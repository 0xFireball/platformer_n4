package;

import kha.Color;
import n4.*;
import n4.NState;
import n4.group.NTypedGroup;
import n4.NCamera;

import sprites.*;

class PlayState extends NState {

	private var player:Player;
	private var boxes:NTypedGroup<Box>;

	override public function create() {

		bgColor = Color.fromFloats(0.95, 0.95, 0.95);

		player = new Player(240, 240);
		add(player);

		boxes = new NTypedGroup<Box>();
		boxes.add(new Box(80, 80));
		add(boxes);

		NG.camera.reset();
		NG.camera.zoom = 1.4;
		NG.camera.follow(player, NCameraFollowStyle.TOPDOWN_TIGHT, 0.1);

		super.create();
	}

	override public function update(dt:Float) {
		super.update(dt);

		NG.collide(player, boxes);
	}
}