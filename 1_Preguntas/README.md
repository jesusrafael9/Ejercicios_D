#Preguntas

###1) Supone que en un repositorio GIT hiciste un commit y te olvidaste un archivo.Explicar como se soluciona si hiciste push, y como si aun no hiciste. De ser posible, buscar que quede solo un commit con los cambios.


###2) Tenes un sitio en tu computadora de desarrollo, y cuando entras desde el navegador, en la consola te aparece esto:

```bash

https://site.local/favicon.ico Failed to load resource: net::ERR_INSECURE_RESPONSE

```
El archivo existe, el sitio debe cargar por https. Como lo solucionas? El error es por que el certificado del servicio web o no existe o expiro.

Se supone que la maquina del desarrollador esta bajo las siguientes caracateristicas:

- Sistema Operativo Debian 8.

- Web server Apache2 



Solucion 1:

Crear una carpeta en el servidor web :

```bash

mkdir -p mis_certificados/localhost

```

Generar un certificado ssl configurarlo en apache,

```bash

openssl genrsa -aes256 -out etc/apache/mis_certificados/localhost/local.key 2048

```

Ahora necesitamos generar el CSR (Certificate Signing Request), esto es una “solicitud de firma” que incluye datos del “dueño” del certificado SSL.


```bash

openssl req -new -key etc/apache2/mis_certificados/localhost/local.key -config rutadeconfiguracion/openssl/openssl.cnf -out etc/apache2/mis_certificados/localhost/local.csr

```


Crear virtual host en apache: 

Crear un archivo localhost con la extension .conf dentro de la carpeta /etc/apache2/site-available/

```bash

vi localhost.conf

```

Insertar el siguiente codigo: 

```bash

<IFModule mos_ssl.c>
<VirtualHost _default_:443>
DocumentRoot /var/www/html/localhost
ServerName localhost.jesus:443
ServerAdmin jesus@home.com
ErrorLog ${APACHE_LOG_DIR}/error.log
SSLEngine on
SSLCertificateFile /etc/apache2/miscerticifados/localhost/localhost.pem
SSLCertificateKeyFile /etc/apache2/miscerticifados/localhost/localhost.key
<FilesMatch "\.(cgi|shtml|phtml|php)$">
    SSLOptions +StdEnvVars
</FilesMatch>
<Directory usr/bin/cgi-bin>
    SSLOptions +StdEnvVars
</Directory>
BrowserMatch "MSIE [2-5]" \
         nokeepalive ssl-unclean-shutdown \
         downgrade-1.0 force-response-1.0

CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

<IFModule>

```

Luego Ejecutar el siguiente comando:


```bash

a2ensite localhost.conf 

```

Reiniciamos el Server apache:

```bash

/etc/init.d/apache2 restart

```

Luego importarlo en el navegador el certificado csr.



Solucion 2 : (en caso de estar en chrome)

Chrome from the terminal: 

Chrome --ignore-certificate-errors


###3) Tenes un archivo comiteado en un repositorio GIT que deseas que quede ignorado. Que pasos debes realizar?

*1- editar o crear el archivo .gitignore , alli se agrega el nombre del archivo a ser ignorado

*2- git rm --cached archivoaignorar.txt (Eliminar el archivo en repo)


###4) Explica las ventajas de cargar en tu sitio las librerias de terceros por GTM.

Aqui menciono algunas de las ventajas que permiten tener estas librerias GTM:


*	Es gratuito : no implica ningun costo en inversion.


*	Rápido de usar: Por la gran documentacion que hay, el manejo de las herramientas lo hacen  fácil.


*	Totalmente integrado con Google Analytics y Google Adwords: por ser productos de google existe una integridad con todas las paqueterias


*	Sistema de testeo en vivo.


*	Creación de lógicas de análisis más rápida y sin intervención de los departamentos IT: Más independencia. 


*	Una gran comunidad que aporta conocimiento sobre la herramienta.



Links relations

GTM Google:

http://analyticstagmanager.com/ventajas-y-desventajas-de-google-tag-manager/

SSL Certificados:

https://www.digitalocean.com/community/tutorials/how-to-create-a-ssl-certificate-on-apache-for-debian-8

https://www.linode.com/docs/security/ssl/ssl-apache2-debian-ubuntu
