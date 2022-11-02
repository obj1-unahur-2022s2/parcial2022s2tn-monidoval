import plantas.*

class Parcela {
	const ancho
	const largo
	var property horasDeSol
	const plantas =[]
	
	method superficie(){return
		ancho * largo
	}
	method cantidadMaxima(){return
		if (ancho > largo) {self.superficie().div(5)}
		else {self.superficie().div(3) + largo}
	}
	method tieneComplicaciones(){return
		plantas.any({p => p.horasDeSolToleradas() < horasDeSol})
	}
	method plantar(unaPlanta){
		if(self.superaCantidadMaxima() or unaPlanta.noToleraSol(self))self.error("no se puede plantar")
		else plantas.add(unaPlanta)
	}
	
	method superaCantidadMaxima(){return
		self.cantidadMaxima() == self.cantidadTotalDePlantas()
	}
	method cantidadTotalDePlantas(){return plantas.size()}
	
	method alturaSupera(unaAltura){return
		plantas.any({p => p.altura() >= unaAltura})
	}
	method esParaMonocultivo(){return plantas.isEmpty()}
	
	method seAsociaBien(unaPlanta)
	
	method tieneMasDe(unaCantidadDePlantas){return
		self.cantidadTotalDePlantas() > unaCantidadDePlantas
	}
	method cantidadDePlantasBienAsociadas(){return
		plantas.count({p => self.seAsociaBien(p)})
		
	}
		
	
}

class ParcelaEcologica inherits Parcela{
	
	override method seAsociaBien(unaPlanta){return
		!self.tieneComplicaciones() and unaPlanta.esParcelaIdeal(self)
	}
	
}

class ParcelaIndustrial inherits Parcela{
	
	override method seAsociaBien(unaPlanta){return
		plantas.size() <= 2 and unaPlanta.esFuerte()
	}
}
