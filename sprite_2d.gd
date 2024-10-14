extends CharacterBody2D

# Velocidad de movimiento del jugador
@export var speed: float = 300.0

# Función que se ejecuta en cada frame
func _process(delta):
	# Crear un vector para el movimiento basado en la entrada
	var movement_vector = Vector2.ZERO

	# Detectar la entrada con WASD
	if Input.is_key_pressed(KEY_W):
		movement_vector.y -= 1
	if Input.is_key_pressed(KEY_S):
		movement_vector.y += 1
	if Input.is_key_pressed(KEY_A):
		movement_vector.x -= 1
	if Input.is_key_pressed(KEY_D):
		movement_vector.x += 1

	# Detectar la entrada con las flechas direccionales
	if Input.is_key_pressed(KEY_UP):
		movement_vector.y -= 1
	if Input.is_key_pressed(KEY_DOWN):
		movement_vector.y += 1
	if Input.is_key_pressed(KEY_LEFT):
		movement_vector.x -= 1
	if Input.is_key_pressed(KEY_RIGHT):
		movement_vector.x += 1

	# Normalizar el vector para que la velocidad sea constante en diagonal
	if movement_vector != Vector2.ZERO:
		movement_vector = movement_vector.normalized()

	# Mover al jugador multiplicando el vector de movimiento por la velocidad y el delta
	velocity = movement_vector * speed
	move_and_slide()
