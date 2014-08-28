package mobilenapestarling {

import citrus.objects.platformer.nape.Sensor;

/**
 * @author Aymeric
 */
public class Particle extends Sensor {

    public function Particle(name:String, params:Object = null) {

        super(name, params);

        _hero = _ce.state.getFirstObjectByType(MobileHero) as MobileHero;
    }

    private var _hero:MobileHero;

    override public function update(timeDelta:Number):void {

        super.update(timeDelta);

        if (this.x < _hero.x - 100)
            this.kill = true;
    }

}
}
