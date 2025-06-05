Este repositorio contiene la resolución del segundo parcial práctico de la materia Ingeniería de Software 1, cursada en la segunda mitad de 2024. El trabajo fue desarrollado usando CuisUniversity.

El ejercicio consistía en implementar un prototipo simplificado del juego Pacman utilizando TDD (Test-Driven Development). El objetivo era evaluar la viabilidad de desarrollar un juego de este tipo, respetando buenas prácticas de diseño orientado a objetos.

El prototipo debía incluir:

- Un modelo de tablero representado a partir de una colección de strings.

- Movimiento de Pacman en las cuatro direcciones.

- Dos fantasmas: Blinky (empieza moviéndose a la izquierda desde el 4º tick) y Clyde (a la derecha desde el 5º tick).

- Reglas de juego como:

  - Movimiento restringido por paredes.

  - Puntos por píldoras: 1 por pequeña, 2 por grande.

  - Fantasmas que dejan el contenido original del casillero al salir.

  - Pacman pierde una vida al ser alcanzado por un fantasma, reiniciando su posición.

  - El juego termina al quedarse sin vidas o sin píldoras.

No era necesario implementar frutas, múltiples niveles ni que Pacman pueda comerse a los fantasmas.

##Cómo abrir el archivo en CuisUniversity
1. Descargar

  Si aún no lo tenés, podés conseguirlo desde esta [página](https://www.isw2.com.ar/cuisuniversity).

2. Abrir el archivo run (en el caso de Windows)

   Esto abrirá CuisUniversity y creará la carpeta UserFiles en la carpeta anterior. Ahí hay que pegar el archivo .st.

3. Abrir el archivo descargardo

   Una vez en Cuis, hacemos click derecho en la pantalla y vamos a Open -> File List. Ahí le hacemos click al archivo que acabamos de agregar y apretamos file in arriba a la derecha. Ahora volvemos a hacer click en el fondo y abrimos el Class Browser, donde aparecerá el archivo abajo de todo.
