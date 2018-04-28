#!/usr/bin/perl
#--------------------------------------------------------------------#
#        Transfer Genome sequence wit BWT                            #
#        H.F. 20180428 Version 0.1                                   #
#--------------------------------------------------------------------#
die "usage: perl bwt4fq.pl <genome_file.fa>\n" unless @ARGV == 2;

my $genome_file = $ARGV[0];
open genome, $genome_ref;         # Source files
open bwm_sort, ">$fq_file.sort";  # Return files
#open debug,dd


# Preprocess the genome sequence: delete \n""
$genome[0] = <genome>;
my @genome;                       # Store genome chromose sequence 
chomp $genome[0];
while($ref = <genome>){	
	chomp $ref;
	if ( substr($ref,0,1) eq '>'){
			$genome[1] = $genome[1].$ref;
	}
}

$seq_debug = substr($genome[1],0,10).'$';
bwt();

sub bwt(){
	my @bwm_pre;
	my $bwm_line = $genome[1];
	my $length = length( $genome[1]);
	foreach $pnt (0..$length-1){
		$bwm_line = substr($bwm_line,-1,1).substr($bwm_line,0,$length-1);
		$bwm_pre[$pnt] = $bwm_line;
	}

	#print join("\n", @bwm_pre);
	my @bwm_sort = sort(@bwm_pre);
	
	foreach $col (@bwm_sort){
		$bwm_file = $bwm_file.substr($col,-1,1);
	}
	print bwm_sort $bwm_file;
}


