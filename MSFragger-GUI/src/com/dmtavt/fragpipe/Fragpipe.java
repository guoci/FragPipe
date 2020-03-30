package com.dmtavt.fragpipe;

import com.dmtavt.fragpipe.api.Bus;
import com.dmtavt.fragpipe.api.FragpipeCacheUtils;
import com.dmtavt.fragpipe.api.UiTab;
import com.dmtavt.fragpipe.messages.MessageExportLog;
import com.dmtavt.fragpipe.messages.MessageLoadUiState;
import com.dmtavt.fragpipe.messages.MessageShowAboutDialog;
import com.dmtavt.fragpipe.messages.MessageUiStateLoaded;
import com.dmtavt.fragpipe.messages.MessageSaveUiState;
import com.dmtavt.fragpipe.messages.MessageUiInitDone;
import com.dmtavt.fragpipe.messages.MessageUmpireEnabled;
import com.github.chhh.utils.LogUtils;
import com.github.chhh.utils.StringUtils;
import com.github.chhh.utils.SwingUtils;
import com.github.chhh.utils.swing.FormEntry;
import com.github.chhh.utils.swing.TextConsole;
import com.github.chhh.utils.swing.UiUtils;
import java.awt.Color;
import java.awt.Component;
import java.awt.Desktop;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.util.Locale;
import java.util.Properties;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.logging.Level;
import javax.swing.ImageIcon;
import javax.swing.JComponent;
import javax.swing.JEditorPane;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPopupMenu;
import javax.swing.JTabbedPane;
import javax.swing.ToolTipManager;
import javax.swing.event.HyperlinkEvent;
import javax.swing.event.HyperlinkListener;
import net.miginfocom.layout.CC;
import net.miginfocom.layout.LC;
import net.miginfocom.swing.MigLayout;
import org.greenrobot.eventbus.NoSubscriberEvent;
import org.greenrobot.eventbus.Subscribe;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import umich.msfragger.Version;
import umich.msfragger.gui.MsfraggerGuiFrame;
import umich.msfragger.gui.MsfraggerGuiFrameUtils;
import umich.msfragger.gui.api.LogbackJTextPaneAppender;
import umich.msfragger.params.ThisAppProps;

public class Fragpipe extends JFrame {

  public static final String UI_STATE_CACHE_FN = "fragpipe-ui.cache";
  private static final Logger log = LoggerFactory.getLogger(Fragpipe.class);
  public static final Color COLOR_GREEN = new Color(105, 193, 38);
  public static final Color COLOR_GREEN_DARKER = new Color(104, 184, 55);
  public static final Color COLOR_GREEN_DARKEST = new Color(82, 140, 26);
  public static final Color COLOR_RED = new Color(236, 99, 80);
  public static final Color COLOR_RED_DARKER = new Color(166, 56, 68);
  public static final Color COLOR_RED_DARKEST = new Color(155, 35, 29);
  public static final Color COLOR_BLACK = new Color(0, 0, 0);
  private static final String TAB_NAME_LCMS = "LCMS Files";
  private static final String TAB_NAME_UMPIRE = "DIA-Umpire SE";
  public static final String PREFIX_FRAGPIPE = "fragpipe.";
  public static final String PROP_NOCACHE = "do-not-cache";

  public static final Function<String, String> PREPEND_FRAGPIPE = (name) -> {
    if (name == null)
      return PREFIX_FRAGPIPE;
    return name.startsWith(PREFIX_FRAGPIPE) ? name : PREFIX_FRAGPIPE + name;
  };
  public static final Function<String, String> APPEND_NO_CACHE = (name) -> {
    if (name == null)
      return PROP_NOCACHE;
    return name.contains(PROP_NOCACHE) ? name : name + "." + PROP_NOCACHE;
  };

  JTabbedPane tabs;
  TextConsole console;
  JLabel defFont;
  private TabUmpire tabUmpire;

  public Fragpipe() throws HeadlessException {
    init();
    initMore();
  }

  public static FormEntry.Builder fe(JComponent comp, String compName) {
    return FormEntry.builder(comp, StringUtils.prependOnce(compName, PREFIX_FRAGPIPE));
  }

  public static FormEntry.Builder fe(JComponent comp, String compName, String prefix) {
    return FormEntry.builder(comp, StringUtils.prependOnce(compName, prefix));
  }

