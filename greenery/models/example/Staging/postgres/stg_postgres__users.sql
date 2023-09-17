with source as (
    select * from {{ source('postgres','users') }}
)
, renamed_recast as (
    select USER_ID,
        FIRST_NAME,
        LAST_NAME,
        EMAIL,
        PHONE_NUMBER,
        CREATED_AT,
        UPDATED_AT,
        ADDRESS_ID 
        from source
)
select * from renamed_recast