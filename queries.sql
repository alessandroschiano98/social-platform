1. Seleziona gli utenti che hanno postato almeno un video

SELECT DISTINCT `users`.`id`, `users`.`username`, `medias`.`type` AS `medias_type`,`medias`.`created_at`
FROM `users`
INNER JOIN `medias`
ON `users`.`id` = `medias`.`user_id`
INNER JOIN `posts`
ON `users`.`id` = `posts`.`user_id`
WHERE `medias`.`type`>= 1
AND `medias`.`type` = "video";




2. Seleziona tutti i post senza Like (13)


3. Conta il numero di like per ogni post (165) nel caso di query con SELECT + JOIN oppure 175 nel caso di query con sola SELECT


4. Ordina gli utenti per il numero di media caricati (25)


5. Ordina gli utenti per totale di likes ricevuti nei loro posts (25)
