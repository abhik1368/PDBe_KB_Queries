 MATCH (entry:Entry)-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdb_res:PDBResidue)-[relation:IS_IN_SCOP_DOMAIN]->(scop:SCOP)
    OPTIONAL MATCH (superfamily:SCOP {SUNID: relation.SUPERFAMILY_ID})
    OPTIONAL MATCH (fold:SCOP {SUNID: relation.FOLD_ID})
    OPTIONAL MATCH (class:SCOP {SUNID: relation.CLASS_ID})
    RETURN scop.SUNID as sunid, scop.DESCRIPTION as desc, superfamily.SUNID as super_sunid, superfamily.DESCRIPTION as super_desc, 
    fold.SUNID as fold_sunid, fold.DESCRIPTION as fold_desc, class.SUNID as class_sunid, class.DESCRIPTION as class_desc, scop.SCCS as sccs, 
    relation.SCOP_ID as scop_id, pdb_res.ID, entity.ID, relation.AUTH_ASYM_ID, relation.STRUCT_ASYM_ID, relation.SEGMENT_ID, relation.AUTH_START, 
    relation.AUTH_END ORDER BY relation.AUTH_ASYM_ID, toInteger(pdb_res.ID) LIMIT 50
