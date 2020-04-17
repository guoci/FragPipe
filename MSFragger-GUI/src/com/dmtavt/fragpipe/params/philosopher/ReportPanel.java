package com.dmtavt.fragpipe.params.philosopher;

import com.dmtavt.fragpipe.messages.MessageLcmsFilesList;
import com.dmtavt.fragpipe.messages.NoteConfigPhilosopher;
import com.github.chhh.utils.swing.JPanelBase;
import com.github.chhh.utils.swing.MigUtils;
import com.github.chhh.utils.swing.UiCheck;
import com.github.chhh.utils.swing.UiText;
import com.github.chhh.utils.swing.UiUtils.UiTextBuilder;
import java.awt.Component;
import java.awt.ItemSelectable;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JCheckBox;
import javax.swing.JPanel;
import javax.swing.JSeparator;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;
import net.java.balloontip.BalloonTip;
import net.miginfocom.layout.CC;
import net.miginfocom.layout.LC;
import net.miginfocom.swing.MigLayout;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.dmtavt.fragpipe.messages.MessageSearchType;
import com.dmtavt.fragpipe.api.InputLcmsFile;
import com.dmtavt.fragpipe.params.ThisAppProps;
import com.github.chhh.utils.swing.FormEntry;

public class ReportPanel extends JPanelBase {
  private static final Logger log = LoggerFactory.getLogger(ReportPanel.class);
  private static final MigUtils mu = MigUtils.get();

  public static final String PREFIX = "phi-report.";

  private final List<BalloonTip> balloonTips = new ArrayList<>();
  private JCheckBox checkRun;
  private JPanel pTop;
  private JPanel pOptions;
  private UiText uiTextFilter;
  private UiCheck uiCheckMultiexp;
  private UiCheck uiCheckPepSummary;
  private UiCheck uiCheckWriteMzid;
  private UiCheck uiCheckPrintDecoys;
  private UiCheck uiCheckDontUseProtProphFile;

  @Override
  protected ItemSelectable getRunCheckbox() {
    return checkRun;
  }

  @Override
  protected Component getEnablementToggleComponent() {
    return pOptions;
  }

  @Override
  protected String getComponentNamePrefix() {
    return PREFIX;
  }

  @Override
  protected void init() {
    mu.layout(this, mu.lcFillXNoInsetsTopBottom());
    mu.border(this, "Report");

    pTop = createPanelTop();
    pOptions = createPanelOptions();

    mu.add(this, pTop).wrap();
    mu.add(this, pOptions).wrap();
  }

