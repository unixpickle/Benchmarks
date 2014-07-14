<?php

if ($argc != 3)
{
	printf("Usage: %s <size> <iterations>\n", $argv[0]);
	exit(1);
}


$myList = range(0, $argv[1] - 1);

for ($i = 0; $i < $argv[2]; $i++)
{
	reverseArray($myList);
}

/**
 * Reverses an array inplace
 * @param array &$array An array to be reversed
 */
function reverseArray(&$array)
{
	for ($i = 0; $i < count($array) >> 1; $i++)
	{
		$lastIdx = count($array) - $i - 1;
		$lastValue = $array[$lastIdx];
		$array[$lastIdx] = $array[$i];
		$array[$i] = $lastValue;
	}
}