  public static void main(String args[]) {
    SwingUtils.setLaf();

    ToolTipManager.sharedInstance().setDismissDelay(Integer.MAX_VALUE);
    Locale.setDefault(Locale.ROOT);

    /* Create and display the form */
    java.awt.EventQueue.invokeLater(() -> {
      final Fragpipe fp = new Fragpipe();

      fp.addWindowListener(new WindowAdapter() {
        @Override
        public void windowClosing(WindowEvent e) {
          Bus.post(MessageSaveUiState.newForCache());
        }
      });

      Thread.setDefaultUncaughtExceptionHandler((t, e) -> {
        String stacktrace = LogUtils.stacktrace(e);
        log.error("Something unexpected happened!", e);
        SwingUtils.userShowError(fp, stacktrace);
      });

      LogbackJTextPaneAppender appender = new LogbackJTextPaneAppender();
      appender.start();
      log.debug("Started LogbackJTextPaneAppender logger");
      appender.setTextPane(fp.console);

      fp.pack();
      fp.setVisible(true);
      Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
      fp.setLocation(dim.width / 2 - fp.getSize().width / 2,
          dim.height / 2 - fp.getSize().height / 2);
    });
  }

  private TextConsole createConsole() {
    TextConsole c = new TextConsole();
    final Font currentFont = c.getFont();
    c.setFont(new Font(Font.MONOSPACED, currentFont.getStyle(), currentFont.getSize()));
    c.setContentType("text/plain; charset=UTF-8");
    c.addMouseListener(new MouseAdapter() {

      @Override
      public void mouseReleased(MouseEvent e) {
        if (e.isPopupTrigger()) {
          doPop(e);
        }
      }

      private void doPop(MouseEvent e) {
        JPopupMenu menu = new JPopupMenu();
        JMenuItem menuItem = new JMenuItem("Export to text file");
        menuItem.addActionListener(e1 -> Bus.post(new MessageExportLog()));
        menu.add(menuItem);
        menu.show(e.getComponent(), e.getX(), e.getY());
      }
    });
    return c;
  }

  /**
   * Use to name all the components that need to save state between runs. Will prepend their name
   * with "fragpipe." prefix.
   */
  public static Component rename(Component comp, String name) {
    return rename(comp, name, false);
  }

  /**
   * Use to name all the components that need to save state between runs.
   * Will prepend their name with "fragpipe." prefix.
   */
  public static Component rename(Component comp, String name, boolean isNoCache) {
    String s = PREPEND_FRAGPIPE.apply(name);
    comp.setName(isNoCache ? APPEND_NO_CACHE.apply(s) : s);
    return comp;
  }

  /**
   * Use to name all the components that need to save state between runs.
   * Will prepend their name with provided prefix.
   */
  public static Component rename(Component comp, String name, String prefix) {
    return rename(comp, name, prefix, false);
  }

  /**
   * Use to name all the components that need to save state between runs.
   * Will prepend their name with provided prefix.
   * @param isNoCache Also append name with 'no-cache' tag. Useful if you want to have a unique name
   *                  for an element, but don't want it to be saved to cache file.
   */
  public static Component rename(Component comp, String name, String prefix, boolean isNoCache) {
    String s = StringUtils.prependOnce(name, prefix);
    comp.setName(isNoCache ? APPEND_NO_CACHE.apply(s) : s);
    return comp;
  }

  /** Same as calling {@link #rename(Component, String, boolean)} with True as last arg. */
  public static Component renameNoCache(Component comp, String name) {
    return rename(comp, name, true);
  }

