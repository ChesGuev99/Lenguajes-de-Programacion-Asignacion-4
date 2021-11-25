module EvalProp where
import Data.Maybe
import Sintax

evalProp :: Proposition -> [(String, Bool)] -> Bool
evalProp (Constante     cons)      vs = cons
evalProp (Variable      var)       vs = fromMaybe False (lookup var vs)
evalProp (Negacion      expr)      vs = not $ evalProp expr vs
evalProp (Conjuncion    exp1 exp2) vs = evalProp exp1 vs && evalProp exp2 vs
evalProp (Disyuncion    exp1 exp2) vs = evalProp exp1 vs || evalProp exp2 vs
evalProp (Implicacion   exp1 exp2) vs = not (evalProp exp1 vs) || evalProp exp2 vs
evalProp (Equivalencia  exp1 exp2) vs = evalProp exp1 vs == evalProp exp2 vs

--
-- > evalProp
-- >     (Conjunction (Variable "A") (Variable "B"))
-- >     (fromList [("A", True), ("B", False)])