  @Override
  protected void initMore() {
    updateEnabledStatus(this, false);
    super.initMore();
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(MessageLcmsFilesList m) {
    if (m.files == null)
      return;
    long countExps = m.files.stream().map(InputLcmsFile::getExperiment).distinct().count();
    if (countExps > 1 && !uiCheckMultiexp.isSelected()) {
      log.info("Auto-flipping 'Validation - Report - Multi-Experiment report' checkbox to Enabled as more than one Experiment is set up");
      uiCheckMultiexp.setSelected(true);
    }
    if (countExps <= 1 && uiCheckMultiexp.isSelected()) {
      log.info("Auto-flipping 'Validation - Report - Multi-Experiment report' checkbox to Disabled as there is no more than 1 Experiment");
      uiCheckMultiexp.setSelected(false);
    }
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(NoteConfigPhilosopher m) {
    updateEnabledStatus(this, m.isValid());
  }

  @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
  public void on(MessageSearchType m) {
    String key = "phi-report.filter." + m.type.name();
    String val = ThisAppProps.getLocalProperties().getProperty(key);
    if (val == null) {
      throw new IllegalStateException("No Report Filter defaults found in bundle for key: " + key);
    }
    uiTextFilter.setText(val);
    uiCheckPepSummary.setSelected(false);
  }

  public void activate(boolean isActive) {
    updateEnabledStatus(pTop, isActive);
  }

  private JPanel createPanelOptions() {
    JPanel p = new JPanel(new MigLayout(new LC()));//.debug()));
    p.setBorder(new EmptyBorder(0, 0, 0, 0));

    uiTextFilter = new UiTextBuilder().cols(5).text("--sequential --razor --prot 0.01").create();
    FormEntry feFilter = new FormEntry("filter", "Filter", uiTextFilter,
        "<html>A custom algorithm for MS/MS data filtering and multi-level false discovery rate estimation.<br/>\n"
            + "See: https://github.com/Nesvilab/philosopher/wiki/Filter<br/><br/>\n" +
            "philosopher filter [flags]<br>\n" +
            "Flags:<br/>\n" +
            "<ul>\n" +
            "<li>--ion float        peptide ion FDR level (default 0.01)</li>\n" +
            "<li>--mapmods          map modifications aquired by an open search</li>\n" +
            "<li>--models           print model distribution</li>\n" +
            "<li>--pep float        peptide FDR level (default 0.01)</li>\n" +
            "<li>--pepProb float    top peptide probability treshold for the FDR filtering (default 0.7)</li>\n"
            +
            "<li>--pepxml string    pepXML file or directory containing a set of pepXML files</li>\n"
            +
            "<li>--picked           apply the picked FDR algorithm before the protein scoring</li>\n"
            +
            "<li>--prot float       protein FDR level (default 0.01)</li>\n" +
            "<li>--protProb float   protein probability treshold for the FDR filtering (not used with the razor algorithm) (default 0.5)</li>\n"
            +
            "<li>--protxml string   protXML file path</li>\n" +
            "<li>--psm float        psm FDR level (default 0.01)</li>\n" +
            "<li>--razor            use razor peptides for protein FDR scoring</li>\n" +
            "<li>--sequential       alternative algorithm that estimates FDR using both filtered PSM and Protein lists</li>\n"
            +
            "<li>--tag string       decoy tag (default \"rev_\")</li>\n" +
            "<li>--weight float     threshold for defining peptide uniqueness (default 1)</li>\n"
            +
            "</ul>");



    uiCheckMultiexp = new UiCheck("Multi-experiment Report", null, false);
    FormEntry feCheckMultiexp = new FormEntry("multi-exp-report", "not-shown",
        uiCheckMultiexp);
    uiCheckPepSummary = new UiCheck("Generate peptide level summary", null, false);
    FormEntry feCheckPepSummary = new FormEntry("pep-level-summary", "not-shown",
        uiCheckPepSummary,
        "<html>Optional generation of combined.pep.xml files for multi-experiment setup.");
    uiCheckWriteMzid = new UiCheck("Write mzID output (experimental)", null, false);
    FormEntry feCheckWriteMzid = new FormEntry("write-mzid", "not-shown",
        uiCheckWriteMzid);
    uiCheckPrintDecoys = new UiCheck("Print decoys", null, false);
    FormEntry feCheckPrintDecoys = new FormEntry("print-decoys", "not-shown",
        uiCheckPrintDecoys);
    uiCheckDontUseProtProphFile = new UiCheck("Do not use ProteinProphet file", null, false);
    FormEntry feCheckDontUseProtProphFile = new FormEntry(
        "dont-use-prot-proph-file", "not-shown", uiCheckDontUseProtProphFile,
        "<html>Only to be used in rare cases.<br/>\n" +
            "Consider turning off Protein Prophet instead of using this checkbox.");

    mu.add(p, feFilter.label()).spanX().split();
    mu.add(p, feFilter.comp).growX().pushX().wrap();
    mu.add(p, feCheckMultiexp.comp).spanX().split();
    mu.add(p, feCheckPepSummary.comp).wrap();
    mu.add(p, new JSeparator(SwingConstants.HORIZONTAL)).growX().spanX().wrap();
    mu.add(p, feCheckWriteMzid.comp);
    mu.add(p, feCheckPrintDecoys.comp);
    mu.add(p, feCheckDontUseProtProphFile.comp).wrap();

    return p;
  }

  private JPanel createPanelTop() {
    // setting the insets allows the top panel to be shifted left of the options panel
    JPanel p = new JPanel(new MigLayout(new LC().insetsAll("0px")));

    checkRun = new UiCheck("Generate Report", null, true);
    checkRun.setName("run-report");
    checkRun.addActionListener(e -> {
      final boolean isSelected = checkRun.isSelected();
      enablementMapping.put(pOptions, isSelected);
      updateEnabledStatus(pOptions, isSelected);
    });
    p.add(checkRun, new CC().alignX("left"));

    p.setBorder(new EmptyBorder(0, 0, 0, 0));
    return p;
  }

  public boolean isGenerateReport() {
    return checkRun.isEnabled() && checkRun.isSelected();
  }

  public boolean isMultiExpReport() {
    return uiCheckMultiexp.isSelected();
  }

  public void setMultiExpReport(boolean value) {
    uiCheckMultiexp.setSelected(value);
  }

  public boolean isPepSummary() {
    return uiCheckPepSummary.isSelected();
  }

  public boolean isNoProtXml() {
    return uiCheckDontUseProtProphFile.isSelected();
  }

  public String getFilterCmdText() {
    return uiTextFilter.getNonGhostText();
  }

  public boolean isPrintDecoys() {
    return uiCheckPrintDecoys.isSelected();
  }

  public boolean isWriteMzid() {
    return uiCheckWriteMzid.isSelected();
  }

  private void clearBalloonTips() {
    for (BalloonTip balloonTip : balloonTips) {
      if (balloonTip != null) {
        try {
          balloonTip.closeBalloon();
        } catch (Exception ignore) {
        }
      }
    }
    balloonTips.clear();
  }

}
