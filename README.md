# Mi aprendizaje de Linux

## Semana 1
- Aprendí qué es el sistema de archivos
- Comandos básicos: ls, cd, pwd
- Completé LinuxJourney sección Command Line

# Mi aprendizaje de Linux

Soy un estudiante de 18 años aprendiendo Linux 
con la meta de trabajar en infraestructura de IA.

## Progreso
- [ ] Linux básico
- [ ] Servidores
- [ ] Docker
- [ ] Primera certificación LFCS

## Día 2 - 02/05/2025

### Comandos aprendidos
- touch — crear archivos
- cat — leer archivos
- echo — imprimir texto
- ">" — redirigir texto a un archivo
- man — manual de cualquier comando

### Lo que entendí hoy
La terminal siempre muestra en qué carpeta estás.

## Día 3 - 03/05/2025

### Comandos aprendidos
- cp — copiar archivos
- mv — mover o renombrar archivos
- ls -la — ver archivos con detalle y permisos
- echo "texto" > archivo — escribir en un archivo
- Ctrl+C — cancelar comando atorado

### Concepto importante
Los permisos en Linux: r=leer, w=escribir, x=ejecutar
Cada archivo tiene permisos para dueño, grupo y otros

### Plataforma
Cambié de DistroSea a Killercoda, mejor compatibilidad

## Día 4 - 04/05/2025

### Comandos aprendidos
- grep — buscar texto dentro de archivos
- grep -r — buscar recursivamente en carpetas
- grep -i — ignorar mayúsculas
- grep -c — contar ocurrencias
- find — buscar archivos y carpetas
- find -type f/d — filtrar por tipo
- wc -l / wc -w — contar líneas y palabras

### Concepto importante
Las banderas se pueden combinar: -ri busca recursivo
e ignorando mayúsculas al mismo tiempo.

## Día 5 - 05/05/2025

### Comandos aprendidos
- chmod — cambiar permisos (644, 755, 777)
- chown — cambiar dueño de archivo
- ps aux — ver procesos activos
- kill / kill -9 — terminar procesos
- top / htop — monitor de recursos
- df -h — espacio en disco
- free -h — uso de RAM
- alias — crear atajos de comandos
- unalias — eliminar alias

### Concepto importante
Permisos: r=4, w=2, x=1, se suman por grupo
El pipe | conecta comandos entre sí

## Día 6 - 05/05/2025

### Comandos aprendidos
- ping -c 4 — verificar conexión a internet
- ip addr — ver IP local
- curl ifconfig.me — ver IP pública
- netstat -tuln — ver puertos abiertos
- ssh usuario@IP — conectarse a servidor remoto
- wget / curl -O — descargar archivos desde terminal
- printenv — ver variables de entorno
- export VARIABLE="valor" — crear variable de entorno

### Puertos clave
22=SSH, 80=HTTP, 443=HTTPS, 3306=MySQL

### Concepto importante
Las variables de entorno guardan configuraciones
que los programas usan. Clave para APIs de IA.

- ## Día 7 - 06/05/2025

### Tema: Bash Scripting

### Lo aprendido
- Crear scripts con nano o cat
- chmod +x — dar permisos de ejecución
- ./ — ejecutar un script
- Variables dentro de scripts
- Condicional if/else/fi

### Primer script creado
Automaticé whoami, date y pwd en un solo comando

### Concepto importante
Un script agrupa comandos para ejecutarlos 
automáticamente. Base de la automatización en servidores.

# Redirección de Errores en Linux

**Fecha:** 19 de mayo de 2026  
**Tema:** stdin / stdout / stderr y operadores de redirección

---

## Los 3 canales estándar

Todo proceso en Linux tiene 3 canales:

| Canal | Nombre | Número |
|-------|--------|--------|
| Entrada | `stdin` | 0 |
| Salida normal | `stdout` | 1 |
| Salida de errores | `stderr` | 2 |

---

## Operadores aprendidos

| Operador | Qué hace |
|----------|----------|
| `>` | Redirige stdout a un archivo |
| `2>` | Redirige stderr a un archivo |
| `2>/dev/null` | Descarta errores completamente |
| `2>&1` | Une stderr hacia donde apunta stdout |
| `&>` | Une stdout y stderr en un solo archivo (atajo moderno) |

