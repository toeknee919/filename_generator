#Author: 	Anthony Hess
#Date :		3/26/15
#Purpose:	This file generates a file name (or whatever) with a noun-adjective result.
			

#set path for this files location
$this_path = split-path -parent $MyInvocation.MyCommand.Definition

#Read the count of words in each file
$readerNoun = [System.IO.File]::OpenText("$this_path\nouns.txt")
try {
	$totalNoun = 0
    for(;;) {
        $line = $readernoun.ReadLine()
        if ($line -eq $null) { break }
        # process the line
        $totalNoun++
    }
	
}
catch{}

$readerAdj = [System.IO.File]::OpenText("$this_path\adjectives.txt")
try {
	$totalAdj = 0
    for(;;) {
        $line = $readerAdj.ReadLine()
        if ($line -eq $null) { break }
        # process the line
        $totalAdj++
    }
}
catch{}

#close the files
$readerAdj.Close()
$readerNoun.Close()


#get two random numbers for selecting index if words for file name
$noun_index = get-random -maximum $totalNoun
$adj_index = get-random -maximum $totalAdj


$readerNoun = [System.IO.File]::OpenText("$this_path\nouns.txt")
$readerAdj = [System.IO.File]::OpenText("$this_path\adjectives.txt")

#choose the words from the files
$mx = [System.Math]::Max($noun_index, $adj_index)
$return_adj
$return_noun

for($i = 0; $i -le $mx; $i++){
	$adjLine = $readerAdj.ReadLine()
	$nounLine = $readerNoun.ReadLine()
	
	if($i -eq $noun_index){
		$return_noun = $nounLine.Trim()
	}
	if($i -eq $adj_index){
		$return_adj = $adjLine.Trim()	
	}
}

#close the files
$readerAdj.Close()
$readerNoun.Close()

#print/return the generated name
return "$return_adj-$return_noun"