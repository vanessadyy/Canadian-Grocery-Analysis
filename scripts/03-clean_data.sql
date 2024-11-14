DROP TABLE IF EXISTS mergedata;
DROP TABLE IF EXISTS analysis_data;

CREATE TABLE mergedata AS
SELECT 
    p.id,
    p.vendor,
    p.product_name,
    CAST(r.current_price AS NUMERIC) AS current_price,
    CAST(r.old_price AS NUMERIC) AS old_price,
    r.price_per_unit,
    r.other,
    r.product_id
FROM
    product p
JOIN raw r
ON p.id = r.product_id
WHERE 
    r.current_price IS NOT NULL 
    AND r.old_price IS NOT NULL 
    AND r.price_per_unit IS NOT NULL 
    AND r.other IS NOT NULL 
    AND r.product_id IS NOT NULL
ORDER BY 
    r.product_id;
	
CREATE TABLE analysis_data AS
SELECT 
	price_per_unit,
	id,
	product_name,
	vendor
FROM
	mergedata
	
