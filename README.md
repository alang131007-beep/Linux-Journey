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

### Puertos clave
22=SSH, 80=HTTP, 443=HTTPS, 3306=MySQL

### Concepto importante
Las variables de entorno guardan configuraciones
que los programas usan. Clave para APIs de IA.
