<?php

class Vector {
	public $x;
	public $y;

	public function __construct($x, $y)
	{
		$this->x = $x;
		$this->y = $y;
	}

	public function subtract($v)
	{
		return new static($this->x - $v->x, $this->y - $v->y);
	}

	public function add($v)
	{
		return new static($this->x + $v->x, $this->y + $v->y);
	}

	public function scale($d)
	{
		return new Vector($this->x * $d, $this->y * $d);
	}

	public function addInPlace($v)
	{
		$this->x += $v->x;
		$this->y += $v->y;
	}

	public function dot($v)
	{
		return ($this->x * $v->x) + ($this->y * $v->y);
	}

	public function normalize()
	{
		$magnitude = sqrt($this->dot($this));
		if ($magnitude == 0) return new static(0, 0);
		return $this->scale(1.0 / $magnitude);
	}

	public function __toString()
	{
		return sprintf('(%f, %f)', $this->x, $this->y);
	}
}

class Particle {
	public $position;
	public $mass;
	public $velocity;

	public function __construct($pos, $mass)
	{
		$this->position = $pos;
		$this->mass = $mass;
		$this->velocity = new Vector(0, 0);
	}

	public function forceFrom(Particle $p)
	{
		$distance = $p->position->subtract($this->position);
		$magnitude = $this->mass * $p->mass / $distance->dot($distance);
		return $distance->normalize()->scale($magnitude);
	}

	public function applyForce($force, $timeDelta)
	{
		$this->velocity->addInPlace($force->scale($timeDelta / abs($this->mass)));
		$this->position->addInPlace($this->velocity->scale($timeDelta));
	}

	public function __toString()
	{
		return sprintf('{Particle mass: %d velocity: %s position: %s', $this->mass, $this->velocity, $this->position);
	}
}

if ($argc != 3)
{
	printf("Usage: %s <time delta> <count>\n", $argv[0]);
	exit(1);
}


$timeDelta = $argv[1];
$count = $argv[2];

$p1 = new Particle(new Vector(0.3, 0), -1);
$p2 = new Particle(new Vector(-0.3, 1), 1);

for ($i = 0; $i < $count; $i++)
{
	$force1 = $p1->forceFrom($p2);
	$force2 = $p2->forceFrom($p1);

	$p1->applyForce($force1, $timeDelta);
	$p2->applyForce($force2, $timeDelta);
}

echo "p1 = " . $p1 . "\n";
echo "p2 = " . $p2 . "\n";

