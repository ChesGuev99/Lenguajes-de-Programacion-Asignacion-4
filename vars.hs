module Vars where
import Data.List (nub, sort)
import Sintax

-- Funcion encargada de mostrar las variables que se encuentran en una proposicion, omitiendo repetidas
varsMain :: Proposition -> [String]
varsMain expr = let 
                    las_vars (Constante    v)      vs = []  
                    las_vars (Variable     v)      vs = [v]
                    las_vars (Negacion     v)      vs = las_vars v vs
                    las_vars (Conjuncion   v1 v2)  vs = las_vars v1 vs ++ las_vars v2 vs
                    las_vars (Disyuncion   v1 v2)  vs = las_vars v1 vs ++ las_vars v2 vs
                    las_vars (Implicacion  v1 v2)  vs = las_vars v1 vs ++ las_vars v2 vs
                    las_vars (Equivalencia v1 v2)  vs = las_vars v1 vs ++ las_vars v2 vs
                 in las_vars expr []

vars :: Proposition -> [String]
vars p = sort(nub (varsMain p))