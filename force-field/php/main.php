<?php

require_once __DIR__ . '/Vector.php';
require_once __DIR__ . '/Particle.php';

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

