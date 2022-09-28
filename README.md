# Credit_Card_Transactions_Fraud_Detection
Prueba técnica Ingeniero de datos Nequi!

# 1. Alcance del proyecto y captura de datos

## Identificar y recopilar datos

* [Credit Card Transactions Fraud Detection Datase](https://www.kaggle.com/datasets/kartik2112/fraud-detection?select=fraudTrain.csv)

    * datos_titulares.csv: Extraida y convertida de fuente original
    * datos_transaccion.csv: Extraida y convertida de fuente original
    * datos_comercio.parquet: Extraida y convertida de fuente original
    * datos_fraude.parquet: Extraida y convertida de fuente original

Para consultar los datos, acceder al siguiente enlace de [Drive](https://drive.google.com/drive/folders/1LZ7k8mRADxn_PAc5cQLdAlDpjb3Gj0RR?usp=sharing)    

A continuación, se describen las columnas extraídas:

- **numero_trasaccion** : numero de la transaccion
- **nombre_titular_cuenta** : nombre de titular de la cuenta
- **apellido_titular_cuenta** : apellido de titular de la cuenta
- **genero_titular_cuenta** : genero de titular de la cuenta
- **calle_titular_cuenta** : calle de titular de la cuenta
- **ciudad_titular_cuenta** : ciudad de titular de la cuenta
- **estado_titular_cuenta** : estado de titular de la cuenta
- **codigo_postal_titular_cuenta** : codigo postal de titular de la cuenta
- **latitud_titular_cuenta** : latitud de titular de la cuenta
- **longitud_titular_cuenta** : longitud de titular de la cuenta
- **poblacion_ciudad_titular_cuenta** : poblacion de ciudad de titular de la cuenta
- **trabajo_titular_cuenta** : trabajo de titular de la cuenta
- **fecha_nacimiento_titular_cuenta** : fecha de nacimiento de titular de la cuenta
- **fecha_hora_transaccion** : fecha y hora de transaccion
- **numero_tarjeta_credito_transaccion** : numero de tarjeta de credito
- **valor_transaccion** : valor de la transaccion
- **nombre_local_comercial** : nombre de local comercial
- **categoria_local_comercial** : categoria de local comercial
- **latitud_local_comercial** : latitud del local comercial 
- **longitud_local_comercial** : longitud del local comercial
- **fraude** : - 1 es fraude - 0 no es fraude

## Casos de uso final

Poner a disposición los datos de las transacciones fraudulentas en un periodo de tiempo para que un científico de datos pueda realizar un modelo analítico con el fin de ayudar a las entidades a predecir fraudes basados en los datos obtenidos.

***************************************************************************************************************************************************

# 2. Explorar y evaluar los datos, EDA.

[eda_nequi_test_fraud.ipynb](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/code/eda_nequi_test_fraud.ipynb)


## Para iniciar con la exploracion de datos, vamos a visualizar algunas estadisticas

```python
print("valores nulos ********************************************")
print(datos_df_copy.isnull().sum())
print("Tipo de datos ********************************************")
print(datos_df_copy.dtypes)
print("Largo de datos *******************************************")
print(datos_df_copy.shape)
print("Estadisticas de los datos ********************************")
print(datos_df_copy.describe())
```
```python
valores nulos ********************************************
fecha_hora_transaccion                0
numero_tarjeta_credito_transaccion    0
nombre_local_comercial                0
categoria_local_comercial             0
valor_transaccion                     0
nombre_titular_cuenta                 0
apellido_titular_cuenta               0
genero_titular_cuenta                 0
calle_titular_cuenta                  0
ciudad_titular_cuenta                 0
estado_titular_cuenta                 0
codigo_postal_titular_cuenta          0
latitud_titular_cuenta                0
longitud_titular_cuenta               0
poblacion_ciudad_titular_cuenta       0
trabajo_titular_cuenta                0
fecha_nacimiento_titular_cuenta       0
numero_trasaccion                     0
latitud_local_comercial               0
longitud_local_comercial              0
fraude                                0
nombre_completo_titular               0
dtype: int64

Tipo de datos ********************************************
fecha_hora_transaccion                 object
numero_tarjeta_credito_transaccion      int64
nombre_local_comercial                 object
categoria_local_comercial              object
valor_transaccion                     float64
nombre_titular_cuenta                  object
apellido_titular_cuenta                object
genero_titular_cuenta                  object
calle_titular_cuenta                   object
ciudad_titular_cuenta                  object
estado_titular_cuenta                  object
codigo_postal_titular_cuenta            int64
latitud_titular_cuenta                float64
longitud_titular_cuenta               float64
poblacion_ciudad_titular_cuenta         int64
trabajo_titular_cuenta                 object
fecha_nacimiento_titular_cuenta        object
numero_trasaccion                      object
latitud_local_comercial               float64
longitud_local_comercial              float64
fraude                                  int64
nombre_completo_titular                object
dtype: object

Largo de datos ********************************************
(1052394, 22)

Estadisticas de los datos relevantes ********************************************
       numero_tarjeta_credito_transaccion  valor_transaccion  poblacion_ciudad_titular_cuenta
count                        1.052394e+06       1.052394e+06                     1.052394e+06   
mean                         4.175187e+17       7.044610e+01                     8.879213e+04   
std                          1.309196e+18       1.593924e+02                     3.014144e+05   
min                          6.041621e+10       1.000000e+00                     2.300000e+01   
25%                          1.800429e+14       9.650000e+00                     7.430000e+02   
50%                          3.521417e+15       4.756000e+01                     2.443000e+03   
75%                          4.642255e+15       8.321000e+01                     2.032800e+04   
max                          4.992346e+18       2.894890e+04                     2.906700e+06   
```

## Se calculan cantidades y promedios de datos

```python
print("")
print(f"Promedio de transacciones por titulares de cuenta {datos_df_copy.shape[0]/datos_df_copy.nombre_completo_titular.nunique():.2f}")
print(f"Promedio de transacciones por local comercial {datos_df_copy.shape[0]/datos_df_copy.nombre_local_comercial.nunique():.2f}")
print("")
print(f"Total de transacciones {datos_df_copy.shape[0]}")
print(f"Total de fraudes en la muestra {(datos_df_copy['fraude'] == 1).sum()}")
print(f"Total de transacciones sin fraude {(datos_df_copy['fraude'] == 0).sum()}")
print("")
print("N de transaciones NaN: " + str(len(datos_df_copy[datos_df_copy['valor_transaccion'] == 'NaN'])))
print("N de transaciones vacias: " + str(len(datos_df_copy[datos_df_copy['valor_transaccion'] == ''])))
```
```python
Promedio de transacciones por titulares de cuenta 1087.18
Promedio de transacciones por local comercial 1518.61

Total de transacciones 1052394
Total de fraudes en la muestra 6388
Total de transacciones sin fraude 1046006

N de transaciones NaN: 0
N de transaciones vacias: 0
```

## Teniendo en cuenta los resultados de estadísticas y cálculos, podemos realizar un análisis de datos:

```python
print('Cantidad de fraudes: 1')
print(datos_df_copy.fraude.value_counts())
print('% de fraudes: 1')
print((datos_df_copy.fraude.value_counts()/len(datos_df_copy['fraude']))*100 )
```
```python
Cantidad de fraudes: 1
0    1046006
1       6388
Name: fraude, dtype: int64
% de fraudes: 1
0    99.393003
1     0.606997
Name: fraude, dtype: float64
```
Podemos observar la cantidad de transacciones totales realizadas en muy alta en comparación con la cantidad de fraudes, por lo que la muestra tiende a desbalancearse

## Análisis exploratorio de datos

- Distribución de fraudes en el tiempo

```python
datos_df_copy['fecha_hora_transaccion'] = pd.to_datetime(datos_df_copy.fecha_hora_transaccion)
datos_df_copy['horas'] = datos_df_copy['fecha_hora_transaccion'].dt.hour

horas_fraude = pd.concat([datos_df_copy.groupby("horas")["fraude"].sum(),datos_df_copy.groupby("horas")["fraude"].count()],axis=1)
horas_fraude.columns = ["Fraudes", "Transacciones"]
horas_fraude["Tasa_de_fraudes"] = horas_fraude.Fraudes/horas_fraude.Transacciones
print(horas_fraude.sort_values(by="horas",ascending=True))

plt.figure(figsize=(10,5))
w=0.4
x = horas_fraude.index
y = horas_fraude.Fraudes
plt.bar(x,y,w)

plt.xlabel("Horas")
plt.ylabel("Cantidad de fraudes")
plt.title("Fraude por hora")
plt.xticks(x,x)
plt.legend()
plt.show()
```

![](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/img/analisis_fraude_por_hora.JPG)

Podemos observar que la mayor cantidad de fraudes realizados a partir de la muestra, se dan entre las 22 y 23 horas.

- Porcentaje de fraudes en el tiempo

```python
datos_df_copy['fecha_hora_transaccion'] = pd.to_datetime(datos_df_copy.fecha_hora_transaccion)
datos_df_copy['horas'] = datos_df_copy['fecha_hora_transaccion'].dt.hour

horas_fraude = datos_df_copy[["horas", "fraude"]]
horas_fraude = horas_fraude.groupby("horas").sum()
horas_fraude['total_fraudes'] = horas_fraude.fraude.sum()
horas_fraude['tasa_total_fraudes_por_hora'] = (horas_fraude.fraude/horas_fraude.total_fraudes)*100.00

print(horas_fraude.sort_values(by="horas",ascending=True))

plt.figure(figsize=(10,5))
w=0.4
x = horas_fraude.index
y = horas_fraude.tasa_total_fraudes_por_hora
plt.bar(x,y,w, color='red')

plt.xlabel("Horas")
plt.ylabel("Porcentaje")
plt.title("Porcentaje de fraudes por hora")
plt.xticks(x,x)
plt.legend()
plt.show()
```

![](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/img/analisis_porcentaje_fraude_por_hora_pie.JPG)

Según la anterior grafica se puede concluir que el más del 84% de los fraudes se realiza entre las 22 pm y las 3 am

- Porcentaje de edades que cometen fraude

```python
datos_df_copy['fecha_nacimiento_titular_cuenta'] = pd.to_datetime(datos_df_copy.fecha_nacimiento_titular_cuenta)
datos_df_copy['edad_titular'] = (date.today().year) - (datos_df_copy['fecha_nacimiento_titular_cuenta'].dt.year)


bins = [0, 18, 26, 59, 100]
names = ["menores de 18", "jovenes 18 - 26", "adultos 27 - 59", "mayores de 60"]
datos_df_copy['grupo_edades'] = pd.cut(datos_df_copy["edad_titular"], bins, labels = names)

edades_fraude = datos_df_copy[["grupo_edades", "fraude"]]
edades_fraude = edades_fraude.groupby("grupo_edades").sum()
edades_fraude['total_fraudes'] = edades_fraude.fraude.sum()
edades_fraude['tasa_total_fraudes_por_edades'] = (edades_fraude.fraude/edades_fraude.total_fraudes)*100.00

print(edades_fraude)

h = edades_fraude.index
d = edades_fraude.tasa_total_fraudes_por_edades

plt.figure(figsize=(10,5))
plt.pie(d, labels=h, autopct="%0.1f %%")

plt.title("Porcentaje de edades que realizan fraude")
plt.axis('equal')
plt.legend()
plt.show()
```

![](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/img/analisis_porcentaje_edades_fraude.JPG)

Podemos observar como existe un porcentaje mayor de fraudes dentro de la muestra que corresponde a personas jovenes.

***************************************************************************************************************************************************

# 3. Modelo de datos

- Arquitectura

![](https://github.com/yealba90/test_nequi_frauds/blob/9135f721f2b783e1cecb00b7c346e12ed7f70749/img/arquitectura.JPG)

## Recursos utilizados

- ## S3

Se implementa S3 por su facilidad de uso, disponibilidad y bajo costo

![](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/img/S3.PNG)

Acceso a los recursos de S3:

```python
buffer_c = io.BytesIO()

obj_comercio_parquet = resource_s3.Object('test-nequi-fraud','fraud-data/datos_comercio.parquet.gzip')
obj_comercio_parquet.download_fileobj(buffer_c)
df_comercio_parquet= pd.read_parquet(buffer_c)
```
```python
buffer_f= io.BytesIO()

obj_fraude_parquet = resource_s3.Object('test-nequi-fraud','fraud-data/datos_fraude.parquet.gzip')
obj_fraude_parquet.download_fileobj(buffer_f)
df_fraude_parquet= pd.read_parquet(buffer_f)
```
```python
obj_titulares_csv = client_s3.get_object(Bucket= 'test-nequi-fraud', Key= 'fraud-data/datos_titulares.csv')  
df_titulares_csv = pd.read_csv(obj_titulares_csv['Body'], sep=";")
```
```python
obj_transaccion_csv = client_s3.get_object(Bucket= 'test-nequi-fraud', Key= 'fraud-data/datos_transaccion.csv')  
df_transaccion_csv = pd.read_csv(obj_transaccion_csv['Body'], sep=";") 
```
- ## PYTHON

Se emplea el lenguaje de programación python por su facil implementación, variedad de librerias utilies como boto3 que permite trabajar con AWS S3, psycopg2 que permite trabajar con AWS RDS

- ## RDS

Se trabaja con RDS por su accesibilidad y facilidad de manejo, además de integración con otros servicios de AWS.

Por medio del entorno Postgresql, se crean las tablas requeridas en las DB de RDS

- ## POSTGRESQL

- Se emplea un modelo de datos relacional basado en postgreSQL ya que permite un gran alcance de consultas, integridad en los datos y fácil manejo de entorno.

![](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/img/create_tables.JPG)

## MER

![](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/img/modelo_de_datos.PNG)

- Diccionario de datos

![](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/img/diccionario.PNG)

## Frecuencia de actualización

Teniendo en cuenta la importancia de los datos a nivel financiero, se propone una actualización mensual con el fin de evidenciar un posible crecimiento o decrecimiento.

***************************************************************************************************************************************************

# 4. Extraer, cargar y transformar datos, el ETL

[etl_test_nequi-original-y.ipynb](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/code/etl_test_nequi-original-y.ipynb)

## Extracción

Según lo visto sección Modelo de datos>Acceso a los recursos, el DM inicia desde el amacenamiento de las fuentes en S3 para ser consumidas a traves de los servicios AWS

## Cargar

## Funciones requeridas para trabajo con RDS y Postgresql

Función connect que se encarca de dirigir la conexión con RDS

```python
def connect_psy():
    engine = None
    try:
    # Conecta a PostgreSQL server
        print('Conectando a aws PostgreSQL database...')
        engine = psycopg2.connect(
          database="db",
          user="user",
          password="password",
          host="xxxxxxxxxxxxxxxxxxxxxx-1.rds.amazonaws.com",
          port='5432')
        print('Conecto a aws PostgreSQL database...')
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
        sys.exit(1) 
    return engine
```


Función requerida para insertar lostes de datos

- engine: conexión a RDS
- table: tabla que va a ser consultada
- df: dataframe a procesar

Retorna

- 1 si hay error

```python
def copy_from_stringio(engine, df, table):
    """
    Here we are going save the dataframe in memory 
    and use copy_from() to copy it to the table
    """
    # save dataframe to an in memory buffer
    buffer = StringIO()
    
    #numero_transaccion como index para primary key
    df.set_index('numero_trasaccion', inplace=True)
    df.to_csv(buffer, index_label='', header=False)
    
    buffer.seek(0)
    cursor = engine.cursor()
    try:
        cursor.copy_from(buffer, table, sep=",")
        engine.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        
        print("Error: %s" % error)
        engine.rollback() #Revierte insert
        cursor.close()
        print(df.head(1))
        return 1
    
    print("copy_from_stringio() done")
    
    cursor.close()
```
Teniendo en cuenta que el volumen de tados es alto, se opta por emplear una carga de datos por lotes de a 10.000.

- **Carga de datos en tabla datos_fraude**

```python
# Inicio Conexion
engine = connect_psy()

# Carga de datos en lotes de 10.000 registros para optimizacion de memoria 
for i in range(1,len(df_fraude_parquet),10000):
    resta= len(df_fraude_parquet) - i
    
    if resta > 10000:
        limit = 10000-1
    else:
        limit = resta+1
        
    df_fraude_parquet_s = df_fraude_parquet[i-1:i+limit]
    
    print("generando copy para registros entre {} y {}".format((i-1),(i+limit)))
    copy_from_stringio(engine, df_fraude_parquet_s, 'datos_fraude')
    
    if copy == 1: break # Si existe error al copy se detiene el proceso
        
# Cierra Conexion
engine.close()
```

- **Carga de datos en tabla datos_comercio**

```python
# Inicio Conexion
engine = connect_psy()

# Carga de datos en lotes de 10.000 registros para optimizacion de memoria 
for i in range(1,len(df_comercio_parquet),10000):
    resta= len(df_comercio_parquet) - i
    
    if resta > 10000:
        limit = 10000-1
    else:
        limit = resta+1
       
    df_s = df_comercio_parquet[i-1:i+limit]
    # Reemeplazo de , po - por uso de , como separador nativo del dataframe
    df_s['nombre_local_comercial'] = df_s['nombre_local_comercial'].str.replace(',','-') 
    
    print("generando copy para registros entre {} y {}".format((i-1),(i+limit)))
    copy = copy_from_stringio(engine, df_s, 'datos_comercio')
    
    if copy == 1: break # Si existe error al copy se detiene el proceso
        
# Cierra Conexion
engine.close()
```

- **Carga de datos en tabla datos_titulares**

```python
# Inicio Conexion
engine = connect_psy()

# Carga de datos en lotes de 10.000 registros para optimizacion de memoria 
for i in range(1,len(df_titulares_csv),10000):
    resta= len(df_titulares_csv) - i
    
    if resta > 10000:
        limit = 10000-1
    else:
        limit = resta+1
        
    df_s = df_titulares_csv[i-1:i+limit]
    # Reemeplazo de , po - por uso de , como separador nativo del dataframe
    df_s['trabajo_titular_cuenta'] = df_s['trabajo_titular_cuenta'].str.replace(',','-')

    print("generando copy para registros entre {} y {}".format((i-1),(i+limit)))
    copy = copy_from_stringio(engine, df_s, 'datos_titulares')
    
    if copy == 1: break # Si existe error al copy se detiene el proceso
        
# Cierra Conexion
engine.close()
```

- **Carga de datos en tabla datos_transaccion**

```python
# Inicio Conexion
engine = connect_psy()

# Carga de datos en lotes de 10.000 registros para optimizacion de memoria 
for i in range(1,len(df_transaccion_csv),10000):
    resta= len(df_transaccion_csv) - i
    
    if resta > 10000:
        limit = 10000-1
    else:
        limit = resta+1
        
    df_s = df_transaccion_csv[i-1:i+limit]
    
    print("generando copy para registros entre {} y {}".format((i-1),(i+limit)))
    copy = copy_from_stringio(engine, df_s, 'datos_transaccion')

    if copy == 1: break # Si existe error al copy se detiene el proceso
        
# Cierra Conexion
engine.close()
```
## Transformar

Teniendo en cuenta que los datos ya fueron cargados en DB de RDS basada en postgresql, se realiza un join. 

![](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/img/Join_row.JPG)

Luego se realiza una transformacion de datos.

[tranformacion_datos.sql](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/code/tranformacion_datos.sql)

![](https://github.com/yealba90/test_nequi_frauds/blob/3b00fe8e6c17af0e5382e992729f3a6d1cf6b52d/img/datos_fraude_transformada.JPG)

Se emplean algunos metodos SQL con el fin de crear columnas que puedan ser utilizadas para otros procesos posteriores.

***************************************************************************************************************************************************

# 5. Redacción del proyecto

## Objetivo del proyecto
Desarrollo de un modelo de datos DM relacional a través de AWS para el análisis de fraudes en transacciones con tarjetas de crédito realizadas en 
Estados Unidos en el periodo comprendido entre enero de 2019 y diciembre de 2020.

## Escenarios

## 1. Si los datos se incrementaran en 100x.
Teniendo en cuenta el volumen de datos, se optaría por migrar a otros servicios de AWS, por ejemplo:

- Migrar de RDS basado en Postgres a RDS basado en Aurora, el cual es un lenguaje nativo de AWS y posee mayores velocidades.

## 2. Si las tuberías se ejecutaran diariamente en una ventana de tiempo especifica.

- la herramienta Apache Airflow puede gestionar las peticiones y planificar (Scheduler), encargándose de interpretar, ejecutar y monitorizar las tareas definidas. Por esto sería una buena opción para implementar en este caso

## 3. Si la base de datos necesitara ser accedido por más de 100 usuarios funcionales.

- Para dar soporte a esa cantidad de usuarios se podrían crear réplicas de la DB o también se puede migrar a los servicios de AWS Aurora que posee más capacidad de consulta.

## 4. Si se requiere hacer analítica en tiempo real, ¿cuales componentes cambiaria a su arquitectura propuesta?

- Se podría implementar un servicio de AWS KINESIS con el fin de realizar análitica de datos en tiempo real con servicios streaming

## Muchas Gracias

YEISON ALVAREZ BALVIN


***************************************************************************************************************************************************