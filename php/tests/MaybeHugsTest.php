<?php


/**
 * MaybeHugs Test
 *
 * @author  Mario Álvarez <ahoy@m4grio.me>
 */
class MaybeHugsTest extends \PHPUnit_Framework_TestCase
{
    public function testHuggableCutie()
    {
        $cutie = new \MaybeHugs\Cutie\HuggableCutie;
        $this->assertTrue($cutie->isHuggable());
        $this->assertEquals('HUG!', $cutie->hug());
    }

    public function testEmpathyCutie()
    {
        $cutie = new \MaybeHugs\Cutie\EmpathyCutie;
        $this->assertFalse($cutie->isHuggable());
        $this->assertEquals('Cutie prefers empathy!', $cutie->hug());
    }
}
