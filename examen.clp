
(deffacts hecho
    ( stock naranjas 4 manzanas 4 caquis 2 uva 3 )
    ( pedido naranjas 3 manzanas 2 caquis 0 uva 1 ) 
    ( robot cajas 0 maxCajas 3)
)

;;comprobamos si hay suficientes cajas para poder realizar el pedido. En el momento en que no haya suficientes cajas,
;;mostrara un mensaje informando que no se ha podido satisfacer el pedido.
(defrule cajasSuficientes 
    (declare(sailence 10))
    ( pedido naranjas ?nar manzanas ?man caquis ?caq uva ?uva )
    ( stock naranjas ?stocknar manzanas ?stockman caquis ?stockcaq uva ?stockuva )
    ( test ( or (> ?nar ?stocknar ) (> ?man ?stockman ) (> ?caq ?stockcaq ) (> ?uva ?stockuva )) )
    =>
    ( halt )
    ( printout t "No se ha podido satisfacer el pedido, no hay suficientes cajas." crlf)
)

;;Comprobamos si el pedido se ha entregado correctamente, para ello comprobaremos que no hay mas stock disponible
;;de ninguna variedad. Si el test comprueba i pasa, que todo el stock es igual a 0, eso significaria que ya ha sido entregado el pedido.
(defrule pedidoEntregado
    ( declare (salience 1))
    ( pedido naranjas ?nar manzanas ?man caquis ?caq uva ?uva )
    ( test ( and (= ?nar 0 ) (= ?man 0 ) (= ?caq 0 ) (= ?uva 0 )) )
    =>
    ( halt )
    ( printout t "El pedido ha sido entregado con exito!" crlf)
)