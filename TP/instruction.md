Chers élèves en morphologie mathématique,

La séance sur machines de cet après-midi a lieu, comme convenu, dans le bâtiment Perrault d'ESIEE Paris, salle 5207.

1 / Les instructions des 2 problèmes à traiter (et de l'aide pour les résoudre) sont données ci-après.

2 / Les images à traiter sont en pièce jointe.

3 / Les instructions pour installer la bibliothèque PINK sous Linux (environnement de travail nécessaire) sont également données ci-dessous.

Bon travail !
Jean

###############################

   INSTRUCTIONS and HINTS

###############################



** Problem 1.

1. Segment all the cells of the attached uranium oxide image
2. Remove the cells that touch the frame of the image
3. Give some statistics about the cells (number, average size, etc.)

Hint: you can use the howto below to find some useful pink commands ;-)

** Problem 2. (Segmentation of red blood cells)
Based on what you have seen in the course:
1. Segment all the red blood cells in the atteched bloodCells image.
2. Remove the ones that touch the edge of the image.
3. Separate the cells that are touching each other.
4. Give some statistics about the globules (number, average size).

Hint: step 3 is tricky. It needs the notion of a *distance map* of a binary object.

-------------------------------
Distance map
-------------------------------

Basically, the distance map to a subset X of the space E is the image D_X on E defined, for every pixel x in E by
D_x) = min {d(x,y) | y in X} where d(x,y) denotes the (Euclidean) distance between x and y.

Then, the distance map to X is an image where the value of each pixel x is the distance from this point to the closest point which belongs to the set X.

To obtain the distance map of an object in Pink you can use the command "dist" for example with the command:

>> dist X.pgm 1 distMapToX.pgm

If needed you can convert the resulting image to a byte image (ie, an image with values between 0 and 255) with the command :

>> long2byte distMapToX.pgm  1 distMapToX_Byte.pgm



####################################
HOWTO Watershed with PINK
####################################

# Pour seuiller une image, en interactif : seuil.tcl

# Pour transformer une image en un graphe à arêtes pondérés :
pgm2GA $PINK/images/2d/im.pgm 0 /tmp/out.ga
# Le deuxième argument [ici 0] indique comment l'on procède pour pondérer les arêtes (maximum / minimum ou différence d'intensité entre pixels extrémités de chaque arête)

# Pour calculer une Ligne de Partage des Eaux d'un graphe à arêtes pondérées
GAwatershed /tmp/relief.ga /tmp/watershed.ga

# Pour visualiser le résultat, on passe dans la grille de Khalimsky
GA2khalimsky /tmp/watershed.ga 0 /tmp/watershed.pgm

# Pour superposer une segmentation (sous forme d'une image binaire) à une image en niveau de gris, on peut utiliser surimp [attention les deux images doivent être de la même taille]
# pour remettre une image à la taille souhaitée, on peut utiliser zoom ou alors faire subir à l'image img.pgm  un passage en graphe pondéré puis en grille de Khalimsky ("pgm2GA img.pgm 0 /tmp/img.ga" puis "GA2khalimsky /tmp/img.ga 0  imgALaBonneTaille.pgm")

#Pour filtrer une image avec une fermeture par aire: areaclosing
# avec une fermeture par dynamique (profondeur): heightminima
# avec un fermeture par volume: volmaxima et inverse
# Pour obtenir une image noire avec un bord blanc : frame

# Pour compter le nombre de pixels blancs d'une image binaire: area
# Pour compter le nombre de composantes connexes d'une image binaire: nbcomp

# C'est tout pour le moment ;-)


##################################
Steps to get PINK work on Linux
##################################

- download PINK library at https://perso.esiee.fr/~coupriem/pink.tgz
- open a terminal
- change current directory to the directory where PINK was downloaded
- then, uncompress PINK with 'tar -xvzf pink.tgz'
- 'cd PINK'
- compile PINK: './makelin'
- create a file name '.pink.start' in your directory homedir
- add the two following lines in the .pink.start file (assuming bash is your shell):
        export PINK=[main_pink_directory]
        export PATH=$PATH:$PINK/linux/bin:$PINK/scripts:$PINK/tcl
where you replace [main_pink_directory] by the path of the directory where PINK is installed.
- before using PINK in a terminal enter the following command line 'source ~/homedir/.pink.start' or copy it into your .bashrc file (located in home directory) if you dont want to enter the command line each time you want to use pink.