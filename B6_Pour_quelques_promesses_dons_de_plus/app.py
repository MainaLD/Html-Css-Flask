from flask import Flask, render_template, request
import data

app = Flask(__name__)
somme_dons = str(data.sum_don())
somme_dons = somme_dons[10:14] 
print(somme_dons,type(somme_dons))

# renvoi l'index
@app.route('/')
def index(): 
    return render_template('index.html', sommehtml=somme_dons)

# formulaire de don
@app.route('/ajoutdon')
def ajouterdon(): 
    return render_template('ajoutdon.html')

# Enregistre le nouveau don
@app.route('/add', methods=['post']) 
def add(): 
    nom = request.values.get('nom') 
    prenom = request.values.get('prenom') 
    adresse = request.values.get('adresse')
    mail = request.values.get('mail')
    somme_promise = request.values.get('somme_promise')
    data.add_don(nom, prenom, adresse, mail, somme_promise) 
    return render_template('add.html')

# lister les dons
@app.route('/listedons')
def listerdons():
    donl = data.list_dons()
    return render_template('listedons.html', don=donl, sommehtml=somme_dons)

# Formulaire d'indentification de l'utilisateur
@app.route('/identification')
def identifier():
    return render_template('identification.html')

# Après l'identification, pour connaître si visiteur ou admin : ici on donne droit aux admins 
@app.route('/connexion', methods=['post'])
def connecter():
    droit_utilisateur ="visiteur"

    nom_form = request.values.get("nom")
    prenom_form = request.values.get("prenom")

    # droit_utilisateur = data.get_droit(nom_form, prenom_form)
    droit_lu =  data.get_droit(nom_form, prenom_form)
    if droit_lu != None :
        droit_utilisateur = droit_lu

    return render_template('connexion.html', droithtml=droit_utilisateur, nomhtml=nom_form)


if __name__ == "__main__":
    app.run(debug=True)