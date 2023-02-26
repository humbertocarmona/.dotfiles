SELECT  n.* FROM newmanziff n LEFT JOIN runs r ON n.runid=r.runid
WHERE r.W>16

