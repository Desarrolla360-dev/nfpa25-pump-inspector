# App de Pruebas de Bombeo (NFPA 25)

Aplicación móvil *offline-first* desarrollada en Flutter para automatizar y digitalizar el levantamiento de pruebas de desempeño de sistemas de bombeo contra incendio, basándose en la normativa internacional NFPA 25 y el formato industrial F-SER-034.

## Descripción del Proyecto

Esta herramienta está diseñada para técnicos en campo que operan en cuartos de bombas (zonas que frecuentemente carecen de conexión a internet). Permite la captura de mediciones hidráulicas, calcula automáticamente las presiones netas ajustadas por leyes de afinidad y determina si el equipo cumple con el umbral mínimo del 95% establecido por la norma. Al finalizar, genera un reporte técnico en formato PDF con gráficas y firmas digitales, listo para entregarse al cliente.

## Características Principales

*   **Operación 100% Offline:** Captura de datos, validaciones y generación de reportes sin necesidad de conexión a internet.
*   **Motor de Cálculo Automático:** Ajuste de curvas mediante las leyes de afinidad cuadrática (RPM nominales vs. medidas).
*   **Dictamen Normativo NFPA 25:** Evaluación instantánea de los puntos de prueba (0%, 50%, 100%, 125%, 150%).
*   **Graficación Dinámica:** Visualización en tiempo real de la curva original de fábrica vs. curva límite vs. curva de campo.
*   **Inspección Visual y Checklist:** Registro de anomalías físicas (ej. falta de tramos rectos en la succión) soportadas por evidencia fotográfica.
*   **Generación de PDF en Sitio:** Renderizado vectorial del dictamen con recolección de firmas en la pantalla del dispositivo.

# Documento de Planteamiento de Proyecto: Aplicación Móvil para Pruebas de Desempeño de Sistemas de Bombeo Contra Incendio (NFPA 25)[cite: 7]

## 1. Resumen Ejecutivo[cite: 7]
El presente proyecto contempla el diseño, desarrollo e implementación de una solución tecnológica móvil orientada a digitalizar, estandarizar y automatizar el levantamiento de pruebas de desempeño hidráulico en bombas contra incendio para el sector industrial y comercial[cite: 7].

Actualmente, los técnicos de campo registran las lecturas en hojas físicas o formatos manuales de hojas de cálculo (formato de referencia F-SER-034), lo que conlleva riesgos de errores en cálculos manuales (como el ajuste por leyes de afinidad de bombas), retrasos en la entrega de reportes al cliente y omisión de criterios normativos críticos de la norma NFPA 25[cite: 7]. La aplicación móvil propuesta resolverá estos puntos mediante arquitectura offline-first, motor de cálculo automatizado, graficación en tiempo real y generación instantánea del dictamen técnico en PDF con firma digital[cite: 7].

## 2. Justificación y Problemática Actual[cite: 7]
Durante la ejecución de las pruebas anuales de sistemas de bombeo contra incendios, los técnicos se enfrentan a escenarios técnicos y operativos complejos[cite: 7]:
* **Ambientes sin conectividad:** Los cuartos de bombas comúnmente se ubican en sótanos, búnkeres o zonas aisladas de plantas industriales sin cobertura celular ni acceso a Wi-Fi[cite: 7].
* **Cálculos matemáticos propensos a error:** El ajuste de la presión neta medido según la variación de velocidad del motor (RPM nominales vs. RPM reales) requiere aplicar leyes de afinidad cuadráticas: $P_{\text{ajustada}} = P_{\text{neta}} \cdot \left( \frac{\text{RPM}_{\text{nominal}}}{\text{RPM}_{\text{medida}}} \right)^2$[cite: 7]. La transcripción manual de estas fórmulas en campo suele inducir discrepancias en los dictámenes[cite: 7].
* **Falta de estandarización en hallazgos físicos:** Criterios de instalación (por ejemplo, tramos rectos mínimos en la succión antes de codos o accesorios para evitar cavitación y turbulencia) se omiten o no se documentan con soporte fotográfico adecuado[cite: 7].
* **Ciclo lento de entrega:** El procesamiento del reporte suele completarse días después en oficina, demorando las acciones correctivas en instalaciones críticas de protección a la vida[cite: 7].

