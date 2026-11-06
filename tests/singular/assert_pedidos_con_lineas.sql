-- =============================================================================
-- Test singular: ningún pedido puede entregarse antes de haberse creado.
-- =============================================================================
-- Un test singular es una SELECT que devuelve las filas que INCUMPLEN la regla.
-- Umbrales: con 1 a 10 filas da WARN; con más de 10, ERROR.
-- =============================================================================
{{
    config(
        severity='error',
        warn_if='>0',
        error_if='>10'
    )
}}

select orders.order_id
from {{ ref('fct_orders') }} as orders
left join {{ ref('fct_order_items') }} as order_items
    on orders.order_id = order_items.order_id
where order_items.order_id is null


