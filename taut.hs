module Taut where
import Sintax
import Vars
import Gen_bools
import AsVals
import EvalProp

import Data.List

-- incrementar :: Int -> Int --POR QUÉ HASKELL ES TAN SHIT QUE NO PUEDE INCREMENTAR COMO UN LENGUAJE NORMAL
-- incrementar i = i + 1 --(╯°□°）╯

--Funcion encargada de evaluar si la proposicion es verdadera o falsa
toEvalProp :: Proposition -> [(String, Bool)] -> Bool 
toEvalProp prop vals = evalProp prop vals


--Funcion encargada de recorrer las diferentes asignaciones de valores, 
-- finalmente, enviara una lista vacia si es una tautologia o la lista de valores que causaron la falacia
recorrer :: Proposition -> [[Bool]]-> [[Bool]]
recorrer _ [[]] = []
recorrer prop lista = 
    let
        toEval = as_vals (vars prop) (head (lista))
        len = length lista
    in
        if toEvalProp prop toEval
            then 
                if len == 1
                    then
                        []
                else
                    recorrer prop (drop 1 lista)
        else [head (lista)]

--Funcion principal encargada de diagnosticar una tautologia, en caso de que reciba que es una falacia, 
--imprime los valores dados, caso contrario, indica que es tautologia
taut :: Proposition -> String
taut prop = 
    let 
        variables =  vars prop
        n = length variables
        lista_combinaciones_booleanas = gen_bools n
        result = recorrer prop lista_combinaciones_booleanas
    in
        if result == []
            then imprimir prop ++ "  es una tautologia "
        else
            imprimir prop ++ "  no es una tautologia, por que  " ++ show (as_vals variables (head result))
    
-- propTaut = Implicacion (Conjuncion (Variable "A") (Variable "B")) (Variable "A")
-- a = Constante True

-- main = print (taut a)