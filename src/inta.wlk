import plantas.*
import parcelas.*

object inta{
	
	const parcelasInta = []
	
	method incluirParcela(unaParcela){
		parcelasInta.add(unaParcela)
	}
	
	method cantidadDeParcelas(){return
		parcelasInta.size()
	}
	
	method promedioDePlantas(){return
		parcelasInta.sum({p => p.cantidadTotalDePlantas() / parcelasInta.size()})
		
	}
	method parcelaMasAutosustentable(){return
		
		parcelasInta.filter({p => p.tieneMasDe(4)}).max({p => p.cantidadDePlantasBienAsociadas()})
		
	}
}