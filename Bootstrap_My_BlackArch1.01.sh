
#!/bin/bash

echo "Welcome to Blackarch-Install. By using this script you agree to the terms in 
README.md. This script must be run as sudo, and it assumes you have already done a base 
arch install, with an xfce4 desktop environment."

check_for_root() {
    if [ "$EUID" -ne 0 ]
      then echo -e "\n\n Script must be run with sudo ./blackarch-installer.sh or as root \n"
      exit
    else
    exit
    fi
}

while true; do
read -p "Would you like to proceed? (y/n) " yn
case $yn in 
	[yY] ) echo "Ok, we will proceed.";
		break;;
	[nN] ) echo "Exiting...";
		exit;;
	* ) echo "Invalid response";;
esac
done

echo "Installing basic utilities."

list_of_apps1="openvpn openssh htop proxychains base-devel
git gedit curl p7zip mousepad fail2ban ufw perl-image-exiftool man-db tor" 

pacman -S $list_of_apps1

echo "Enabling multilib repository."

sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

echo "Getting bootstrap script from blackarch.org."

curl -O https://blackarch.org/strap.sh

echo "Verifying SHA sum."

echo 3f121404fd02216a053f7394b8dab67f105228e3 strap.sh | sha1sum -c

while true; do
read -p "Did the sha sum verify? (y/n) " yn
case $yn in 
	[yY] ) echo "Ok, we will proceed.";
		break;;
	[nN] ) echo "Exiting...";
		exit;;
	* ) echo "Invalid response";;
esac
done 

echo "Making script executable."

chmod +x strap.sh

./strap.sh

pacman -Syu

echo "We will now install the default list of tools. Feel free to edit this as you see fit."

echo "Installing blackarch cosmetics. themes, fonts, menus, and wallpapers."

#The blackarch menus will work on most desktops i.e. kde, gnome. If installing on a different desktop, 
#I would advise removing blackarch-config-xfce from the package list. 

list_of_apps2="blackarch-menus blackarch-config-cursor blackarch-config-icons 
blackarch-config-xfce blackarch-artwork noto-fonts"

pacman -S $list_of_apps2

echo "Installing default tool list."

list_of_apps3="aircrack-ng amass arp-scan autorecon bettercap bettercap-ui bloodhound burpsuite
commix crackmapexec dirb dirbuster dnschef dnsenum dnsrecon empire enum4linux exploitdb evil-winrm
feroxbuster ffuf fierce gobuster hashcat hashcat-utils hashid hash-identifier hydra impacket
john kerberoast kismet linenum linux-exploit-suggester maltego metasploit msfdb mimikatz
netdiscover nikto nmap netcat recon-ng responder seclists smbmap sploitctl sqlmap stegcracker
stegdetect steghide subfinder wafw00f wfuzz windows-exploit-suggester wireshark-qt wpscan xsser
zaproxy"  

pacman -S $list_of_apps3

#This is done due to permission conflicts with setting wallpapers from the default artwork directory. 
#This will make them show up under the xfce default directory when you open settings.

echo "Copying wallpapers to xfce folder."
cp /usr/share/blackarch/artwork/wallpaper/*.png /usr/share/backgrounds/xfce

echo "Extracting rockyou.txt"

tar -xvf /usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt.tar.gz --directory /usr/share/seclists

echo "Your blackarch install is now ready to use. I would recommend rebooting.
Seclists are located under /usr/share/seclists. 
rockyou is under /usr/share/seclists/rockyou.txt.
Blackarch artwork is under /usr/share/blackarch.
Setting the blackarch icons under settings will get the cosmetics for blackarch menus working properly.
The blackarch theme should be available under your themes settings."
