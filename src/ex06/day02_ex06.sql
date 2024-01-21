SELECT
    m.pizza_name,
    p.name AS pizzeria_name
FROM
    person_order po

JOIN
    menu m ON
        po.menu_id = m.id
JOIN
    pizzeria p ON
        m.pizzeria_id = p.id

WHERE
    po.person_id IN (
        SELECT
            id
        FROM
            person
        WHERE
            name = 'Denis' OR name = 'Anna'
)

ORDER BY
    m.pizza_name,
    p.name;
