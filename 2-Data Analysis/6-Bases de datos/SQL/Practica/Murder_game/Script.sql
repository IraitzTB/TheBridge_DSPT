SELECT *
FROM crime_scene_report
WHERE Date == 20180115 AND type == 'murder' AND city == 'SQL City'

-- Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". 
-- The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- # Testigo 1: Vive en la última casa de Northwestern Dr.
-- # Testigo 2: Annabel, vive en Franklin Ave.

SELECT *
FROM Person
WHERE address_street_name LIKE '%Franklin Ave%' AND name LIKE '%Annabel%'
-- 16371

SELECT *
FROM Person
WHERE address_street_name LIKE '%Northwestern Dr%'
ORDER BY address_number DESC
-- 14887

SELECT *
FROM interview i 
WHERE person_id IN (16371,14887)

-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
-- The membership number on the bag started with "48Z". Only gold members have those bags.
-- The man got into a car with a plate that included "H42W".

-- I saw the murder happen, and I recognized the killer from my gym when I was working out 
-- last week on January the 9th.

SELECT * 
FROM drivers_license dl
JOIN person p ON p.license_id == dl.id
JOIN get_fit_now_member gfnm ON gfnm.person_id == p.id
WHERE dl.plate_number LIKE '%H42W%' AND gender == 'male'
-- 67318

SELECT *
FROM get_fit_now_check_in gfnci 
WHERE gfnci.membership_id == '48Z55'

SELECT *
FROM person p 
WHERE p.id == 67318

-- Buscar con quien coincidio en el gimnasio
SELECT *
FROM get_fit_now_check_in gfnci 
WHERE check_in_date == 20180109 --AND gfnci.check_in_date >= 1600 AND gfnci.check_out_time < 1730 --gfnci.membership_id == '48Z55'

SELECT *
FROM facebook_event_checkin fec
JOIN get_fit_now_member gfnm ON gfnm.person_id == fec.person_id 
WHERE fec.date == 20180115

-- Jeremy Bowers en la entrevista
SELECT *
FROM interview i 
WHERE person_id IN (67318)

-- I was hired by a woman with a lot of money.
-- I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S.
-- I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT *
FROM drivers_license dl 
JOIN person p ON p.license_id == dl.id
WHERE dl.car_make LIKE '%Tesla%' 
	AND dl.car_model == 'Model S' 
	AND hair_color == 'red' 
	AND gender == 'female'

-- 78881, 90700, 99716
	
SELECT *
FROM drivers_license dl 
JOIN person p ON p.license_id == dl.id
JOIN facebook_event_checkin fec ON fec.person_id == p.id
--JOIN get_fit_now_member gfnm ON gfnm.person_id == p.id
WHERE dl.car_make LIKE '%Tesla%' 
	AND dl.car_model == 'Model S' 
	AND hair_color == 'red' 
	AND gender == 'female'

-- Miranda Priestly







