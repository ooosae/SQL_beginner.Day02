SELECT
    p.name AS person_name
FROM
    person p

WHERE
    p.gender = 'female'
AND p.id IN (
    SELECT
        pv.person_id
    FROM
        person_visits pv

    JOIN menu m
        ON pv.pizzeria_id = m.pizzeria_id

    WHERE
        m.pizza_name = 'pepperoni pizza'
)
AND p.id IN (
    SELECT
        pv.person_id
    FROM
        person_visits pv

    JOIN
        menu m
            ON pv.pizzeria_id = m.pizzeria_id

    WHERE
        m.pizza_name = 'cheese pizza'
)

ORDER BY
    person_name;
