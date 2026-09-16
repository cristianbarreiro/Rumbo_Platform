# Arquitectura

Rumbo Platform es un superproyecto Git. Web y Android conservan versiones, dependencias, compilación y despliegue propios. La raíz contiene acuerdos compartidos; no introduce un backend común nuevo.

Objetivo: separar presentación, reglas del dominio de transporte y acceso a datos en cada plataforma. La equivalencia se evalúa por comportamiento observable y contratos, sin exigir clases o carpetas idénticas.

Estado: estructura inicial. La auditoría de paridad y la extracción de contratos aún están pendientes. Los commits fijados no certifican compatibilidad funcional.
