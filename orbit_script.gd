extends Spatial
tool

export var distance: float=10.0
export var NodeInOrbit: NodePath
export var rotation_in_orbit : float=3.141593

var node_orbit: Spatial
var node_to_orbit: Spatial
var no:Vector2
var nt:Vector2

func _ready():
	node_to_orbit=get_parent()
	node_orbit=get_node(NodeInOrbit)
	nt=Vector2(node_to_orbit.translation.x,node_to_orbit.translation.z)
	no=Vector2(node_orbit.translation.x,node_orbit.translation.z)
	rotation_in_orbit = nt.angle_to_point(no)
#	PI    : Graus em 0
#	PI/2  : Graus em 90
#	0/PI*2: Graus em 180
#	PI*3/2: Graus em 270
	

func _process(delta):
	if node_orbit!=null:
		node_orbit.translation.x=(sin(rotation_in_orbit)*distance)+node_to_orbit.translation.x
		node_orbit.translation.z=(cos(rotation_in_orbit)*distance)+node_to_orbit.translation.z

