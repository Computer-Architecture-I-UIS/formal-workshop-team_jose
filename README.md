# Formal Verification

## Reglas Formales 

|  | assume | assert |
| --- | --- | --- |
| 0. Inicialmente el circuito tiene que estar con un reset. | [x] | [ ] |
| 1. Se asume que el periodo es mayor a 0 | `assume (io_periodCounter > 0)` (Este assume aplica para todo el formal verification) | [ ] | 
| 2. Se asume que el duty Cicle es menor al periodo y mayor a 0.| [x] | [ ] | 
| 3. Si el reset esta en alto, el contador debe ser 0. | [ ] | [x] |
| 4. Si el enable está en 0, la salida debe ser 0.  | [ ] | [x] |
| 5. Si el contador es mayor a 0, y menor o igual al duty Cicle, la salida debe ser 1, asumiendo que el enable esta activo.| [ ] | [x] |
| 6. Si el contador es mayor al duty Cicle, y menor o igual al periodo, la salida debe ser 0, asumiendo que el enable está activo.| [ ] | [x] |
| 7. Si el contador es mayor a 1, el contador debe ser igual al pasado del contador+1. (Lo que se busca verificar es que el contador siempre vaya sumando de a 1)| [ ] | [x] |
