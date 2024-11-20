extends Control

var dialog1 = [
	"El aire se vuelve pesado y helado cuando la puerta cede, rechinando con un sonido seco que rasga el silencio.",
	"La oscuridad de la habitación cede lentamente a la luz temblorosa que entra tras ella, revelando figuras inmóviles, pálidas y cubiertas de polvo.",
	"El hedor de la muerte y la podredumbre golpea su rostro, obligándola a contener el aliento mientras el terror se instala en su pecho como un nudo.",
	"Allí, alineadas y despojadas de vida, yacen las mujeres que le precedieron: sus ojos vacíos aún parecen implorar escape.",
	"Un escalofrío le recorre la espalda; no es sólo el horror lo que siente, sino la certeza de que ella estaba destinada a ser la siguiente."

]

var text_speed = 0.05  # Velocidad de escritura (en segundos)
var dialog_index = 0  # Índice del diálogo actual
var char_index = 0  # Índice del carácter actual
var current_text = ""  # Texto que se está mostrando

func _ready():
	$RichTextLabel.clear()  # Limpia el texto del label
	_show_next_character()  # Comienza a mostrar el diálogo

func _show_next_character():
	if dialog_index < dialog1.size():
		# Si hay texto por escribir en la línea actual
		if char_index < dialog1[dialog_index].length():
			current_text = dialog1[dialog_index]
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
		get_tree().change_scene_to_file("res://Player/MansionP1.tscn")
