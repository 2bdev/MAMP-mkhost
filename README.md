MAMP-mkhost
===========

A bash script to create a virtual host quickly for MAMP.

This is a small and simple script for getting a virtual host up and running in MAMP with one line. **This assumes that you are using the httpd-vhosts.conf file.**

To get started, edit mkhost.sh to set the proper USER and GROUP. These will be used to set permissions on the DocumentRoot to be used.

Once you have all your paths set up, you can use the script like this:

    sudo bash ./mkhost.sh <domain name> <document root>
    
Note: `<document root>` needs to be a full system path

Here is an example:

    sudo bash ./mkhost.sh mynewdomain.dev /Users/username/www
    
This would make the domain name mynewdomain.dev load from the /Users/username/www directory.
    
What this script does:

1. Edit /private/etc/hosts to add <domain name> and point it to 127.0.0.1
2. Check if <document root> exists, if not create it and set permissions to USER and GROUP
3. Edit httpd-vhosts.conf to add the new domain and document root
4. Restart apache so that the changes take effect

Feel free to use, copy, suggest, etc anything with this script.
    
