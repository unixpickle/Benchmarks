<?php

if ($argc != 3)
{
	printf("Usage: %s <size> <iterations>", $argv[0]);
	exit(1);
}


$myList = range(0, $argv[1] - 1);

for ($i = 0; $i < $argv[2]; $i++)
{
	$myList = array_reverse($myList);
}
