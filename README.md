# Formal Verification

## Reglas Formales 

|  | assume | assert |
| --- | --- | --- |
| 1. Inicialmente el circuito tiene que estar en reset. | [x] | [ ] |
| 2. El enable tiene que estar en alto para que el circuito funcione. | [ ] | [x] |
| 3. La señal de salida es alto cuando el contador es menor al ciclo útil.| [ ] | [x] |
| 4. El ciclo útil es mayor a cero.| [x] | [ ] |
| 5. Cuando el contador es mayor al ciclo útil la señal de salida es cero.| [ ] | [x] |
| 6. El periodo es un número mayor a cero| [x] | [ ] |
| 7. El contador  nunca debe ser mayor al periodo.| [ ] | [x] |
