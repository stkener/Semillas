import Plantas.*
import INTA.*

class ParcelaEcologica{
	var property ancho
	var property largo
	var property hsSol
	const plantas = []
	
	
	method quitararPlantas(unaPlanta){plantas.remove(unaPlanta)}

	method superficie(){return ancho*largo}
	
	method cantMaximaDePlantas(){
		if(ancho > largo){return self.superficie() / 5 }
		else {return (self.superficie() / 3) + largo}}
		
	method tieneSangreJoven(){return plantas.any({p => p.anioDeObtencionSemilla()>2012})}

	method plantar(unaPlanta){
		if(plantas.size() < self.cantMaximaDePlantas() and hsSol > (unaPlanta.hsSol()+2))
		{plantas.add(unaPlanta) return "Plantaste plantita"}
		else {return "Parcela completa, imposible plantar"}}
		
	method algunaSupera(altura){return plantas.any({p => p.altura() < 1.5})}
		
	method cantDePlantas(){return plantas.size()}
	
	method seAsociaBien(unaPlanta){return self.tieneSangreJoven() and unaPlanta.ParcelaIdeal(self)}
	
	method cantBienAsoc(){return (plantas.count({p => p.seAsocBien()})).size()}
	}

class ParcelaIndustrial inherits ParcelaEcologica{
	
	override method seAsociaBien(unaPlanta){ return plantas.size() < 3 and unaPlanta.esFuerte()}}