<?php
    // affiche le html avec les champs de notre objet Exemple
    echo "<div class='container'>";
        echo "<div class='table-responsive'>";
            echo "<table class='table table-bordered table-hover'>";
                echo "<thead class=\"thead-dark\">";
                    echo "<tr>";
                        echo "<th scope='col'>Id</th>";
                        echo "<th scope='col'>Nom</th>";
                        echo "<th scope='col'>Prénom</th>";
                        echo "<th scope='col'>Email</th>";
                        echo "<th scope='col'>Porte-monnaie</th>";
                        echo "<th scope='col'>Date de naissance</th>";
                    echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                    foreach ($comptes as $compte){
                            echo "<tr>";
                                echo "<th scope='row'>" . $compte->id() . "</th>";
                                echo "<td>" . $compte->nom() . "</td>";
                                echo "<td>" . $compte->prenom() . "</td>";
                                echo "<td>" . $compte->email() . "</td>";
                                echo "<td>" . $compte->porteMonnaie() . "</td>";
                                echo "<td>" . $compte->dateNaissance(). "</td>";
                            echo "</tr>";
                    }
                echo "</tbody>";
            echo "</table>";
        echo "</div>";
    echo "</div>";


?>