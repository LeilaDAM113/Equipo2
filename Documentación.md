# Equipo2DAM

#### ÍNDICE
  - [Sistemas informáticos](#sistemas-informáticos)
  - [Entornos de desarrollo](#entornos-de-desarrollo)
  - [Bases de datos](#bases-de-datos)
  - [Lenguaje de marcas](#lenguaje-de-marcas)
  - [Programación](#programación)
   

## Sistemas informáticos



## Entornos de desarrollo
Se ha realizado el diagrama de casos de uso, de secuencia y de clases del proyecto utilizando una herramienta de diseño UML. 

Se ha utilizado en la documentación el lenguaje Markdown, el cual ha sido laborioso de utilizar. Este lenguaje lo hemos utilizado sobretodo para que quede visualmente ordenado y atractivo, para la fácil comprensión del lector. 

Se ha creado el repositorio en Github junto con los issues y las branches, en las cuales se ha asociado a cada rama un colaborador. En este repositorio se ha ido añadiendo información del progreso de cada colaborador a tiempo real. Además, se ha creado el repositorio local, estableciendo una conexión con GitHub a través de GitBash.

A la hora de elaborar la documentación, hemos utilizado Visual Studio, enlazándolo con Github a través de GitBash, de tal forma que podamos ejectuar e introducir información desde Visual Studio, guardándose en Github mediante commits y pushs.

#### Casos de usos y sus esquemas
**Caso de uso 1**
~~~
- Caso de uso: pedir préstamo
- Actores involucrados: clientes y banco
- Precondición: la persona debe haberse afiliado al banco y el banco tiene que existir
-	Flujo básico:
1. La persona/cliente solicita un préstamo al banco
2. El banco hace un chequeo del expediente del cliente para comprobar si es moroso, tiene cargos judiciales o ambos
3. Se verifica si el cliente está desempleado, es un estudiante, una ama de casa o si trabaja
4. Se verifica su nómina de los últimos 12 meses si está empleado, es rentista o es pensionista
5. Se verifica su media anual (si es mayor de 1000) y se le concede un límite de cuánto dinero puede pedir
- Caminos alternativos:
1. Si en el caso 2 se detecta que el cliente es moroso, tiene cargos judiciales o ambos no se le concederá el préstamo
2. Si en el caso 3 la pareja del cliente no está afiliado al banco o no trabaja, no se le concederá el préstamo
3. Si en el caso 4 el cliente no ha trabajado, trabajo menos de 12 meses el año actual, ha empezado ha trabajar hace poco o gana menos de 1000 euros al mes, no se le concederá el préstamo
4. Si en el caso 5, el cliente pide un préstamo mayor al limite que le da el banco, no se le concederá el préstamo
Cuyo resultado será:

~~~
![Casos de uso](/casosdeusouno.PNG)

**Caso de uso 2**
~~~
- Caso de uso: calcular los préstamos de los clientes
- Actores involucrados: clientes y banco
- Precondición: la persona debe haberse afiliado al banco y el banco tiene que existir
- Flujo básico:
1. El cliente debe pedir al banco un préstamo
2. El banco comprobara cual es la nomina del cliente y su media anual
3. Dependiendo de cuanto gane el cliente, se le concederá un préstamo de 5000, 10000 o 15000
- Caminos alternativos:
1. En el caso 2, si el posee una nomina y una media anual menor a 1000 euros, no se le podrá calcular el préstamo y no se le concederá 
Cuyo resultado será:

~~~
![Casos de uso](/casosdeusodos.PNG)

**Caso de uso 3**
~~~
- Caso de uso: visualizar clientes
- Actores involucrados: clientes y banco
- Precondición: el banco tiene que tener afiliados a él un cliente o más y el banco tiene que existir
- Flujo básico:
1. El administrador a cargo de esto quiere ver la información de todos sus clientes
2. Si el banco posee algún cliente dentro de su base de datos se le mostrara por pantalla la información del cliente
- Caminos alternativos:
1. Si en el caso 2, el banco ha sido abierto recientemente o no tiene cliente, no se podrá visualizar la información que se quiere
Cuyo resultado será:
~~~
![Casos de uso](/casosdeusotres.PNG)

**Caso de uso 4**
~~~
- Caso de uso: visualizar préstamos
- Actores involucrados: clientes y banco
- Precondición: la persona debe haberse afiliado al banco, debe de haber un préstamo ya pedido y el banco tiene que existir
- Flujo básico:
1. El administrador del banco quiere ver los préstamos que han sido concedidos y pre-concedidos
2. Se comprobará si se ha hecho algún préstamo
3. Si algún cliente del banco ha pedido con anterioridad un préstamo, se podrá visualizar en pantalla los prestamos que se han hecho
- Caminos alternativos:
1. Si en el caso 2, no ha habido clientes que hayan pedido hacer un préstamo al banco no se podrá visualizar la información que se quiere
Cuyo resultado será:
~~~
![Casos de uso](/casosdeusocuatro.PNG)

**Caso de uso 5**
~~~
- Caso de uso: visualizar préstamo por localidad
- Actores involucrados: clientes y banco
- Precondición: la persona debe haberse afiliado al banco, debe de haber un préstamo ya pedido y el banco tiene que existir
- Flujo básico:
1. El administrador del banco quiere ver los préstamos que han sido concedidos y pre-concedidos en una cierta localidad
2. Se comprobará si se ha hecho algún préstamo
3. Se buscará por el nombre de la localidad todos los prestamos suyos clientes vivan en dicha localidad.
- Caminos alternativos:
1. Si en el caso 2, no ha habido clientes que hayan pedido hacer un préstamo al banco no se podrá visualizar la información que se quiere
2. Si en el caso 3, no ha habido ningún cliente de la localidad deseada que haya pedido un préstamo no se podrá sacar la información deseada
Cuyo resultado será:
~~~
![Casos de uso](/casosdeusocinco.PNG)

**Caso de uso 6**
~~~
- Caso de uso: gestionar perfil
- Actores involucrados: clientes y banco
- Precondición: la persona debe haberse afiliado al banco y el banco tiene que existir
- Flujo básico:
1. El cliente quiere modificar su perfil
2. Cuando el cliente inicie sesión podrá modificar su perfil a su gusto y lo guardara
- Caminos alternativos:
1. En el caso 2, si el cliente quiere modificar su perfil en un banco al cual no está afiliado o en un banco inexistente, no podrá cambiar su perfil
Cuyo resultado será:
~~~
![Casos de uso](/casosdeusoseis.PNG)

**Caso de uso 7**
~~~
- Caso de uso: realizar una operación
- Actores involucrados: clientes y banco
- Precondición: la persona debe haberse afiliado al banco y el banco tiene que existir
- Flujo básico:
1. El cliente querrá depositar, retirar, pagar o pedir un préstamo pre-concedido o concedido
2. El cliente tendrá que primero entrar a su cuenta
3. El cliente después tendrá varias opciones las cuales serán:  depositar, retirar, pagar o pedir un préstamo pre-concedido o concedido
4. Cualquier acción modificara el saldo de la cuenta bancaria del cliente y se guardara este movimiento
- Caminos alternativos:
1. En el caso 2, si el cliente no puede entrar a la cuenta no se podrá ejecutar ninguna operación
2. En el caso 3, si el cliente quiere retirar o pagar una suma de dinero mayor a la que posee en su cuenta bancaria, no se podrá realizar la acción
Cuyo resultado será:
~~~
![Casos de uso](/casosdeusosiete.PNG)

**Caso de uso 8**
~~~
- Caso de uso: visualizar datos cuentas
- Actores involucrados: clientes y banco
-	Precondición: la persona debe haberse afiliado al banco y el banco tiene que existir
-	Flujo básico:
1.	El cliente desea ver la información, de los datos del perfil, los movimientos ocurridos en su cuenta bancaria, los datos de la cuenta bancaria, sus propios datos y los préstamos que pueda haber pedido
2.	El cliente tendrá que entrar en la cuenta
3.	En el podrá ver todos los datos que quiera de si mismo
-	Caminos alternativos:
1.	En el caso 2, si el cliente no puede entrar a su cuenta no se podrá realizar la acción
2.	En el caso 2, si el cliente no está afiliado al banco, no se podrá realizar está acción
3.	En el caso 3, si el cliente no ha pedido ningún préstamoS, no se podrán ver estos datos
Cuyo resultado será:
~~~
![Casos de uso](/casosdeusoocho.PNG)

El esquema de casos de uso quedaría de esta forma:

![Esquema final casos de uso](/EsquemaCasoDeUso.drawio.png)

En resumen, el proyecto final es este:
![Esquema final proyecto](/esquemaProyectoFinal.drawio.png)

## Bases de datos
Este es el diagrama oficial de la base de datos que hemos utilizado en este proyecto:

![Esquema bases de datos](/esquemaBaseDatos.PNG)

Esta base de datos cuenta con triggers, de tal forma que la funcionalidad de la base de datos se pueda utilizar en un banco real, en otras palabras, estos triggers pueden hacer que la cantidad de dinero que se ingrese o se saque, se actualice en tiempo real a la vez que actualice la cantidad a pagar final de los préstamos.

También cuenta con un informe en el que se muestran todos los préstamos de Mayo del año actual.

Cabe decir que por cada vez que se ingrese o se saque dinero, esto se reflejará también en los movimientos de la cuenta bancaria. Haciendo un seguimiento continuo del movimiento del dinero en la cuenta del cliente.

## Lenguaje de marcas
Se ha realizado la cara visible de la empresa, es decir, la página web, que sirve para promocionar un banco.

En cuanto al diseño, tanto de página como del logo, nos hemos basado en una forma circular, minimalista y sencilla. 

La imagen de la página se centra sobretodo en colores llamativos y con correlación.

En cuanto a la página web, se ha buscado que fuera bonito visualmente, pero también funcional. Esta cuenta con:
-Posibilidad de registro y logueo.
-Forma de contacto rápida y fácil.
-Preguntas resueltas más frecuentes de los usuarios.
-Mostrar las funcionalidades del banco.
-Se pueden consultar los préstamos de manera eficaz.


## Programación

En este proyecto hemos realizado una aplicación para gestionar los clientes que tienen derecho a solicitar préstamos, y así poder preconcederlos en base a unos parámetros determinados.
> Por ejemplo: Si existe morosidad.

También hemos tenido en cuenta que los clientes puedan inscribirse en el banco, realizar operaciones, ver los datos de su cuenta o modificar los datos de su propio perfil.

Por último, hemos gestionado la aplicación para que el propio empleado pueda visualizar todos los clientes, todos los préstamos preconcedidos/concedidos (también buscar por localidad) y obviamente conceder dichos préstamos.

En cuanto al diseño, hemos decidido basarnos en la página web, ya que aparte del morado, nuestra página se basa en los colores azul y blanco, nos hemos propuesto realizar un diseño minimalista y funcional, ya que así el empleado puede visualizar con fácilidad lo que requiera el cliente en el momento, ya que nuestro objetivo siempre ha sido hacer una aplicación que sea rápida, eficaz e innovadora.

En cuanto a los objetivos pedidos por el cliente hemos realizado las siguientes modificaciones:
~~~
- Recogida de datos de cada uno de los clientes.
```
println ("");
```
![Casos de uso](/)
- Muestra de datos recogidos.
- Cálculo de los préstamos de todos los clientes.
- Muestra de datos de la concesión de un cliente concreto.
- Muestra de datos de las concesiones de varios clientes en función de la localidad.
~~~

