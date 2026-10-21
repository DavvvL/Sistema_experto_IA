/* Sistema Experto: experto.pl
Trata los sintomas como una lista. La cabeza es el diagnostico y la "cola" son los sintomas.
Utiliza assert/1 para cambiar dinamicamente la base de conocimientos.
Determina la verdad y falsedad de los sintomas conocidos.
Puede contestar a las preguntas 'porque' e incluye capacidad de explicacion.
Elimina dinamicamente las aseveraciones agregadas despues de cada consulta.
*/

% Declara conocido/1 como dinamico para poder agregar y eliminar
% respuestas del usuario durante la ejecucion del sistema.
:- dynamic conocido/1.

% Punto de entrada principal: intenta hallar un diagnostico,
% mostrarlo, ofrecer su explicacion y limpiar la memoria temporal.
consulta :-
    haz_diagnostico(X),
    escribe_diagnostico(X),
    ofrece_explicacion_diagnostico(X),
    clean_scratchpad.

% Segunda regla de consulta: se activa cuando ninguna hipotesis
% puede demostrarse con la informacion disponible.
consulta :-
    write('No hay suficiente conocimiento para elaborar un diagnostico.'), nl,
    clean_scratchpad.

% Busca una hipotesis candidata y verifica si todos sus sintomas
% pueden demostrarse como verdaderos.
haz_diagnostico(Diagnosis) :-
    obten_hipotesis_y_sintomas(Diagnosis, ListaDeSintomas),
    prueba_presencia_de(Diagnosis, ListaDeSintomas).

% Recupera de la base de conocimiento un diagnostico y la lista
% de sintomas asociados a ese diagnostico.
obten_hipotesis_y_sintomas(Diagnosis, ListaDeSintomas) :-
    conocimiento(Diagnosis, ListaDeSintomas).

% Caso base: si ya no quedan sintomas por revisar, la hipotesis
% se considera satisfecha.
prueba_presencia_de(_, []).

% Caso recursivo: verifica el sintoma actual y continua con el resto.
prueba_presencia_de(Diagnosis, [Head | Tail]) :-
    prueba_verdad_de(Diagnosis, Head),
    prueba_presencia_de(Diagnosis, Tail).

% Si el sintoma ya fue confirmado antes, se acepta sin preguntar de nuevo.
prueba_verdad_de(_, Sintoma) :-
    conocido(Sintoma).

% Si el sintoma aun no esta marcado como falso, el sistema pregunta
% al usuario. Solo se acepta esta ruta cuando la respuesta es si.
prueba_verdad_de(Diagnosis, Sintoma) :-
    not(conocido(is_false(Sintoma))),
    pregunta_sobre(Diagnosis, Sintoma, Reply),
    Reply = si.

% Formula la pregunta al usuario y envia la respuesta al predicado
% process/4, que decide como almacenarla o validarla.
pregunta_sobre(Diagnosis, Sintoma, Reply) :-
    write('Es verdad que '),
    write(Sintoma), write('? '),
    read(Respuesta),
    process(Diagnosis, Sintoma, Respuesta, Reply).

% Si el usuario responde si, el sintoma se guarda como conocido.
process(_, Sintoma, si, si) :-
    asserta(conocido(Sintoma)).

% Si el usuario responde no, el sintoma se guarda como falso.
process(_, Sintoma, no, no) :-
    asserta(conocido(is_false(Sintoma))).

% Si el usuario responde porque, el sistema explica la hipotesis
% que esta intentando comprobar y vuelve a formular la pregunta.
process(Diagnosis, Sintoma, porque, Reply) :-
    nl,
    write('Estoy investigando la hipotesis siguiente: '),
    write(Diagnosis), write('.'), nl,
    write('Para esto necesito saber si '),
    write(Sintoma), write('.'), nl,
    pregunta_sobre(Diagnosis, Sintoma, Reply).

% Si la respuesta no es valida, se informa al usuario y se vuelve a preguntar.
process(Diagnosis, Sintoma, Respuesta, Reply) :-
    Respuesta \== no,
    Respuesta \== si,
    Respuesta \== porque, nl,
    write('Debes contestar si, no o porque.'), nl,
    pregunta_sobre(Diagnosis, Sintoma, Reply).

% Muestra el diagnostico final encontrado.
escribe_diagnostico(Diagnosis) :-
    write('El diagnostico es '),
    write(Diagnosis), write('.'), nl.

% Pregunta al usuario si desea una explicacion del diagnostico.
ofrece_explicacion_diagnostico(Diagnosis) :-
    pregunta_si_necesita_explicacion(Respuesta),
    actua_consecuentemente(Diagnosis, Respuesta).

% Lee la respuesta del usuario y verifica que sea si o no.
pregunta_si_necesita_explicacion(Respuesta) :-
    write('Quieres que justifique este diagnostico? '),
    read(RespuestaUsuario),
    asegura_respuesta_si_o_no(RespuestaUsuario, Respuesta).

% Acepta una respuesta afirmativa.
asegura_respuesta_si_o_no(si, si).

% Acepta una respuesta negativa.
asegura_respuesta_si_o_no(no, no).

% Si la respuesta no es valida, vuelve a preguntar.
asegura_respuesta_si_o_no(_, Respuesta) :-
    write('Debes contestar si o no.'), nl,
    pregunta_si_necesita_explicacion(Respuesta).

% Si el usuario no desea explicacion, el sistema termina esta parte.
actua_consecuentemente(_, no).

% Si el usuario pide justificacion, se recuperan los sintomas de la
% hipotesis aceptada y se muestran uno por uno.
actua_consecuentemente(Diagnosis, si) :-
    conocimiento(Diagnosis, ListaDeSintomas),
    write('Se determino este diagnostico porque se encontraron los siguientes sintomas:'), nl,
    escribe_lista_de_sintomas(ListaDeSintomas).

% Caso base para terminar de imprimir la lista de sintomas.
escribe_lista_de_sintomas([]).

% Imprime un sintoma por linea y continua con el resto de la lista.
escribe_lista_de_sintomas([Head | Tail]) :-
    write(Head), nl,
    escribe_lista_de_sintomas(Tail).

% Elimina todos los hechos temporales agregados durante la consulta.
clean_scratchpad :-
    retract(conocido(_)), fail.
clean_scratchpad.

% Si no hay informacion almacenada en conocido/1, este predicado falla.
conocido(_) :- fail.

% Implementacion manual de negacion por falla.
not(X) :- X, !, fail.
not(_).