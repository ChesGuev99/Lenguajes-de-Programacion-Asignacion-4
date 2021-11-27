module Taut where
import Sintax
import Vars
import Gen_bools
import AsVals
import EvalProp

import Data.List

-- incrementar :: Int -> Int --POR QUÉ HASKELL ES TAN SHIT QUE NO PUEDE INCREMENTAR COMO UN LENGUAJE NORMAL
-- incrementar i = i + 1 --(╯°□°）╯


toEvalProp :: Proposition -> [(String, Bool)] -> Bool
toEvalProp prop vals = evalProp prop vals

recorrer :: Proposition -> [[Bool]]-> Bool
recorrer _ [[]] = True
recorrer prop lista = 
    let
        toEval = as_vals (vars prop) (head (lista))
    in
        if toEvalProp prop toEval
            then 
                recorrer prop (drop 1 lista)
        else False

taut :: Proposition -> Bool
taut prop = 
    let 
        variables =  vars prop
        n = length variables
        lista_combinaciones_booleanas = gen_bools n
    in
        if recorrer prop lista_combinaciones_booleanas
            then True
        else
            False
    
-- taut :: Proposition -> Indice -> Bool 
-- taut prop indice = let
--     variables = vars prop
--     combinaciones = gen_bools 
--     indice = length combinaciones --COMO MODIFICAMOS ESTO CONSTANTEMENTE??
--     sublista = toEvalProp combinaciones indice 
--     asociacion = as_vals variables sublista
--     evaluacion_es_verdadera = evalProp prop asociacion
--         in
--             if evaluacion_es_verdadera
--                 incrementar indice 
--                      --NO ME GUSTA LA PROGRAMACION FUNCIONAL     
--                      --ESTO ME PASA POR QUEDARME DORMIDA EN LAS CLASES DE NACHITO ｡ﾟ(TᐞT)ﾟ
--                 if indice == length combinaciones
--                     in True
--                 taut prop indice --ESTO ES LEGAL?
--             else
--                 in False
--                      --retorna false y vamonos  
--                  --CHES COMO RETORNO EVALUACION_ES_VERDADERA??? o(´Д｀*)o
