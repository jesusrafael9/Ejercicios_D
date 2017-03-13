<?php

namespace PHPUnit\Test;

class Poker extends \PHPUnit_Framework_TestCase{



	public function testAlgorithm() {

			$results1 = $this->isStraight([2, 3, 4 ,5, 6]);

			$this->assertEquals($results1, true, "2, 3, 4 ,5, 6");

			$results2 = $this->isStraight([14, 5, 4 ,2, 3]);

			$this->assertEquals($results2, true, "14, 5, 4 ,2, 3");

			$results3 = $this->isStraight([7, 7, 12 ,11, 3, 4, 14]);

			$this->assertEquals($results3, false, "7, 7, 12 ,11, 3, 4, 14");

			$results4 = $this->isStraight([7, 3, 2]);

			$this->assertEquals($results4, false, "7, 3, 2");
	}



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

}