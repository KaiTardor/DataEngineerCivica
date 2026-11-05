-- =============================================================================
-- fct_events
-- =============================================================================
-- Hechos de eventos de navegación. Grano: una fila por evento.
-- =============================================================================

with orders as (
    select * from {{ ref('gold_orders__enriched') }}
), 

final as (
    select
        order_id
        , user_id
        , address_id
        , discount_usd
        , created_at
        , estimated_delivery_at
        , delivered_at
        , order_status
        , tracking_id
        , shipping_service
        , order_cost
        , shipping_cost
        , promo_discount_usd
        , order_total
    from orders
)

select * from final
