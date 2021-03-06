import rodados.*
import pedidos.*

class Dependencia {
	var property nombre
	var property flota = []
	var property empleados = 0
	var property pedidos = []
	
	method agregarAFlota(unRodado) {
		flota.add(unRodado)
	}
	
	method quitarDeFlota(unRodado) {
		flota.remove(unRodado)
	}
	
	method pesoTotalFlota() {
		return flota.sum( { r => r.peso() } )
	}
	
	method estaBienEquipada() {
		return flota.size() >= 3 and flota.all( { r => r.velocidadMaxima() >= 100 } )
	}
	
	method capacidadTotalEnColor(color) {
		return flota.filter( { r => r.color() == color } ).sum( { r => r.capacidad() } )
	}
	
	method colorDelRodadoMasRapido() {
		return flota.max( { r => r.velocidadMaxima() } ).color()
	} 
	
	method capacidadFaltante() {
		return 0.max(empleados - flota.sum( { r => r.capacidad() } ))
	}
	
	method esGrande() {
		return empleados >= 40 and flota.size() >= 5
	}
	
	method totalPasajerosEnPedidos() {
		return pedidos.sum( { p => p.cantidadPasajeros() } )
	}
	
	method algunAutoPuedeConPedido(unPedido) {
		return flota.any( { a => unPedido.puedeSatisfacerPedido(a) } )
	}	
	
	method pedidosNoPuedenSerSatisfechos() {
		return pedidos.filter( { p => ! self.algunAutoPuedeConPedido(p) } )
	}
	
	method losPedidosTienenIncompatible(unColor) {
		return pedidos.all( { p => p.coloresIncompatibles().any( { c => c == unColor } ) } )
	}
}




