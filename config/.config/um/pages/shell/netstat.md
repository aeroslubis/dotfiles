# netstat --
{:data-section="shell"}
{:data-date="May 27, 2019"}
{:data-extra="Um Pages"}

## SYNOPSIS

  Displays network-related information such as open connections, open socket ports, etc.

## OPTIONS


  `netstat -a` : List all ports

  `netstat -l` : List all listening ports

  `netstat -t` : List listening TCP ports


  `netstat -p` : Display PID and program names


  `netstat -c` : List information continuously


  `netstat -rn` : List routes and do not resolve IP to hostname


  `netstat -lepunt` : List listening TCP and UDP ports (+ user and process if you're root)


  `netstat -nr` : Print the routing table:

  `netstat -tulpn` : Find out which process is listing upon a port
