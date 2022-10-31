<img src="Assets/JailityNewRounded.png" alt="Logo" width="70" height="70">

# Jaility
Simple iOS supercharger to be used with TrollStore. Can be used to disable locking after respring, supervise your Device in one click, change badge colours and make your password keys blank.

# Warning
If you used disable lock after respring, and want to enable it back but the enable lock after respring button doesn't work, try rebooting. If rebooting doesn't work, you need to go to /var/Managed Preferences/mobile and edit the key in com.apple.springboard.plist named SBDontLockAfterCrash to false. Should work. Also, the app doesn't work on iOS 13 and lower!

# Installing
Download the latest .iPA file from Releases tab and import it to TrollStore. That's it. :)

# Compiling
To build the .iPA so it can be used with TrollStore you need to install ldid and modify the build.command a bit, then run it in the terminal.

# Credits
The Respring Project by Amy, fiore for UI insporation and all of my testers. :)
