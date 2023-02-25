extends HitObject
class_name NoteObject

var note:Map.Note
var spawn_distance:float = 50
var colour:Color

func _init(_id:String="",_note:Map.Note=null,_colour:Color=Color.RED):
	super._init(_id)
	self.note = _note
	colour = _colour
	scale = Vector3.ONE*0.865

func _physics_process(_delta):
	var time = note.time-game.sync_manager.current_time
	can_hit = hittable and time <= 0 and hit_state == HitState.NONE

func update(current_time:float):
	var time = (note.time-current_time)/(note.time-spawn_time)
	transform.origin = Vector3(-note.x+1,-note.y+1,time*spawn_distance)

func visible_at(current_time:float):
	if hit_state != HitState.NONE: return false
	var time = note.time-current_time
	return time <= 1
