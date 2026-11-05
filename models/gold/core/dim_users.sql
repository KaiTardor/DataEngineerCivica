-- =============================================================================
-- dim_addresses
-- =============================================================================
-- Dimensión de direcciones, enriquecida con el seed country_codes para
-- obtener el código ISO y el continente.
-- El cruce es por nombre de país: si Bronze trae un nombre que no está en el
-- seed (o escrito distinto), country_code y continent quedan a nulo.
-- =============================================================================

with users as (
    select * from {{ ref('slv_sql_server_dbo__users') }}
),

addresses as (
    select * from {{ ref('dim_addresses') }}
),

final as (
    select
          u.*
        , a.address_line
        , a.zipcode
        , a.state
        , a.country
        , a.country_code
        , a.continent
        , a.date_load as address_date_load
    from users as u
    left join addresses as a
        on u.address_id = a.address_id
)

select * from final