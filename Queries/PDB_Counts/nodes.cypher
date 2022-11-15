MATCH (n)
RETURN labels(n) as NodeLabel, count(labels(n)) as LabelCount;