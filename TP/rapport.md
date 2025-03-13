# Rapport TP MorphoMath
# Carrette Théo

### Problem 1.

1. Segment all the cells of the attached uranium oxide image

Pour segmenter les cellules, il faut d'abord faire une fermeture dynamique pour se débarasser des petits creux dans l'image. On utilise la commande ```heightminima uo.pgm 4 20 out.pgm```. Ensuite, on récupère le graphe à arêtes pondérées associés avec notre nouvelle image pour pouvoir utiliser watershed dessus. On utilise la commande ```pgm2GA out.pgm 2 out.ga``` avec le paramètre 2 car on veut utiliser le maximum des sommets pour créer les arêtes plutôt que faire la différence des sommets. Ensuite, utilise la commande ```GAwatershed out.ga outwater.ga``` pour utiliser la méthode des lignes du partage des eaux et récupérer le graphe associé. Enfin, pour convertir en .pgm pour pouvoir lire l'image segmenté, on utilise la commande ```GA2khalimsky outwater.ga 0 watershed.pgm```. On obtient donc l'image watershade.pgm qui correspond à la segmentation des cellules de l'image uo.pgm.

La commande totale est : 

```heightminima uo.pgm 4 20 out.pgm && pgm2GA out.pgm 2 out.ga && GAwatershed out.ga outwater.ga && GA2khalimsky outwater.ga 0 watershed.pgm```

2. Remove the cells that touch the frame of the image

```frame watershed.pgm 50 mark.pgm && inverse mark.pgm inv_mark.pgm && inverse watershed.pgm inv_watershed.pgm && geodilat inv_mark.pgm inv_watershed.pgm 4 -1 waterB.pgm```

3. Give some statistics about the cells (number, average size, etc.)