## 3. Objetivos del Proyecto[cite: 7]

### 3.1. Objetivo General[cite: 7]
Desarrollar una aplicación móvil multiplataforma (iOS/Android) bajo un esquema offline-first que guíe al personal técnico en el levantamiento de pruebas de bombas contra incendio bajo el estándar NFPA 25, automatice los cálculos hidráulicos y emita reportes técnicos formales de manera inmediata[cite: 7].

### 3.2. Objetivos Específicos[cite: 7]
* Garantizar operación 100% desconectada con sincronización automática diferida a la nube al recuperar conexión a internet[cite: 7].
* Automatizar la verificación del cumplimiento normativo (tolerancia máxima del -5% en presión neta respecto a la curva de placa o de aceptación previa)[cite: 7].
* Renderizar la gráfica comparativa en el dispositivo móvil: Curva Nominal de Fábrica vs. Límite Mínimo NFPA 25 vs. Curva Obtenida en Campo[cite: 7].
* Incorporar módulos de captura fotográfica con metadatos y recolección de firmas digitales para técnico y cliente[cite: 7].
* Generar el reporte técnico en formato PDF directamente en el dispositivo móvil, sin dependencia de servidores externos[cite: 7].

## 4. Alcance Funcional del Sistema[cite: 7]

### 4.1. Módulos Principales[cite: 7]

| Módulo | Funcionalidades Clave | Beneficio Operativo |
|---|---|---|
| **1. Registro de Servicios y Equipos**[cite: 7] | Captura de datos de cliente, planta y datos de placa del equipo (GPM, PSI nominal, RPM, marca/modelo de bomba, motor diésel/eléctrico, controlador)[cite: 7]. | Estandarización de base de datos de activos instalados por cliente[cite: 7]. |
| **2. Captura Hidráulica y Motor Matemático**[cite: 7] | Ingreso de mediciones en 5 puntos operativos (0%, 50%, 100%, 125%, 150%)[cite: 7]. Cálculo automático de Presión Neta (Descarga - Succión) y Presión Ajustada por RPM[cite: 7]. | Eliminación total del error de cálculo aritmético manual[cite: 7]. |
| **3. Validación Normativa y Gráfica**[cite: 7] | Comparación instantánea contra el 95% de presión nominal (NFPA 25)[cite: 7]. Graficado interactivo con ejes GPM vs. PSI superponiendo las 3 curvas de referencia[cite: 7]. | Dictamen inmediato en sitio: Aprobado / No Aprobado[cite: 7]. |
| **4. Inspección Visual y Checklist**[cite: 7] | Lista de verificación de condiciones de succión (tramos rectos, vórtice, válvulas OS&Y, cisterna) y registro fotográfico de evidencias[cite: 7]. | Soporte de hallazgos que no dependen del bombeo pero condicionan la aceptación del sistema[cite: 7]. |
| **5. Generación de PDF y Cierre**[cite: 7] | Compilación vectorial local del reporte formal con maquetación idéntica a los estándares industriales, firma digital en pantalla y exportación a WhatsApp/Correo[cite: 7]. | Cierre del servicio en el sitio sin requerir trabajo posterior en oficina[cite: 7]. |

## 5. Especificación del Stack Tecnológico[cite: 7]
La selección tecnológica responde directamente al requerimiento crítico de operatividad offline, renderizado gráfico vectorial y compilación local de documentos[cite: 7]:

