MATCH (entry:Entry {ID:'1s70'})-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdb_res:PDBResidue)-[:MAP_TO_UNIPROT_RESIDUE]->(unp_res:UNPResidue)-[rel:IS_IN_PFAM]->(pfam:Pfam)
    WITH DISTINCT pfam.PFAM_ACCESSION AS pfam_domain, pfam.DESCRIPTION AS domain_name, pdb_res.ID AS pdb_res_id, pdb_res.CHEM_COMP_ID AS pdb_res_code ORDER BY toInteger(pdb_res_id)
    RETURN pfam_domain, domain_name, COLLECT(pdb_res_id) AS pdb_residues, COLLECT(pdb_res_code) AS pdb_residue_codes LIMIT 50
