!classDefinition: #PacmanGameTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #PacmanGameTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
randomThrowingOnly1s

	^ CircularReadStream on: #(1) moving: NullUnit new! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:50:06'!
test01PacmanStartsMovingLeft
"TODO: queda hacer algunos refactorings en los tests para sacar codigo repetido"
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#-BC-#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test02PacmanWinsAPointWhenEatingSmallPill
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	game tick.
	self
	assert: (game hasPoints: 1)! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test03PacmanLeavesASpaceAfterEatingSmallPill
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#-BC-#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test04PacmanCantMoveIntoAWall
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	2 timesRepeat: [game tick]. "En el segundo tick va a querer avanzar hacia la pared"
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#-BC-#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test05PacmanCanChangeDirectionUp
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	game tick.
	game changeMovementUp.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#pBC-#'
	'#==--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test06PacmanCanChangeDirectionToTheRight
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	game tick.
	game changeMovementRight.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#-BC-#'
	'#=p--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test07PacmanCanChangeDirectionDown
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	game tick.
	game changeMovementUp.
	game tick.
	game changeMovementDown.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#=BC-#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test08PacmanCanChangeDirectionToTheLeft
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	game tick.
	game changeMovementRight.
	game tick.
	game changeMovementLeft.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#-BC-#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test09PacmanWinsTwoPointsWhenEatingBigPill
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#*p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	game tick.
	self
	assert: (game hasPoints: 2).! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test10PacmanLeavesSpaceWhenEatingBigPill
	| board game random|
	random := self randomThrowingOnly1s.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#*p--#'
	'######').
	"Crea el juego y hace que avance un solo tick"
	game := PacmanGame withRepresentation: board randomizing: random.
	game tick.
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#-BC-#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:35:35'!
test11BlinkyStartsMovingLeftIn4thTickAndLeavesSpace
"Acabo de enterarme a las 21:35 que se puede verificar una sola fila. Los tests que siguen testean todo el tablero"
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#*p--#'
	'######').
	game := PacmanGame withRepresentation: board randomizing: random.
	4 timesRepeat: [game tick].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#B=C-#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test12BlinkyCantMoveIIntoAWall
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#*p--#'
	'######').
	game := PacmanGame withRepresentation: board randomizing: random.
	5 timesRepeat: [game tick].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#B==C#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test13BlinkyLeavesSmallPillAfterLeavingThePosition
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#--BC-#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	5 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#B-==C#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test14BlinkyLeavesBigPillAfterLeavingThePosition
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#-*BC-#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	5 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#B*==C#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test15ClydeStartsMovingRightIn5thTickAndLeavesSpace
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#*p--#'
	'######').
	game := PacmanGame withRepresentation: board randomizing: random.
	5 timesRepeat: [game tick].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#B==C#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test16ClydeCantMoveIIntoAWall
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'######'
	'#-BC-#'
	'#*p--#'
	'######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'######'
	'#B==C#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test17ClydeLeavesSmallPillAfterLeavingThePosition
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#-BC--#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#B==-C#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test18ClydeLeavesBigPillAfterLeavingThePosition
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#-BC*-#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#B==*C#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test19BlinkyDoesNotChangeMovementAfterCollidingWithAWallAndGettingA1
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#--C*-#'
	'#-B---#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#--=*C#'
	'#B=---#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 20:52:54'!
test20BlinkyChangesToUpAfterCollidingWithAWallAndGettingA3
"No hago el que saca 2 todavia porque necesito que cambie de posicion antes"
	| board game random results|
	results := CircularReadStream on: #(3) moving: NullUnit new.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#--C*-#'
	'#-B---#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#B-=*C#'
	'#-=---#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 20:52:54'!
test21BlinkyChangesToDownAfterCollidingWithAWallAndGettingA4
	| board game random results|
	results := CircularReadStream on: #(4) moving: NullUnit new.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#-BC*-#'
	'#-----#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#-==*C#'
	'#B----#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 20:52:54'!
test22BlinkyChangesToRightAfterCollidingWithAWallAndGettingA5
	| board game random results|
	results := CircularReadStream on: #(5) moving: NullUnit new.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#-BC*-#'
	'#-----#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#-B=*C#'
	'#-----#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 20:52:54'!
