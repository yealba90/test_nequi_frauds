create table public.datos_fraude_join_raw as ( 
select    a.*
		, b.fecha_hora_transaccion
		, b.numero_tarjeta_credito_transaccion
		, b.valor_transaccion
		, c.nombre_local_comercial
		, c.categoria_local_comercial
		, c.latitud_local_comercial
		, c.longitud_local_comercial
		, d.nombre_titular_cuenta
		, d.apellido_titular_cuenta
		, d.genero_titular_cuenta
		, d.calle_titular_cuenta
		, d.ciudad_titular_cuenta
		, d.estado_titular_cuenta
		, d.codigo_postal_titular_cuenta
		, d.latitud_titular_cuenta
		, d.longitud_titular_cuenta
		, d.poblacion_ciudad_titular_cuenta
		, d.trabajo_titular_cuenta
		, d.fecha_nacimiento_titular_cuenta
		
from datos_fraude as a 
left join datos_transaccion as b
	on a.numero_trasaccion = b.numero_trasaccion
left join datos_comercio as c
	on a.numero_trasaccion = c.numero_trasaccion
left join datos_titulares as d
	on a.numero_trasaccion = d.numero_trasaccion
)