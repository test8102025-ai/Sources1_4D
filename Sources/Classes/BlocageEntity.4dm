Class extends Entity

Function get dateDeFinPrevisionnelle()->$result : Date
	$result:=This.Actions.max("Date_Fin_Previsionnelle")
	
Function get rowColor()->$result : Integer
	$result:=lk inherited
	If (This.Commande.Prioritaire)
		$result:=0x00FBAA99
	End if 
	If (Not(This.Actions.Date_Fin.includes(!00-00-00!)))  // Toutes les actions sont closes
		$result:=0x00B6F3B6  // Vert
	End if 
	If (This.Date_Fin#!00-00-00!)  // Le blocage est côlturé, [Blocage]Date_Fin renseignée
		$result:=0x00DDDDDD  // Gris
	End if 
	
Function get textColor()->$result : Integer
	//Texte de la date de fin prévisionnelle en rouge si dépassée
	Case of 
		: (This.dateDeFinPrevisionnelle<Current date)
			$result:=0x00FF0000  // Rouge
		Else 
			$result:=lk inherited  // Noir par défaut
	End case 
	
Function get CABloque()->$result : Real
	If (Storage.u[0].Cout && Not(Undefined(This.Commande)))
		$result:=This.Qte*This.Commande.Prix_unitaire
	Else 
		$result:=0
	End if 