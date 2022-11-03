/*
 * Faltaban los paréntesis  or (anioDeObtencion > 2007 and altura > 1)
 */
import parcelas.*

class Planta{
	const anioDeObtencion
	const property altura
	
	method horasDeSolToleradas()
		
	
	method esFuerte(){return
		self.horasDeSolToleradas() > 10
	}
	method daNuevasSemillas(){return
	    self.esFuerte()
	}
	method espacio()
	method noToleraSol(unaParcela){return
		unaParcela.horasDeSol() >= self.horasDeSolToleradas() + 2
	}	
}

class Menta inherits Planta{
	
	
	override method horasDeSolToleradas(){return 6}
	
	override method daNuevasSemillas(){return
		super() or altura > 0.4	
	}
	override method espacio(){return 
		altura * 3
	}
	method esParcelaIdeal(unaParcela){return
		unaParcela.superficie() > 6
	}
}

class Soja inherits Planta{
	
	override method horasDeSolToleradas(){return 
		if(altura < 0.5) {6}
		else if (altura.between(0.5 , 1)) {7}
		else {9}
	}
	
	override method daNuevasSemillas(){return
		super() or (anioDeObtencion > 2007 and altura > 1)
	}
	override method espacio(){return 
		altura * 0.5
	}
	method esParcelaIdeal(unaParcela){return
		unaParcela.horasDeSol() == self.horasDeSolToleradas() 
	}		
}

class Quinoa inherits Planta{
	const solToleradoPorCepa
	
	override method horasDeSolToleradas(){return solToleradoPorCepa}
	
	override method daNuevasSemillas(){return
		super() or anioDeObtencion < 2005
	}
	override method espacio(){return 0.5}
	method esParcelaIdeal(unaParcela){return
		!unaParcela.alturaSupera(1.5) 
	}		
}

class SojaTransgenica inherits Soja{
	
	override method daNuevasSemillas(){return false}
	override method esParcelaIdeal(unaParcela){return
		unaParcela.esParaMonocultivo() 
	}	
}

class Hierbabuena inherits Menta{
	
	override method espacio(){return 
		super() * 2
	}
}


