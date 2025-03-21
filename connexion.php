<?php

    try {
        $con=new PDO('mysql:host=localhost;dbname=gestionReserve','root','');
    } catch (PDOException $er) {
        echo"Erreur de connection !".$er->getMessage();
    }
?>
