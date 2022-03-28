
(deffacts hecho
    ( stock naranjas 4 manzanas 4 caquis 2 uva 3 )
    ( pedido naranjas 3 manzanas 2 caquis 0 uva 1 ) 
    ( robot cajas 0 maxCajas 3)
)

;;comprobamos si hay suficientes cajas para poder realizar el pedido
(defrule cajasSuficientes 
    (declare(sailence 20))
    ( pedido naranjas ?n manzanas ?m caquis ?c uva ?u )
    ( stockPalets naranjas ?stockn manzanas ?stockm caquis ?stockc uva ?stocku )
    ( test ( or (> ?n ?stockn ) (> ?m ?stockm ) (> ?c ?stockc ) (> ?u ?stocku )) )
    =>
    ( halt )
    ( printout t"No hay bastantes cajas para el pedido" crlf)
)