 MATCH (entry:Entry {ID:'1s70'})-[:HAS_ENTITY]->(entity:Entity {ID:"1"})-[:HAS_PDB_RESIDUE]->(pdb_res:PDBResidue)-[rel:MAP_TO_UNIPROT_RESIDUE]->(unp_res:UNPResidue)<-[:HAS_UNP_RESIDUE]-(unp:UniProt) WHERE NOT unp.ACCESSION CONTAINS '-'
    MATCH (chem_comp:ChemicalComponent) WHERE chem_comp.ID=pdb_res.CHEM_COMP_ID AND chem_comp.TYPE IN ['P','D','R'] AND chem_comp.MON_NSTD_PARENT_CHEM_COMP_ID IS NOT null
    RETURN pdb_res.ID, pdb_res.CHEM_COMP_ID, unp_res.UNIQID AS unp_res_uniqid, unp_res.ID, unp_res.ONE_LETTER_CODE ORDER BY toInteger(pdb_res.ID)
