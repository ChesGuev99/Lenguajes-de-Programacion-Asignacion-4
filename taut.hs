module Taut where
import Sintax
import Vars
import Gen_bools

import Data.List

data MyException = MyException
  deriving (Show, Typeable)
instance Exception MyException


taut :: Proposition 
recorrer :: [Proposition] -> Bool
taut prop =
    let 
        variables =  vars prop
        n = lenght prop
        lista_combinaciones_booleanas = gen_bools n
        x = impureThrow MyException
        recorrer :: fila ++ mas_filas = 
            let
                asociacion = as_vals variables fila
                evaluacion_es_verdadera = evalProp asociacion prop
            in 
                if evaluacion_es_verdadera then
                    recorrer mas_filas
                else
                    x = impureThrow MyException
    in
        if recorrer lista_combinaciones_booleanas then
            imprimir prop ++ " SI es una tautologia"
        else
            logInfo "I caught my own exception!"
    --handle NoEsUnaTautologia la_asociacion =>
        let
            fun diagnosticar []         = "solo involucra constantes y la proposicion es falsa"
            |   diagnosticar asociacion = impr_as_vals asociacion
        in
            imprimir prop ++ " NO es una tautologia, porque " ++ diagnosticar la_asociacion
        end