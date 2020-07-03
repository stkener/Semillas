import Parcelas.*
import Plantas.*

object inta{
	
	var parcelas =[]
	
	method agregarParcela(unaParcela){parcelas.add(unaParcela)}
	method quitarParcela(unaParcela){parcelas.remove(unaParcela)}
	
	method promedioDePlantas(){return parcelas.sum({parcela => parcela.cantPlantas()}) / parcelas.size()}
	
	method parcelaMasAutosustentable(){
		
		var pPobladas = parcelas.filter({p => p.cantPlantas() > 4})
		
		return pPobladas.max({p => p.cantBienAsoc()})}
}