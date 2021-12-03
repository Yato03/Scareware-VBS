# Scareware-VBS
Scareware creado en vbs que deja inutilizado el pc.


## **ATENCIÓN**
```
Este malware se ha creado con fines educativos. Si se utiliza con
otros fines no me hago responsable de los daños causados.
```

## **Funcionamiento**
Su funcionamiento es el siguiente:
 1. Primero se copia a la carpeta de Inicio de Windows con la función ```copyToStartUp``` para que cada vez que se inice el PC se vuelva a ejecutar.
 2. Abre una página web aleatoria especificada anteriormente en un array llamado ```urls```.
 3. Abre una ventana con un mensaje aleatorio especificado anteriormente en un array llamado ```messages```.
 4. Infecta al ordenador copiandose a si mismo en otros lugares del PC como por ejemplo la carpeta de **Inicio** o de **Favoritos**.
 5. Ejecuta todas las copias anteriores volviendose a repetir el bucle.
 6. Después de x tiempo se ejecuta una [Bomba Fork](https://es.wikipedia.org/wiki/Bomba_fork) que intenta crashear el ordenador