test23BlinkyChangesToLeftAfterCollidingWithAWallAndGettingA2
	| board game random results|
	results := CircularReadStream on: #(2 5 2 2 2 2 2 2) moving: NullUnit new.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#--C*-#'
	'#B----#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	10 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#-C=*-#'
	'#=--B-#'
	'#p==--#'
	'#######').
	"Hice un poco de trampa aca para ver donde tenia que estar clyde en esa iteracion, esto lo tuve que agregar despues de haber hecho los test de los movimientos de clyde"! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test24ClydeDoesNotChangeMovementAfterCollidingWithAWallAndGettingA1
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#---C-#'
	'#----B#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#---=C#'
	'#-B--=#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 20:52:54'!
test25ClydeChangesToUpAfterCollidingWithAWallAndGettingA3
"No hago el que saca 2 todavia porque necesito que cambie de posicion antes"
	| board game random results|
	results := CircularReadStream on: #(3) moving: NullUnit new.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#----B#'
	'#----C#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#-B--C#'
	'#----=#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 20:52:54'!
test26ClydeChangesToLeftAfterCollidingWithAWallAndGettingA2
	| board game random results|
	results := CircularReadStream on: #(2) moving: NullUnit new.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#---BC#'
	'#-----#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#B--C=#'
	'#-----#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 20:52:54'!
test27ClydeChangesToDownAfterCollidingWithAWallAndGettingA4
	| board game random results|
	results := CircularReadStream on: #(4) moving: NullUnit new.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#---BC#'
	'#-----#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#B--==#'
	'#----C#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 20:52:54'!
test28ClydeChangesToRightAfterCollidingWithAWallAndGettingA5
	| board game random results|
	results := CircularReadStream on: #(2 2 5 5 5 5 5 5 5) moving: NullUnit new.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#----C#'
	'#----B#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	11 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#-C--=#'
	'#---B=#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test29PacmanLosesALifeAfterBeingEaten
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#----C#'
	'#B*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	2 timesRepeat: [game tick.].
	self assert: (game hasLifes: 2)
	! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test30PacmanReturnsToInitialPositionAfterBeingEaten
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#----C#'
	'#B*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	2 timesRepeat: [game tick.].
	self assert: (game pacmanAt: 4@3).

	! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test31TicksRestartWhenPacmanEaten
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#----C#'
	'#B*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	2 timesRepeat: [game tick.].
	self assert: (game atTick: 0)
	"No voy a testear que no se muevan los fantasmas: como se que el tick es el 0 y anteriormente testee que no se mueven desde el 4 y 5, me aseguro que no se van a mover"! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test32ClydeCanEatThePacmanToo
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#----B#'
	'#C*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	2 timesRepeat: [game tick.].
	self assert: (game atTick: 0).
	self assert: (game hasLifes: 2).
	self assert: (game pacmanAt: 4@3).
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test33CantKeepOnPlayingGameWith0Lifes
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#----B#'
	'#C*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].

	self should: [game tick]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:error | 
		self assert: error messageText = PacmanGame noLifesReaminingErrorDescription
		]! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:21:58'!
test34BlinkyLeavesSpaceAfterLeavingThePosition
"Me olvide los test para verificar que los fantasmas dejan el space que habia en la casilla que estaban"
	| board game random results|
	results := CircularReadStream on: #() moving: NullUnit new.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#-=BC-#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	5 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#B===C#'
	'#p==--#'
	'#######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:33:56'!
test35ClydeLeavesSpaceAfterLeavingThePosition
"Me olvide los test para verificar que los fantasmas dejan el space que habia en la casilla que estaban"
	| board game random results|
	results := self randomThrowingOnly1s.
	random := RandomSimulator withResults: results.
	board := StringPacmanBoard representedAs:#(
	'#######'
	'#-BC=-#'
	'#-*p--#'
	'#######').
	game := PacmanGame withRepresentation: board randomizing: random.
	6 timesRepeat: [game tick.].
	self
	assert: game stringRepresentationOfBoard
	equals: #(
	'#######'
	'#B===C#'
	'#p==--#'
	'#######').! !


!classDefinition: #StringPacmanBoardTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #StringPacmanBoardTest
	instanceVariableNames: 'visitedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test01CannotCreateABoardWithoutThePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test02CannotCreateABoardWithMoreThanOnePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BCpp') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test03CannotCreateABoardWithoutBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 14:32:55'!
test04CannotCreateABoardWithMoreThanOneBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pBBC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:33'!
test05CannotCreateABoardWithoutClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pB') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:40'!
test06CannotCreateABoardWithMoreThanOneClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pBCC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:49'!
test07AllRowsHaveSameSize

	self 
		should: [ StringPacmanBoard representedAs: #('pBC' '') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: StringPacmanBoard rowsMustHaveSameSizeErrorDescription! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:00'!
test08VisitElementsWithRightPosition

	| board |
	
	visitedElements := Dictionary new.
	
	board := StringPacmanBoard representedAs: #('pBC#-*=').
	board visitElementsWith: self.
	
	self assert: (visitedElements at: #pacman) equals: 1@1.
	self assert: (visitedElements at: #blinky) equals: 2@1.
	self assert: (visitedElements at: #clyde) equals: 3@1.
	self assert: (visitedElements at: #wall) equals: 4@1.
	self assert: (visitedElements at: #smallPill) equals: 5@1.
	self assert: (visitedElements at: #bigPill) equals: 6@1.
	self assert: (visitedElements at: #space) equals: 7@1.
	self assert: visitedElements size equals: 7
	
	
	! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:11'!
test09InvalidCharactersAreNotAllowed

	self 
		should: [ StringPacmanBoard representedAs: #('pBCx') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard notAllowCharaterErrorDescriptionFor: $x)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'mq 11/22/2024 21:21:03'!
test10BoardTranslationExample
"
	HACER PASAR ESTE TEST ANTES DE COMENZAR: falla porque en la posicion del pacman (p) pone un string en vez de #pacman
"
	| board translator |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#-p=-#'
'######').

	translator := BoardOperatorAndTranslator on: board.
	
	self assert: translator stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#-p=-#'
'######').
! !


!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:25'!
visitBigPillAt: position 
	
	visitedElements at: #bigPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:27'!
visitBlinkyAt: position 
	
	visitedElements at: #blinky put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:56'!
visitClydeAt: position 
	
	visitedElements at: #clyde put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:10'!
visitPacmanAt: position 
	
	visitedElements at: #pacman put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:14'!
visitSmallPillAt: position 
	
	visitedElements at: #smallPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:17:12'!
visitSpaceAt: position 
	
	visitedElements at: #space put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:05'!
visitWallAt: position 
	
	visitedElements at: #wall put: position ! !


!classDefinition: #BoardOperatorAndTranslator category: #'2024-2C-Parcial-2'!
Object subclass: #BoardOperatorAndTranslator
	instanceVariableNames: 'board boardExtent'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!BoardOperatorAndTranslator methodsFor: 'string representation' stamp: 'mq 11/22/2024 19:22:28'!
characterRepresentationOf: anElement
	
	(anElement isKindOf: SmallPill) ifTrue: [ ^StringPacmanBoard smallPillCharacter ].
	(anElement isKindOf: BigPill) ifTrue: [ ^StringPacmanBoard bigPillCharacter ].
	(anElement isKindOf: Blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(anElement isKindOf: Clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(anElement isKindOf: Space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(anElement isKindOf: Wall) ifTrue: [ ^StringPacmanBoard wallCharacter ].
	(anElement = #pacman) ifTrue: [ ^StringPacmanBoard pacmanCharacter ].
	
	self error: 'Unknown pacman element type'! !

!BoardOperatorAndTranslator methodsFor: 'string representation' stamp: 'HAW 11/22/2024 14:45:23'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !

!BoardOperatorAndTranslator methodsFor: 'string representation' stamp: 'LL 11/22/2024 10:44:29'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!BoardOperatorAndTranslator methodsFor: 'string board visiting' stamp: 'mq 11/22/2024 18:18:42'!
visitBigPillAt: aPosition 
	
	board at: aPosition put: BigPill new! !

!BoardOperatorAndTranslator methodsFor: 'string board visiting' stamp: 'mq 11/22/2024 18:50:28'!
visitBlinkyAt: aPosition 
	
	board at: aPosition put: (Blinky covering: Space new)! !

!BoardOperatorAndTranslator methodsFor: 'string board visiting' stamp: 'mq 11/22/2024 19:22:17'!
visitClydeAt: aPosition 
	
	board at: aPosition put: (Clyde covering: Space new)! !

!BoardOperatorAndTranslator methodsFor: 'string board visiting' stamp: 'mq 11/22/2024 17:24:17'!
visitPacmanAt: aPosition 
	
	board at: aPosition put: #pacman! !

!BoardOperatorAndTranslator methodsFor: 'string board visiting' stamp: 'mq 11/22/2024 18:07:12'!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: SmallPill new.! !

!BoardOperatorAndTranslator methodsFor: 'string board visiting' stamp: 'mq 11/22/2024 18:06:13'!
visitSpaceAt: aPosition

	board at: aPosition put: Space new.
	
	! !

!BoardOperatorAndTranslator methodsFor: 'string board visiting' stamp: 'mq 11/22/2024 18:14:26'!
visitWallAt: aPosition 
	
	board at: aPosition put: Wall new.! !


!BoardOperatorAndTranslator methodsFor: 'initialization' stamp: 'HAW 11/22/2024 14:43:18'!
initializeOn: aBoard

	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self! !


!BoardOperatorAndTranslator methodsFor: 'board operations' stamp: 'mq 11/22/2024 18:03:40'!
at: aPosition 
	
	^board at: aPosition! !

!BoardOperatorAndTranslator methodsFor: 'board operations' stamp: 'mq 11/22/2024 17:53:53'!
at: aPosition put: aValue

	board at: aPosition put: aValue! !

!BoardOperatorAndTranslator methodsFor: 'board operations' stamp: 'mq 11/22/2024 19:01:33'!
detect: aBlock 

	^board detect: aBlock! !

!BoardOperatorAndTranslator methodsFor: 'board operations' stamp: 'mq 11/22/2024 17:50:40'!
keyAtValue: aValue
	
	^board keyAtValue: aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardOperatorAndTranslator class' category: #'2024-2C-Parcial-2'!
BoardOperatorAndTranslator class
	instanceVariableNames: ''!

!BoardOperatorAndTranslator class methodsFor: 'instance creation' stamp: 'LL 11/22/2024 10:37:38'!
on: aBoard

	^self new initializeOn: aBoard! !


!classDefinition: #FieldElement category: #'2024-2C-Parcial-2'!
Object subclass: #FieldElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!FieldElement methodsFor: 'interacting' stamp: 'mq 11/22/2024 20:53:58'!
interactWithBlinkyInGame: aPacmanGame

	self subclassResponsibility! !

!FieldElement methodsFor: 'interacting' stamp: 'mq 11/22/2024 20:54:01'!
interactWithClydeInGame: aPacmanGame

	self subclassResponsibility! !

!FieldElement methodsFor: 'interacting' stamp: 'mq 11/22/2024 20:54:03'!
interactWithPacmanInGame: aPacmanGame

	self subclassResponsibility! !


!classDefinition: #BigPill category: #'2024-2C-Parcial-2'!
FieldElement subclass: #BigPill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!BigPill methodsFor: 'interacting' stamp: 'mq 11/22/2024 19:18:43'!
interactWithBlinkyInGame: aPacmanGame

	aPacmanGame blinkyInPositionOfBigPill: self! !

!BigPill methodsFor: 'interacting' stamp: 'mq 11/22/2024 19:31:28'!
interactWithClydeInGame: aPacmanGame 

	aPacmanGame clydeInPositionOfBigPill: self.! !

!BigPill methodsFor: 'interacting' stamp: 'mq 11/22/2024 21:09:08'!
interactWithPacmanInGame: aPacmanGame

	aPacmanGame pacmanInPositionOfBigPill.! !


!classDefinition: #SmallPill category: #'2024-2C-Parcial-2'!
FieldElement subclass: #SmallPill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!SmallPill methodsFor: 'interacting' stamp: 'mq 11/22/2024 19:03:15'!
interactWithBlinkyInGame: aPacmanGame

	aPacmanGame blinkyInPositionOfSmallPill: 	self.! !

!SmallPill methodsFor: 'interacting' stamp: 'mq 11/22/2024 19:24:58'!
interactWithClydeInGame: aPacmanGame

	aPacmanGame clydeInPositionOfSmallPill: self! !

!SmallPill methodsFor: 'interacting' stamp: 'mq 11/22/2024 21:09:14'!
interactWithPacmanInGame: aPacmanGame 

	aPacmanGame pacmanInPositionOfSmallPill.! !


!classDefinition: #Space category: #'2024-2C-Parcial-2'!
FieldElement subclass: #Space
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Space methodsFor: 'interacting' stamp: 'mq 11/22/2024 20:08:14'!
interactWithBlinkyInGame: aPacmanGame

	aPacmanGame blinkyInPositionOfSpace: self.! !

!Space methodsFor: 'interacting' stamp: 'mq 11/22/2024 20:20:55'!
interactWithClydeInGame: aPacmanGame

	aPacmanGame clydeInPositionOfSpace: self.

	! !

!Space methodsFor: 'interacting' stamp: 'mq 11/22/2024 21:09:18'!
interactWithPacmanInGame: aPacmanGame

	aPacmanGame pacmanInPositionOfSpace.! !


!classDefinition: #Wall category: #'2024-2C-Parcial-2'!
FieldElement subclass: #Wall
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Wall methodsFor: 'interacting' stamp: 'mq 11/22/2024 21:08:16'!
interactWithBlinkyInGame: aPacmanGame

	aPacmanGame blinkyInPositionOfWall.! !

!Wall methodsFor: 'interacting' stamp: 'mq 11/22/2024 21:08:41'!
interactWithClydeInGame: aPacmanGame 

	aPacmanGame clydeInPositionOfWall.! !

!Wall methodsFor: 'interacting' stamp: 'mq 11/22/2024 21:09:27'!
interactWithPacmanInGame: aPacmanGame

	aPacmanGame pacmanInPositionOfWall. ! !


!classDefinition: #Ghost category: #'2024-2C-Parcial-2'!
Object subclass: #Ghost
	instanceVariableNames: 'covering'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Ghost methodsFor: 'covered element' stamp: 'mq 11/22/2024 20:55:25'!
changeCoveredElementTo: anElement

	covering := anElement! !

!Ghost methodsFor: 'covered element' stamp: 'mq 11/22/2024 20:55:33'!
coveredElement
	
	^covering ! !


!Ghost methodsFor: 'interacting' stamp: 'mq 11/22/2024 20:55:45'!
interactWithPacmanInGame: aPacmanGame

	self subclassResponsibility! !


!Ghost methodsFor: 'initialization' stamp: 'mq 11/22/2024 20:55:38'!
initializeCovering: anElement

	covering := anElement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ghost class' category: #'2024-2C-Parcial-2'!
Ghost class
	instanceVariableNames: ''!

!Ghost class methodsFor: 'instance creation' stamp: 'mq 11/22/2024 21:15:11'!
covering: anElement

	^self new initializeCovering: anElement.! !


!classDefinition: #Blinky category: #'2024-2C-Parcial-2'!
Ghost subclass: #Blinky
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Blinky methodsFor: 'interacting' stamp: 'mq 11/22/2024 21:07:41'!
interactWithPacmanInGame: aPacmanGame

	aPacmanGame blinkyInPositionOfPacman.! !


!classDefinition: #Clyde category: #'2024-2C-Parcial-2'!
Ghost subclass: #Clyde
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Clyde methodsFor: 'interacting' stamp: 'mq 11/22/2024 21:08:30'!
interactWithPacmanInGame: aPacmanGame

	aPacmanGame clydeInPositionOfPacman.! !


!classDefinition: #PacmanGame category: #'2024-2C-Parcial-2'!
Object subclass: #PacmanGame
	instanceVariableNames: 'board pacmanPosition lives points clydePosition blinkyPosition pacmanMovement tick clydeMovement blinkyMovement random pacmanInitialPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGame methodsFor: 'initialization' stamp: 'mq 11/22/2024 21:17:15'!
getBlinkyFromBoard

	^ board detect: [:aValue | aValue isKindOf: Blinky]! !

!PacmanGame methodsFor: 'initialization' stamp: 'mq 11/22/2024 21:16:59'!
getClydeFromBoard

	^ board detect: [:aValue | aValue isKindOf: Clyde]! !

!PacmanGame methodsFor: 'initialization' stamp: 'mq 11/22/2024 21:21:03'!
initializeWithRepresentation: aBoard randomizing: aRandom  

	board := BoardOperatorAndTranslator on: aBoard.
	"Cambie la clase dada: tambien es capaz de operar sobre el tablero asi que le cambie el nombre de acuerdo a sus nuevas responsabilidades"
	lives := 3.
	points := 0.
	tick := 0.
	random := aRandom.
	pacmanInitialPosition := board keyAtValue: #pacman.
	pacmanPosition := board keyAtValue: #pacman.
	clydePosition := board keyAtValue: ( self getClydeFromBoard).
	blinkyPosition := board keyAtValue: ( self getBlinkyFromBoard).
	pacmanMovement := -1@0.
	clydeMovement := 1@0.
	blinkyMovement := -1@0.

	! !


!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 19:02:47'!
advanceBlinky

	(board at: (blinkyPosition + blinkyMovement)) interactWithBlinkyInGame: self.
! !

!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 19:16:33'!
blinky

	^ board at: blinkyPosition! !

!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 20:56:24'!
blinkyInPositionOfBigPill: aBigPill 

	self moveBlinkyToElement: aBigPill .! !

!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 21:07:41'!
blinkyInPositionOfPacman 

	self pacmanEaten.! !

!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 20:08:54'!
blinkyInPositionOfSmallPill: aSmallPill 

	self moveBlinkyToElement: aSmallPill.! !

!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 20:09:15'!
blinkyInPositionOfSpace: aSpace 

	self moveBlinkyToElement: aSpace.! !

!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 21:08:16'!
blinkyInPositionOfWall 
	|randomNumber|
	randomNumber := (random getRandom).
	
	randomNumber = 2 ifTrue: [blinkyMovement := -1@0].
	randomNumber = 3 ifTrue: [blinkyMovement := 0@-1].
	randomNumber = 4 ifTrue: [blinkyMovement := 0@1].
	randomNumber = 5 ifTrue: [blinkyMovement := 1@0].! !

!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 20:58:34'!
moveBlinkyForward

	board at: blinkyPosition + blinkyMovement put: (self blinky).
	blinkyPosition := blinkyPosition + blinkyMovement! !

!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 21:08:02'!
moveBlinkyToElement: anElement

	self moveBlinkyForward.
	self restoreElementUnderBlinky.
	(self blinky) changeCoveredElementTo: anElement.! !

!PacmanGame methodsFor: 'blinky' stamp: 'mq 11/22/2024 21:28:07'!
restoreElementUnderBlinky

	| previousPosition |
	previousPosition := blinkyPosition - blinkyMovement.
	^ board at: previousPosition put: (self blinky) coveredElement! !


!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 19:24:03'!
advanceClyde

	(board at: (clydePosition + clydeMovement)) interactWithClydeInGame: self.
! !

!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 19:26:03'!
clyde

	^board at: clydePosition ! !

!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 20:09:02'!
clydeInPositionOfBigPill: aBigPill 

	self moveClydeToElement: aBigPill.! !

!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 21:08:30'!
clydeInPositionOfPacman 

	self pacmanEaten.! !

!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 20:09:02'!
clydeInPositionOfSmallPill: aSmallPill 

	self moveClydeToElement: aSmallPill.! !

!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 20:21:09'!
clydeInPositionOfSpace: aSpace 

	self moveClydeToElement: aSpace.! !

!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 21:08:41'!
clydeInPositionOfWall 

	|randomNumber|
	randomNumber := (random getRandom).
	
	randomNumber = 2 ifTrue: [clydeMovement := -1@0].
	randomNumber = 3 ifTrue: [clydeMovement := 0@-1].
	randomNumber = 4 ifTrue: [clydeMovement := 0@1].
	randomNumber = 5 ifTrue: [clydeMovement := 1@0].! !

!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 20:59:08'!
moveClydeForward

	board at: clydePosition + clydeMovement put: (self clyde).
	clydePosition := clydePosition + clydeMovement! !

!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 21:26:19'!
moveClydeToElement: anElement

	self moveClydeForward.
	self restoreElementUnderClyde.
	(self clyde) changeCoveredElementTo: anElement ! !

!PacmanGame methodsFor: 'clyde' stamp: 'mq 11/22/2024 21:27:52'!
restoreElementUnderClyde

	|previousPosition|
	previousPosition := clydePosition - clydeMovement.
	^ board at: previousPosition put: (self clyde) coveredElement! !


!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 18:11:18'!
advancePacman
	
	(board at: pacmanPosition + pacmanMovement ) interactWithPacmanInGame: self.
	! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 18:25:45'!
changeMovementDown

	pacmanMovement := 0@1! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 18:27:19'!
changeMovementLeft

	pacmanMovement := -1@0! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 18:22:06'!
changeMovementRight

	pacmanMovement := 1@0! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 18:20:22'!
changeMovementUp

	pacmanMovement := 0@-1! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 18:31:44'!
movePacmanForward

	board at: pacmanPosition + pacmanMovement put: #pacman.
	board at: pacmanPosition put: Space new.
	pacmanPosition := pacmanPosition  + pacmanMovement.! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 20:49:44'!
pacmanEaten

	lives := lives - 1.
	board at: pacmanPosition put: Space new.
	pacmanPosition := pacmanInitialPosition.
	tick := 0! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 21:09:08'!
pacmanInPositionOfBigPill 

	self movePacmanForward.
	points := points + 2.! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 21:09:14'!
pacmanInPositionOfSmallPill 

	self movePacmanForward.
	points := points + 1.! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 21:09:18'!
pacmanInPositionOfSpace 

	self movePacmanForward.! !

!PacmanGame methodsFor: 'pacman' stamp: 'mq 11/22/2024 21:09:27'!
pacmanInPositionOfWall 

	! !


!PacmanGame methodsFor: 'testing' stamp: 'mq 11/22/2024 20:39:38'!
atTick: aPotentialTick 

	^tick = aPotentialTick	! !

!PacmanGame methodsFor: 'testing' stamp: 'mq 11/22/2024 20:35:26'!
hasLifes: aPotentialAmountOfLifes

	^aPotentialAmountOfLifes = lives 

	! !

!PacmanGame methodsFor: 'testing' stamp: 'mq 11/22/2024 18:16:42'!
hasPoints: aPotentialAmountOfPoints 

	^aPotentialAmountOfPoints = points ! !

!PacmanGame methodsFor: 'testing' stamp: 'mq 11/22/2024 20:36:58'!
pacmanAt: aPosition 

	^pacmanPosition = aPosition! !


!PacmanGame methodsFor: 'string representation' stamp: 'mq 11/22/2024 17:41:17'!
stringRepresentationOfBoard

	^board stringRepresentationOfBoard.! !


!PacmanGame methodsFor: 'advance time' stamp: 'mq 11/22/2024 21:26:56'!
assertEnoughLifesToPlay

	^ lives = 0 ifTrue: [self error: self class noLifesReaminingErrorDescription]! !

!PacmanGame methodsFor: 'advance time' stamp: 'mq 11/22/2024 21:26:56'!
tick
	
	self assertEnoughLifesToPlay.
	tick := tick + 1.
	self advancePacman.
	tick > 3 ifTrue: [self advanceBlinky].
	tick > 4 ifTrue: [self advanceClyde]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PacmanGame class' category: #'2024-2C-Parcial-2'!
PacmanGame class
	instanceVariableNames: ''!

!PacmanGame class methodsFor: 'instance creation' stamp: 'mq 11/22/2024 19:45:35'!
withRepresentation: board randomizing: aRandom  

	^self new initializeWithRepresentation: board randomizing: aRandom! !


!PacmanGame class methodsFor: 'error descriptions' stamp: 'mq 11/22/2024 20:50:56'!
noLifesReaminingErrorDescription

	^'No lifes remaining'! !


!classDefinition: #RandomSimulator category: #'2024-2C-Parcial-2'!
Object subclass: #RandomSimulator
	instanceVariableNames: 'results'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!RandomSimulator methodsFor: 'random' stamp: 'mq 11/22/2024 19:43:37'!
getRandom

	^results next! !

!RandomSimulator methodsFor: 'random' stamp: 'mq 11/22/2024 19:43:52'!
lastResult

	^results current.! !


!RandomSimulator methodsFor: 'initialization' stamp: 'mq 11/22/2024 19:43:12'!
initializeWithResults: aCircularReadStream

	results := aCircularReadStream.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RandomSimulator class' category: #'2024-2C-Parcial-2'!
RandomSimulator class
	instanceVariableNames: ''!

!RandomSimulator class methodsFor: 'instance creation' stamp: 'mq 11/22/2024 19:42:58'!
withResults: aCircularReadStream

	^self new initializeWithResults: aCircularReadStream.! !


!classDefinition: #StringPacmanBoard category: #'2024-2C-Parcial-2'!
Object subclass: #StringPacmanBoard
	instanceVariableNames: 'stringRepresentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoard methodsFor: 'initialization' stamp: 'HAW 11/18/2024 19:29:26'!
initializeRepresentedAs: aStringRepresentation 
	
	stringRepresentation := aStringRepresentation.! !


!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:23:48'!
bigPillCharacter

	^self class bigPillCharacter! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:20'!
blinkyCharacter

	^ self class blinkyCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:30'!
clydeCharacter

	^ self class clydeCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:52'!
pacmanCharacter

	^ self class pacmanCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:15'!
smallPillCharacter

	^self class smallPillCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:37'!
spaceCharacter

	^self class spaceCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:26:00'!
wallCharacter

	^self class wallCharacter! !


!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:21'!
isBigPill: anElement

	^ anElement = self bigPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:36'!
isBlinky: anElement

	^ anElement = self blinkyCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:09'!
isClyde: anElement

	^ anElement = self clydeCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:17'!
isPacman: anElement

	^ anElement = self pacmanCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:12'!
isSmalltPill: anElement

	^ anElement = self smallPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:29'!
isSpace: anElement

	^ anElement = self spaceCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:03'!
isWall: anElement

	^ anElement = self wallCharacter! !


!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/22/2024 14:38:19'!
visit: anElement at: position with: aPacmanBoardVisitor

	(self isWall: anElement) ifTrue: [ ^aPacmanBoardVisitor visitWallAt: position ].
	(self isSmalltPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSmallPillAt: position ].
	(self isBigPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBigPillAt: position ].
	(self isBlinky: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBlinkyAt: position ].
	(self isClyde: anElement) ifTrue: [ ^aPacmanBoardVisitor visitClydeAt: position ].
	(self isPacman: anElement) ifTrue: [ ^aPacmanBoardVisitor visitPacmanAt: position ].
	(self isSpace: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSpaceAt: position ].
	
	"No hay necesidad de generar un error porque no se permite crear un board con caracteres distintos a todos estos - Hernan"! !

!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/20/2024 17:22:41'!
visitElementsWith: aPacmanBoardVisitor

	stringRepresentation withIndexDo: [ :aRow :y |
		aRow withIndexDo: [ :anElement :x | 
			self visit: anElement at: x@y with: aPacmanBoardVisitor.]]! !


!StringPacmanBoard methodsFor: 'extent' stamp: 'HAW 11/22/2024 10:50:10'!
extent
	
	"There is always a row and their size is the same to all - Hernan"
	^stringRepresentation first size @ stringRepresentation size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StringPacmanBoard class' category: #'2024-2C-Parcial-2'!
StringPacmanBoard class
	instanceVariableNames: ''!

!StringPacmanBoard class methodsFor: 'instance creation' stamp: 'HAW 11/22/2024 10:48:32'!
representedAs: aStringRepresentation 
	
	| elementCharactersCount |
	
	elementCharactersCount := self elementCharacterCountOf: aStringRepresentation.	
	self asserltAllActorsAreIn: elementCharactersCount.
	"If I get here the there is always a row - Hernan"
	self assertAllRowsHaveSameSizeIn: aStringRepresentation.
	
	^self new initializeRepresentedAs: aStringRepresentation 
	! !


!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:30'!
characterIsMissingErrorDescriptionFor: aCharacterName
	
	^aCharacterName, ' is missing'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:39:12'!
notAllowCharaterErrorDescriptionFor: aCharacter

	^'Character ', aCharacter asString, ' is not allowed'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:07:31'!
rowsMustHaveSameSizeErrorDescription
	
	^'Rows must have same number of columns'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:01'!
shouldBeUniqueErrorDescriptionFor: aCharacterName
	
	^'There should be only one ', aCharacterName ! !


!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/21/2024 20:17:42'!
allowedCharacters
	
	^ {
	self pacmanCharacter.
	self blinkyCharacter.
	self clydeCharacter.
	self wallCharacter.
	self bigPillCharacter.
	self smallPillCharacter.
	self spaceCharacter.
	}! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:24:06'!
bigPillCharacter
	
	^ $*! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:25'!
blinkyCharacter
	
	^$B! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:42'!
clydeCharacter
	
	^$C! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:41:25'!
pacmanCharacter
	
	^$p! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:24'!
smallPillCharacter
	
	^ $-! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:46'!
spaceCharacter
	
	^ $=! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:26:06'!
wallCharacter
	
	^ $#! !


!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:12'!
blinkyName

	^ #blinky! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:29'!
clydeName

	^ #clyde! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:05'!
pacmanName

	^ #pacman! !


!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/21/2024 19:59:27'!
asserltAllActorsAreIn: elementCharactersCount

	{ self pacmanName. self blinkyName. self clydeName } do: [ :aCharacterName | 
		self assertActorIsCorrect: aCharacterName in: elementCharactersCount ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:04'!
assert: anElementCharacter isAllowed: allowedCharacters

	(allowedCharacters includes: anElementCharacter) ifFalse: [ self error: (self notAllowCharaterErrorDescriptionFor: anElementCharacter) ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:48:41'!
assertActorIsCorrect: aCharacterName in: elements 
	
	| characterIdentifier |
	
	characterIdentifier := self perform: (aCharacterName, #Character) asSymbol.
	(elements includes: characterIdentifier)
		ifFalse: [ self error: (self characterIsMissingErrorDescriptionFor: aCharacterName) ].
		
	(elements occurrencesOf: characterIdentifier) > 1
		ifTrue: [ self error: (self shouldBeUniqueErrorDescriptionFor: aCharacterName) ].
! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:16'!
assertAllRowsHaveSameSizeIn: aStringRepresentation

	(aStringRepresentation allSatisfy: [ :aRow | aRow size = aStringRepresentation first size ]) ifFalse: [ 
		self error: self rowsMustHaveSameSizeErrorDescription ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:30'!
elementCharacterCountOf: aStringRepresentation

	| elementCharactersCount allowedCharacters |
	
	elementCharactersCount := Bag new.
	allowedCharacters := self allowedCharacters.
	
	aStringRepresentation do: [ :aRow |
		aRow do: [ :anElementCharacter | 
			self assert: anElementCharacter isAllowed: allowedCharacters.
			elementCharactersCount add: anElementCharacter ]].
	
	^elementCharactersCount ! !
