import wollok.game.*

class Corsa {
	var property image = "autitorojo.png"
	var property position = game.at(4,7)
	var property posicionesAnteriores = []
	
	const property color //Porque quiero tener el setter para 1 solo uso y luego tener el getter
	
	method capacidad() { return 4 }	
	method velocidadMaxima() { return 150 }
	method peso(){ return 1300 }
	
	method pasoPorPosicion(posicion) {
		return posicionesAnteriores.any( { p => p == posicion } )	
	}
	
	method pasoPorFila(numero) {
		return posicionesAnteriores.any( { p => p.x() == numero } )	
	}
	
	method recorrioFilas(listaNumeros) {
		return listaNumeros.all( { n => self.pasoPorFila(n) } )
	} 
	
	method moverALaDerecha() {
		self.position(self.position().right(1))
		posicionesAnteriores.add(self.position())
	}
	
	method moverALaIzquierda() {
		self.position(self.position().left(1))
		posicionesAnteriores.add(self.position())
	}
	
	method moverAArriba() {
		self.position(self.position().up(1))
		posicionesAnteriores.add(self.position())
	}

	method moverAAbajo() {
		self.position(self.position().down(1))
		posicionesAnteriores.add(self.position())
	}
}

class Kwid {
	const property color = "azul"
	var property tieneGas = false //El tanque adicional es este
	
	method capacidad() {
		return
		if(tieneGas) {
			3
		} else {
			4
		}
	}
	
	method velocidadMaxima() {
		return
		if(tieneGas) {
			120
		} else {
			110
		}
	}
	
	method peso() { 
		return 1200 + 
		if(tieneGas) {
			150
		} else {
			0 //Hay que poner si o si el else
		}
	}
}

object traffic {
	var property interior //Para poder crearlo cuando haga una instancia
	var property motor //Para poder crearlo cuando haga una instancia
	const property color = "blanco"
	
	method capacidad() { return interior.capacidad() } //Ver
	method velocidadMaxima() { return motor.velocidadMaxima() } //Ver
	method peso(){ return 4000 + interior.peso() + motor.peso() }	
}

object interiorComodo {
	method capacidad() { return 5 }
	method peso() { return 700 }
}

object interiorPopular {
	method capacidad() { return 12 }
	method peso() { return 1000 }
}

object motorPulenta {
	method velocidadMaxima() { return 130 }
	method peso() { return 800 }
}

object motorBataton {
	method velocidadMaxima() { return 80 }
	method peso() { return 500 }
}

class AutosEspeciales {
	var property color
	var property capacidad
	var property velocidadMaxima
	var property peso
}