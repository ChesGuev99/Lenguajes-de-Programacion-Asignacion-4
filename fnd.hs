module Fnd where
import Sintax
import EvalProp

neg :: Proposition -> Proposition
neg = Negacion

disj :: Proposition -> Proposition -> Proposition
disj = Disyuncion

conj :: Proposition -> Proposition -> Proposition
conj = Conjuncion

fnd :: Proposition -> Proposition
fnd (Constante prop)                     = Constante prop
fnd (Negacion(Constante prop))           = Constante (not prop)
fnd prop@(Variable _)                    = prop
fnd prop@(Negacion (Variable _))         = prop
fnd (Negacion (Negacion prop))           = prop

fnd (Conjuncion prop1 prop2)              = fnd prop1 `conj` fnd prop2
fnd (Negacion (Conjuncion prop1 prop2))   = fnd $ neg prop1 `disj` neg prop2

fnd (Disyuncion prop1 prop2)              = fnd prop1 `disj` fnd prop2
fnd (Negacion (Disyuncion prop1 prop2))   = fnd $ neg prop1 `conj` neg prop2

fnd (Implicacion prop1 prop2)              = fnd $ neg prop1 `disj` prop2
fnd (Negacion (Implicacion prop1 prop2))   = fnd $ prop1 `conj` neg prop2

fnd (Equivalencia prop1 prop2)            = fnd $ implicacionNeg prop1 prop2

fnd (Negacion (Equivalencia prop1 prop2)) = fnd $ implicacionNeg prop1 prop2

implicacionNeg :: Proposition -> Proposition-> Proposition
implicacionNeg a b = (a `conj` b) `disj` (neg a `conj` neg b)

equivalenciaNeg :: Proposition -> Proposition-> Proposition
equivalenciaNeg a b = (a `disj` b) `conj` (a `disj` b)