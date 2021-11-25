module AsVals where

-- dada una lista de variables proposicionales sin repeticiones, la combina  con una lista de valores booleanos
as_vals :: [vars] -> [boo] -> [(vars, boo)]
as_vals vs     []     = []
as_vals []     bs     = []
as_vals (v:vs) (b:bs) = (v, b) : as_vals vs bs