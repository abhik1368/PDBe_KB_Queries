MATCH
(entry:Entry)-[:HAS_ENTITY]->(entity:Entity)-[:HAS_PDB_RESIDUE]->(pdbRes:PDBResidue)<-[resRel:FUNPDBE_ANNOTATION_FOR]-(funGroup:FunPDBeResidueGroup)-
        [:FUNPDBE_RESIDUE_GROUP_OF]->(funEntry:FunPDBeEntry)
    WHERE entry.ID='1cbs' WITH
        resRel.CONFIDENCE_SCORE AS confScore, resRel.CONFIDENCE_CLASSIFICATION AS confClass, resRel.RAW_SCORE AS rawScore, pdbRes, entity.BEST_CHAIN_ID AS bestChain,
        resRel.CHAIN_LABEL AS chainLabel, toInteger(funGroup.ORDINAL_ID) AS siteId, funGroup.LABEL AS label, funEntry.RESOURCE_ENTRY_URL AS resUrl
    MATCH (pdbRes)-[chainRel:IS_IN_CHAIN]->(chain:Chain) WHERE chain.STRUCT_ASYM_ID=bestChain AND chain.AUTH_ASYM_ID=chainLabel
    RETURN
        siteId, label, resUrl, toInteger(chainRel.AUTH_SEQ_ID) AS pdbResNum, pdbRes.CHEM_COMP_ID AS pdbCode,
        confClass, toFloat(confScore) AS confScore, toFloat(rawScore) AS rawScore
    ORDER BY pdbResNum