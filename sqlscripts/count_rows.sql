SELECT runid, COUNT(runid) FROM newmanziff 
WHERE runid IN
	( SELECT n.runid  
	  FROM newmanziff n LEFT JOIN runs r  ON n.runid=r.runid 
	  WHERE r.`data` ="22-Feb-23" AND r.L=32 AND r.W=8.0)
GROUP BY runid 