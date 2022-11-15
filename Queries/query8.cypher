 MATCH (chem_comp:ChemicalComponent) WHERE chem_comp.TYPE IN ['P','D','R'] AND chem_comp.MON_NSTD_PARENT_CHEM_COMP_ID IS NOT null
    WITH COLLECT(chem_comp.ID) AS chem_comps
    MATCH (entry:Entry)-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdb_res:PDBResidue), (entity)-[:CONTAINS_CHAIN]->(chain:Chain) 
        WHERE entity.POLYMER_TYPE IN ['P','D','R','D/R'] AND pdb_res.CHEM_COMP_ID IN chem_comps
    MATCH (pdb_res)-[chain_rel:IS_IN_CHAIN]->(chain)
    MATCH (chem_comp:ChemicalComponent)
        WHERE pdb_res.CHEM_COMP_ID=chem_comp.ID
    RETURN toInteger(entity.ID), chem_comp.NAME, chain.AUTH_ASYM_ID, chain.STRUCT_ASYM_ID, toInteger(chain_rel.AUTH_SEQ_ID), toInteger(pdb_res.ID), pdb_res.CHEM_COMP_ID, COALESCE(chain_rel.PDB_INS_CODE, ""), 
        COALESCE(toInteger(chain_rel.ALT_CONF_NUM), 0)
            ORDER BY toInteger(entity.ID), toInteger(pdb_res.ID) LIMIT 50