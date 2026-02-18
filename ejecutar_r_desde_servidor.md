# Ejecutar R desde servidor (mini tutorial)

Este tutorial complementa `crear_entorno.md` y `clase_bioestadistica.md`.
Primero creas el entorno, luego usas este tutorial para ejecutar R desde servidor.
La idea es simple: conectarte al servidor con VSCode y usar el R del entorno `bioest`.

## Que vamos a hacer

1. Entrar al servidor con `Remote - SSH`
2. Abrir tu carpeta de trabajo
3. Activar el entorno `bioest`
4. Comprobar con `R --version`
5. Crear `main.R` y ejecutarlo con el boton Play

Con eso, cuando ejecutes codigo R desde VSCode, correra en el servidor y con tus paquetes del entorno.

## Paso 0: extensiones en VSCode

Instala estas extensiones:
- `R`
- `R Syntax`
- `Remote - SSH`
- `Remote Explorer`

Reinicia VSCode cuando termines.

## Paso 1: conectarte al servidor

En VSCode, abajo a la izquierda/derecha veras el icono `><`.
Pulsa ahi y elige conectar por SSH.

Conectate como siempre, por ejemplo:

```sh
ssh user@masterbio
```

Cuando se abra la sesion remota, ya estas trabajando "dentro" del servidor.

## Paso 2: abrir carpeta del proyecto

Crea (o abre) una carpeta para esta asignatura.

Ejemplo desde terminal en el servidor:

```sh
mkdir -p ~/bioestadistica_practicas
cd ~/bioestadistica_practicas
```

Regla simple: una carpeta por proyecto para no mezclar cosas.

## Paso 3: activar el entorno `bioest`

En la terminal integrada de VSCode (remota):

```sh
conda activate bioest
```

Si todo va bien, veras `(bioest)` al inicio de la linea.

## Paso 4: comprobar que usa el R correcto

```sh
R --version
```

Si quieres probar un paquete:

```sh
R -q -e "library(tidyverse); cat('R remoto OK\n')"
```

Si sale `R remoto OK`, ya esta funcionando.

Test recomendado para confirmar entorno y versiones:

```sh
R -q -e "sessionInfo()"
```

En la salida revisa que aparezca la version de R y el entorno esperado.

## Paso 5: crear `main.R` y ejecutar con Play

Crea un archivo llamado `main.R` en tu carpeta del proyecto y pega esto:

```r
cat("Hola bioestadistica desde servidor\n")
sessionInfo()
```

Guarda el archivo.

Ahora, arriba a la derecha en VSCode, pulsa el boton `Play` (Run) con `main.R` abierto.
Si todo esta bien, veras la salida en la terminal/console de R.

## Uso diario

- Abres VSCode
- Te conectas por `Remote - SSH`
- Abres tu carpeta
- Ejecutas `main.R` (u otros scripts `.R`) con el boton `Play`

VSCode usara el R del entorno activo (`bioest`).

## Si algo falla

1. No conecta por SSH
- Prueba desde terminal normal: `ssh user@masterbio`
- Si ahi falla, primero arregla acceso SSH.

2. VSCode no encuentra R
- Asegurate de haber activado el entorno:
  ```sh
  conda activate bioest
  ```
- Vuelve a probar:
  ```sh
  R --version
  ```

3. Falta algun paquete
- En servidor, recrea/actualiza entorno con `enviroment.yml`:
  ```sh
  conda env update -f enviroment.yml --prune
  ```

## Resumen mini

```sh
conda activate bioest
```

Test rapido:

```sh
R --version
R -q -e "sessionInfo()"
```

Con esto ejecutas R en servidor, con el entorno correcto y sin liarte.
