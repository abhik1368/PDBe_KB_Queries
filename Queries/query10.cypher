MATCH (entry:Entry)-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdbRes:PDBResidue)
            WHERE entity.POLYMER_TYPE IN ['D','R','D/R'] 
            RETURN 
                entry.ID as pdb_id, 
                entity.ID as entity_id, 
                entity.POLYMER_TYPE as polymer_type,
                size([x in collect(pdbRes.CHEM_COMP_ID) where x in ['DA','DT','DC','DG']]) as DNA_COUNT,
                size([x in collect(pdbRes.CHEM_COMP_ID) where x in ['A','U','C','G']]) as RNA_COUNT,
                size([x in collect(pdbRes.CHEM_COMP_ID) where not x in ['DA', 'DT', 'DC', 'DG', 'DI', 'A', 'U', 'C', 'G', 'I']]) as OTHER_COUNT