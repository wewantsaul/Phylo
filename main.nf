nextflow.enable.dsl=2

include {prokka} from './modules/prokka.nf'
include {roary} from './modules/roary.nf'
include {iqtree} from './modules/iqtree.nf'

workflow {

	Channel
		.fromPath("${params.assemblies}/*.{fasta,fa}{,.gz}")
		.map {file -> tuple(file.simpleName, file)}	
		.set{assembly_files}

	main:
	
		prokka(assembly_files)
		roary(prokka.out.gff.collect())
		iqtree(roary.out.alignment)	
        
}

// nextflow run main.nf --assemblies </path/to/assemblies>
