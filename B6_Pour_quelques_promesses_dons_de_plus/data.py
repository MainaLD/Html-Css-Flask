import mysql.connector as mysqlpyth

# descrition des variable en valeur ici None
bdd = None 
cursor = None

# Connexion de la bdd
def connexion(): 
    global bdd 
    global cursor
    bdd = mysqlpyth.connect(user='root', password='root', host='localhost', port="8081", database='projet_eclas')
    cursor = bdd.cursor()

# Déconnexion de la bdd
def deconnexion(): 
    global bdd 
    global cursor
    
    cursor.close() 
    bdd.close()

# Requete pour lire la liste des dons avec for (donc pour chq don)
def list_dons(): 
    global cursor

    connexion() 
    query = "SELECT * FROM promesse_dons" 
    cursor.execute(query)
    dons = []

    for enregistrement in cursor:
        don = {} 
        don['id_promesse'] = enregistrement[0]
        don['nom'] = enregistrement[1]
        don['prenom'] = enregistrement[2]
        don['adresse'] = enregistrement[3]
        don['mail'] = enregistrement[4]
        don['somme_promise'] = enregistrement[5]
        dons.append(don)
    
    deconnexion() 
    return dons

# Ajout dans la bdd
def add_don(nom, prenom, adresse, mail, somme_promise): 
    global cursor 
    global bdd 

    connexion() 
    query = 'INSERT INTO promesse_dons(nom, prenom, adresse, mail, somme_promise, droit) VALUES ("'+nom+'","'+prenom+'","'+adresse+'","'+mail+'","'+somme_promise+'",1);' 
    cursor.execute(query) 
    bdd.commit()
    
    deconnexion() 

# Contrôle le droit d'accès
def get_droit(nom_arg, prenom_arg):
    global cursor
    droit = "" 
    
    connexion() 
    query = "SELECT libelle FROM droits JOIN promesse_dons ON droits.id_droit=promesse_dons.droit WHERE promesse_dons.nom = %s AND promesse_dons.prenom = %s;"   
    vals = (nom_arg, prenom_arg)
    cursor.execute(query, vals)

    for droit_lu in cursor:
        droit = droit_lu[0]

    deconnexion()
    return droit

# Calcul la somme des don
def sum_don(): 
    global cursor 
    global bdd 
    somme = ()
    connexion() 
    query = 'SELECT SUM(somme_promise) FROM promesse_dons;' 
    cursor.execute(query) 
    
    for x in cursor:
        somme = x

    deconnexion()
    return somme

    