create table datos_titulares (
	numero_trasaccion Varchar(256),
	nombre_titular_cuenta Varchar(256), 
	apellido_titular_cuenta Varchar(256), 
	genero_titular_cuenta Varchar(256), 
	calle_titular_cuenta Varchar(256), 
	ciudad_titular_cuenta Varchar(256), 
	estado_titular_cuenta Varchar(256), 
	codigo_postal_titular_cuenta Varchar(256), 
	latitud_titular_cuenta Varchar(256), 
	longitud_titular_cuenta Varchar(256), 
	poblacion_ciudad_titular_cuenta Varchar(256), 
	trabajo_titular_cuenta Varchar(256), 
	fecha_nacimiento_titular_cuenta Varchar(256)
)

create table datos_transaccion (
	numero_trasaccion Varchar(256),
	fecha_hora_transaccion Varchar(256), 
	numero_tarjeta_credito_transaccion Varchar(256), 
	valor_transaccion Varchar(256)
)

create table datos_comercio (
	numero_trasaccion Varchar(256),
	nombre_local_comercial Varchar(256), 
	categoria_local_comercial Varchar(256), 
	latitud_local_comercial Varchar(256), 
	longitud_local_comercial Varchar(256)
)

create table datos_fraude (
	numero_trasaccion Varchar(256),
	fraude Varchar(256)
)



