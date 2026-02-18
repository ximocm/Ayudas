# Clase de bioestadistica (usando enviroment.yml)

Este mini tutorial complementa `crear_entorno.md`.
La idea es no instalar paquetes uno por uno, sino usar un archivo con todo ya definido.

En esta clase vamos a usar `enviroment.yml`, que ya trae las dependencias de R para bioestadistica.

## Que es `enviroment.yml`?

Es un archivo que le dice a Conda:
- como se llama el entorno
- que canales usar
- que paquetes instalar

En tu caso, el entorno se llama `bioest` y trae paquetes como `r-tidyverse`, `r-ggplot2`, `r-data.table`, etc.

## Paso 1: abre terminal en esta carpeta

Asegurate de estar en la carpeta donde esta `enviroment.yml`.

Puedes comprobarlo con:

```sh
ls
```

Deberias ver `enviroment.yml` en la lista.

## Paso 2: crear el entorno desde el archivo

Ejecuta:

```sh
conda env create -f enviroment.yml
```

Esto puede tardar un poco la primera vez.
No cierres la terminal hasta que termine.

## Paso 3: activar el entorno

```sh
conda activate bioest
```

Si aparece `(bioest)` al inicio de la linea, todo bien.

## Paso 4: comprobar que R funciona

```sh
R --version
```

Y prueba rapida de paquetes:

```sh
R -q -e "library(tidyverse); library(data.table); library(ggplot2); cat('Entorno bioestadistica OK\n')"
```

Si sale `Entorno bioestadistica OK`, listo para clase.

## Uso diario

Cada vez que tengas practica de bioestadistica:

```sh
conda activate bioest
```

Cuando termines:

```sh
conda deactivate
```

## Si actualizas `enviroment.yml`

Si anades o cambias paquetes en el YAML, actualiza el entorno con:

```sh
conda env update -f enviroment.yml --prune
```

`--prune` elimina paquetes que ya no esten en el archivo, asi se mantiene limpio.

## Si algo falla

1. Dice que el entorno ya existe

```sh
conda env remove -n bioest
conda env create -f enviroment.yml
```

2. `conda: command not found`
- Instala Miniconda/Anaconda y abre una terminal nueva.

## Resumen mini

```sh
conda env create -f enviroment.yml
conda activate bioest
R -q -e "library(tidyverse); library(data.table); library(ggplot2); cat('Entorno bioestadistica OK\n')"
```

Con esto tienes el entorno de bioestadistica reproducible y listo con un solo archivo.