  private JTabbedPane createTabs(TextConsole console) {
    final JTabbedPane t = new JTabbedPane(JTabbedPane.TOP, JTabbedPane.WRAP_TAB_LAYOUT);

    Consumer<UiTab> addTab = tab -> t.addTab(tab.getTitle(), tab.getIcon(), SwingUtils.scroll(tab.getComponent()), tab.getTooltip());

    TabConfig tabConfig = new TabConfig();
    TabLcmsFiles tabLcmsFiles = new TabLcmsFiles();
    TabDatabase tabDatabase = new TabDatabase();
    TabMsfragger tabMsfragger = new TabMsfragger();
    TabDownstream tabDownstream = new TabDownstream();
    TabQuantitaion tabQuantitaion = new TabQuantitaion();
    TabMisc tabMisc = new TabMisc();
    TabRun tabRun = new TabRun(console);
    tabUmpire = new TabUmpire();

    addTab.accept(new UiTab("Config", tabConfig, "/umich/msfragger/gui/icons/150-cogs.png", null));
    addTab.accept(new UiTab(TAB_NAME_LCMS, tabLcmsFiles, "/umich/msfragger/gui/icons/186-list-numbered.png", null));
    addTab.accept(new UiTab("Database", tabDatabase, "/umich/msfragger/gui/icons/093-drawer.png", null));
    addTab.accept(new UiTab("MSFragger", tabMsfragger, "/umich/msfragger/gui/icons/bolt-16.png", null));
    addTab.accept(new UiTab("Downstream", tabDownstream, "/umich/msfragger/gui/icons/348-filter.png", null));
    addTab.accept(new UiTab("Quant", tabQuantitaion, "/umich/msfragger/gui/icons/360-sigma.png", null));
    addTab.accept(new UiTab("PTMs + Misc", tabMisc, null, null));
    addTab.accept(new UiTab("Run", tabRun, "/umich/msfragger/gui/icons/video-play-16.png", null));

    return t;
  }

