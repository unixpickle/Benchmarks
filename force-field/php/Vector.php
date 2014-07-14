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
