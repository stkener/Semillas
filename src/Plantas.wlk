import INTA.*
import Parcelas.*

class Menta{
	var property anioDeObtencionSemilla
	var property altura
	var property hsSol
	
	method esFuerte(){return hsSol > 9}
	
	method daNuevasSemillas(){return self.esFuerte() and self.espacioQueOcupa() > 1.5}
	
	method espacioQueOcupa(){return altura + 1}
	
	method ParcelaIdeal(unaParcela){return unaParcela.superficie() > 6}
		
}

class Soja{
	var property anioDeObtencionSemilla
	var property altura
	var property hsSol
	
	method esFuerte(){
		if(altura < 0.5 and hsSol < 7){return true}
		if(2 > altura > 0.5 and hsSol < 9){return true}
		if(altura > 1 and hsSol < 13){return true}
		else{return false}
	}
	
	method daNuevasSemillas(){return self.anioDeObtencionSemilla() > 2007 and 0.9 > altura > 0.75}
	
	method espacioQueOcupa(){return altura / 2}
		
	method ParcelaIdeal(unaParcela){
		hsSol = unaParcela.hsSol()
		
		return self.esFuerte()	
	}	
}


class Quinoa{
	var property anioDeObtencionSemilla
	var property altura
	var property espacioQueOcupa
	
	method esFuerte(){return self.hsSol() > 9}
	
	method daNuevasSemillas(){return self.anioDeObtencionSemilla() < 2005 }
	
	method hsSol(){ 
		if(espacioQueOcupa < 0.3){return 10}
		else return 7}
		
	method ParcelaIdeal(unaParcela){return not unaParcela.algunaSupera(1.5)}
}

class Peperina{
	var property anioDeObtencionSemilla
	var property altura
	var property hsSol
	
	method esFuerte(){return hsSol > 9}
	
	method daNuevasSemillas(){return self.esFuerte() and self.espacioQueOcupa() > 1.5}
	
	method espacioQueOcupa(){return (altura + 1)*2}
	
	method ParcelaIdeal(unaParcela){return unaParcela.superficie() > 6}	
}

class SojaTransgenica{
	var property anioDeObtencionSemilla
	var property altura
	var property hsSol
	
	method esFuerte(){
		if(altura < 0.5 and hsSol < 7){return true}
		if(2 > altura > 0.5 and hsSol < 9){return true}
		if(altura > 1 and hsSol < 13){return true}
		else{return false}
	}
	
	method daNuevasSemillas(){return false}
	
	method espacioQueOcupa(){return altura / 2}
	
	method ParcelaIdeal(unaParcela){return unaParcela.cantMaximaDePlantas() < 2}
		
	}