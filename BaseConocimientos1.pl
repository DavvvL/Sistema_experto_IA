/* ====================================================================
   BaseConocimientos1.pl - Diagnostico Medico, Prevencion y Tratamiento
   ==================================================================== */

% --- HECHOS DE CONOCIMIENTO (Diagnosticos y Sintomas) ---

conocimiento('sarampion', [
    'el paciente esta cubierto de puntos',
    'el paciente tiene temperatura alta',
    'el paciente tiene ojos rojos',
    'el paciente tiene tos seca',
    'el paciente tiene malestar general'
]).

conocimiento('influenza', [
    'el paciente tiene dolor en las articulaciones',
    'el paciente tiene mucho estornudo',
    'el paciente tiene dolor de cabeza',
    'el paciente tiene fiebre',
    'el paciente tiene congestion nasal'
]).

conocimiento('malaria', [
    'el paciente tiene temperatura alta',
    'el paciente tiene dolor en las articulaciones',
    'el paciente tiembla violentamente',
    'el paciente tiene escalofrios',
    'el paciente tiene sudoracion excesiva'
]).

conocimiento('gripe', [
    'el paciente tiene cuerpo cortado',
    'el paciente tiene dolor de cabeza',
    'el paciente tiene temperatura alta',
    'el paciente tiene congestion nasal',
    'el paciente tiene dolor de garganta'
]).

conocimiento('tifoidea', [
    'el paciente tiene falta de apetito',
    'el paciente tiene temperatura alta',
    'el paciente tiene dolor abdominal',
    'el paciente tiene dolor de cabeza',
    'el paciente tiene diarrea'
]).

conocimiento('hepatitis A', [
    'el paciente tiene coloracion amarilla en la piel',
    'el paciente tiene orina oscura',
    'el paciente tiene fiebre',
    'el paciente tiene nauseas',
    'el paciente tiene dolor en el lado derecho del abdomen'
]).

conocimiento('dengue', [
    'el paciente tiene fiebre alta',
    'el paciente tiene dolor detras de los ojos',
    'el paciente tiene dolor en los musculos',
    'el paciente tiene sarpullido',
    'el paciente tiene nauseas'
]).

conocimiento('covid-19', [
    'el paciente tiene fiebre',
    'el paciente tiene tos seca',
    'el paciente tiene perdida del olfato',
    'el paciente tiene dificultad para respirar',
    'el paciente tiene dolor de garganta'
]).

conocimiento('bronquitis', [
    'el paciente tiene tos con flema',
    'el paciente tiene dolor en el pecho',
    'el paciente tiene dificultad para respirar',
    'el paciente tiene fatiga',
    'el paciente tiene fiebre leve'
]).

conocimiento('asma', [
    'el paciente tiene sibilancias',
    'el paciente tiene dificultad para respirar',
    'el paciente tiene opresion en el pecho',
    'el paciente tiene tos frecuente',
    'el paciente tiene fatiga al hacer ejercicio'
]).


% --- PREVENCIoN ---

prevencion('sarampion', 'Vacunacion con la vacuna triple virica (SRP: sarampion, rubeola, parotiditis).').
prevencion('influenza', 'Vacunacion anual contra la influenza, lavado frecuente de manos y distanciamiento con personas enfermas.').
prevencion('malaria', 'Uso de mosquiteros con insecticida, repelentes de insectos, ropa de manga larga y quimioprofilaxis al viajar a zonas endemicas.').
prevencion('gripe', 'Lavado correcto de manos, evitar tocarse el rostro, ventilacion de espacios y evitar contacto con personas infectadas.').
prevencion('tifoidea', 'Consumo de agua potable o hervida, lavado de manos antes de comer, higiene alimentaria y vacunacion en areas de riesgo.').
prevencion('hepatitis A', 'Vacunacion contra la Hepatitis A, consumo de agua segura/embotellada y lavado riguroso de manos.').
prevencion('dengue', 'Eliminar criaderos de mosquitos (recipientes con agua estancada), uso de repelente y colocar mosquiteros en puertas y ventanas.').
prevencion('covid-19', 'Esquema de vacunacion al dia, uso de mascarillas en espacios cerrados o con alta concurrencia, ventilacion adecuada y lavado de manos.').
prevencion('bronquitis', 'Evitar el humo de tabaco y contaminantes ambientales, vacunacion contra la gripe y el neumococo, y lavado de manos.').
prevencion('asma', 'Identificar y evitar desencadenantes (polvo, acaros, humo, polen, cambios bruscos de temperatura) y adherencia a inhaladores preventivos.').


% --- TRATAMIENTO ---

tratamiento('sarampion', 'Reposo, hidratacion abundante, antipireticos para la fiebre y suplementos de vitamina A bajo supervision medica.').
tratamiento('influenza', 'Antivirales especificos (como oseltamivir) prescritos tempranamente, descanso, liquidos y analgesicos.').
tratamiento('malaria', 'Medicamentos antipaludicos prescriptos por un medico, como la terapia combinada basada en la artemisinina (TCA).').
tratamiento('gripe', 'Sintomatico: reposo, consumo de abundantes liquidos, descongestionantes y analgesicos para aliviar el dolor y la fiebre.').
tratamiento('tifoidea', 'Tratamiento con antibioticos especificos recetados por un medico, rehidratacion oral o intravenosa y reposo.').
tratamiento('hepatitis A', 'No existe tratamiento antiviral especifico; se recomienda reposo, nutricion adecuada, hidratacion y evitar el consumo de alcohol o farmacos hepatotoxicos.').
tratamiento('dengue', 'Hidratacion oral constante, reposo absoluto y uso de paracetamol para la fiebre/dolor. Evitar aspirina e ibuprofeno por riesgo de sangrado.').
tratamiento('covid-19', 'Aislamiento, reposo, analgesicos/antipireticos, monitoreo de la oxigenacion y tratamiento antiviral o medico especializado en casos severos.').
tratamiento('tratamiento', 'Reposo, hidratacion, uso de humidificadores, medicamentos broncodilatadores si hay sibilancias y analgesicos.').
tratamiento('asma', 'Uso de inhaladores de rescate (broncodilatadores de accion rapida) durante crisis y corticoesteroides inhalados como control a largo plazo.').