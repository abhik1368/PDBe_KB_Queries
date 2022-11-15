MATCH (n:Entry {ID:'1cbs'})-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdb_res:PDBResidue)-[rel:IS_IN_CHAIN]->(chain:Chain)
        WHERE rel.OBSERVED='Y' AND (rel.IS_IN_HELIX='Y' OR exists(rel.SHEETS))
    WITH entity.ID AS entity_id, chain.AUTH_ASYM_ID AS auth_asym_id, chain.STRUCT_ASYM_ID AS struct_asym_id,
    CASE rel.HELIX_SEGMENT
        WHEN null
            THEN "0"
        ELSE rel.HELIX_SEGMENT
    END AS helix_segment, rel.SHEETS AS sheets, toInteger(pdb_res.ID) AS pdb_res_id, toInteger(rel.AUTH_SEQ_ID) AS auth_seq_id, rel.PDB_INS_CODE AS pdb_ins_code
    RETURN entity_id, auth_asym_id, struct_asym_id, helix_segment, sheets, pdb_res_id, auth_seq_id, pdb_ins_code
    ORDER by toInteger(entity_id), struct_asym_id, pdb_res_id
                       
                       
                       
                       