-- Sujungiu dvi lenteles, tačiau dar nenurodau jokios sąlygos ir taip gaunasi Dekarto sanndauga
-- Dekarto sandauga mums praktikoje nebus labai naudinga, bet iš pradžių toks pavyzdys
SELECT
    *
FROM
    `receptai`
JOIN sujungimas_receptai_ingredientai;


-- Reikėtų pasakyti, kad tas eilutes tarpusavyje jungtų prasmingai. REikia nusakyti pagal kurią salygą / kada tas eilutes jungti
-- Tai jungiu eilutes, jeigu recepto lentelės id stulpelis sutampa su sujungimų lentelės receptas_id stulpeliu
SELECT
    *
FROM
    `receptai`
JOIN sujungimas_receptai_ingredientai ON receptai.id = sujungimas_receptai_ingredientai.receptas_id

-- Toliau, vien tik matyti ingrediento id - neužtenka. Norėtume matyti ir to ingrediento duomenis.
-- Todėl, jungiame dar šių dviejų lentelių junginį su trečia lentele - ingredientas lentele.
SELECT
    *
FROM
    `receptai`
JOIN sujungimas_receptai_ingredientai ON receptai.id = sujungimas_receptai_ingredientai.receptas_id
JOIN ingredientai ON ingredientai.id = sujungimas_receptai_ingredientai.ingredientas_id


-- Tačiau, tas pavyzdys prieš tai parodo kokius ingredientus turi kiekvienas receptas bei labai daug stulpelių.
-- Gal noriu iš pradžių pasižiūrėti tik tai tarkim recepto, kurio id yra 6, ingredientus.
SELECT
    *
FROM
    `receptai`
JOIN sujungimas_receptai_ingredientai ON receptai.id = sujungimas_receptai_ingredientai.receptas_id
JOIN ingredientai ON ingredientai.id = sujungimas_receptai_ingredientai.ingredientas_id
WHERE receptai.id = 6;





-- Jog nereikėtų tiek daug rašyti, galima panaudoti "alias".
-- Receptas lentelę užsivadinu "r" raide ir kur noriu naudoti tą lentelę, galiu naudoti tiesiog "r" raidę.
SELECT
    *
FROM
    `receptai` r
WHERE r.id = 4;


-- Tai yra labai patogu joinuose:
SELECT
    *
FROM
    `receptai` r
JOIN sujungimas_receptai_ingredientai s ON r.id = s.receptas_id;


-- Sujungiame su dar trečia lentele
SELECT
    *
FROM
    `receptai` r
JOIN sujungimas_receptai_ingredientai s ON r.id = s.receptas_id
JOIN ingredientai i ON i.id = s.ingredientas_id;


-- Paimame pirmo recepto ingredientų visus stulpelius
SELECT
    *
FROM
    `receptai` r
JOIN sujungimas_receptai_ingredientai s ON r.id = s.receptas_id
JOIN ingredientai i ON i.id = s.ingredientas_id
WHERE r.id = 1;

-- Paimame pirmo recepto ingredientų kainos stulpelį
SELECT
    i.kaina
FROM
    `receptai` r
JOIN sujungimas_receptai_ingredientai s ON r.id = s.receptas_id
JOIN ingredientai i ON i.id = s.ingredientas_id
WHERE r.id = 1




