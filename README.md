# Godot_MovingByMouse

Brief: Script for moving objects with the mouse in 3d. Such as trees in the landscape editor.

License: Public domain.

The script for Godot Engine. It Can move objects in 3d, using the mouse, on the ground.
It also allows you to select multiple objects, and move them.
Collision calculation is automatic by Godot Engine (therefore it is fast).

To use it, you need to place this script in a top-level node that receives mouse events (for example, in the root).
Collisions are configured through masks: objects that can be selected, and objects of the earth (on which objects move). 
These masks have childrens of PhysicsBody (must have collision forms). In scripts this masks:

const groundMask = 0b10000000000000000000
const pickMask = 0b00000000000000000001

And everything. Now you can create an earth object, and objects that move around it.