---

## Ejemplos practicados

```bash
# Redirigir error a archivo
ls falsacarpeta.sh 2> errores.txt
cat errores.txt

# Separar stdout y stderr en archivos distintos
ls errores.txt listat.txt > salida.txt 2> errores.txt

# Silenciar errores con /dev/null
ls /agujero.txt 2>/dev/null

# Unir stdout y stderr en un solo archivo
ls errores.txt agujero.txt &> todo.txt
cat todo.txt
```

---

## Notas personales

- `/dev/null` es un "agujero negro": todo lo que se manda ahí desaparece
- `&>` es el atajo moderno de `> archivo 2>&1`
- En servidores de producción se usa `2>` para separar logs normales de logs de error
- Cuidado con las comillas al escribir `2>/dev/null` — un `"` accidental abre un string multilínea en bash

---

## Ejercicios completados

- [x] Ejercicio 1 — Redirigir stderr a un archivo y verificar con `cat`
- [x] Ejercicio 2 — Separar stdout y stderr en archivos distintos con un solo comando
- [x] Ejercicio 3 — Silenciar errores con `/dev/null`
- [x] Ejercicio 4 — Unir stdout y stderr en un archivo con `&>`

 # Pipes y Permisos Avanzados en Linux

**Fecha:** 21 de mayo de 2026

---

## PARTE 1 — Pipes (`|`)

### ¿Qué es un pipe?

Conecta la salida (stdout) de un comando con la entrada (stdin) del siguiente. Los datos fluyen sin necesidad de archivos intermedios.

```
comando1 | comando2 | comando3
```

### Comandos más usados con pipes

| Comando | Para qué |
|---------|----------|
| `grep` | Filtrar líneas por patrón |
| `sort` | Ordenar resultados |
| `wc -l` | Contar líneas |
| `head -n` | Primeras n líneas |
| `tail -n` | Últimas n líneas |
| `cut` | Extraer columnas de texto |
| `uniq` | Eliminar duplicados |

### Ejemplos practicados

```bash
# Filtrar procesos
ps aux | grep bash

# Contar archivos en /etc
ls /etc | wc -l          # resultado: 234

# Encadenar 3 comandos
ls /etc | grep "\.conf$" | sort

# Filtrar y contar en archivo de texto
cat frases.txt | grep "error critico" | wc -l
```

### Nota importante

`grep` siempre aparece en sus propios resultados. Para evitarlo:
```bash
ps aux | grep [b]ash
```

---

## PARTE 2 — Permisos Avanzados

### Los 3 bits especiales

| Bit | Símbolo | Número | Dónde aparece |
|-----|---------|--------|---------------|
| SUID | `s` | 4 | Posición x del dueño |
| SGID | `s` | 2 | Posición x del grupo |
| Sticky | `t` | 1 | Posición x de otros |

### SUID (Set User ID)

El ejecutable corre con los permisos del dueño, no del usuario que lo ejecuta.

```bash
chmod u+s archivo
chmod 4755 archivo
```

Binarios con SUID en el sistema:
```bash
find /usr/bin -perm /4000
# ejemplos: passwd, su, sudo, mount, umount, gpasswd
```

### SGID (Set Group ID)

En directorios: los archivos creados adentro heredan el grupo del directorio.

```bash
chmod g+s directorio
chmod 2755 directorio
```

### Sticky Bit

Solo el dueño del archivo puede borrarlo, aunque otros tengan permisos de escritura.

```bash
chmod +t directorio
chmod 1777 directorio
```

Ejemplo real: `/tmp` siempre tiene sticky bit activo (`drwxrwxrwt`).

### Combinar bits

```
SUID + SGID + Sticky + permisos normales
  4  +   2  +   1   +       755
```

### Ejemplos practicados

```bash
# Ver SUID en el sistema
find /usr/bin -perm /4000

# Verificar sticky bit en /tmp
ls -la / | grep tmp          # drwxrwxrwt

# Crear directorio con sticky bit
mkdir ~/sticky_test
chmod +t ~/sticky_test
ls -la ~ | grep sticky_test  # drwxrwxr-t

# Crear directorio con SGID
mkdir ~/compartido
chmod g+s ~/compartido
ls -la ~ | grep compartido   # drwxrwsr-x
```

