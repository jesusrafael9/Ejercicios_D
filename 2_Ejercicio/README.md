# Ejercicio

Escribir una funcion que determine si un conjunto de cartas de una lista representan una escalera de poker (5 cartas con valores consecutivos) o no.

* Las cartas siempre tienen valores entre 2 y 14, donde 14 es el AS.

* Tener en cuenta que el AS tambien cuenta como 1.

* La cantidad de cartas puede variar, pero nunca es superior a 7.


### Requirements

Programs                | Version
:-----------------------|:----------
 PHP Unit               | 5.7.15
 Git 					| 2.x


 ###Test php unit
Ver la version de phpunit
```bash
phpunit --version

```

###Clonar el repositorio. 

```bash
git clone https://github.com/jesusrafael9/test_jesus.git

```

###Pocisionar en el directorio de la app

```bash
cd 2_Ejercicio/

```

###Ejecutar La prueba del Algoritmo. 

```bash
phpunit

```
En la ejecucion phpunit utiliza el archivo phpunit.xml, para la carga de las clases a testear.


###Función implementada para la escalera poker.

```sh

	public function isStraight($cards) {
		$this->cards = $cards;
		$this->straight = false;
		if ( count($this->cards) > 7 ) return false;
		for($i = 1; $i <= 14; $i++) {
		    $ind = $i;
		    if (!in_array($ind, $this->cards)) continue;
		    $s = [$ind, $this->valid($ind), $this->valid($ind), $this->valid($ind), $this->valid($ind)];    
		    $this->straight = count(array_intersect($s, $this->cards)) == count($s);
		    if ($this->straight) break;
		}
		return $this->straight;
	}

	public function valid(&$i) {
		    if ($i == 14 ||  $i == 1) 
		        $i = 2;
		    else
		        $i++;
		    return $i;
	}

```