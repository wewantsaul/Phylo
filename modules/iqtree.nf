process iqtree {
	container 'staphb/iqtree2:2.2.2.6'

	tag "constructing ML tree"

	publishDir (
	path: "${params.out_dir}/06_iqtree",
	mode: "copy",
	overwrite: "true"
	)

	input:
	file(roary_aln)

	output:
	path "*"

	script:
	"""
	cat $roary_aln > allseq.aln
	iqtree2 -T AUTO \
	-s allseq.aln \
	-B 1000
	"""

}
