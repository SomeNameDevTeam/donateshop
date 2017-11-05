# DonateShop API


## User
### post /user/login
Send: {"email": "string", "password": "string"}
Return: {token: "string use in next authorisation operation"}
### post /user/create
Send: {"email": "string", "password": "string", "name":"String"}
Return: {token: "string"}
### get /user/
Return: {"address": [{"id":0, "address":"String"}], name: "String"}
### put /user/
Send: {"name": "string"}
Return: {"address": [{"id":0, "address":"String"}], name: "String"}
### post /user/address
Send: {"address": "string"}
Return: {code: "ok"}
### put /user/address/1
Send: {"address": "string"}
Return: {code: "ok"}
### delete /user/address/1
Return: {code: "ok"}

## Shop Organisation
### AdminUser
#### get /adminUser/current
Return current user Profile
#### get /adminUser/:id
#### post /adminUser/create
Send: {"login", "password"}
Return token
#### post /adminUser/login
Send: {"login", "password"}
Return token
#### put /adminUser/id
Update password
Send {"password", "role"}

### Item
#### get /item/list
#### post /item/create
#### put /item/:id
#### get /itemMods/
#### post /itemMods/
####

## Product
### List
#### get /item/list[?type=some]
#### get /item/:id
#### get /order/
Return list of Specific Items With Quantity
#### post /order/
Create order and work with order that belongs to Current Session.
#### post /order/addItem
#### post /order/execute
Send all need data to process