---

## Ejercicios completados

### Pipes
- [x] Ejercicio 1 — Filtrar procesos con `ps aux | grep bash`
- [x] Ejercicio 2 — Contar entradas en `/etc` con `wc -l`
- [x] Ejercicio 3 — Encadenar 3 comandos: listar, filtrar `.conf` y ordenar
- [x] Ejercicio 4 — Filtrar y contar líneas en archivo de texto

### Permisos avanzados
- [x] Ejercicio 1 — Encontrar binarios con SUID con `find -perm /4000`
- [x] Ejercicio 2 — Verificar sticky bit en `/tmp` y crearlo en directorio propio
- [x] Ejercicio 3 — Crear directorio con SGID y verificar la `s` en el grupo

# Compresión y Archivos en Linux

**Fecha:** 22 de mayo de 2026
**Nota:** Tema a repasar en la siguiente sesión.

---

## Herramientas

### gzip — comprimir un solo archivo
```bash
gzip archivo.txt          # comprime → archivo.txt.gz
gzip -d archivo.txt.gz    # descomprime
gunzip archivo.txt.gz     # igual que gzip -d
```
⚠️ gzip **reemplaza** el archivo original en ambas direcciones.

---

### tar — empaquetar varios archivos
Solo agrupa, no comprime por sí solo.

```bash
tar -cvf paquete.tar carpeta/     # crear paquete
tar -xvf paquete.tar              # extraer
tar -tvf paquete.tar              # ver contenido sin extraer
tar -xvf paquete.tar -C ~/destino # extraer en otra ubicación
```

Flags:
| Flag | Significa |
|------|-----------|
| `c` | crear |
| `x` | extraer |
| `t` | listar contenido |
| `v` | verbose (mostrar progreso) |
| `f` | especificar nombre de archivo |
| `z` | activar compresión gzip |

---

### tar + gzip — empaquetar Y comprimir
La combinación más usada en servidores.

```bash
tar -czvf paquete.tar.gz carpeta/   # crear comprimido
tar -xzvf paquete.tar.gz            # extraer comprimido
```

Resultado de la práctica:
- `paquete.tar` → 10K
- `paquete.tar.gz` → 228 bytes

---

### zip / unzip — compatible con Windows
```bash
zip -r paquete.zip carpeta/          # comprimir
unzip -l paquete.zip                 # ver contenido sin extraer
unzip paquete.zip -d ~/destino       # extraer en ubicación específica
```

---

## Comparación de herramientas

| Herramienta | Agrupa | Comprime | Uso típico |
|-------------|--------|----------|------------|
| `gzip` | No | Sí | Un solo archivo |
| `tar` | Sí | No | Agrupar sin comprimir |
| `tar.gz` | Sí | Sí | Backups en servidores |
| `zip` | Sí | Sí | Compatibilidad con Windows |

---

## Ejercicios completados

- [x] Ejercicio 1 — Comprimir y descomprimir con gzip
- [x] Ejercicio 2 — Empaquetar con tar, listar y extraer con `-C`
- [x] Ejercicio 3 — Crear tar.gz y comparar tamaño con tar sin comprimir
- [x] Ejercicio 4 — Comprimir con zip, listar y extraer con `-d`

# Semana 1 — Navegación y comandos base
**Plan de repaso Linux · Tachyon-01**  
**Sistema:** Ubuntu 24.04 · ThinkPad T450

---

## Comandos cubiertos

### mkdir — Crear directorios
```bash
mkdir carpeta                        # crea una carpeta
mkdir -p carpeta/sub1 carpeta/sub2   # crea múltiples niveles de un jalón
```
> `-p` crea todos los niveles necesarios sin error si ya existen.

---

### touch — Crear archivos vacíos
```bash
touch archivo.txt
touch ruta/completa/archivo.txt
```

---

### echo — Escribir texto
```bash
echo "texto" > archivo.txt    # crea/sobreescribe el archivo
echo "texto" >> archivo.txt   # agrega al final sin borrar
```
> `>` sobreescribe · `>>` acumula

---

### cat — Leer archivos
```bash
cat archivo.txt
cat ruta/completa/archivo.txt
```

---

