# Restore Touch Bar

__Note that this process has only been tested on macOS Catalina, and we do not guarantee that it will work with other versions of the operating system.__

This script will kill the MacBook Touch Bar processes executing the following commands

```bash
sudo pkill TouchBarServer
sudo killall "ControlStrip"
```

You can either run the script or just run those two commands on the Terminal.

Terminal requires your password to complete the process and restart anything related to Touch Bar. It’s normal to not see the characters on the screen while you’re typing, so just press the Return key again when you have finished.

The system will instantly restart the process that controls the Touch Bar and it should work as expected again.