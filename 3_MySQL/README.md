
# Base de Datos


### Requirements

Programs                | Version
:-----------------------|:----------
 MySQL 	                | 5.5.x


Entrar en el servicio de mysql 

Ejemplo:
```bash
mysql -u root -p  

``` 

Crear base de datos: 

Ejemplo:
```bash
CREATE DATABASE futbol;

``` 

Se debe importar el sql en una base de datos. 

Ejemplo:
```bash
mysql -u root -p futbol < futbol.sql

``` 

* Consulta 1:

¿Cuál es el jugador más viejo de cada equipo?

```bash
SELECT * FROM jugadores
INNER JOIN
(SELECT MIN(fecha_nacimiento) min_Fecha from jugadores group by fk_equipos) jugadores2
ON jugadores.fecha_nacimiento = jugadores2.min_Fecha;
``` 

* Consulta 2:

¿Cuántos partidos jugó de visitante cada equipo? (nota: hay equipos no jugaron ningún partido)

```bash
SELECT nombre, count(partidos.fk_equipo_visitante) as partidos_como_visitante FROM equipos 
LEFT JOIN partidos
ON partidos.fk_equipo_visitante = equipos.id_equipos 
group by id_equipos;
``` 

* Consulta 3:

¿Qué equipos jugaron el 01/01/2016 y el 12/02/2016?

```bash
SELECT GROUP_CONCAT( nombre SEPARATOR ' vs ') AS equipos, partidos.fecha_partido FROM equipos 
INNER JOIN partidos
ON id_equipos = fk_equipo_visitante or id_equipos = fk_equipo_local 
WHERE fecha_partido="2016-01-01" or fecha_partido="2016-02-12" 
GROUP BY id_partidos;
``` 

* Consulta 4:

Diga el total de goles que hizo el equipo “Chacarita” en su historia (como local o visitante)

```bash
SELECT nombre,SUM(IF( fk_equipo_local=3, goles_local,0)) AS goles_locales, SUM(IF( fk_equipo_visitante=3, goles_visitante,0)) as goles_visitantes FROM partidos
inner join equipos
on equipos.id_equipos = 3;
``` 
