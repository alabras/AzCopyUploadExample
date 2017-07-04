# AzCopyUploadExample
Ejemplo de carga de archivos con AzCopy hacia Azure Storage File Service. Una vez terminado y si se ejecuta correctamente, elimina los archivos de la carpeta local.

## Configuración
Para ejecutar el código se debe modificar los parámetros:

* $Source: Ruta donde se encuentra la carpeta con los archivos a subir, ej: "C:\File\"
* $file: Patron de archivos que se subiran, este patron puede tener el comodín "*". Ej: "*.txt" (Sube todos los archivos .txt que existan en la carpeta "Source")
* $Dest: Ruta de File service endpoint, ejemplo: "https://xxxx.file.core.windows.net/"  donde xxxx es el nombre del Storage account.
* $Token: access key del Storage Account. 


# Ejemplo de Resultado

Al finalizar la carga, mostrará el summary de la transferencia.
```
[2017/07/04 18:27:07] Transfer summary:
Total files transferred: 20
Transfer successfully:   20
Transfer skipped:        0
Transfer failed:         0
Elapsed time:            00.00:18:11
```
