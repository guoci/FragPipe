/*
 * Copyright (C) 2018 Dmitry Avtonomov
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package umich.msfragger.gui;

import static java.nio.charset.StandardCharsets.UTF_8;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import umich.msfragger.cmd.ProcessBuilderInfo;
import umich.msfragger.util.StringUtils;

class ProcessResult implements AutoCloseable {

  private final ProcessBuilderInfo pbi;

  private boolean started;
  private StringBuilder output = new StringBuilder();
  private Integer exitCode;
  private Process proc;
  private InputStream stdOut;
  private InputStream stdErr;
  private BufferedOutputStream stdErrRedirect;
  private BufferedOutputStream stdOutRedirect;

  public ProcessResult(ProcessBuilderInfo pbi) {
    this.pbi = pbi;
  }

  public Process start() throws IOException {
    stdErrRedirect = createStdErrRedirect();
    stdOutRedirect = createStdOutRedirect();
    stdOut = proc.getInputStream();
    stdErr = proc.getErrorStream();
    proc = pbi.pb.start();
    started = true;
    return proc;
  }

  @Override
  public void close() throws Exception {
    if (stdOutRedirect != null) {
      stdOutRedirect.close();
    }
    if (stdErrRedirect != null) {
      stdErrRedirect.close();
    }
  }

  public Process getProc() {
    return proc;
  }

  public byte[] pollStdOut() throws IOException {
    return poll(stdOut);
  }

  public byte[] pollStdErr() throws IOException {
    return poll(stdErr);
  }

  private static byte[] poll(InputStream is) throws IOException {
    if (is == null) {
      return null;
    }
    int available = is.available();
    if (available > 0) {
      byte[] bytes = new byte[available];
      int read = is.read(bytes);
      return bytes;
    }
    return null;
  }

  private BufferedOutputStream createStdOutRedirect() throws IOException {
    return createOutputStream(pbi.pb, pbi.fnStdOut);
  }

  private BufferedOutputStream createStdErrRedirect() throws IOException {
    return createOutputStream(pbi.pb, pbi.fnStdErr);
  }

  /**
   * Creates a new file output stream to the
   */
  private static BufferedOutputStream createOutputStream(ProcessBuilder pb, String fn) throws IOException {
    if (!StringUtils.isNullOrWhitespace(fn) && pb.directory() != null) {
      final Path pathLogOut = pb.directory().toPath().resolve(fn);
      if (!Files.exists(pathLogOut.getParent())) {
        Files.createDirectories(pathLogOut);
      }
      return new BufferedOutputStream(Files
          .newOutputStream(pathLogOut, StandardOpenOption.CREATE,
              StandardOpenOption.TRUNCATE_EXISTING, StandardOpenOption.WRITE));
    }
    return null;
  }

  public ProcessBuilder getPb() {
    return pbi.pb;
  }

  public boolean isStarted() {
    return started;
  }

  public StringBuilder getOutput() {
    return output;
  }

  public String appendOut(byte[] bytes) throws IOException {
    return append(bytes, stdOutRedirect);
  }

  public String appendErr(byte[] bytes) throws IOException {
    return append(bytes, stdErrRedirect);
  }

  private String append(byte[] bytes, BufferedOutputStream bos) throws IOException {
    if (bytes == null || bytes.length == 0) {
      return null;
    }
    String s = new String(bytes, UTF_8);
    output.append(s);
    if (bos != null) {
      bos.write(bytes);
    }
    return s;
  }

  public Integer getExitCode() {
    return exitCode;
  }

  public void setExitCode(Integer exitCode) {
    this.exitCode = exitCode;
  }
}
