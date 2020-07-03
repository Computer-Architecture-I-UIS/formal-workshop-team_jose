# Formal Verification

## C. Reglas Formales 

|  | assume | assert |
| --- | --- | --- |
| 0. Inicialmente el circuito tiene que estar con un reset. | [x] | [ ] |
| 1. Se asume que el periodo es mayor a 0 | `assume (io_periodCounter > 0)` *Este assume aplica para todo el formal verification* | | 
| 2. Se asume que el duty Cicle es menor al periodo y mayor a 0.| `assume (io_dutyCicle<io_periodCounter);assume (io_dutyCicle>0);`*Este assume aplica para todo el formal verification*|  | 
| 3. Si el reset esta en alto, el contador debe ser 0. |  | `if (reset) begin assert (io_contador == 0); end` |
| 4. Si el enable está en 0, la salida debe ser 0.  | | `if (!io_en)begin assert (io_out == 0); end` |
| 5. Si el contador es mayor a 0, y menor o igual al duty Cicle, la salida debe ser 1, asumiendo que el enable esta activo.| `assume (io_en);` *Este assume aplica solo para esta assertion*| `if(io_contador <= io_dutyCicle && io_contador>0)begin assert (io_out == 1); end`|
| 6. Si el contador es mayor al duty Cicle, y menor o igual al periodo, la salida debe ser 0, asumiendo que el enable está activo.| `assume (io_en);` *Este assume aplica solo para esta assertion*| `if (io_contador>io_dutyCicle && io_contador<= io_periodCounter)begin assert (io_out == 0); end` |
| 7. Si el contador es mayor a 1, el contador debe ser igual al pasado del contador+1. *(Lo que se busca verificar es que el contador siempre vaya sumando de a 1)*|`assume(io_en);`*Este assume aplica solo para esta assertion*|` if(io_contador>8'h1)begin assert (io_contador==$past(io_contador)+1'b1); end` |

### Más detalles de algunas reglas formales:
1. Este assume es para no mirar los casos en que se ingrese un periodo negativo, ya que asumimos que siempre se ingresan valores correctos por simplicidad del circuito.
2. Este assume es para no mirar cuando se ingrese un duty Cicle mayor al periodo, ya que esto no es posible y asumimos que siempre se ingresan valores correctos.
7. Aca la condicion es que el contador sea mayor a 1, ya que cuando el contador es igual a 0, quiere decir que el reset está activado, por lo cual no nos interesa esta condición, y cuando el contador es igual al periodo, el contador se reinicia a 1, por lo cual cuando el contador es igual a 1, no nos interesa que esta condición se cumpla.
