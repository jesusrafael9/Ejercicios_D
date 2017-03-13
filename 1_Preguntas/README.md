###Preguntas

1) Supone que en un repositorio GIT hiciste un commit y te olvidaste un archivo.Explicar como se soluciona si hiciste push, y como si aun no hiciste. De ser posible, buscar que quede solo un commit con los cambios.


2) Tenes un sitio en tu computadora de desarrollo, y cuando entras desde el navegador, en la consola te aparece esto:

```bash

https://site.local/favicon.ico Failed to load resource: net::ERR_INSECURE_RESPONSE

```
El archivo existe, el sitio debe cargar por https. Como lo solucionas?



El error es por que el certificado del servicio web o no existe o expiro.
Solucion 1:
En una supocion de que mi maquina de desarrollo esta bajo estas caracateristicas:
Sistema operativo: Debian 8
Servidor Web: Apache , version 2.algo
Se soluciona generando un certificado ssl configurarlo en apache, y luego importarlo en el navegador 
estoy implica crear servidores virtual host de http.

Solucion 2 : (en caso de estar en chrome) 
Chrome from the terminal: Chrome --ignore-certificate-errors


3) Tenes un archivo comiteado en un repositorio GIT que deseas que quede ignorado. Que pasos debes realizar?

1- editar o crear el archivo .gitignore , alli se agrega el nombre del archivo a ser ignorado
2- git rm --cached archivoaignorar.txt (Eliminar el archivo en repo)

4) Explica las ventajas de cargar en tu sitio las librerias de terceros por GTM.