match (b2:BoundLigand{CHEM_COMP_ID:"NAJ"})-[dis1:HAS_ARP_CONTACT]->(res1:PDBResidue),
(res1:PDBResidue)<-[:HAS_PDB_RESIDUE]-(e1:Entity),
(e1:Entity)<-[:HAS_ENTITY]-(pdb1:Entry{ID:"6oa7"}) 
match (b1:BoundLigand{CHEM_COMP_ID:"NAJ"})-[dis2:HAS_ARP_CONTACT]->(res2:PDBResidue),
(res2:PDBResidue)<-[:HAS_PDB_RESIDUE]-(e2:Entity),
(e2:Entity)<-[:HAS_ENTITY]-(pdb2:Entry)
where pdb2.ID IN ["5cdu", "5kje", "1n92", "5cdt", "4dxh", "3wgi", "6owp"]
RETURN pdb1.ID, pdb2.ID, 
apoc.algo.euclideanDistance(collect(toFloat(dis1.DISTANCE)), collect(toFloat(dis2.DISTANCE))) as similarity 
order by similarity desc