  private synchronized void init() {
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    setTitle(Version.PROGRAM_TITLE + " (v" + Version.version() + ")");
    setLocale(Locale.ROOT);
    setMinimumSize(new Dimension(640, 480));


    this.setLayout(new MigLayout(new LC().fill()));
    //this.setLayout(new BorderLayout());

    defFont = new JLabel("dummy label to get default font from");
    console = createConsole();
    tabs = createTabs(console);

    //add(tabs, BorderLayout.CENTER);
    add(tabs, new CC().grow());

//    defTextColor = UIManager.getColor("TextField.foreground");
//    if (defTextColor == null) {
//      defTextColor = Color.BLACK;
//    }
//
//    // check if fragger jar points to a correct location
//    if (!MsfraggerGuiFrameUtils.validateMsfraggerJarContents(textBinMsfragger.getText())) {
//      log.debug("Msfragger jar is not valid");
//    }
//
//    if (MsfraggerGuiFrameUtils.validatePhilosopherPath(textBinPhilosopher.getText()) == null) {
//      enablePhilosopherPanels(false);
//    }
//
//    tableModelRawFiles = MsfraggerGuiFrameUtils.createTableModelRawFiles();
//    tableModelRawFiles.addTableModelListener(e -> {
//      List<InputLcmsFile> files = tableModelRawFiles.dataCopy();
//      Bus.post(new MessageLcmsFilesList(MessageType.UPDATE, files));
//    });
//    tableRawFiles = new LcmsInputFileTable(tableModelRawFiles);
//    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnRawClear);
//    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnGroupsConsecutive);
//    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnGroupsByParentDir);
//    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnGroupsByFilename);
//    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnGroupsClear);
//    tableRawFiles.addComponentsEnabledOnNonEmptySelection(btnRawRemove);
//    tableRawFiles.addComponentsEnabledOnNonEmptySelection(btnGroupsAssignToSelected);
//    tableRawFiles.fireInitialization();
//    tableRawFiles.setFillsViewportHeight(true);
//    scrollPaneRawFiles.setViewportView(tableRawFiles);
//
//    // Drag and drop support for files from Explorer to the Application
//    // this works only when tableRawFiles.setFillsViewportHeight(true) is called.
////        tableRawFiles.setDragEnabled(true);
////        tableRawFiles.setDropMode(DropMode.ON);
////        tableRawFiles.setFillsViewportHeight(true);
////        TransferHandler origHandler = tableRawFiles.getTransferHandler();
////        SimpleETableTransferHandler newHandler = new SimpleETableTransferHandler();
////        tableRawFiles.setTransferHandler(newHandler);
//    // dropping onto enclosing JPanel works.
//    tableRawFilesFileDrop = new FileDrop(panelSelectedFiles, true, files -> {
//      Predicate<File> pred = CmdMsfragger.getSupportedFilePredicate(getExtBinSearchPaths());
//      List<Path> accepted = new ArrayList<>(files.length);
//      for (File f : files) {
//        PathUtils.traverseDirectoriesAcceptingFiles(f, pred, accepted, false);
//      }
//      if (!accepted.isEmpty()) {
//        Bus.post(new MessageLcmsFilesAdded(accepted));
//      }
//    });
//
//    textBinPython.addFocusListener(new FocusAdapter() {
//      @Override
//      public void focusLost(FocusEvent e) {
//        Bus.post(new MessagePythonBinSelectedByUser(textBinPython.getText()));
//      }
//    });
//
//    fraggerMigPanel = new FraggerMigPanel();
//    final int fraggerTabIndex = 3;
//    final String fraggerTabName = "MSFragger";
//    tabPane.add(fraggerMigPanel, fraggerTabIndex);
//    tabPane.setTitleAt(fraggerTabIndex, fraggerTabName);
//
//
//    // set icons for tabs
//    Map<String, Integer> mapTabNameToIdx = new HashMap<>();
//    for (int i = 0, tabCount = tabPane.getTabCount(); i < tabCount; i++) {
//      mapTabNameToIdx.put(tabPane.getTitleAt(i), i);
//    }
//    setTabIcon(mapTabNameToIdx, "Config", "/umich/msfragger/gui/icons/146-wrench.png");
//    setTabIcon(mapTabNameToIdx, "Select LC/MS Files", "/umich/msfragger/gui/icons/198-download2.png");
//    setTabIcon(mapTabNameToIdx, "Database", "/umich/msfragger/gui/icons/093-drawer.png");
//    setTabIcon(mapTabNameToIdx, "Downstream", "/umich/msfragger/gui/icons/328-move-down.png");
//    setTabIcon(mapTabNameToIdx, "Report", "/umich/msfragger/gui/icons/185-clipboard.png");
//    setTabIcon(mapTabNameToIdx, fraggerTabName, "/umich/msfragger/gui/icons/bolt-16.png");
//    //setTabIcon(mapTabNameToIdx, "", "");
//
//    exec.submit(() -> MsfraggerGuiFrameUtils.validateAndSaveMsfraggerPath(this, textBinMsfragger.getText()));
//    exec.submit(() -> MsfraggerGuiFrameUtils.validateAndSavePhilosopherPath(this, textBinPhilosopher.getText()));
//    exec.submit(() -> Version.checkUpdates());
//    exec.submit(() -> MsfraggerGuiFrameUtils.checkPreviouslySavedParams(MsfraggerGuiFrame.this));
//
//    // The python check must be run before DbSlice and SpecLibGen.
//    // Don't run these checks asynchronously
//    exec.submit(() -> MsfraggerGuiFrameUtils.checkPython(MsfraggerGuiFrame.this));
//    exec.submit(() -> MsfraggerGuiFrameUtils.validateDbslicing(fraggerVer));
//    exec.submit(MsfraggerGuiFrameUtils::validateSpeclibgen);
//
//
//    exec.submit(() -> MsfraggerGuiFrameUtils.validateMsadjusterEligibility(fraggerVer));
//    exec.submit(() -> MsfraggerGuiFrameUtils.validateMsfraggerMassCalibrationEligibility(fraggerVer));
//
//
//    // submitting all "loadLast" methods for invocation
//    for (Method method : this.getClass().getDeclaredMethods()) {
//      // TODO: Old 'loadLast' mechanism is mostly replaced by auto save/load of components by 'name'
//      if (method.getName().startsWith("loadLast") && method.getParameterCount() == 0) {
//        exec.submit(() -> method.invoke(this));
//      }
//    }
//
//    // Force loading form caches
//    Bus.post(MessageLoadAllForms.forCaching());
//
//    initActions();
  }

  private void initMore() {
    Bus.register(this);

    Bus.post(new MessageUiInitDone());
  }

  @Subscribe
  public void onUmpireEnabled(MessageUmpireEnabled m) {
    synchronized (this) {
      if (m.enabled) {
        final String prevTabName = TAB_NAME_LCMS;
        int prevTabIndex = tabs.indexOfTab(prevTabName);
        if (prevTabIndex < 0) {
          throw new IllegalStateException("Could not find tab named " + prevTabName);
        }
        final ImageIcon icon = UiUtils.loadIcon(Fragpipe.class, "/umich/msfragger/gui/icons/dia-umpire-16x16.png");
        tabs.insertTab(TAB_NAME_UMPIRE, icon, SwingUtils.scroll(tabUmpire), "", prevTabIndex + 1);

      } else {
        int index = tabs.indexOfTab(TAB_NAME_UMPIRE);
        if (index >= 0) {
          tabs.removeTabAt(index);
        }
      }
    }
  }

