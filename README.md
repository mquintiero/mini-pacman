Este repositorio contiene la resolución del segundo parcial práctico de la materia Ingeniería de Software 1, cursada en la segunda mitad de 2024. El trabajo fue desarrollado usando CuisUniversity.

El ejercicio consistía en implementar un prototipo simplificado del juego Pacman utilizando TDD (Test-Driven Development). El objetivo era evaluar la viabilidad de desarrollar un juego de este tipo, respetando buenas prácticas de diseño orientado a objetos.

El prototipo debía incluir:

Un modelo de tablero representado a partir de una colección de strings.

Movimiento de Pacman en las cuatro direcciones.

Dos fantasmas: Blinky (empieza moviéndose a la izquierda desde el 4º tick) y Clyde (a la derecha desde el 5º tick).

Reglas de juego como:

Movimiento restringido por paredes.

Puntos por píldoras: 1 por pequeña, 2 por grande.

Fantasmas que dejan el contenido original del casillero al salir.

Pacman pierde una vida al ser alcanzado por un fantasma, reiniciando su posición.

El juego termina al quedarse sin vidas o sin píldoras.

No era necesario implementar frutas, múltiples niveles ni que Pacman pueda comerse a los fantasmas.