| Componente | Tecnología Seleccionada | Justificación Técnica |
|---|---|---|
| **Framework Frontend**[cite: 7] | Flutter (Dart)[cite: 7] | Compilación nativa de alto rendimiento en iOS y Android a partir de una única base de código, con control pixel-perfect sobre interfaces complejas[cite: 7]. |
| **Motor de Gráficas**[cite: 7] | fl_chart / syncfusion_flutter_charts[cite: 7] | Soporte nativo para gráficos cartesianos de dispersión y líneas suaves superpuestas con escalamiento automático de ejes continuos (GPM vs. PSI)[cite: 7]. |
| **Base de Datos Local (Offline)**[cite: 7] | Drift / Isar Database[cite: 7] | Motor de almacenamiento persistente embebido, transaccional y fuertemente tipado en Dart, garantizando cero pérdida de datos ante cortes imprevistos[cite: 7]. |
| **Motor de PDF y Firma**[cite: 7] | pdf + printing + signature[cite: 7] | Librerías especializadas que construyen documentos PDF vectoriales directamente en la memoria del dispositivo, integrando imágenes, tablas y firmas digitales[cite: 7]. |
| **Backend & Nube**[cite: 7] | Supabase (PostgreSQL, Auth, Storage)[cite: 7] | Infraestructura escalable relacional para respaldo de informes, sincronización diferida cuando se detecta conexión y almacenamiento seguro de archivos en la nube[cite: 7]. |

## 6. Hoja de Ruta y Fases de Implementación[cite: 7]
* **Fase 1: Motor de Cálculo y Modelado (Semanas 1 - 2):**[cite: 7] Definición de entidades (Empresas, Equipos, Inspecciones, Mediciones, Hallazgos)[cite: 7]. Programación y pruebas unitarias de las leyes de afinidad y algoritmos de validación NFPA 25[cite: 7].
* **Fase 2: Arquitectura Local y Formularios de Campo (Semanas 3 - 4):**[cite: 7] Implementación de la base de datos embebida (Drift/Isar)[cite: 7]. Creación del flujo de pantallas dinámicas para captura de datos nominales y mediciones hidráulicas[cite: 7].
* **Fase 3: Graficación Dinámica e Inspección Física (Semanas 5 - 6):**[cite: 7] Integración del widget interactivo de curvas hidráulicas[cite: 7]. Módulo de evidencias fotográficas y checklist de cumplimiento en cuarto de bombas[cite: 7].
* **Fase 4: Motor de Reportes PDF y Firma Digital (Semanas 7 - 8):**[cite: 7] Diseño del formato visual del informe (similar al estándar F-SER-034)[cite: 7]. Captura de firmas en pantalla y exportación de archivos sin requerir internet[cite: 7].
* **Fase 5: Sincronización en la Nube y Pruebas Piloto (Semanas 9 - 10):**[cite: 7] Integración con Supabase para sincronización diferida automática[cite: 7]. Validación en campo con técnicos durante pruebas de desempeño reales y ajustes finales[cite: 7].

## 7. Factibilidad y Riesgos[cite: 7]

| Riesgo Identificado | Nivel de Impacto | Estrategia de Mitigación |
|---|---|---|
| Pérdida de datos por apagado súbito de batería o caída de la app en campo.[cite: 7] | Alto[cite: 7] | Guardado atómico automático en base de datos local cada vez que un campo numérico pierde foco o cambia de valor[cite: 7]. |
| Discrepancias en curvas por datos de fábrica no convencionales.[cite: 7] | Medio[cite: 7] | Permitir entrada manual de la curva original certificada por el fabricante cuando no siga el comportamiento teórico estándar[cite: 7]. |
| Conflictos de sincronización entre el dispositivo y la nube.[cite: 7] | Bajo[cite: 7] | Arquitectura basada en identificadores únicos universales (UUID) y política de resolución de conflictos por marca de tiempo (timestamp)[cite: 7]. |

## 8. Conclusión y Siguientes Pasos[cite: 7]
El proyecto representa una evolución indispensable para empresas dedicadas a la inspección y mantenimiento de sistemas contra incendios[cite: 7]. La digitalización del formato analizado elimina los cuellos de botella operativos, incrementa la precisión técnica y proyecta un estándar de servicio profesional de alto valor ante los clientes[cite: 7].

**Próximo paso recomendado:** Definir la estructura detallada de las tablas de datos (esquema SQL / entidades locales) y los algoritmos en código Dart para el ajuste de curvas hidráulicas[cite: 7].

## Instalación y Ejecución Local

1. Clona este repositorio:
   ```bash
   git clone [https://github.com/tu-usuario/app-pruebas-bombeo.git](https://github.com/tu-usuario/app-pruebas-bombeo.git)
