package;

import n4.*;
import n4.NState;
import n4.group.NTypedGroup;

import sprites.*;

class PlayState extends NState {

	private var player:Player;
	private var boxes:NTypedGroup<Box>;

	override public function create() {
		player = new Player(240, 240);
		add(player);

		boxes = new NTypedGroup<Box>();
		boxes.add(new Box(80, 80));
		add(boxes);		

		super.create();
	}

	override public function update(dt:Float) {
		super.update(dt);

		NG.collide(player, boxes);
	}
}