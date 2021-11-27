module Fnd where
import Sintax
import EvalProp

--operador de negacion
neg :: Proposition -> Proposition
neg = Negacion

--operador de disyuncion
disj :: Proposition -> Proposition -> Proposition
disj = Disyuncion

--operador de conjuncion
conj :: Proposition -> Proposition -> Proposition
conj = Conjuncion

--Funcion encargada de realizar la forma normal disyuntiva, a traves de las correspondientes reglas logicas
-- hace uso de los operadores previos 
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


-- Funcion encargada de llevar a cabo la negacion de una implicacion
implicacionNeg :: Proposition -> Proposition-> Proposition
implicacionNeg a b = (a `conj` b) `disj` (neg a `conj` neg b)

-- Funcion encargada de llevar a cabo la negacion de una equivalencia
equivalenciaNeg :: Proposition -> Proposition-> Proposition
equivalenciaNeg a b = (a `disj` b) `conj` (a `disj` b)