  @Subscribe
  public void onSaveUiState(MessageSaveUiState m) {
    log.debug("Writing ui state cache to: {}", m.path.toString());
    try (OutputStream os = Files.newOutputStream(m.path)) {
      FragpipeCacheUtils.tabsWrite(os, tabs);
    } catch (IOException e) {
      log.error("Could not write fragpipe cache to: {}", m.path.toString());
    }
  }

  @Subscribe
  public void onUiInitDone(MessageUiInitDone m) {
    Bus.post(MessageLoadUiState.newForCache());
  }

  @Subscribe
  public void onLoadUiState(MessageLoadUiState m) {
    log.debug("Loading ui state cache from: {}", m.path.toString());
    try (InputStream is = Files.newInputStream(m.path)) {
      FragpipeCacheUtils.tabsRead(is, tabs);
    } catch (IOException e) {
      log.error("Could not write fragpipe cache to: {}", m.path.toString());
    }
    Bus.post(new MessageUiStateLoaded());
  }

  @Subscribe
  public void onUiStateLoaded(MessageUiStateLoaded m) {
    // TODO: check fragger, python, philosopher
  }

  @Subscribe
  public void onShowAbout(MessageShowAboutDialog m) {
    showAboutDialog(this);
  }

  private String createAboutBody() {
    final Properties p = ThisAppProps.getRemotePropertiesWithLocalDefaults();
    String linkDl = p.getProperty(umich.msfragger.Version.PROP_DOWNLOAD_URL, "");
    String linkSite = p.getProperty(ThisAppProps.PROP_LAB_SITE_URL, "http://nesvilab.org");
    String linkToPaper = p.getProperty(ThisAppProps.PROP_MANUSCRIPT_URL, "http://www.nature.com/nmeth/journal/v14/n5/full/nmeth.4256.html");

    return "MSFragger - Ultrafast Proteomics Search Engine<br/>"
        + "FragPipe (v" + umich.msfragger.Version.version() + ")<br/>"
        + "Dmitry Avtonomov<br/>"
        + "University of Michigan, 2017<br/><br/>"
        + "<a href=\"" + linkDl
        + "\">Click here to download</a> the latest version<br/><br/>"
        + "<a href=\"" + linkSite + "\">Alexey Nesvizhskii lab</a><br/>&nbsp;<br/>&nbsp;"
        + "MSFragger authors and contributors:<br/>"
        + "<ul>"
        + "<li>Andy Kong</li>"
        + "<li>Dmitry Avtonomov</li>"
        + "<li>Guo-Ci Teo</li>"
        + "<li>Fengchao Yu</li>"
        + "<li>Alexey Nesvizhskii</li>"
        + "</ul>"
        + "<a href=\"" + linkToPaper + "\">Link to the research manuscript</a><br/>"
        + "Reference: <b>doi:10.1038/nmeth.4256</b><br/><br/>"
        + "Components and Downstream tools:"
        + "<ul>"
        + "<li><a href='https://philosopher.nesvilab.org/'>Philosopher</a>: Felipe Leprevost</li>"
        + "<li>PTM-Shepherd: Andy Kong</li>"
        + "<li>Crystal-C: Hui-Yin Chang</li>"
        + "<li>Spectral library generation: Guo-Ci Teo</li>"
        + "<li><a href='https://diaumpire.nesvilab.org/'>DIA-Umpire</a>: Chih-Chiang Tsou</li>"
        + "</ul>";
  }

  public void showAboutDialog(Component parent) {
    JEditorPane ep = SwingUtils
        .createClickableHtml(SwingUtils.wrapInStyledHtml(createAboutBody()));
    SwingUtils.showDialog(this, ep);
  }

  @Subscribe
  public void onNoSubscriberEvent(NoSubscriberEvent m) {
    String message = String.format("No subscribers for message type [%s]", m.originalEvent.getClass().getSimpleName());
    log.debug(message);
    //System.err.println(message);
  }
}
