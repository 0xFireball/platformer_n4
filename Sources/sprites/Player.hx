package sprites;

import kha.Color;
import n4.*;
import n4.math.NVector;
import n4.entities.NSprite;

class Player extends NSprite {
	
	private var movementSpeed:Float = 24;

	public function new (?X:Float = 0, ?Y:Float = 0) {
		super(X, Y);

		makeGraphic(36, 36, Color.fromFloats(0.2, 0.2, 1.0));

		drag.set(280, 280);
		maxVelocity.set(120, 120);
	}

	public override function update(dt:Float) {
		movement();

		super.update(dt);
	}

	private function movement() {
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		up = NG.keys.pressed(["UP", "W"]);
		down = NG.keys.pressed(["DOWN", "S"]);
		left = NG.keys.pressed(["LEFT", "A"]);
		right = NG.keys.pressed(["RIGHT", "D"]);

		if (up && down) up = down = false;
		if (left && right) left = right = false;

		if (up || down || left || right) {
			var mv = new NVector(movementSpeed, 0);
			var ma = 0;
			if (up) {
				ma = -90;
				if (left) {
					ma -= 45;	
				} else if (right) {
					ma += 45;
				}
			} else if (down) {
				ma = 90;
				if (left) {
					ma += 45;
				} else if (right) {
					ma -= 45;
				}
			} else if (left) {
				ma = 180;
			}
			mv.rotateByDegrees(ma);

			// add to motion
			velocity.addPoint(mv);
		}
	}
}