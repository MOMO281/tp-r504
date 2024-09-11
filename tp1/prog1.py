# Importation du fichier fonctions.py
import fonctions as f

def puissance():

	try:
    
		a = int(input("Saisir le premier nombre : "))
		b = int(input("Saisir le second nombre (puissance) : "))
    
		res = f.puissance(a, b)
    
		print(f, a, "élevé à la puissance", b, " vaut ",res )

	except TypeError as e:
		print(f"Erreur : ", e)

puissance()
