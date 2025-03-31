Nome repo: (social-platform)

Vogliamo creare uno spazio virtuale in stile social network dove gli utenti possano
condividere le proprie esperienze. Ogni (utente) può creare dei post, al quale può
aggiungere uno o più (media) come foto e video. Ogni (post) può avere uno o più (tags) che
servono per categorizzare i contenuti. Gli altri utenti possono interagire con il post
esprimendo il loro gradimento attraverso un semplice (like).

Step 1 (Diagramma ER)
Individuate prima le entità su cui si basa la piattaforma e poi osservate come sono
relazionate. Inoltre, specificate i campi e i diversi vincoli disponibili per ciascun campo, come
ad esempio l'utilizzo di UNIQUE per garantire l'unicità dei valori e NOT NULL per indicare
l’obbligo di fornire un valore per quel campo. Attenzione alle chiavi primarie. Espandere il
diagramma per integrare anche l’entità Tags

BONUS: i post possono avere anche i Commenti.
 





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

SELECT DISTINCT `posts`.`id` AS `posts_id`, `posts`.`title` AS `posts_title`, `likes`.`post_id` AS `numbers_of_likes_of_posts`
FROM `posts`
LEFT JOIN `likes`
ON `posts`.`id` = `likes`.`post_id`
WHERE `likes`.`post_id` IS NULL;

3. Conta il numero di like per ogni post (165) nel caso di query con SELECT + JOIN oppure (175) nel caso di query con sola SELECT

SELECT DISTINCT `posts`.`id`,`posts`.`title` AS `post_title`, COUNT(`likes`.`post_id`) AS `numbers_of_like_post`
FROM `posts`
INNER JOIN `likes`
ON `posts`.`id` = `likes`.`post_id`
GROUP BY `posts`.`id`, `likes`.`post_id`
ORDER BY `numbers_of_like_post` ASC;

4. Ordina gli utenti per il numero di media caricati (25)


5. Ordina gli utenti per totale di likes ricevuti nei loro posts (25)
