extends Control

var dialog = [
	"El aire se vuelve pesado y helado cuando la puerta cede, rechinando con un sonido seco que rasga el silencio.",
	"El portón chirrió una última vez, cerrándose tras ella con un eco que parecía enterrar los horrores del interior.",
	"Había escapado.",
	"El aire fresco llenó sus pulmones como si respirara por primera vez en siglos, pero el temblor en sus manos le recordaba cada segundo de su huida.",
	"Miró hacia atrás una última vez, hacia aquella fortaleza sombría que casi se convirtió en su tumba.",
	"No era solo un lugar que dejaba atrás; era el peso de la oscuridad, el engaño, y el dolor.",
	"Con cada paso que daba, su miedo se transformaba en fuerza.",
	"La promesa de no ser nunca más la víctima, de contar la verdad y advertir a otras, se encendió en su pecho.",
	"Las sombras podían haberla marcado, pero no la habían destruido."
]

var text_speed = 0.05  # Velocidad de escritura (en segundos)
var dialog_index = 0  # Índice del diálogo actual
var char_index = 0  # Índice del carácter actual
var current_text = ""  # Texto que se está mostrando

func _ready():
	$RichTextLabel.clear()  # Limpia el texto del label
	_show_next_character()  # Comienza a mostrar el diálogo

func _show_next_character():
	if dialog_index < dialog.size():
		# Si hay texto por escribir en la línea actual
		if char_index < dialog[dialog_index].length():
			current_text = dialog[dialog_index]
			$RichTextLabel.bbcode_text = current_text.substr(0, char_index + 1)  # Actualiza el texto visible
			char_index += 1
			await get_tree().create_timer(text_speed).timeout  # Espera un tiempo antes de escribir el siguiente carácter
			_show_next_character()  # Llama nuevamente para continuar la animación
		else:
			# Una vez terminada la línea actual, pasa a la siguiente
			dialog_index += 1
			char_index = 0
			await get_tree().create_timer(1.0).timeout  # Pausa de 1 segundo antes de la próxima línea
			_show_next_character()
	else:
		print("Diálogo completado")  # Mensaje opcional cuando el diálogo finaliza
		get_tree().change_scene_to_file("res://Player/final_juego.tscn")
