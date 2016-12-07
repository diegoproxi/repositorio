SELECT i.invoice_number, cli.client_name, cli.client_tax_id, (select inventory_name from mcb_inventory where inventory_id = ii.inventory_id) codigo, ii.item_description, ia.item_subtotal, ia.item_tax, ia.item_total
FROM mcb_clients cli, mcb_invoices i, mcb_invoice_items ii, mcb_invoice_item_amounts ia 
WHERE i.invoice_id = ii.invoice_id and cli.client_id = i.client_id and ii.invoice_item_id = ia.invoice_item_id and i.invoice_number in ('NM007','452','451','NM006','NM005','450','449','448','447','446','445','444','443','442','441','440','439','438','437','436','435','434','433','432','431','430','429','427','428','426','425','424','423','422','421','420','419','418','417','416','415','414','413','412','411','410','409','408','407','406','405','404','403','402','401','400','399','398','397','396','395','394','393','392','391','390','389','388','387','386','385','384','383','382','381','380','379','378','377','376','375','374','373','372','371','390','370','369','368','367','366','365','364','363','362','361','360','359');

SELECT i.invoice_number, ii.item_description, (
ii.item_price * ii.item_qty
)subtotalxprod
FROM mcb_invoices i, mcb_invoice_items ii
WHERE i.invoice_id = ii.invoice_id
AND i.invoice_number
IN (
'NM007',  '452',  '451',  'NM006',  'NM005',  '450',  '449',  '448',  '447',  '446',  '445',  '444',  '443',  '442',  '441',  '440',  '439',  '438',  '437',  '436',  '435',  '434',  '433',  '432',  '431',  '430',  '429',  '427',  '428',  '426',  '425',  '424',  '423',  '422',  '421',  '420',  '419', '418',  '417',  '416',  '415',  '414',  '413',  '412',  '411',  '410',  '409',  '408',  '407',  '406',  '405',  '404',  '403',  '402',  '401',  '400',  '399',  '398',  '397',  '396',  '395',  '394',  '393',  '392',  '391',  '390',  '389',  '388',  '387',  '386',  '385',  '384',  '383',  '382',  '381',  '380', '379',  '378',  '377',  '376',  '375',  '374',  '373',  '372',  '371',  '390',  '370',  '369',  '368',  '367',  '366',  '365',  '364',  '363',  '362',  '361',  '360',  '359'
)

i.invoice_number in ('NM007','452','451','NM006','NM005','450','449','448','447','446','445','444','443','442','441','440','439','438','437','436','435','434','433','432','431','430','429','427','428','426','425','424','423','422','421','420','419','418','417','416','415','414','413','412','411','410','409','408','407','406','405','404','403','402','401','400','399','398','397','396','395','394','393','392','391','390','389','388','387','386','385','384','383','382','381','380','379','378','377','376','375','374','373','372','371','390','370','369','368','367','366','365','364','363','362','361','360','359');