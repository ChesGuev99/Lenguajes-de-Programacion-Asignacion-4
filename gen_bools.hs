module Gen_bools where
import Sintax
import Vars

import Data.Map (Map)

-- cons es una funcion que recibe un Booleano y lo agrega al inicio de la lista dada como segundo parametro
-- cons False [a,b,c] =  [False,a,b,c]
cons :: Bool -> [Bool]-> [Bool]
cons x xs = x : xs

-- generacion de todas las combinaciones posibles de booleanos para un numero de variables dado
gen_bools :: Int -> [[Bool]]
gen_bools 0 = [[]]
gen_bools n = let anterior = gen_bools (n-1)
                in (map (cons True) anterior) ++ (map (cons False) anterior)
