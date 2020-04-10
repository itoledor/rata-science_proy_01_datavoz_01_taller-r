####  Programar en R - Conceptos Básicos   ####

#### 1. Navegar en en R Studio - Shortcuts ####

# Comenta una linea utilizando               ctrl + shift + c

# Duplica una linea utilizando               alt  + shift + up
# Duplica una linea utilizando               alt  + shift + up
# Duplica una linea utilizando               alt  + shift + up
# Duplica una linea utilizando               alt  + shift + down
# Duplica una linea utilizando               alt  + shift + down
# Duplica una linea utilizando               alt  + shift + down

# Desplaza una linea utilizando              alt  + up
# Desplaza una linea utilizando              alt  + down

# Edita varias lineas a la vez utilizando    ctrl + alt + up                reemplaza el valor de x = 5
# Edita varias lineas a la vez utilizando    ctrl + alt + down              reemplaza el valor de x = 5

# Navega por los bloques utilizando          ctrl + shift + o      

# Contrae el bloque actual utilizando        alt  + l 
# Contrae el bloque actual utilizando        alt  + shift + l 

# Contrae todos los bloques utilizando       alt  + o 
# Contrae todos los bloques utilizando       alt  + shift + o 

# Mueve el cursor a la consola utilizando    ctrl + 2
# Mueve el cursor a la fuente  utilizando    ctrl + 1

# Reemplaza código utilizando                insert

# Limpia la consola utilizando               ctrl + l

# Reinicia la sesion utilizando              ctrl + shift + F10

#### 2. R como calculadora                 ####

# Operaciones básicas

7 + 2
7 - 2 
7 * 2
7 / 2
7 ^ 2
sqrt(7)
7 ^ (1/2)

# asignación
a <- 7
b <- 2
a
b

a <- 7 -> A
b <- 2 -> B
A
B

a + b
a - b 
a * b
a / b
a ^ b
sqrt(a)
a ^ (1/b)

class(a)

#### 3. Objetos                            ####

# números

a <- 1
a
class(a)

# caracteres

a <- "1"
a
a <- "a"
a
class(a) 

# vectores de números
a <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10.1)
class(a)
a
a[1]

a <- 1:10
a
class(a) # integer vs numeric?


is.vector(a)
length(a)

# vectores de caracteres 

b <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
b
b <- letters[1:10]
b
class(b)
is.vector(b)
length(b)
length(a <- 1)

# matrices

m <- matrix(a)
m
class(a)
is.vector(m)
is.matrix(m)

m <- matrix(a, ncol = 2)
m
m <- matrix(a, ncol = 5)
m
m[1]
m[2]
m <- matrix(a, ncol = 5, byrow = TRUE)
m
m[1]
m[2]
m[1,1]
m[1,2]
m[2,1]
m[2,2]

# listas

c <- list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
c
class(c)
c[1]
class(c[1])
c[[1]]
class(c[[1]])

c <- list(a , b)
c
c[1]
c[[1]]
c[[1]][1]
c[2]
c[[2]]
c[[2]][1]

# data frames

d <- data.frame(a , b)
d
d[1]
d["a"]
d[1,1]
d[2]
d["b"]
d[1,2]
d[1,]
d[2,]
d[1,"a"]
d[1,"b"]

# tibble
library(tibble)
t <- tibble(a , b)
t
t[1]
t["a"]
t[1,1]
t[1,"a"]
t[2]
t["b"]
t[1,2]
t[1,"b"]
t[1,]
t[2,]
