MATCH(uniprot:UniProt)-[:HAS_UNP_RESIDUE]->(unp_res:UNPResidue)<-[:MAP_TO_UNIPROT_RESIDUE]-(pdb_res:PDBResidue)<-[:HAS_PDB_RESIDUE]-(entity:Entity)-[:HAS_TAXONOMY]->(tax:Taxonomy), (entity)-[:CONTAINS_CHAIN]->(chain:Chain), (entity)<-[:HAS_ENTITY]-(entry:Entry)-[:EXPERIMENT]->(method:Method) WHERE toInteger(unp_res.ID) IN RANGE(1,100)
    WITH entry.ID AS entry_id, entity.ID AS entity_id, chain.AUTH_ASYM_ID AS chain_id, collect(DISTINCT pdb_res.ID) AS pdb_residues, collect(DISTINCT unp_res.ID) AS unp_residues, MIN(toInteger(pdb_res.ID)) AS pdb_start, MAX(toInteger(pdb_res.ID)) as pdb_end, MIN(toInteger(unp_res.ID)) as unp_start, MAX(toInteger(unp_res.ID)) as unp_end, tax.TAX_ID AS taxonomy_id, method.METHOD AS experiment, toFloat(entry.RESOLUTION) AS resolution, toFloat(entry.R_FACTOR) as r_factor
    RETURN entry_id, entity_id, chain_id, SIZE(pdb_residues)/(unp_end-unp_start) AS coverage, pdb_start, pdb_end, unp_start, unp_end, taxonomy_id, resolution, r_factor, experiment ORDER BY round(3 * toFloat(coverage))/3 DESC, toFloat(resolution) ASC LIMIT 50
