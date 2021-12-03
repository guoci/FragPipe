package com.dmtavt.fragpipe.tools.percolator;

import com.dmtavt.fragpipe.Fragpipe;
import com.dmtavt.fragpipe.api.SearchTypeProp;
import com.dmtavt.fragpipe.messages.MessageSearchType;
import com.dmtavt.fragpipe.tabs.TabMsfragger;
import com.github.chhh.utils.SwingUtils;
import com.github.chhh.utils.swing.FormEntry;
import com.github.chhh.utils.swing.JPanelBase;
import com.github.chhh.utils.swing.MigUtils;
import com.github.chhh.utils.swing.UiCheck;
import com.github.chhh.utils.swing.UiRadio;
import com.github.chhh.utils.swing.UiSpinnerDouble;
import com.github.chhh.utils.swing.UiText;
import com.github.chhh.utils.swing.UiUtils;
import java.awt.Component;
import java.awt.ItemSelectable;
import javax.swing.ButtonGroup;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PercolatorPanel extends JPanelBase {
    private static final Logger log = LoggerFactory.getLogger(PercolatorPanel.class);
    private static MigUtils mu = MigUtils.get();
    public UiRadio checkRun;
    private UiCheck checkKeepTsvFiles;
    private UiSpinnerDouble spinMinProb;
    private UiText uiTextCmdOpts;
    private UiCheck uiCheckCombinePepxml;
    private JPanel pTop;
    private JPanel pContent;
    private final boolean parentPanelEnabled;
    public static final String PREFIX = "percolator.";

    public PercolatorPanel(ButtonGroup buttonGroup, boolean parentPanelEnabled) {
        buttonGroup.add(checkRun);
        this.parentPanelEnabled = parentPanelEnabled;
    }

    public boolean isKeepTsvFiles() {
        return checkKeepTsvFiles.isSelected();
    }

    public boolean isRun() {
        return parentPanelEnabled && SwingUtils.isEnabledAndChecked(checkRun);
    }

    public boolean isSelected() {
        return checkRun.isSelected();
    }

    public String getCmdOpts() {
        return uiTextCmdOpts.getNonGhostText().trim();
    }

    public double getMinProb() {
        return Double.parseDouble(spinMinProb.asString());
    }

    public boolean isCombinePepxml() {
        return uiCheckCombinePepxml.isSelected();
    }

    @Override
    protected ItemSelectable getRunCheckbox() {
        return checkRun;
    }

    @Override
    protected Component getEnablementToggleComponent() {
        return pContent;
    }

    @Override
    protected String getComponentNamePrefix() {
        return PREFIX;
    }

    @Override
    protected void initMore() {
        checkRun.addItemListener(e -> {
            if (isRun()) {
                final TabMsfragger tabMsfragger = Fragpipe.getStickyStrict(TabMsfragger.class);
                tabMsfragger.uiComboOutputType.setSelectedIndex(5);
            }
        });

        updateEnabledStatus(this, true);
        super.initMore();
    }

    @Subscribe(threadMode = ThreadMode.MAIN_ORDERED)
    public void on(MessageSearchType m) {
        log.debug("Got MessageSearchType of type [{}], loading defaults for it", m.type.toString());
        switch (m.type) {
            case open:
            case offset:
            case glyco:
                checkRun.setSelected(false);
                break;
            case closed:
            case nonspecific:
                checkRun.setSelected(true);
                break;
            default:
                throw new IllegalStateException("Not covered enum option: " + m.type.name());
        }
        loadDefaults(m.type);
    }

    @Override
    protected void init() {
        checkRun = new UiRadio("Run Percolator", null, true);
        checkRun.setName("run-percolator");

        checkKeepTsvFiles = new UiCheck("Keep temp files", null, false);
        checkKeepTsvFiles.setName("keep-tsv-files");

        spinMinProb = UiUtils.spinnerDouble(0.50, 0, 1, 0.01).setCols(4).setFormat("#.##").create();
        FormEntry feMinProb = mu.feb(spinMinProb).name("min-prob").label("Min probability").tooltip("Minimum probability threshold").create();

        uiTextCmdOpts = UiUtils.uiTextBuilder().cols(20).text(defaultCmdOpts()).create();
        FormEntry feCmdOpts = fe(uiTextCmdOpts, "cmd-opts")
                .label("Cmd line opts:")
                .tooltip("These options will be passed on to Percolator.\n"
                        + "This set will be merged with some additional options\n"
                        + "added as a requirement by other stages in the pipeline.\n"
                        + "To set --num-threads, please adjust the Parallelism setting in the Workflow tab.\n"
                        + "See output log (e.g. dry-run results) for the complete command.").create();
        uiCheckCombinePepxml = UiUtils
                .createUiCheck("<html>Single <b>combined</b> pepxml file per experiment / group", false);
        uiCheckCombinePepxml.setName("combine-pepxml");


        mu.layout(this).fillX();
        mu.borderEmpty(this);

        pTop = mu.newPanel(null, mu.lcFillXNoInsetsTopBottom());
        mu.add(pTop, checkRun).split();
        mu.add(pTop, checkKeepTsvFiles);
        mu.add(pTop, feMinProb.label(), mu.ccR()).gapLeft("80px");
        mu.add(pTop, feMinProb.comp).pushX().wrap();

        pContent = mu.newPanel(null, mu.lcFillXNoInsetsTopBottom());
        mu.add(pContent, feCmdOpts.label()).alignX("right");
        mu.add(pContent, feCmdOpts.comp).growX().pushX().wrap();

        mu.add(this, pTop).growX().wrap();
        mu.add(this, pContent).growX().wrap();
    }

    private void loadDefaults(SearchTypeProp type) {
        Fragpipe.getPropsFixAndSetVal("percolator.cmd.line.opts." + type.name(), uiTextCmdOpts);
        Fragpipe.getPropsFixAndSetVal("percolator.combine.pepxml." + type.name(), uiCheckCombinePepxml);
    }

    private String defaultCmdOpts() {
        String v = Fragpipe.getPropFix("percolator.cmd.line.opts", "closed");
        log.debug("Peptide prophet default value for Cmd Opts in ui fetched from properties: percolator.cmd.line.opts.closed={}", v);
        return v;
    }

    private FormEntry.Builder fe(JComponent comp, String name) {
        return Fragpipe.fe(comp, name, PREFIX);
    }

}
