# Godot_MovingByMouse

#En
Brief: Script for moving objects with the mouse in 3d. Such as trees in the landscape editor.

License: Public domain.

The script for Godot Engine. It Can move objects, using the mouse, on the ground (in 3d).
It also allows you to select multiple objects, and move them.
Collision calculation is automatic by Godot Engine (therefore it is fast).

To use it, you need to place this script node that receives mouse events (for example, in the root).
Collisions are configured through masks: objects that can be selected, and objects of the earth (on which objects move). 
These masks have childrens of PhysicsBody (must have collision forms). In scripts this masks:

const groundMask = 0b10000000000000000000
const pickMask = 0b00000000000000000001

And everything. Now you can create an earth object, and objects that move around it.




#Ru

Краткое описание: Скрипт для перемещения объектов с помощью мыши (в 3d). Например, деревьев в редакторе ландшафта.

Лицензия: Общественное достояние (или нет лицензии).

Скрипт для Godot. Он может перемещать объекты в 3d с помощью мыши по земле.
Он также позволяет выбирать несколько объектов и перемещать их.
Расчет столкновений выполняется автоматически Godot (поэтому быстро).

Чтобы использовать, нужно разместить этот скрипт в узле который получает события мыши (например, в корне).
Столкновения настраиваются с помощью масок: объектов, которые можно выбрать, и объектs земли (по которым движутся объекты).
Эти маски имеют дочерние от PhysicsBody (им нужно задать формы столкновения). В скрипте это маски:

const groundMask = 0b10000000000000000000
const pickMask = 0b000000000000000000011

И всё. Теперь можно создать объект Земли, и объекты, которые перемещаются по ней.
