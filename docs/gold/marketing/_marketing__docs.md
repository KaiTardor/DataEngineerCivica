{% docs purchase_segment %}

Segmento de compra del usuario en `agg_user_purchases`, determinado por el num de pedidos registrados en `total_orders`.

| Segmento | Num de pedidos | Descripcion |
| --- | ---: | --- |
| `never_bought` | 0 | El usuario nunca ha realizado un pedido. |
| `one_purchase` | 1 | El usuario ha realizado un pedido. |
| `two_purchases` | 2 | El usuario ha realizado dos pedidos. |
| `three_or_more` | 3 o más | El usuario ha realizado al menos tres pedidos. |

{% enddocs %}
