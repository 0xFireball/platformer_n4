package sprites;

import kha.Color;
import n4.entities.NSprite;

class Box extends NSprite {
	public function new (?X:Float = 0, ?Y:Float = 0) {
		super(X, Y);

		makeGraphic(16, 16, Color.fromFloats(1.0, 0.1, 0.1));

		drag.set(100, 100);
	}
}