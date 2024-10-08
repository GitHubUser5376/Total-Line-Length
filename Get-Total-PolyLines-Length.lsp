

(defun C:PL-Length (/ ss ent iItr1 lOrigPos rTotal-Length)
    
    ;; Initializing variables
    (setq
        rTotal-Length 0
        iItr1 -1
        ss (ssget '((0 . "*POLYLINE"))); Filter for PolyLines
    );setq
    
    ;; Each selected item
    (repeat (sslength ss)
        (setq
            iItr1 (1+ iItr1)
            ent (entget (ssname ss iItr1)); Each entity
            lOrigPos nil
        );setq
        
        ;; Each position
        (while (setq ent (member (assoc 10 (cdr ent)) ent))
            
            ;; Total Length
            (if lOrigPos (setq
                rTotal-Length (+
                    rTotal-Length ;---------------; Total length
                    (distance (cdar ent) lOrigPos); Line's length
                );Addition
            ));if<-setq
            
            ;; Origin Position
            (setq lOrigPos (cdar ent))
        );while
    );repeat
    rTotal-Length
);defun
