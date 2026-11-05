-- =============================================================================
-- gold_orders__enriched
-- =============================================================================
-- Capa Gold: Unifica la información de órdenes, direcciones y promociones 
-- para enriquecer el análisis de los pedidos.
-- =============================================================================

with orders as (
    select
          order_id
        , user_id
        , address_id
        , discount_usd
        , created_at
        , estimated_delivery_at
        , delivered_at
        , tracking_id
        , shipping_service
        , shipping_cost
        , order_cost
        , order_total
        , order_status
    from {{ ref('slv_sql_server_dbo__orders') }}
)

select
      o.*
    , a.address_line
    , a.zipcode
    , a.state
    , a.country
    , a.date_load as address_date_load
    , p.discount_usd as promo_discount_usd
    , p.promo_status
    , p.date_load as promo_date_load
from orders as o
left join {{ ref('slv_sql_server_dbo__addresses') }} as a
    on o.address_id = a.address_id
left join {{ ref('slv_sql_server_dbo__promos') }} as p
    on o.discount_usd = p.promo_id
