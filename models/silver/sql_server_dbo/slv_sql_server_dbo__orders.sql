-- =============================================================================
-- slv_sql_server_dbo__order_items 
-- =============================================================================
-- Capa Silver: elimina borrados lógicos y deduplica por clave de negocio,
-- quedándose con la versión más reciente según date_load.
-- =============================================================================

with orders as (
    select * from {{ ref('stg_sql_server_dbo_orders') }}
),

cleaned as (
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
    from orders
    where not is_deleted
    qualify row_number() over (partition by order_id order by date_load desc) = 1
)

select * from cleaned
