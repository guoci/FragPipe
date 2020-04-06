package com.dmtavt.fragpipe;

import com.dmtavt.fragpipe.api.Bus;
import com.dmtavt.fragpipe.messages.MessageLcmsAddFiles;
import com.dmtavt.fragpipe.messages.MessageLcmsAddFolder;
import com.dmtavt.fragpipe.messages.MessageLcmsClearFiles;
import com.dmtavt.fragpipe.messages.MessageLcmsFilesAdded;
import com.dmtavt.fragpipe.messages.MessageLcmsFilesList;
import com.dmtavt.fragpipe.messages.MessageLcmsGroupAction;
import com.dmtavt.fragpipe.messages.MessageLcmsGroupAction.Type;
import com.dmtavt.fragpipe.messages.MessageLcmsRemoveSelected;
import com.dmtavt.fragpipe.messages.MessageType;
import com.github.chhh.utils.FileDrop;
import com.github.chhh.utils.PathUtils;
import com.github.chhh.utils.StringUtils;
import com.github.chhh.utils.SwingUtils;
import com.github.chhh.utils.swing.FileChooserUtils;
import com.github.chhh.utils.swing.FileChooserUtils.FcMode;
import com.github.chhh.utils.swing.JPanelWithEnablement;
import com.github.chhh.utils.swing.MigUtils;
import com.github.chhh.utils.swing.UiCombo;
import com.github.chhh.utils.swing.UiUtils;
import java.awt.Dimension;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Random;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;
import javax.swing.JButton;
import javax.swing.JEditorPane;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import net.miginfocom.layout.LC;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.RandomUtils;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import umich.msfragger.cmd.CmdMsfragger;
import umich.msfragger.gui.InputLcmsFile;
import umich.msfragger.gui.LcmsInputFileTable;
import umich.msfragger.gui.MsfraggerGuiFrameUtils;
import umich.msfragger.gui.MsfraggerGuiFrameUtils.LcmsFileAddition;
import umich.msfragger.gui.api.SimpleETable;
import umich.msfragger.gui.api.UniqueLcmsFilesTableModel;
import umich.msfragger.params.ThisAppProps;

public class TabWorkflow extends JPanelWithEnablement {
  private static final Logger log = LoggerFactory.getLogger(TabWorkflow.class);
  private final MigUtils mu = MigUtils.get();
  private JButton btnFilesRemove;
  private JButton btnFilesClear;

  private SimpleETable tableRawFiles;
  private UniqueLcmsFilesTableModel tableModelRawFiles;
  private FileDrop tableRawFilesFileDrop;
  private JScrollPane scrollPaneRawFiles;
  private JButton btnGroupsConsecutive;
  private JButton btnGroupsByParentDir;
  private JButton btnGroupsByFilename;
  private JButton btnGroupsAssignToSelected;
  private JButton btnGroupsClear;
  private JEditorPane epWorkflowsInfo;
  private JPanel pWorkflows;
  private JPanel pLcmsFiles;
  private JPanel pContent;

  public static final String TAB_PREFIX = "workflow.";

  public TabWorkflow() {
    init();
    initMore();
  }

  private void initMore() {
    Bus.register(this);
  }

  private void init() {
    this.setLayout(new MigLayout(new LC().fillX()));

    add(createPanalWorkflows(), mu.ccGx().wrap());
    add(createPanalLcmsFiles(), mu.ccGx().wrap());
  }

  private String genSentence() {
    int numWords = RandomUtils.nextInt(10, 120);
    return IntStream.range(0, numWords)
        .mapToObj(i -> genWord())
        .collect(StringBuilder::new, (s1, s2) -> s1.append(" ").append(s2), (s1, s2) -> s1.append(" ").append(s2))
        .toString();
  }

  private String genWord() {
    int lo = 97;  // letter 'a'
    int hi = 122; // letter 'z'
    int targetStringLength = RandomUtils.nextInt(2, 12);
    Random random = new Random();
    return random.ints(lo, hi + 1)
        .limit(targetStringLength)
        .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
        .toString();
  }

  private JPanel createPanalWorkflows() {
    JPanel p = mu.panel(false, "Workflows");

    epWorkflowsInfo = SwingUtils.createClickableHtml(true,
        "FragPipe and its collection of tools support multiple proteomic workflows.\n"
        + "Select an option in the dropdown menu below to configure "
        + "all the tools. You can tweak the options yourself after loading.\n"
        + "Also, <a href=\"https://google.com\">see the tutorial</a>");
    final UiCombo uiCombo = UiUtils.createUiCombo(Arrays
        .asList("Open Search", "Closed Search", "Non-specific Search", "Speclib generation",
            "TMT-10 Quant"));
    final JEditorPane epWorkflowsDesc = SwingUtils.createClickableHtml(SwingUtils.makeHtml(genSentence()));
    epWorkflowsDesc.setPreferredSize(new Dimension(400, 50));
    uiCombo.addItemListener(e -> SwingUtils.setJEditorPaneContent(epWorkflowsDesc, genSentence()));
    JButton btnWorkflowLoad = UiUtils.createButton("Load", e -> {
      log.debug("Load workflow button clicked");
      SwingUtils.showInfoDialog(this, "User clicked " + (String)uiCombo.getSelectedItem(), "Loading");
    });


    p.add(epWorkflowsInfo, mu.ccL().growX().spanX().wrap());
    p.add(btnWorkflowLoad, mu.ccL().split());
    p.add(uiCombo, mu.ccL().wrap());
    p.add(epWorkflowsDesc, mu.ccL().growX().spanX().wrap());

    return p;
  }

