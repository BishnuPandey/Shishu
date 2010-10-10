update `users`
set `fname` = concat( `fname`," ",`mname`," ",`lname`);

update `users`
set `mname` = null,
    `lname` = null

;

