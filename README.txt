PROYECTO DE AUTOMATIZACIÓN API - DEMOBLAZE
=================================================

DESCRIPCIÓN:
---------------
Automatización completa de pruebas API para la plataforma Demoblaze (https://api.demoblaze.com).
El proyecto implementa pruebas de funcionalidades críticas de autenticación que cubren:
- Registro de nuevos usuarios
- Validación de usuarios existentes
- Login con credenciales válidas
- Manejo de errores en autenticación

TECNOLOGÍAS UTILIZADAS:
---------------------------
- Java 11
- Karate 1.4.1 (Framework BDD para pruebas API)
- Maven 3.8+
- JUnit 5
- Apache HttpClient 4.5.14

ESTRUCTURA DEL PROYECTO:
-----------------------------
demoblaze-api-tests/
├── src/test/java/
│   ├── TestRunner.java                 # Configuración de ejecución Karate
│   └── demoblaze/DemoblazeAPITest.java # Clase adicional de pruebas
├── src/test/resources/
│   └── karate/
│       ├── demoblaze.feature          # Escenarios principales en Gherkin
│       └── create-user.feature        # Feature auxiliar
├── pom.xml                            # Configuración Maven
├── README.txt                         # Este archivo
├── conclusiones.txt                   # Análisis y hallazgos
└── target/                            # Generado automáticamente
    └── karate-reports/                # Reportes de ejecución
        ├── karate-summary.html        # Reporte HTML principal
        ├── demoblaze.html             # Reporte detallado por feature
        └── karate.log                 # Logs de ejecución

REQUISITOS PREVIOS:
-----------------------
1. Java JDK 11 o superior instalado
2. Maven 3.8 o superior instalado
3. Visual Studio Code con extensiones:
   - Extension Pack for Java (Microsoft)
   - Maven for Java (Microsoft)
   - Karate Runner (Intuit)

INSTALACIÓN Y CONFIGURACIÓN EN VS CODE:
--------------------------------------------
1. **ABRIR EL PROYECTO:**
   - File → Open Folder
   - Seleccionar la ubicación del proyecto

2. CONFIGURAR EXTENSIONES (si no las tienes):
   - Ctrl+Shift+X para abrir Extensiones
   - Buscar e instalar: "Extension Pack for Java"
   - Buscar e instalar: "Maven for Java"
   - Buscar e instalar: "Karate Runner" (opcional)

3. CONFIGURAR JAVA EN VS CODE:
   - Presionar Ctrl+Shift+P
   - Escribir: "Java: Configure Java Runtime"
   - Seleccionar JDK 11 o superior

EJECUCIÓN DE PRUEBAS:
--------------------------

OPCIÓN 1: DESDE TERMINAL DE VS CODE
----------------------------------------
1. Abrir terminal en VS Code: Ctrl+Shift+`
2. Navegar a la ubicación del proyecto y ejecutar:

   # Limpiar y ejecutar todas las pruebas
   mvn clean test

   # Solo ejecutar pruebas (sin limpiar)
   mvn test

   # Ejecutar con actualización forzada de dependencias
   mvn clean test -U

   # Ver estructura de dependencias
   mvn dependency:tree

3. Los reportes se generan en:
   file:///C:/Users/Documents/demoblaze/target/karate-reports/karate-summary.html

OPCIÓN 2: DESDE EXTENSIÓN KARATE RUNNER
--------------------------------------------
1. Abrir archivo .feature
2. Click en icono "Run" al lado de cada escenario
3. Ver resultados en terminal integrada

FLUJOS AUTOMATIZADOS:
--------------------------
El proyecto prueba estos 5 escenarios completos:

1. SIGNUP - CREAR NUEVO USUARIO:
- Endpoint: POST /signup
- Usuario generado dinámicamente
- Contraseña: TestPass123
- Verificación: Status 200 con respuesta vacía

2. SIGNUP - USUARIO EXISTENTE:
- Endpoint: POST /signup
- Usuario del escenario anterior
- Verificación: Error "This user already exist."

3. LOGIN - CREDENCIALES VÁLIDAS:
- Endpoint: POST /login
- Usuario y contraseña válidos
- Verificación: Token de autenticación retornado

4. LOGIN - CONTRASEÑA INCORRECTA:
- Endpoint: POST /login
- Usuario válido, contraseña incorrecta
- Verificación: Error "Wrong password."

5. LOGIN - USUARIO INEXISTENTE:
- Endpoint: POST /login
- Usuario no registrado
- Verificación: Error "User does not exist."

CARACTERÍSTICAS DEL PROYECTO:
----------------------------------

GENERACIÓN DINÁMICA DE DATOS:
- Usernames únicos con timestamp y random
- Evita conflictos entre ejecuciones
- Implementado con funciones JavaScript

VALIDACIONES COMPLETAS:
- Status codes HTTP
- Estructura de respuestas JSON
- Mensajes de error específicos
- Tipos de datos correctos

LOGGING DETALLADO:
- Request/Response headers
- Bodies de peticiones
- Tiempos de respuesta
- Debugging automático

MANEJO DE ERRORES:
- Validación de respuestas de error
- Continuación de ejecución tras fallos
- Reportes claros de problemas


SOLUCIÓN DE PROBLEMAS COMUNES:
-----------------------------------

PROBLEMA: "Error de dependencias"
**SOLUCIÓN:**
- Verificar conexión a internet
- Ejecutar: mvn dependency:resolve
- Limpiar cache: mvn clean compile -U

PROBLEMA: "karate.random() no funciona"
**SOLUCIÓN:**
- Usar JavaScript puro: Math.random()
- O Java: new java.util.Random().nextInt()

PROBLEMA: "No encuentra TestRunner"
**SOLUCIÓN:**
- Verificar ubicación: src/test/java/
- Sin package o package correcto
- Ejecutar: mvn clean compile test-compile

PROBLEMA: "Reportes no se generan"
**SOLUCIÓN:**
- Verificar permisos de escritura
- Ejecutar como administrador si es necesario
- Limpiar target: mvn clean

CONFIGURACIÓN MAVEN (pom.xml):
----------------------------------
El archivo pom.xml contiene:
- Java 11 como versión de compilación
- Dependencia karate-junit5 v1.4.1
- Plugins de compilación y reporting
- Configuración de encoding UTF-8

REPORTES:
-------------
Después de ejecutar las pruebas, los reportes están disponibles en:

1. **HTML PRINCIPAL:** target/karate-reports/karate-summary.html
   - Resumen general de ejecución
   - Estadísticas por feature y scenario
   - Tiempos de ejecución

2. **REPORTE DETALLADO:** target/karate-reports/demoblaze.html
   - Pasos ejecutados con resultados
   - Requests y responses completos
   - Screenshots de errores (si aplica)

3. **LOGS:** target/karate-reports/karate.log
   - Log completo de ejecución
   - Debugging detallado
   - Errores y warnings

4. **CONSOLA:** Output en terminal VS Code
   - Resultados inmediatos
   - Errores de validación
   - Tiempos de respuesta

PARA ABRIR EL REPORTE HTML:
1. Click derecho en karate-summary.html en el explorador de VS Code
2. Seleccionar "Reveal in File Explorer"
3. Doble click para abrir en navegador
4. O copiar ruta: file:///C:/Users/Documents/demoblaze/target/karate-reports/karate-summary.html

BENEFICIOS DE KARATE PARA PRUEBAS API:
-------------------------------------------
- **Sintaxis BDD simple**: Escenarios en lenguaje natural
- **Sin código Java necesario**: Para la mayoría de casos
- **Validaciones integradas**: match, contains, schema validation
- **Manejo automático de JSON/XML**: Sin parsers manuales
- **Testing de performance**: Integración con Gatling
- **Mocks y stubs**: Para testing aislado
- **Parallel execution**: Para suites grandes
