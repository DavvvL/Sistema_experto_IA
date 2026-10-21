import re

class SistemaExpertoSimple:
    def __init__(self, ruta_pl):
        self.base_conocimiento = self._cargar_pl(ruta_pl)
        self.respuestas = {}  # Guarda 'si' o 'no' para cada síntoma

    def _cargar_pl(self, ruta):
        # Extrae diagnósticos y síntomas del archivo .pl a un diccionario 
        # donde la clave es el diagnóstico y el valor es lista de síntomas
        base = {}
        with open(ruta, 'r', encoding='utf-8') as f:
            contenido = f.read()

        # Usa expresiones regulares para identificar los síntom
        patron = r"conocimiento\s*\(\s*'([^']+)'\s*,\s*\[(.*?)\]\s*\)\s*\."
        for diagnostico, lista_str in re.findall(patron, contenido, re.DOTALL):
            sintomas = re.findall(r"'([^']+)'", lista_str)
            base[diagnostico] = sintomas
        return base

    def preguntar_sintoma(self, diagnostico, sintoma):
        # Gestiona la pregunta al usuario y la opción porque
        if sintoma in self.respuestas:
            return self.respuestas[sintoma]

        while True:
            resp = input(f"¿Es verdad que {sintoma}? (si/no/porque): ").strip().lower()

            if resp == 'si':
                self.respuestas[sintoma] = True
                return True
            elif resp == 'no':
                self.respuestas[sintoma] = False
                return False
            elif resp == 'porque':
                print(f"\n -> [POR QUÉ]: Estoy evaluando '{diagnostico}' y necesito verificar si presentas: {sintoma}.\n")
            else:
                print(" -> Opción no válida. Responde con 'si', 'no' o 'porque'.")

    def ejecutar(self):
        # Evaluación principal de diagnósticos
        print("=== INICIANDO SISTEMA EXPERTO ===")
        self.respuestas.clear()
        diagnostico_hallado = None
        sintomas_hallados = []

        # Recorre cada diagnóstico
        for diagnostico, sintomas in self.base_conocimiento.items():
            cumple_todos = True

            for sintoma in sintomas:
                if not self.preguntar_sintoma(diagnostico, sintoma):
                    cumple_todos = False
                    break  # Si un síntoma es falso, descarta esta hipótesis

            if cumple_todos:
                diagnostico_hallado = diagnostico
                sintomas_hallados = sintomas
                break

        # Mostrar Resultado
        print("\n=================================")
        if diagnostico_hallado:
            print(f"Resultado: El diagnóstico es '{diagnostico_hallado}'.")
            self.ofrecer_explicacion(sintomas_hallados)
        else:
            print("Resultado: No se pudo determinar un diagnóstico con la información proporcionada.")
        print("=================================\n")

    def ofrecer_explicacion(self, sintomas):
        """Ofrece justificación opcional al finalizar"""
        while True:
            resp = input("\n¿Quieres que justifique este diagnóstico? (si/no): ").strip().lower()
            if resp == 'si':
                print("\nJustificación: Se concluyó este diagnóstico porque confirmaste los siguientes síntomas:")
                for s in sintomas:
                    print(f" - {s}")
                break
            elif resp == 'no':
                break
            else:
                print("Responde únicamente 'si' o 'no'.")


# --- Uso del Sistema ---
if __name__ == "__main__":
    # Carga tu archivo .pl (ej: 'conocimiento.pl')
    se = SistemaExpertoSimple('BaseConocimientos3.pl')
    se.ejecutar()