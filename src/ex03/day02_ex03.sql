WITH
    data_range AS (
        SELECT
            '2022-01-01'::date + generate_series(0, 9) AS missing_days
)

SELECT
    missing_days
FROM
    data_range dr

LEFT JOIN (

    SELECT DISTINCT
        visit_date
    FROM
        person_visits
    WHERE
        person_id IN (1, 2)

) AS visited_dates ON
    dr.missing_days = visited_dates.visit_date

WHERE
    visited_dates.visit_date IS NULL
ORDER BY
    missing_days;
