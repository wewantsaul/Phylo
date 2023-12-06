process roary {
	container 'staphb/roary:3.13.0'
	
	tag "aligning sequences"

	publishDir (
	path: "$params.out_dir",
	mode: "copy",
	overwrite: "true"
	)

	input:
	file(prokka_gff)

	output:
	path "05_roary/*.aln", emit: alignment

	script:
	"""
	roary -e --mafft \
	$prokka_gff \
	-f 05_roary
	"""

}

