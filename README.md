# 🌱 Semillas al viento 🌱 - 17

<img src="images/huerta.jpg" width="500px" />

A raíz de la [polémica](https://www.elancasti.com.ar/opinion/2018/11/27/ley-cuestionada-389812.html) reciente sobre la posibilidad de que se modifique la [Ley de semillas y creaciones fitogenéticas, Nº 20.247](http://servicios.infoleg.gob.ar/infolegInternet/anexos/30000-34999/34822/texact.htm), una organización de pequeños productores nos pidió crear una aplicación para poder medir mejor el desempeño de sus huertas.

## 1. Plantas

Comenzaremos modelando a cada una de las plantas que hay en la huerta, de las cuales podemos configurar los siguientes aspectos:

* el **año de obtención** de la semilla. Es decir, en qué año la semilla que le dio origen se sacó de su planta "madre";
* la **altura** que tiene, medida en metros.

Además, queremos poder preguntarle:

* cuántas **horas de sol tolera**;
* si **es fuerte** o no;
* si **da nuevas semillas** o no;
* cuánto **espacio** ocupa una vez plantada, medido en metros cuadrados.

De todos ellos, el año de obtención y la altura se configuran para cada planta; el resto se calcula en función de la especie y de características generales.

Se dice que una planta **es fuerte** si tolera más de 9 horas de sol al día, esto es igual para todas las plantas. En principio, las plantas toleran 7 horas de sol por día, esto cambia para algunos tipos de planta (ver más abajo).

Otro aspecto que nos interesa es saber si **da nuevas semillas**, para lo cual se tiene que cumplir que la planta sea fuerte _o bien_ una condición alternativa, que define cada especie. En cuanto al **espacio que ocupa**, depende pura y exclusivamente de características de la especie.

Contemplaremos las especies que se detallan a continuación.

### Menta
Como condición alternativa para saber si da semillas, 
hay que mirar si el espacio que ocupa es mayor a 1.5 metros cuadrados. 
Como crece al ras del suelo, diremos que el espacio que ocupa es su altura más un metro cuadrado.

Ejemplos:
* una menta de 1 metro, debería dar semillas y ocupar un espacio de 2 metros cuadrados.
* una menta de solo 0.3 metros, no debería dar semillas y ocuparía 1.3 metros cuadrados de espacio.

### Soja
La tolerancia al sol depende de su altura:
* menor a 0.5 metros: 6 horas;
* entre 0.5 y 1 metro: 8 horas;
* más de 1 metro: 12 horas;

La condición alternativa para que de semillas es que su propia semilla sea posterior al 2007 y además su altura esté entre 0.75 y 0.9 metros. El espacio que ocupa es la mitad de su altura.

Por ejemplo, si tuviesemos una soja de 0.6 metros y de semilla de 2009, la planta tendría una tolerancia al sol de 8 horas, no daría semillas y ocuparía 0.3 metros cuadrados.

### Quinoa
Existen muchas cepas de esta nutritiva planta andina y es por eso que la cantidad de espacio que ocupa la configuraremos para cada planta.
Si ocupa menos de 0.3 m2, entonces tolera 10 horas de sol al día; si no, corre el valor genérico. 
La condición alternativa para saber si da semillas es que el año de obtención de la semilla que le dio origen sea anterior al 2005.

Por ejemplo:
* si tenemos una quinoa que ocupa 0.2 m2 y su semilla de origen es de 2010, se trata de una planta que da semillas.
* si tenemos una planta que ocupa 0.9 m2 pero cuya semilla de origen es de 2003, también da semillas.

## 2. Variedades

Agregar al modelo la soja transgénica y la peperina, que son similares a la soja y a la menta respectivamente, pero con algunas diferencias.

La **soja transgénica** nunca da nuevas semillas, porque las empresas que las comercializan las someten adrede a un proceso de esterilización (que les asegura no perder nunca a su clientes). _Ojo_: la consulta siempre tiene que dar falso, incluso si se cumple la condición general.

La **peperina** se esparce más rápido que la menta y por eso el espacio que ocupa es el doble del que ocuparía una planta de menta de las mismas características.

## 3. Parcelas

De cada parcela se conoce:
* su **ancho** y su **largo**, medidos en metros. (Para evacuar dudas: sí, van en dos atributos distintos.);
* cuántas **horas de sol** recibe por día;
* las **plantas** que tiene, representadas por una colección.

Y se pide:
* conocer la **superficie** de la parcela, que se calcula... multiplicando `ancho` por `largo`;
* saber la **cantidad máxima** de plantas que tolera, que se calcula de la siguiente manera: si el `ancho` es mayor que el `largo`, la cuenta es `superficie / 5`; si no `superficie / 3 + largo`;
* saber si **tiene sangre joven**, lo cual es así si la semilla que dio origen a alguna de las plantas es posterior a 2012 ;
* poder **plantar una planta** que se recibe por parámetro. El efecto que produce es que se agregue a la colección. Esto debe arrojar un error si al plantar se supera la cantidad máxima _o bien_ si la parcela recibe al menos 2 horas más de sol que los que la planta tolera.

Un ejemplo:

Una parcela de 20 metros de ancho por 1 metro de largo que recibe 10 horas de sol por día, tiene una superficie de 20 metros cuadrados y la cantidad máxima de plantas que tolera es 4.

Si a esa parcela le plantamos 4 plantas de soja de más de 1 metro (que toleran 12 horas de sol), todas con semilla de 2010, no tendría sangre joven. Si intentaramos agregar una quinta planta, se superaría la cantidad máxima y nos arrojaría un error.


## 4. Parcelas ideales

Cada planta define ciertas condiciones para saber si una parcela le resulta ideal:

* la **menta** prefiere suelos extensos, por lo cual le resultan ideales las parcelas con una superficie mayor a 6 metros cuadrados. La peperina, como buena menta que es, se comporta igual;
* la **quinoa** es bajita y por eso anda mejor en parcelas en las que no haya ninguna planta cuya altura supere los 1.5 metros;
* la **soja común** va bien si la cantidad de sol que recibe la parcela es exactamente igual a los que ella tolera;
* la **soja transgénica** está pensada como monocultivo, así que prefiere parcelas cuya cantidad máxima de plantas sea igual a 1.

Agregar a las plantas la capacidad de decir si una parcela le resulta ideal.

## 5. Asociación de plantas

La asociación de plantas es una práctica ancestral que busca maximizar los beneficios de las plantas al plantarlas en conjunto con otras que de alguna manera potencian sus beneficios. Para modelar esto, debemos previamente diferenciar las parcelas en dos tipos: las ecológicas y las industriales.

Para saber si una planta **se asocia bien** dentro de una parcela, hay que tener en cuenta:
* para las **parcelas ecológicas**: que la parcela tenga sangre joven y sea ideal para la planta;
* para las **parcelas industriales**: que haya como máximo 2 plantas y que la planta en cuestión sea fuerte.

## 6. Estadísticas del INTA

Al Instituto Nacional de Tecnología Agropecuaria (INTA), le interesa realizar una serie de estadísticas sobre todas las parcelas del país. Para ello, agregaremos al modelo un objeto único que represente al INTA, en el cual mantendremos una colección de parcelas.

Se pide realizar dos estadísticas:
* el **promedio de plantas** por parcela. Recordar para esto que un promedio se calcula como la suma (de plantas que hay en cada parcela) dividido por la cantidad (de parcelas que existen);
* obtener la parcela **más autosustentable**. Para esto, solo consideraremos aquellas parcelas con más de 4 plantas y elegiremos aquella que tenga mayor porcentaje de plantas "bien asociadas" (ver etapa 5).
