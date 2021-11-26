module Taut where
import Sintax
import Vars
import Gen_bools
import AsVals
import EvalProp

import Data.List

-- handler :: IOError -> IO ()  
-- handler e  
--     | NoEsUnaTautologia e = putStrLn "NO es una tautologia" 


-- taut :: Proposition 
-- recorrer :: [Proposition] -> Bool
-- taut prop =
--     let 
--         variables =  vars prop
--         n = lenght prop
--         lista_combinaciones_booleanas = gen_bools n
--         recorrer :: fila ++ mas_filas = 
--             let
--                 asociacion = as_vals variables fila
--                 evaluacion_es_verdadera = evalProp asociacion prop
--             in 
--                 if evaluacion_es_verdadera then
--                     recorrer mas_filas
--                 else
--                     imprimir prop ++ " NO es una tautologia, porque " ++ diagnosticar la_asociacion
--     in
--         if recorrer lista_combinaciones_booleanas then
--             imprimir prop ++ " SI es una tautologia"
--         else
--             let
--                 fun diagnosticar []         = "solo involucra constantes y la proposicion es falsa"
--                 diagnosticar asociacion = impr_as_vals asociacion
--             in
--                 imprimir prop ++ " NO es una tautologia, porque " ++ diagnosticar la_asociacion

-- incrementar :: Int -> Int --POR QUÉ HASKELL ES TAN SHIT QUE NO PUEDE INCREMENTAR COMO UN LENGUAJE NORMAL
-- incrementar i = i + 1 --(╯°□°）╯
 
-- recorrer :: [[Bools]] -> Int -> [Bools]
-- recorrer listap indice = let
--                                 subl = listap !! indice
--                         in subl

-- taut :: Proposition -> Indice -> Bool 
-- taut prop indice = let
--     variables = vars prop
--     combinaciones = gen_bools 
--     indice = length combinaciones --COMO MODIFICAMOS ESTO CONSTANTEMENTE??
--     sublista = recorrer combinaciones indice 
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


-- taut :: Proposition -> Bool 
-- recorrer :: [[Bool]]-> [Bool] 
-- taut prop = let
--     variables = vars prop 
--     combinaciones = gen_bools (length variables) 
--     --ciclo para asignar las variables a cada lista de gen_bools
--     recorrer [] = True
--     recorrer (fila : mas_filas) = let
--         asociacion = as_vals variables fila
--         evaluacion_es_verdadera = evalProp asociacion prop
--         in evaluacion_es_verdadera
--     in combinaciones

-- | Determines whether an expression is tautological.
taut :: Expr -> Bool
taut = and . values