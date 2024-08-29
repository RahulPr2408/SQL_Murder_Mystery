SELECT *
FROM crime_scene_report
WHERE type = "murder"
AND 
city = "SQL City"
AND 
date = 20180115

SELECT *
FROM person
WHERE address_street_name = "Northwestern Dr"
ORDER BY address_number DESC LIMIT 1

SELECT *
FROM person
WHERE name LIKE "Annabel%"
AND address_street_name = "Franklin Ave"

SELECT *
FROM interview
WHERE (person_id = 14887 or person_id = 16371)

SELECT *
FROM get_fit_now_member
WHERE id LIKE "48Z%"
AND 
membership_status = "gold"

SELECT person.*, drivers_license.* FROM person
JOIN drivers_license
ON person.license_id = drivers_license.id
WHERE gender = "male"
AND
plate_number LIKE "%H42W%"

-- Query to make sure who is our Prime Culprit --
SELECT get_fit_now_member.name, get_fit_now_member.id, get_fit_now_member.membership_status,get_fit_now_check_in.check_in_date, 
person.license_id, drivers_license.gender, drivers_license.plate_number  
FROM get_fit_now_member
JOIN get_fit_now_check_in
ON get_fit_now_check_in.membership_id = get_fit_now_member.id
JOIN person
ON person.id = get_fit_now_member.person_id
JOIN drivers_license
ON person.license_id = drivers_license.id
WHERE get_fit_now_check_in.check_in_date = 20180109 
AND get_fit_now_member.id LIKE "48Z%"
AND get_fit_now_member.membership_status = "gold"

