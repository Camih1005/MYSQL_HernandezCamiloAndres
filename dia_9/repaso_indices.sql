-- INDICESSS

CREATE index index_name
on table_name (column1,column2);

-- INDICES SIMPLESS

CREATE index index_name
on table_name (column1,column2);

-- FDX_NAME SI ES FORANEA
create index idx_name on country(name);


-- INDICES COMPUESTOS




-- INDICES UNICOS

create unique index idx_unq_name on country(name);

-- indice de texto completo
-- Permite busqyedas eficientes de texto completo en campos de texto largo}
-- create fulltext index idx_name on country(content)
-- sirve para filtrar algo de un comentario

-- VISTAS se puede pensae como una vista como una tabla virtal que no almacena fisica mente
-- ventajas,seguridad,mantenimiento,consistencia de datos,simplificacion de consultas complejjas
-- 
-- VISTASSSSSSSSSSSSSSSSSSSSSSSSSS
create view nombreCP as select
c.name as ciudad, c.countrycode,p.name as pais
from country as p
join city as c on p.code = c.CountryCode;

DROP view nombreCP;

select * from nombreCP; 

-- SINTAXIS PARA CAMBIAR UNA VISTA 

-- remplazar

create or replace view nombreCP as select
c.name as ciudad,p.code, c.countrycode,p.name as pais
from country as p
join city as c on p.code = c.CountryCode;

#create or replace view PopulationCitiesContinent as select * 
#from (selcet code,countryname,cityname,continent,format(population,0)as populationcity 
#from)
-- HACER LAS VALIDACIONES CON CASE
select l.language,if(l.isofficial = "F" ,"NO OFICIAL","OFICIAL") AS OFICIAL, -- se puede usas
CASE WHEN l.IsOfficial = "F" then "No oficial"-- esta igual
else"Oficial"
end as Tipo2,
case WHEN l.percentage < 0.3 then "Poco hablado"
when l.percentage < 0.3 then "Mediante hablado"
when l.percentage > 50 then "Muy hablado"
else "Muy hablado"
end as frecuencia
from countrylanguage as l
join country as p on p.code = countrycode
where p.name = "Colombia"