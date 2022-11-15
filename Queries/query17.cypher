MATCH (entry:Entry {ID:'1s70'})-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdb_res:PDBResidue)-[rel:IS_IN_CATH_DOMAIN]->(cath:CATH) WHERE rel.STRUCT_ASYM_ID=entity.BEST_CHAIN_ID
    WITH DISTINCT cath.CATHCODE AS cath_code, cath.NAME AS domain_name, cath.DOMAIN AS domain_id, pdb_res.ID AS pdb_res_id, pdb_res.CHEM_COMP_ID AS pdb_res_code ORDER BY toInteger(pdb_res_id)
    RETURN cath_code, domain_name, domain_id, COLLECT(pdb_res_id) AS pdb_residues, COLLECT(pdb_res_code) AS pdb_residue_codes LIMIT 50
