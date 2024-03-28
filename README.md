## usersテーブル

| Column  |     Type     |   Options   |
|---------|--------------|-------------|
|  name   | string | null:false |
|  email  | string | null:false uniqe:true |
| encrypted_password | string | null:false |
| first_name | string | null:false |
| last_name | string | null:false |
| first_name_kana | string | null:false |
| last_name_kana | string | null:false |
| birth | date | null:false |

### association

- has_many items
- has_many orders


## itemsテーブル

| Column  |     Type     |   Options   |
|---------|--------------|-------------|
| item_name | string | null:false |
| expanation | text | null:false |
| category | integer | null:false |
| situation | integer | null:false |
| delivery | integer | null:false |
| region | integer | null:false |
| shippingdate| integer | null:false |
| price | integer | null:false |
| user_id | references | null:false foreign_key:true |


### association

- belong_to user
- has_many orders

## ordersテーブル

| Column  |     Type     |   Options   |
|---------|--------------|-------------|
| user_id | references | null:false foreign_key:true |
| item_id | references | null:false foreign_key:true |
| shippingaddress_id | references | null:false foreign_key:true |

### association

- belong_to user
- belong_to item
- has_one shippingaddress

## shippingaddress

| Column  |     Type     |   Options   |
|---------|--------------|-------------|
| postcode | integer | null:false |
| region | integer | null:false |
| municipalities | string | null:false |
| streetaddress | string | null:false |
| buildingname | string | null:false |
| tel | integer | null:false |

### association

- belong_to oeder