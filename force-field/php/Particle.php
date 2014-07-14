<?php

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
