
(defun C:L-Length (/ ss ent iItr1 rTotal-Length)
    
    ;; Initializing variables
    (setq
        rTotal-Length 0
        iItr1 -1
        ss (ssget '((0 . "LINE"))); Filter for Lines
    );setq
    
    ;; Each selected item
    (repeat (sslength ss)
        (setq
            iItr1 (1+ iItr1)
            ent (entget (ssname ss iItr1)); Each entity
            
            ;; Adding lengths
            rTotal-Length (+ 
                rTotal-Length
                (distance (cdr (assoc 10 ent))(cdr (assoc 11 ent)))
            );addition
        );setq
    );repeat
    rTotal-Length
);defun