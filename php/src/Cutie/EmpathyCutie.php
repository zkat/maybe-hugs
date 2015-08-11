<?php

namespace MaybeHugs\Cutie;

/**
 * Empathy Cutie
 *
 * @package MaybeHugs\Cutie
 * @author  Mario Álvarez <ahoy@m4grio.me>
 */
class EmpathyCutie extends AbstractCutie
{
    const HUG_MESSAGE = 'Cutie prefers empathy!';

    /**
     * @return bool
     */
    public function isHuggable()
    {
        return false;
    }
}
