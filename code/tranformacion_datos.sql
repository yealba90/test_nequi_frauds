create table public.datos_fraude_transformado as ( 
SELECT
	      numero_trasaccion
		, fraude
		, fecha_hora_transaccion
		, LEFT((fecha_hora_transaccion),10) AS fecha_transaccion, RIGHT((fecha_hora_transaccion),8) as hora_transaccion 
		, numero_tarjeta_credito_transaccion
		, valor_transaccion
		, nombre_local_comercial
		, categoria_local_comercial
		, latitud_local_comercial
		, longitud_local_comercial
		, nombre_titular_cuenta
		, apellido_titular_cuenta
		, CONCAT(nombre_titular_cuenta, ' ', apellido_titular_cuenta) AS nombre_completo_titular_cuenta
		, genero_titular_cuenta
		, CASE WHEN genero_titular_cuenta='M' THEN 1 ELSE 0 END AS genero_titular_cuenta_masculino
		, CASE WHEN genero_titular_cuenta='F' THEN 1 ELSE 0 END AS genero_titular_cuenta_femenino
		, calle_titular_cuenta
		, ciudad_titular_cuenta
		, estado_titular_cuenta
		, codigo_postal_titular_cuenta
		, latitud_titular_cuenta
		, longitud_titular_cuenta
		, poblacion_ciudad_titular_cuenta
		, trabajo_titular_cuenta
		, fecha_nacimiento_titular_cuenta
		, (CURRENT_DATE - CAST(fecha_nacimiento_titular_cuenta as date)) /365 as edad_titular_cuenta
	
from public.datos_fraude_join_raw
)
