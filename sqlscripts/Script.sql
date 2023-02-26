SELECT  n.*, r.L r.W , r.seed  FROM newmanziff n
LEFT JOIN runs r
WHERE r.runid = n.runid 