### head y tail — Leer parcialmente
```bash
head -3 archivo.txt    # primeras 3 líneas
tail -3 archivo.txt    # últimas 3 líneas
```

---

### cp — Copiar
```bash
cp origen.txt destino.txt              # copia con nuevo nombre
cp origen.txt ruta/destino/            # copia a otra carpeta
cp -r carpeta/ destino/                # copia carpeta completa (-r para directorios)
```

---

### mv — Mover o renombrar
```bash
mv archivo.txt nueva_ruta/             # mueve
mv archivo.txt nuevo_nombre.txt        # renombra
mv archivo.txt nueva_ruta/nuevo.txt    # mueve y renombra
```

---

### rm — Eliminar
```bash
rm archivo.txt          # elimina archivo
rm -r carpeta/          # elimina carpeta y todo su contenido
```
> ⚠️ No hay papelera — rm es permanente.

---

### pwd — Ver directorio actual
```bash
pwd    # muestra la ruta absoluta donde estás parado
```
> Úsalo antes de cualquier operación importante para no operar en el lugar equivocado.

---

### cd — Navegar entre directorios
```bash
cd carpeta/              # entra a carpeta
cd ruta/completa/sub/    # ruta relativa
cd ~                     # regresa a home siempre
cd ..                    # sube un nivel
cd -                     # regresa al directorio anterior
```

---

### ls — Listar contenido
```bash
ls                  # lista carpeta actual
ls ruta/            # lista otra carpeta
ls -l               # formato detallado (permisos, dueño, tamaño)
ls -R               # lista recursiva (todos los subdirectorios)
ls -lh              # detallado con tamaños legibles
```

---

### find — Buscar archivos
```bash
find ~ -name archivo.txt          # busca desde home por nombre exacto
find . -name archivo.txt          # busca desde donde estás
find ~ -name "*.txt"              # busca todos los .txt
find /ruta -name archivo 2>/dev/null   # suprime errores de permisos
```
> `find` busca el nombre **exacto**. Si no aparece, verifica el nombre real con `ls`.

---

## Regla general de sintaxis

```
comando origen destino
```

El último argumento siempre es el destino. Aplica a `cp`, `mv`, `echo >`, etc.

---

## Errores comunes

| Error | Causa | Solución |
|-------|-------|----------|
| `No such file or directory` | Ruta incorrecta o nombre mal escrito | Verificar con `ls` primero |
| Archivo en lugar incorrecto | No saber dónde estás parado | Usar `pwd` antes de operar |
| `find` no encuentra el archivo | Nombre incorrecto | Verificar nombre exacto con `ls` |
| `rm -r` borra de más | Flag incorrecto para archivos | Sin `-r` para archivos simples |

---

## Ejercicio de referencia

Flujo completo practicado:
```bash
# Crear estructura
mkdir -p repaso/notas repaso/scripts/backup

# Crear y escribir archivo
echo "contenido" > repaso/notas/texto.txt
echo "más líneas" >> repaso/notas/texto.txt

# Leer
cat repaso/notas/texto.txt
head -2 repaso/notas/texto.txt
tail -2 repaso/notas/texto.txt

# Copiar, mover, eliminar
cp repaso/notas/texto.txt repaso/scripts/copia.txt
mv repaso/scripts/copia.txt repaso/scripts/backup/
rm repaso/scripts/backup/copia.txt

# Buscar
find ~ -name texto.txt
```

# Semana 2 — Permisos y usuarios
**Plan de repaso Linux · Tachyon-01**  
**Sistema:** Ubuntu 24.04 · ThinkPad T450

---

## Comandos cubiertos

### useradd — Crear usuarios
```bash
sudo useradd -m usuario          # crea usuario con directorio home
sudo useradd -M usuario          # crea usuario sin directorio home
sudo useradd -m -G grupo usuario # crea usuario con home y lo asigna a un grupo
```
> `-m` crea `/home/usuario` · `-M` lo omite · `-G` asigna grupo suplementario

---

### passwd — Asignar contraseña
```bash
sudo passwd usuario
```
> La contraseña se escribe de forma interactiva — nunca va en el comando directo (quedaría en el historial).

---