  private void logObjectType(Object m) {
    log.debug("Got {}", m.getClass().getSimpleName());
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(MessageLcmsAddFiles m) {
    logObjectType(m);

    List<Path> searchPaths = Fragpipe.getExtBinSearchPaths();
    final javax.swing.filechooser.FileFilter ff = CmdMsfragger.getFileChooserFilter(searchPaths);
    Predicate<File> supportedFilePredicate = CmdMsfragger.getSupportedFilePredicate(searchPaths);
    JFileChooser fc = FileChooserUtils
        .create("Choose raw data files", "Select", true, FcMode.ANY, true,
            ff);
    tableModelRawFiles.dataCopy();
    FileChooserUtils.setPath(fc, Stream.of(ThisAppProps.load(ThisAppProps.PROP_LCMS_FILES_IN)));

    int result = fc.showDialog(this, "Select");
    if (JFileChooser.APPROVE_OPTION != result)
      return;
    final List<Path> paths = Arrays.stream(fc.getSelectedFiles())
        .filter(supportedFilePredicate)
        .map(File::toPath).collect(Collectors.toList());
    if (paths.isEmpty()) {
      JOptionPane.showMessageDialog(this,
          "None of selected files/folders are supported", "Warning", JOptionPane.WARNING_MESSAGE);
      return;
    } else {
      Bus.post(new MessageLcmsFilesAdded(paths));
    }
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(MessageLcmsFilesAdded m) {
    // save locations
    String savePath = m.recursiveAdditionRoot != null ? m.recursiveAdditionRoot.toString() : m.paths.get(0).toString();
    ThisAppProps.save(ThisAppProps.PROP_LCMS_FILES_IN, savePath);

    LcmsFileAddition lfa = new LcmsFileAddition(m.paths, new ArrayList<>(m.paths));
    MsfraggerGuiFrameUtils.processAddedLcmsPaths(lfa, this, Fragpipe::getExtBinSearchPaths);

    // add the files
    List<InputLcmsFile> toAdd = lfa.toAdd.stream()
        .map(p -> new InputLcmsFile(p, ThisAppProps.DEFAULT_LCMS_EXP_NAME))
        .collect(Collectors.toList());
    if (!toAdd.isEmpty()) {
      tableModelRawFiles.dataAddAll(toAdd);
      postFileListUpdate();
    }
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(MessageLcmsAddFolder m) {
    logObjectType(m);

    final javax.swing.filechooser.FileFilter ff = CmdMsfragger.getFileChooserFilter(Fragpipe.getExtBinSearchPaths());
    JFileChooser fc = FileChooserUtils.create("Select a folder with LC/MS files (searched recursively)", "Select",
        true, FcMode.ANY, true);
    FileChooserUtils.setPath(fc, Stream.of(ThisAppProps.load(ThisAppProps.PROP_LCMS_FILES_IN)));

    String lastPath = ThisAppProps.load(ThisAppProps.PROP_LCMS_FILES_IN);
    if (!StringUtils.isNullOrWhitespace(lastPath)) {
      try {
        Path p = Paths.get(lastPath);
        fc.setSelectedFile(p.toFile());
      } catch (Exception ignore) {}
    }

    int confirmation = fc.showOpenDialog(this);

    if (confirmation != JFileChooser.APPROVE_OPTION)
      return;

    final Predicate<File> pred = CmdMsfragger.getSupportedFilePredicate(Fragpipe.getExtBinSearchPaths());
    File[] selectedFiles = fc.getSelectedFiles();
    List<Path> paths = new ArrayList<>();
    for (File f : selectedFiles) {
      PathUtils.traverseDirectoriesAcceptingFiles(f, pred, paths, false);
    }

    if (selectedFiles.length > 0 && !paths.isEmpty()) {
      EventBus.getDefault().post(new MessageLcmsFilesAdded(paths, selectedFiles[0].toPath()));
    }
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(MessageLcmsRemoveSelected m) {
    logObjectType(m);

    final List<InputLcmsFile> toRemove = new ArrayList<>();
    Arrays.stream(this.tableRawFiles.getSelectedRows())
        .map(tableRawFiles::convertRowIndexToModel)
        .boxed()
        .forEach(i -> toRemove.add(tableModelRawFiles.dataGet(i)));
    tableRawFiles.getSelectionModel().clearSelection();

    if (!toRemove.isEmpty()) {
      tableModelRawFiles.dataRemoveAll(toRemove);
      postFileListUpdate();
    }
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(MessageLcmsClearFiles m) {
    logObjectType(m);
    tableModelRawFiles.dataClear();
    postFileListUpdate();
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(MessageLcmsFilesList m) {
    if (m.type == MessageType.REQUEST) {
      Bus.post(new MessageLcmsFilesList(MessageType.RESPONSE, tableModelRawFiles.dataCopy()));
    }
  }

  private void postFileListUpdate() {
    ArrayList<InputLcmsFile> data = tableModelRawFiles.dataCopy();
    if (!data.isEmpty()) {
      ThisAppProps.save(ThisAppProps.PROP_LCMS_FILES_IN, data.get(0).getPath().toString());
    }
    Bus.post(new MessageLcmsFilesList(MessageType.UPDATE, data));
  }

  private JPanel createPanalLcmsFiles() {
    JPanel p = mu.panel(false, "Input LC/MS Files");

    JButton btnFilesAddFiles = button("Add files", MessageLcmsAddFiles::new);
    JButton btnFilesAddFolder = button("Add folder recursively", MessageLcmsAddFolder::new);
    btnFilesRemove = button("Remove selected files", MessageLcmsRemoveSelected::new);
    btnFilesRemove.setEnabled(false);
    btnFilesClear = button("Clear files", MessageLcmsClearFiles::new);
    btnFilesClear.setEnabled(false);

    btnGroupsConsecutive = button("Consecutive", () -> new MessageLcmsGroupAction(Type.CONSECUTIVE));
    btnGroupsByParentDir = button("By parent directory", () -> new MessageLcmsGroupAction(Type.BY_PARENT_DIR));
    btnGroupsByFilename = button("By file name", () -> new MessageLcmsGroupAction(Type.BY_FILE_NAME));
    btnGroupsAssignToSelected = button("Set experiment/replicate", () -> new MessageLcmsGroupAction(Type.SET_EXP));
    btnGroupsClear = button("Clear groups", () -> new MessageLcmsGroupAction(Type.CLEAR_GROUPS));

    tableRawFilesFileDrop = makeFileDrop();

    createFileTable();

    mu.add(p, btnFilesAddFiles).split();
    mu.add(p, btnFilesAddFolder);
    mu.add(p, btnFilesRemove);
    mu.add(p, btnFilesClear).wrap();
    mu.add(p, new JLabel("Assign files to Experiments/Groups (select rows to activate action buttons):")).spanX().wrap();
    mu.add(p, btnGroupsConsecutive).split();
    mu.add(p, btnGroupsByParentDir);
    mu.add(p, btnGroupsByFilename);
    mu.add(p, btnGroupsAssignToSelected);
    mu.add(p, btnGroupsClear).wrap();

    p.add(scrollPaneRawFiles, mu.ccGx().wrap());

    return p;
  }

  private JButton button(String text, Supplier<Object> message) {
    return UiUtils.createButton(text, e -> Bus.post(message.get()));
  }

  private void createFileTable() {
    tableModelRawFiles = MsfraggerGuiFrameUtils.createTableModelRawFiles();
    tableModelRawFiles.addTableModelListener(e -> {
      List<InputLcmsFile> files = tableModelRawFiles.dataCopy();
      EventBus.getDefault().post(new MessageLcmsFilesList(MessageType.UPDATE, files));
    });
    tableRawFiles = new LcmsInputFileTable(tableModelRawFiles);
    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnFilesClear);
    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnGroupsConsecutive);
    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnGroupsByParentDir);
    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnGroupsByFilename);
    tableRawFiles.addComponentsEnabledOnNonEmptyData(btnGroupsClear);

    tableRawFiles.addComponentsEnabledOnNonEmptySelection(btnFilesRemove);
    tableRawFiles.addComponentsEnabledOnNonEmptySelection(btnGroupsAssignToSelected);
    tableRawFiles.fireInitialization();
    tableRawFiles.setFillsViewportHeight(true);
    scrollPaneRawFiles = new JScrollPane();
    scrollPaneRawFiles.setViewportView(tableRawFiles);
  }

  private FileDrop makeFileDrop() {
    return new FileDrop(this, true, files -> {
      Predicate<File> pred = CmdMsfragger.getSupportedFilePredicate(Fragpipe.getExtBinSearchPaths());
      List<Path> accepted = new ArrayList<>(files.length);
      for (File f : files) {
        PathUtils.traverseDirectoriesAcceptingFiles(f, pred, accepted, false);
      }
      if (!accepted.isEmpty()) {
        Bus.post(new MessageLcmsFilesAdded(accepted));
      }
    });
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(MessageLcmsGroupAction m) {
    log.debug("Got MessageLcmsGroupAction of type: {}", m.type.toString());
  }
}
