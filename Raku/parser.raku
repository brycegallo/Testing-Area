# pseudo-constants
my $STOP_WORDS = 0;           # flag - filter stopwords, 0 (off) | 1 (on)
my $DEBUG = 0;				  # flag - debug words, 0 (off) | 1 (on)
my $SEQUENCE_LENGTH = 10;	  # length of song title, suggested default 10
my $FILE = "";

# variable initialization
my @tracks = ();        # array of song tracks
my %counts = ();        # hash of hashes for bigram counts
my %word_history = ();  # hash of words used in current sequence, reset for new sequence

# This extracts a title from the raw track input line
sub extract_title {
	if ($DEBUG) {say "<extracting titles>\n";}
	my @tracktitles = ();
	
	for @tracks -> $track { 
		## regex to capture song title only
		if ($track ~~ /(.*)/) {
			# $0 should be the title caught by regex first set of parens
			@tracktitles.push: $0;  # add to end of array
		}
	} 
	# Updates @tracks
	return @tracktitles;
}

# This removes comments and parenthetical information
sub comments {
	if ($DEBUG) {say "<filtering comments>\n";}
	my @filteredtitles = ();
	
	# This loops through each track
	for @tracks -> $title { 
		$_ = $title;

        ## Add regex substitutions to remove superflous comments and all that follows them
		## Assign to $_ with smartmatcher (~~)
		# Uncomment and replace ... with a substition for ( and anything that follows
		# $_ ~~ ...
		
		@filteredtitles.push: $_;   # Add edited $title to the new array of titles
	}
	# Updates @tracks
	return @filteredtitles;
}

# This removes punctutation
sub punctuation {
	if ($DEBUG) {say "<filtering punctuation>\n";}
	my @filteredtitles = ();
	## Add regex substitutions to remove punctuation
	
	for @tracks -> $title { 
		$_ = $title;
		# Uncomment and replace ... with a substition for ?
		# $_ ~~ ...

		# Repeat for the other symbols

		
		@filteredtitles.push: $_;	# Add the edited $title to the new array of titles
	}
	return @filteredtitles;	# Updates @tracks	
}