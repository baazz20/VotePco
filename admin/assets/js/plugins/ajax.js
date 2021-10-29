function getXhr() {
    var xhr = null;
    if (window.XMLHttpRequest) // Firefox et autres
        xhr = new XMLHttpRequest();
    else if (window.ActiveXObject) // Internet Explorer
    {
        try { xhr = new ActiveXObject("Msxml2.XMLHTTP"); } catch (e) { xhr = new ActiveXObject("Microsoft.XMLHTTP"); }
    } else { // XMLHttpRequest non supporté par le navigateur
        alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
        xhr = false;
    }
    return xhr
}

// Méthode qui sera appelée sur le click du bouton
function go(element) // Méthode qui sera appelée sur le click du bouton
{
    var xhr = getXhr()
        // On défini ce qu'on va faire quand on aura la réponse du serveur
    xhr.onreadystatechange = function() { // On ne fait quelque chose que si on a tout re�u et que le serveur est ok
        if (xhr.readyState == 4) {
            if (xhr.status == 200) { afficher(xhr.responseText, element); } else
                alert("Error: returned status code " + xhr.status + " " + xhr.statusText);
        }
    };

    var client = encodeURIComponent(document.getElementById("client").value);
    var commande = encodeURIComponent(document.getElementById("commande").value);
    xhr.open("GET", "detailsCommande.php?Client=" + client + "&Commande=" + commande, true);
    xhr.send(null);
}


//Affichage du resultat 
function afficher(xhr, element) { element.innerHTML = xhr; }