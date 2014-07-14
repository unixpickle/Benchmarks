<?php

if ($argc != 3)
{
	printf("Usage: %s <start> <end>", $argv[0]);
	exit(1);
}

$start = $argv[1];
$end = $argv[2];

for ($i = $start; $i <= $end; $i++)
{
	printf("rollAverage(%d) = %d\n", $i, rollAverage($i));
}


/**
 * @param int $dest
 * @return int
 */
function addUpTo($dest)
{
	$sum = 0;
	for ($i = 1; $i <= $dest; $i++)
	{
		$sum += $i;
	}
	return $sum;
}

/**
 * @param int $dest
 * @return float
 */
function rollAverage($dest)
{
	$average = 0;
	for ($i = 0; $i < $dest; $i++)
	{
		$average = ($average + addUpTo($i)) / 2.0;
	}
	return $average;
}
