# Bootstrap_My_BlackArch
Welcome to Bootstrap my BlackArch! First and foremost, a few formalities out of 
the way. I accept no responsibility for any use or misuse of the 
tools installed by this script, or any damages caused by your actions. 
By using this script, you agree to use them ethically. I also accept 
no responsibility for any damage or data loss caused by the use of this script 
on your system. Use at your own risk! it is your responsibility to verify 
what is contained in the script, and that it will work for your purposes.

The purpose this script was written for, is to quickly and easily setup 
BlackArch virtual machines for pentesting and lab use. It will assume you have
already done a base arch install with an xfce4 desktop environment 
installed. It should work with most other desktop environments if you remove 
blackarch-config-xfce from the package list. There is also no reason why this 
script would not work on a bare metal install, but I'll leave that to your 
judgement. It has a default list of tools, as well as some basic utilities.

Feel free to edit for your own purposes. 

Step 1. Get a current Arch Linux install iso from https://archlinux.org/download/
2. Load the iso into your hypervisor and configure as necessary.
3. Boot the virtual machine, and run archinstall at the command prompt.
Follow the arch linux wiki at https://wiki.archlinux.org/title/archinstall. 
4. Configure the arch install as needed. At the profile section, select desktop ->
xfce4 for the defaults in this script.
5. When the install finishes, run the script in the newly installed, reboot into
6. the new desktop environment and run the script. 
 
THE SCRIPT MUST BE RUN AS SUDO.

sudo ./blackarch-installer.sh

BlackArch artwork including the wallpapers can be found under 
/usr/share/blackarch.
The script will copy the wallpapers to the xfce default folder, this is a work
around for permission issues when trying to set them from the default install directory. 
Seclists can be found under usr/share/seclists, and rockyou,txt will extract to 
/usr/share/seclists/rockyou.txt
The Blackarch theme will be available under your xfce theme settings, as well as the icons. 
Setting blackarch icons will allow the cosmetics for blackarch menus to function properly, 
but isnt mandatory should you prefer another icon type. 
For virtualbox guests, I recommend installing virtualbox-guest-utils for a quality of life upgrade.
  
Have fun and happy hacking! 
