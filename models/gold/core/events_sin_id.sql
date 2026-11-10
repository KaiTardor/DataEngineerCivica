{%set columnas_exc = ['EVENT_ID']%}

select
{{ dbt_utils.star(from=ref('fct_events'), except=columnas_exc) }}
from {{ ref('fct_events') }}
