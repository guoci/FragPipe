/*
 * This file is part of FragPipe.
 *
 * FragPipe is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FragPipe is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with FragPipe.  If not, see <https://www.gnu.org/licenses/>.
 */

package com.dmtavt.fragpipe.cmd;

import com.dmtavt.fragpipe.Fragpipe;
import com.dmtavt.fragpipe.FragpipeLocations;
import com.dmtavt.fragpipe.api.InputLcmsFile;
import com.dmtavt.fragpipe.tools.opair.OPairParams;
import com.dmtavt.fragpipe.util.PairScans;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import org.jooq.lambda.Seq;

public class CmdPairScans extends CmdBase {


    public static final String NAME = "PairScans";
    public static final String JAR_MSFTBX_NAME = ToolingUtils.BATMASS_IO_JAR;
    private static String[] JAR_DEPS = {JAR_MSFTBX_NAME};

    public CmdPairScans(boolean isRun, Path workDir) {
        super(isRun, workDir);
    }

    @Override
    public String getCmdName() {
        return NAME;
    }

    public boolean configure(Path jarFragpipe, int ramGb, int nThreads, List<InputLcmsFile> lcmsFiles, OPairParams params) {
        initPreConfig();

        final List<Path> classpathJars = FragpipeLocations.checkToolsMissing(Seq.of(jarFragpipe.toAbsolutePath().toString()).concat(JAR_DEPS));
        if (classpathJars == null) {
            return false;
        }

        for (InputLcmsFile lcms : lcmsFiles) {
            List<String> cmd = new ArrayList<>();
            cmd.add(Fragpipe.getBinJava());
            cmd.add("-Xmx" + ramGb + "G");
            cmd.add("-cp");
            cmd.add(constructClasspathString(classpathJars));
            cmd.add(PairScans.class.getCanonicalName());
            cmd.add(lcms.getPath().toAbsolutePath().toString());
            cmd.add(nThreads + "");
            cmd.add(params.getActivation1());
            cmd.add(params.getActivation2());
            cmd.add(String.valueOf(params.isReverseScanOrder()));
            cmd.add(String.valueOf(params.isSingleScanType()));
            ProcessBuilder pb = new ProcessBuilder(cmd);
            pbis.add(PbiBuilder.from(pb));
        }

        isConfigured = true;
        return true;
    }
}
