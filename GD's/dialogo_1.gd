extends Control

var dialog1 = [
	"Desde el momento en que Barba Azul le entregó la llave prohibida, una inquietud creció en su interior, como un eco persistente que no podía ignorar.",
	"Cada advertencia suya, cada mirada esquiva que le lanzaba, alimentaban su certeza: había algo que debía saber.",
	"No era simple curiosidad lo que la empujaba; era la necesidad de entender qué se escondía tras las sombras de ese hombre.",
	"Si algo le enseñó su tiempo bajo aquel techo, es que el peligro se oculta bajo promesas dulces y secretos celosamente guardados.",
	"Con el corazón palpitando con fuerza y la llave temblando en su mano, decidió enfrentar aquello que Barba Azul nunca quiso que viera.",
	"Si entrar significaba desatar la verdad, entonces estaba lista para encararla, sin importar cuán aterradora pudiera ser."
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
		get_tree().change_scene_to_file("res://Player/mansion_p_0.tscn")
