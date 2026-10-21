% BaseConocimientos3: diagnostico de redes informaticas
% Dominio: fallas en redes. Trata los sintomas como una lista multi-elementos

conocimiento('fallo de conexion a internet', ['no hay acceso a sitios web', 'el router no responde', 'el dispositivo no obtiene direccion IP', 'el icono de red muestra error', 'no hay respuesta al hacer ping']).
conocimiento('conexion intermitente', ['perdida de paquetes', 'velocidad de internet baja', 'desconexiones frecuentes', 'latencia variable', 'reconexiones automaticas']).
conocimiento('servidor caido', ['no se puede acceder a un servicio', 'error 500 en la web', 'respuestas lentas del servidor', 'el servidor no responde al ping', 'se agota el tiempo de espera de conexion']).
conocimiento('DNS no responde', ['no se pueden resolver direcciones web', 'errores de DNS en la configuracion', 'el navegador indica problema de DNS', 'la IP funciona pero el dominio no', 'servidores DNS inalcanzables']).
conocimiento('router defectuoso', ['el router se reinicia solo', 'no emite senal Wi-Fi', 'se calienta demasiado', 'la configuracion se pierde', 'no permite conexiones simultaneas']).
conocimiento('interferencia en Wi-Fi', ['baja velocidad de conexion', 'senal inestable', 'perdida de paquetes en Wi Fi', 'frecuentes cambios de canal', 'cortes aleatorios']).
conocimiento('cables danados', ['no hay conexion de red', 'el cable de red esta roto o pelado', 'conectores RJ45 danados', 'la red se conecta solo si se mueve el cable', 'fallos intermitentes de red']).
conocimiento('mala configuracion de red', ['no hay acceso a internet', 'direccion IP incorrecta', 'configuracion de proxy erronea', 'conflicto de direcciones IP', 'sin puerta de enlace predeterminada']).
conocimiento('firewall bloqueando conexion', ['algunas aplicaciones no se conectan', 'el firewall muestra bloqueos frecuentes', 'se requiere desactivacion temporal del firewall', 'servicios internos inaccesibles', 'reglas demasiado restrictivas']).
conocimiento('problema con proveedor de internet', ['internet se cae constantemente', 'alta latencia en juegos o streaming', 'varios usuarios afectados en la zona', 'sin acceso a ciertos sitios web', 'atencion al cliente confirma falla masiva']).

prevencion('fallo de conexion a internet', 'mantener el firmware del router actualizado y verificar las conexiones fisicas regularmente').
prevencion('conexion intermitente', 'evitar el sobrecalentamiento del equipo de red y colocar el router en una zona abierta sin obstrucciones').
prevencion('servidor caido', 'implementar balanceo de carga y tener servidores de respaldo configurados').
prevencion('DNS no responde', 'configurar servidores DNS alternativos de confianza en la red como los de Google o Cloudflare').
prevencion('router defectuoso', 'conectar el router a un regulador de voltaje y ubicarlo en un lugar ventilado').
prevencion('interferencia en Wi-Fi', 'alejar el router de dispositivos que emitan ondas electromagneticas como microondas o telefonos inalambricos').
prevencion('cables danados', 'organizar los cables con canaletas y evitar dobleces extremos o pisarlos con muebles').
prevencion('mala configuracion de red', 'utilizar DHCP para la asignacion automatica de direcciones y documentar correctamente las IP estaticas asignadas').
prevencion('firewall bloqueando conexion', 'auditar regularmente las reglas del firewall y probar los cambios en un entorno seguro antes de aplicarlos').
prevencion('problema con proveedor de internet', 'contratar un servicio de internet de respaldo si la disponibilidad de la red es critica para el lugar').

tratamiento('fallo de conexion a internet', 'reiniciar el router y el modem, y verificar que las luces de estado esten encendidas correctamente').
tratamiento('conexion intermitente', 'cambiar el canal de la red Wi-Fi y verificar si hay interferencias con otros aparatos').
tratamiento('servidor caido', 'reiniciar los servicios del servidor y revisar los registros de errores del sistema operativo').
tratamiento('DNS no responde', 'cambiar los DNS del equipo de forma manual y limpiar la cache DNS desde la terminal').
tratamiento('router defectuoso', 'restablecer el router a sus valores de fabrica o reemplazar el equipo si el fallo de hardware persiste').
tratamiento('interferencia en Wi-Fi', 'utilizar la banda de 5 GHz en lugar de la de 2.4 GHz y analizar los canales menos saturados').
tratamiento('cables danados', 'reemplazar el cable defectuoso por uno nuevo o ponchar nuevamente los conectores RJ45 con las normas T568A o T568B').
tratamiento('mala configuracion de red', 'revisar la configuracion TCP IP del equipo y renovar la concesion de la direccion IP').
tratamiento('firewall bloqueando conexion', 'agregar excepciones para las aplicaciones bloqueadas o ajustar las reglas de filtrado de puertos de entrada y salida').
tratamiento('problema con proveedor de internet', 'contactar al soporte tecnico del proveedor para reportar el problema y esperar la resolucion de la falla externa').