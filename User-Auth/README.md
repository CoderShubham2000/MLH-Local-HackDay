

#### Auto-Installation in a Ubuntu 14.04 LTS server <a name="auto-installation-ubuntu"></a>

Extremely simple installation in a fresh and naked typical Ubuntu 14.04 LTS server:

Download the installer script
```bash
wget https://raw.githubusercontent.com/panique/huge/master/_one-click-installation/bootstrap.sh
```

Make it executable
```bash
chmod +x bootstrap.sh
```

Run it! Give it some minutes to perform all the tasks. And yes, you can thank me later :)
```bash
sudo ./bootstrap.sh
```
### Installation <a name="installation"></a>

#### Quick guide: <a name="quick-installation"></a>

0. Make sure you have Apache, PHP, MySQL installed. [Tutorial](http://www.dev-metal.com/installsetup-basic-lamp-stack-linux-apache-mysql-php-ubuntu-14-04-lts/). 
1. Clone the repo to a folder on your server
2. Activate mod_rewrite, route all traffic to application's /public folder. [Tutorial](http://www.dev-metal.com/enable-mod_rewrite-ubuntu-14-04-lts/).
3. Edit application/config: Set your database credentials
4. Execute SQL statements from application/_installation to setup database tables
5. [Install Composer](http://www.dev-metal.com/install-update-composer-windows-7-ubuntu-debian-centos/),
   run `Composer install` on application's root folder to install dependencies
6. Make avatar folder (application/public/avatars) writable
7. For proper email usage: Set SMTP credentials in config file, set EMAIL_USE_SMTP to true

"Email does not work" ? See the troubleshooting below. TODO

#### Detailed guide (Ubuntu 14.04 LTS): <a name="detailed-installation"></a>

This is just a quick guideline for easy setup of a development environment!

Make sure you have Apache, PHP 5.5+ and MySQL installed. [Tutorial here](http://www.dev-metal.com/installsetup-basic-lamp-stack-linux-apache-mysql-php-ubuntu-14-04-lts/). 
Nginx will work for sure too, but no install guidelines are available yet. 

Edit vhost to make clean URLs possible and route all traffic to /public folder of your project:
```bash
sudo nano /etc/apache2/sites-available/000-default.conf
```

and make the file look like
```
<VirtualHost *:80>
    DocumentRoot "/var/www/html/public"
    <Directory "/var/www/html/public">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

Enable mod_rewrite and restart apache.
```bash
sudo a2enmod rewrite
service apache2 restart
```

Install curl (needed to use git), openssl (needed to clone from GitHub, as github is https only),
PHP GD, the graphic lib (we create captchas and avatars), and git.
```bash
sudo apt-get -y install curl
sudo apt-get -y install php5-curl
sudo apt-get -y install openssl
sudo apt-get -y install php5-gd
sudo apt-get -y install git
```

git clone HUGE
```bash
sudo git clone https://github.com/panique/huge "/var/www/html"
```

Install Composer
```bash
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
```

Go to project folder, load Composer packages (--dev is optional, you know the deal)
```bash
cd /var/www/html
composer install --dev
```

Execute the SQL statements. Via phpmyadmin or via the command line for example. 12345678 is the example password.
Note that this is written without a space.
```bash
sudo mysql -h "localhost" -u "root" "-p12345678" < "/var/www/html/application/_installation/01-create-database.sql"
sudo mysql -h "localhost" -u "root" "-p12345678" < "/var/www/html/application/_installation/02-create-table-users.sql"
sudo mysql -h "localhost" -u "root" "-p12345678" < "/var/www/html/application/_installation/03-create-table-notes.sql"
```

Make avatar folder writable (make sure it's the correct path!)
```bash
sudo chown -R www-data "/var/www/html/public/avatars"
```
If this doesn't work for you, then you might try the hard way by setting alternatively
```bash
sudo chmod 0777 -R "/var/www/html/public/avatars"
```

Remove Apache's default demo file
```bash
sudo rm "/var/www/html/index.html"
```

Edit the application's config in application/config/config.development.php and put in your database credentials.

Last part (not needed for a first test): Set your SMTP credentials in the same file and set EMAIL_USE_SMTP to true, so
you can send proper emails. It's highly recommended to use SMTP for mail sending! Native sending via PHP's mail() will
not work in nearly every case (spam blocking). I use [SMTP2GO](http://www.smtp2go.com/?s=devmetal).

Then check your server's IP / domain. Everything should work fine.

#### NGINX setup: <a name="nginx-setup"></a>

This is an untested NGINX setup. Please comment [on the ticket](https://github.com/panique/huge/issues/622) if you see 
issues.
 
```
server {
    # your listening port
    listen 80;

    # your server name
    server_name example.com;

    # your path to access log files
    access_log /srv/www/example.com/logs/access.log;
    error_log /srv/www/example.com/logs/error.log;

    # your root
    root /srv/www/example.com/public_html;

    # huge
    index index.php;

    # huge
    location / {
        try_files $uri /index.php?url=$uri&$args;
    }

    # your PHP config
    location ~ \.php$ {
        try_files $uri  = 401;
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/php-fastcgi/php-fastcgi.socket;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

#### IIS setup: <a name="iis-setup"></a>

Big thanks to razuro for this fine setup: Put this inside your root folder, but don't put any web.config in your public 
folder.

```
<?xml version="1.0" encoding="UTF-8"?><configuration>
    <system.webServer>
        <rewrite>
            <rules>
			
                <rule name="Imported Rule 1" stopProcessing="true">
                    <match url="^(.*)$" ignoreCase="false" />
					<conditions logicalGrouping="MatchAll">
                        <add input="{REQUEST_FILENAME}" matchType="IsDirectory" ignoreCase="false" negate="true" />
                        <add input="{REQUEST_FILENAME}" matchType="IsFile" ignoreCase="false" negate="true" />
                    </conditions>
                    <action type="Rewrite" url="public/index.php?url={R:1}" />
                </rule>
            </rules>
        </rewrite>
    </system.webServer>
</configuration>
```

Find the original [ticket here](https://github.com/panique/huge/issues/788).

#### Testing with demo users

By default there are two demo users, a normal user and an admin user. For more info on that please have a look on the
user role part of the small documentation block inside this readme.
 
Normal user: Username is `demo2`, password is `12345678`. The user is already activated.
Admin user (can delete and suspend other users): Username is `demo`, password is `12345678`. The user is already activated.

### What the hell are .travis.yml, .scrutinizer.yml etc. ?

There are several files in the root folder of the project that might be irritating:

 - *.htaccess* (optionally) routes all traffic to /public/index.php! If you installed this project correctly, then this
   file is not necessary, but as lots of people have problems setting up the vhost correctly, .htaccess it still there
   to increase security, even on partly-broken-installations.
 - *.scrutinizer.yml* (can be deleted): Configs for the external code quality analyzer Scrutinizer, just used here on
   GitHub, you don't need this for your project.
 - *.travis.yml* (can be deleted): Same like above. Travis is an external service that creates installations of this
   repo after each code change to make sure everything runs fine. Also runs the unit tests. You don't need this inside
   your project.
 - *composer.json* (important): You should know what this does. ;) This file says what external dependencies are used.  
 - *travis-ci-apache* (can be deleted): Config file for Travis, see above, so Travis knows how to setup the Apache.    
    
