# fix-asterisk-externhost

This script checks for changes on your external IP address and modifies the "externhost" parameter in sip_general_custom.conf

Setting my dynmic hostname in "External Address" in "Asterisk SIP Settings"/"NAT Settings" on my FreePBX did not work as expected.
So, instead of spending time to find why I have NAT problems and one-way audio, I wrote this simple script which does the job.

Don't forget to add this at your crontab:

*/5 * * * * /usr/local/fix-asterisk-externhost.sh >/dev/null 2>&1
