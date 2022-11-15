MATCH (entry:Entry {ID:'1cbs'})-[:HAS_BOUND_MOLECULE]->(boundMolecule:BoundMolecule)<-[:IS_PART_OF]-(boundLigand:BoundLigand)-[rel:HAS_ARP_CONTACT]-(pdbRes:PDBResidue)-[:IS_IN_CHAIN]->(chain:Chain)  WITH
boundMolecule.ID AS siteId, toInteger(SPLIT(pdbRes.UNIQID, '_')[1]) AS entityId, toInteger(pdbRes.ID) AS resId, pdbRes.CHEM_COMP_ID AS chemCompId, CASE
            WHEN labels(startNode(rel))[0] = 'BoundLigand'
            THEN [rel.AUTH_ASYM_ID_2, rel.STRUCT_ASYM_ID_2, toInteger(rel.AUTH_SEQ_ID_2)]
            ELSE [rel.AUTH_ASYM_ID_1, rel.STRUCT_ASYM_ID_1, toInteger(rel.AUTH_SEQ_ID_1)]
        END AS values
    RETURN DISTINCT siteId, entityId, resId, chemCompId, values[0] AS authAsymId, values[1] AS structAsymId, values[2] AS authSeqId ORDER BY authSeqId LIMIT 50