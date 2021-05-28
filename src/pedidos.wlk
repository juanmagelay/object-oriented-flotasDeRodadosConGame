import rodados.*

class Pedidos {
	var property distancia
	var property tiempoMax
	var property cantidadPasajeros
	const property coloresIncompatibles = #{}
	
	method velocidadRequerida() { return distancia / tiempoMax }
	
	method puedeSatisfacerPedido(unAuto) {
		return
			(unAuto.velocidadMaxima() >= 10) and
			(unAuto.capacidad() >= self.cantidadPasajeros()) and
			(self.coloresIncompatibles().all( { c => c != unAuto.color() } ))
	}	
}
