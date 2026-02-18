# Como crear un entorno?

Un entorno es un contenedor aislado donde puedes instalar paquetes, lenguajes y librerias sin romper nada de tu sistema.
En el master esto ayuda muchisimo, porque cada asignatura o practica puede pedir versiones distintas.

Piensalo asi: cada proyecto tiene su "cajita" y dentro va todo lo que necesita.

## pyenv

https://github.com/pyenv/pyenv

Pyenv es una herramienta para manejar versiones de Python.
Esta muy bien, pero para empezar en el master puede liarte un poco si todavia estas arrancando.

Por eso, en esta guia corta vamos a usar **Conda** como camino principal (mas facil para empezar rapido).

## conda (camino recomendado y facil)

### Paso 0: abre terminal

- Linux/Mac: `Terminal`
- Windows: `Anaconda Prompt`

### Paso 1: crear entorno

Copia y pega esto tal cual:

```sh
conda create -n masterbio python=3.11 -y
```

Que significa:
- `-n masterbio`: nombre del entorno (puedes dejar ese)
- `python=3.11`: version estable para casi todo en bioinfo inicial
- `-y`: acepta automaticamente las preguntas

### Paso 2: activar entorno

```sh
conda activate masterbio
```

Si ves `(masterbio)` al principio de la linea, perfecto: ya estas dentro.

### Paso 3: instalar lo basico

```sh
conda install -y numpy pandas matplotlib jupyterlab
```

Esto te cubre la mayoria de practicas iniciales:
- `numpy`: calculo numerico
- `pandas`: tablas/datos
- `matplotlib`: graficos
- `jupyterlab`: cuadernos

### Paso 4: comprobar que todo funciona

```sh
python --version
```

Deberia salir algo parecido a `Python 3.11.x`.

Y prueba final:

```sh
python -c "import numpy, pandas, matplotlib; print('Entorno OK')"
```

Si sale `Entorno OK`, listo.

## Uso diario (importante)

Cada vez que vayas a trabajar en ese proyecto:

```sh
conda activate masterbio
```

Cuando acabes:

```sh
conda deactivate
```

## Si algo falla (solucion rapida)

1. `conda: command not found`
- No esta instalado Conda o no esta en PATH.
- Solucion: instala Miniconda y abre terminal nueva.

2. No activa el entorno
- Ejecuta:
  ```sh
  conda init
  ```
- Cierra y abre terminal, luego repite `conda activate masterbio`.

3. Entorno roto por pruebas
- Lo mas rapido: borrar y recrear.
  ```sh
  conda env remove -n masterbio
  conda create -n masterbio python=3.11 -y
  conda activate masterbio
  conda install -y numpy pandas matplotlib jupyterlab
  ```

## Resumen mini

```sh
conda create -n masterbio python=3.11 -y
conda activate masterbio
conda install -y numpy pandas matplotlib jupyterlab
python -c "import numpy, pandas, matplotlib; print('Entorno OK')"
```

Con esto ya puedes empezar practicas sin pelearte con configuraciones raras.
