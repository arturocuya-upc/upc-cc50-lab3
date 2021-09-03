# Copiar iris
my.iris <- iris
head(my.iris)

# Mostrar objetos en memoria
ls()

# Borrar lo que copiamos
rm(my.iris)
ls()

# Crear columna
my.iris <- iris
my.iris$Petal.Area <- my.iris$Petal.Length * my.iris$Petal.Width

# Eliminar columna
my.iris$Petal.Area <- NULL

# Ordenar según longitud de pétalos
my.iris <- iris[order(iris$Petal.Length),]

# ======

# Creación de vectores

# Vector numérico del 1 al 10
x <- 1:10

# Vector numérico categórico para las especies del dataset iris
y <- iris$Species

ls()

# seq() reemplaza al operador ":"
seq(1, 5)

# Para repetir la secuencia n veces se usa rep()
rep(1:5, 5)

# Exploración de vectores
plot(x)
length(x)
table(y)
summary(y)
head(x)
tail(x)

# Recordar que el vector "y" equivale a table(iris$Species)
table(iris$Species)

# Selección de elementos de un vector. Se pueden usar índices (empezando de 1)
# o condiciones lógicas
x <- x^2
x
# Selecciona los índices indicados
x[1:3]
x[c(1, 3)]
x[x > 25]
# Selección de forma inversa
x[3:1]
# Remueve los 2 primeros elementos
x[-(1:2)]
# Remueve el elemento en la posición indicada. En este caso, el último
x[-length(x)]

# También se pueden seleccionar elementos por nombre. En R se pueden
# asociar nombres a los elementos de un vector.
w <- table(iris$Species)
w["setosa"]
w[c("setosa", "virginica")]

# Cambiar nombre de columna
my.iris <- iris
colnames(my.iris)[5] <- "Especie"
colnames(my.iris)

# Igual sucede con los nombres de un vector, usando names()
z <- table(iris$Species)
names(z)
names(z)[1] <- "Tipo 1"
names(z)

# Con el corchete también podemos cambiar el contenido de los elementos seleccionados
z <- 1:10
z
z[z<5] <- 100

# Para obtener elementos al azar dentro de un vector usamos sample()
x <- 1:10
x
sample(x,4)
# sample(x,50) # Da error porque el tamaño de muestra es mayor que la población (tamaño del vector)

sample(x, 50, replace=TRUE) # Esto no da error porque permite valores repetidos

# Uso de funciones
x <- 1:10
mean(x)
max(x)
median(x)
sum(x)
prod(x)

# Creación de función para suma de cuadrados
x <- 1:10
suma_cuadrados <- function(x) sum(x*x)
suma_cuadrados(x)

# Podemos encerrar el cuerpo de la función entre llaves
media <- function(x) {
  longitud <- length(x)
  suma <- sum(x)
  suma / longitud
}

# Función tapply (similar a group by de SQL)
# Media de la longitud del pétalo por especie
tapply(iris$Petal.Length, iris$Species, mean)

# Creación de listas

# Las listas son objetos de R. El dataset iris es una lista
is.list(iris)

# Creación de listas usando list()
# a,b y c son etiquetas
x <- list("a"=2.5, "b"=TRUE, "c"=1:3)
x

# Verificar si un objeto es una lista con typeof()
typeof(x)
# Encontrar la longitud usando length()
length(x)

# Examinamos la estructura con str()
str(x)

# Las etiquetas son opcionales. También podemos crear la lista sin las etiquetas
x <- list(2.5,TRUE,1:3)

# Accediendo a los componentes de una lista
x <- list(name = "John", age = 19, speaks = c("English", "French"))

# Usando un vector entero
x[c(1:2)]

# Usando un entero negativo para excluir el segundo componente
x[-2]

# Usando un índice de vector lógico
x[c(T,F,F)]

# Usando un vector de caracteres
x[c("age", "speaks")]

# Modificando componentes de la lista mediante reasignación. Se pueden utilizar
# cualquiera de los métodos mencionados
x [["name"]] <- "Patricia"; x

# Añadiendo componentes a una lista. Se deben asignar valores usando nuevas etiquetas
x[["married"]] <- TRUE

# Eliminar componentes asignandole NULL
x[["age"]] <- NULL
x$married <- NULL

# ======

# Visualización gráfica

# Grafica de variables continuas

# Para variables continuas usamos histogramas
hist(iris$Sepal.Width)

# El mismo gráfico, incluyendo títulos, etiquetas y colores
hist(iris$Sepal.Width, main = "Iris: Histograma de la anchura de los sépalos", 
     xlab = "anchura del sépalo", ylab = "frecuencia", 
     col = "steelblue")


# Grafica de variables categóricas
# Usamos diagramas de barras con barplot
barplot(table(iris$Species))


# Grafica de relación entre dos variables continuas
# Usamos un gráfico de dispersión para mostrar la relación entre dos variables numéricas

plot(iris$Petal.Length, iris$Petal.Width, main="Edgar Anderson's Iris Data")


# Gráfica de la relación entre una variable continua y otra categórica
boxplot(iris$Sepal.Width ~ iris$Species, col = "gray", main = "Especies de iris\nsegún la anchura del sépalo")
