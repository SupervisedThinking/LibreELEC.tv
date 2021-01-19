#!/usr/bin/python
import subprocess
subprocess.call("systemd-run /usr/bin/google-chrome.start", shell=True)
