MATCH (entry:Entry {ID:'1s70'})-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdb_res:PDBResidue)-[:HAS_PISA_BOND]-(interacting_pdb_res:PDBResidue)<-[:HAS_PDB_RESIDUE]-(partner_entity:Entity)-[:HAS_UNIPROT]->(uniprot:UniProt)
    WHERE NOT uniprot.ACCESSION CONTAINS '-'
    WITH DISTINCT uniprot.ACCESSION AS accession, uniprot.DESCR AS description, pdb_res.ID AS pdb_res_id, pdb_res.CHEM_COMP_ID AS pdb_res_code ORDER BY toInteger(pdb_res_id)
    RETURN accession, description, COLLECT(pdb_res_id) AS pdb_residues, COLLECT(pdb_res_code) AS pdb_residue_codes LIMIT 50
