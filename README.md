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

## Stack Tecnológico

*   **Frontend:** Flutter (Dart)
*   **Base de Datos Local:** Drift / Isar Database
*   **Gráficas:** `fl_chart`
*   **Generación de PDF:** `pdf` y `printing`
*   **Backend & Sincronización:** Supabase (PostgreSQL, Storage, Auth)

## Instalación y Ejecución Local

1. Clona este repositorio:
   ```bash
   git clone [https://github.com/tu-usuario/app-pruebas-bombeo.git](https://github.com/tu-usuario/app-pruebas-bombeo.git)
