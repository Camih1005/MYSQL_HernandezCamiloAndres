use jardineria;


show tables;

-- 1- Escribe una consulta que permita agrupar los clientes de todos los empleados
-- cuyo puesto sea responsable de ventas. Se requiere que la consulta muestre:
-- Nombre del cliente, teléfono, la ciudad, nombre y primer apellido del responsable
-- de ventas y su email.

create FULLTEXT INDEX idx_puesto on empleado(puesto);

select cli.nombre_cliente, cli.telefono, cli.ciudad, concat(emp.nombre," ",emp.apellido1) as "Nombre", emp.email
from empleado as emp 
inner join cliente as cli on cli.codigo_empleado =emp.codigo_empleado
where emp.puesto="Representante Ventas";


-- 2. Se necesita obtener los registros de los pedidos entre el 15 de marzo del 2009 y
-- el 15 de julio del 2009, para todos los clientes que sean de la ciudad de
-- Sotogrande. Se requiere mostrar el código del pedido, la fecha del pedido, fecha
-- de entrega, estado, los comentarios y el condigo del cliente que realizo dicho
-- pedido.

create index idx_date on pedido(fecha_pedido);
create FULLTEXT index idx_ciudad on cliente(ciudad);

select ped.codigo_pedido,ped.fecha_pedido,ped.fecha_entrega,ped.estado,ped.comentarios,ped.codigo_Cliente
 from pedido as ped
inner join cliente as cli on cli.codigo_cliente=ped.codigo_cliente
where ped.fecha_Pedido BETWEEN "2009-03-15" and "2009-07-15" and cli.ciudad="Sotogrande";


-- 3- Se desea obtener los productos cuya gama pertenezca a las frutas y que el
-- proveedor sea Frutas Talaveras S.A, se desea mostrar el código, nombre,
-- descripción, cantidad en stock, y su precio con 10% de descuento, de igual forma
-- se pide la cantidad en los distintos pedidos que se han hecho.

show tables;

show keys from producto;
create FULLTEXT index idx_proveedor on producto(proveedor);
create fulltext index idx_gama on gama_producto(gama);


select pro.codigo_Producto, pro.nombre,pro.descripcion,pro.cantidad_en_Stock,(precio_Venta-(pro.precio_Venta*0.1)) as "PrecioVenta 10%" ,sum(dp.cantidad) as cantidadPedido
from gama_producto as gp
inner join producto as pro on gp.gama=pro.gama
inner join detalle_pedido as dp on dp.codigo_Producto=pro.codigo_Producto
where gp.gama="Frutales" and pro.proveedor="Frutales Talavera S.A"
GROUP BY pro.codigo_Producto, pro.nombre;
