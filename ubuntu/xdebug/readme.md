# Install Xdebug extension

1. First, make sure you have the PHP version you want to run the Xdebug package on active with the following command:

```php -v```

2. Also verify that you have the Xdebug package installed for that version. To do this, when you run the above command, you should see a text similar to *with Xdebug X.X.X*.
3. If this message does not appear, you must install the Xdebug package for the version of PHP you have active.

```sudo apt install phpX.X-xdebug -y```

4. Once the package is installed, navigate to the configuration directory for your PHP version.

```cd /etc/php/YOUR-PHP-VERSION/apache2/conf.d/```

5. Create the following file.

```sudo touch 99-xdebug.ini```
```sudo nano 99-xdebug.ini```

6. Add the following lines to the file.

```
zend_extension = xdebug
xdebug.profiler_enable = off
xdebug.profiler_enable_trigger = Off
xdebug.profiler_output_name = cachegrind.out.%t.%p
xdebug.output_dir = "/var/www/html"
xdebug.show_local_vars=0
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.client_port = 9900
```

7. And save it.
8. The next step is to prepare your IDE to use the package. As I work with VSCode, I have had to download the [PHP Debug extension](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug).
9. Once installed, you must create a **launch.json** file inside the **.vscode** directory of your project.
10. In that file add the content that you can find in this [example](../../vscode/xdebug/launch.json), substituting the values that you consider necessary.

And voilà, you can now use the Xdebug package to debug your code.