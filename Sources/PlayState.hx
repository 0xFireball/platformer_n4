package;

import kha.Color;
import n4.*;
import n4.NState;
import n4.group.NTypedGroup;
import n4.NCamera;
import n4.display.NBackdrop;
import n4.tile.*;

import sprites.*;

class PlayState extends NState {

	private var player:Player;
	private var boxes:NTypedGroup<Box>;

	private var tilesetImage:NGraphic;

	override public function create() {

		bgColor = Color.fromFloats(0.95, 0.95, 0.95);

		// var backdrop = new NBackdrop("backdrop.png");
		// add(backdrop);

		// load map
		var gameTileset = new NTileset("simple_tset.png", 32, 32);
		var map = NTilemapLoader.loadTilemapFromArray([
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
			0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
			0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0
		], gameTileset);
		add(map);

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