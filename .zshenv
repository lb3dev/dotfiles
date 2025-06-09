function ping-google {
    ping -i 5 google.com | while read line; do echo `date` - $line; done
}