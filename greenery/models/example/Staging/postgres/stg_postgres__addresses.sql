    select 
        ADDRESS_ID,
        ADDRESS,
        zipcode,
        state,
        country


     from {{ source('postgres','addresses') }}