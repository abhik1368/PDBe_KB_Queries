MATCH (entry:Entry {ID:'1s70'})-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdb_res:PDBResidue)-[rel:IS_IN_CHAIN]->(chain:Chain {STRUCT_ASYM_ID:entity.BEST_CHAIN_ID})
	WHERE rel.OBSERVED='Y' AND (rel.IS_IN_HELIX='Y' OR exists(rel.SHEETS))
    WITH entity.ID AS entity_id, chain.STRUCT_ASYM_ID AS struct_asym_id,
    CASE rel.HELIX_SEGMENT
        WHEN null
            THEN "0"
        ELSE
            rel.HELIX_SEGMENT
    END AS helix_segment,
    rel.SHEETS AS sheets, toInteger(pdb_res.ID) AS pdb_res_id, pdb_res.CHEM_COMP_ID AS pdb_res_code
    RETURN struct_asym_id, helix_segment, sheets, pdb_res_id, pdb_res_code ORDER BY pdb_res_id LIMIT 50