### su — Cambiar de usuario
```bash
su usuario      # cambia usuario pero mantiene el entorno actual
su - usuario    # simula login completo, carga el entorno del usuario
exit            # regresa al usuario anterior
```
> Siempre usar `su -` para simular un entorno real. Sin el guión los paths y variables pueden fallar.

---

### groupadd — Crear grupos
```bash
sudo groupadd nombre_grupo
```

---

### usermod — Modificar usuario existente
```bash
sudo usermod -aG grupo usuario   # agrega usuario a un grupo sin quitarle los anteriores
```
> `-a` = append (agregar) · Sin `-a` reemplaza todos los grupos existentes ⚠️

---

### chown — Cambiar dueño o grupo
```bash
sudo chown usuario archivo           # cambia usuario dueño
sudo chown :grupo archivo            # cambia solo el grupo dueño
sudo chown usuario:grupo archivo     # cambia ambos
sudo chown -R :grupo carpeta/        # recursivo para toda la carpeta
```

---

### chmod — Cambiar permisos
```bash
sudo chmod 770 carpeta/    # dueño rwx, grupo rwx, otros ---
sudo chmod 755 carpeta/    # dueño rwx, grupo r-x, otros r-x
sudo chmod 750 carpeta/    # dueño rwx, grupo r-x, otros ---
```

#### Tabla de referencia rápida
| Número | Permisos | Significado |
|--------|----------|-------------|
| 7 | rwx | leer + escribir + ejecutar |
| 6 | rw- | leer + escribir |
| 5 | r-x | leer + ejecutar |
| 4 | r-- | solo leer |
| 0 | --- | sin permisos |

---

### id — Verificar usuario y grupos
```bash
id usuario    # muestra UID, GID y todos los grupos del usuario
```

### ls -l — Verificar permisos
```bash
ls -l /ruta/          # muestra permisos, dueño y grupo de cada archivo/carpeta
ls -ld /ruta/         # muestra permisos de la carpeta en sí, no su contenido
```

---

## Lógica de permisos — Regla importante

Los permisos son una **cadena**. Si cualquier directorio en la ruta no tiene permisos de entrada, no puedes llegar al destino aunque este sí tenga permisos.

```
/home/alanlinux/  →  repaso/  →  qa-work/
drwxr-x---             755         770
     ↑
  Sin permiso para otros → hiro no puede entrar aunque qa-work tenga 770
```

**Solución:** mover carpetas compartidas a `/srv/` donde todos tienen acceso, en lugar de dentro del home de otro usuario.

---

## Diferencia -m vs -M

| Flag | Resultado |
|------|-----------|
| `-m` | Crea `/home/usuario` automáticamente |
| `-M` | No crea home — útil para usuarios de servicio |

Si intentas `su -` con un usuario sin home recibirás un warning pero funciona igual.

---

## Flujo completo practicado

```bash
# Crear usuarios
sudo useradd -M ken                        # sin home
sudo useradd -m -G Developers hiro         # con home y grupo

# Asignar contraseña
sudo passwd hiro

# Crear grupo y agregar usuarios
sudo groupadd qa
sudo usermod -aG qa hiro
sudo usermod -aG qa ken

# Verificar
id hiro    # debe mostrar Developers y qa
id ken     # debe mostrar qa

# Crear carpeta del grupo en /srv
sudo mkdir /srv/qa-work
sudo chown :qa /srv/qa-work
sudo chmod 770 /srv/qa-work

# Verificar
ls -l /srv/

# Probar acceso como hiro
su - hiro
touch /srv/qa-work/prueba.txt    # debe funcionar (hiro está en qa)
exit

# Probar acceso como ken
su - ken
touch /srv/qa-work/prueba_ken.txt    # debe funcionar (ken está en qa)
exit
```

---

## Errores comunes

| Error | Causa | Solución |
|-------|-------|----------|
| `Permission denied` en useradd/groupadd | Falta sudo | Agregar `sudo` al inicio |
| `can't cd to /home/usuario` | Usuario creado sin `-m` | Normal si se usó `-M`, no es error crítico |
| Usuario pierde grupos anteriores | `usermod -G` sin `-a` | Siempre usar `usermod -aG` |
| No puede entrar a carpeta aunque tenga permisos | Directorio padre sin permisos | Verificar toda la cadena de rutas con `ls -ld` |
