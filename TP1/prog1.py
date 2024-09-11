# Importation du fichier fonctions.py
import fonctions as f

def main():
    try:
        # Saisie des deux nombres avec gestion des erreurs
        a = int(input("Saisir le premier nombre (entier) : "))
        b = int(input("Saisir le second nombre (entier, puissance) : "))
        
        # Appel de la fonction puissance(a, b) du fichier fonctions.py
        res = f.puissance(a, b)
        
        # Affichage du résultat
        print(f"{a} élevé à la puissance {b} vaut {res}")
    
    except ValueError:
        print("Erreur : Vous devez entrer des nombres entiers.")
    except TypeError as e:
        print(f"Erreur : {e}")

# Exécution du programme principal
if __name__ == "__main__":
    main()

