MATCH (entry:Entry {ID:'1s70'})-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdb_res:PDBResidue)-[r:MAP_TO_UNIPROT_RESIDUE]->
    (unp_res:UNPResidue)<-[:HAS_UNP_RESIDUE]-(unp:UniProt),
    (pdb_res)-[chain_rel:IS_IN_CHAIN]->(chain:Chain)
    RETURN toInteger(entity.ID) as entityId, unp.ACCESSION, unp.NAME, unp.DESCR, toInteger(pdb_res.ID) as pdbResId, toInteger(unp_res.ID) as unpResId, chain.AUTH_ASYM_ID, chain.STRUCT_ASYM_ID,
    toInteger(chain_rel.AUTH_SEQ_ID) as auth_seq_id, chain_rel.PDB_INS_CODE order by toInteger(pdb_res.ID)
