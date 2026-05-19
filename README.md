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
