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
| category_id | integer | null:false |
| situation_id | integer | null:false |
| delivery_id | integer | null:false |
| region_id | integer | null:false |
| shippingdate_id| integer | null:false |
| price | integer | null:false |
| user | references | null:false foreign_key:true |


### association

- belongs_to user
- has_one order

## ordersテーブル

| Column  |     Type     |   Options   |
|---------|--------------|-------------|
| user | references | null:false foreign_key:true |
| item | references | null:false foreign_key:true |

### association

- belongs_to user
- belongs_to item
- has_one shippingaddress

## shippingaddress

| Column  |     Type     |   Options   |
|---------|--------------|-------------|
| postcode | string | null:false |
| region_id | integer | null:false |
| municipalities | string | null:false |
| streetaddress | string | null:false |
| buildingname | string |  |
| tel | string | null:false |
| order | references | null:false foreign_key:true |

### association

- belongs_to order
