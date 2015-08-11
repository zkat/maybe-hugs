<?php

namespace MaybeHugs\Cutie;

/**
 * Abstract Cutie
 *
 * @package MaybeHugs\Cutie
 * @author  Mario Álvarez <ahoy@m4grio.me>
 */
abstract class AbstractCutie implements CutieInterface
{

    /**
     * @return string
     */
    public function hug()
    {
        return static::HUG_MESSAGE;
    }

    /**
     * @return bool
     */
    public function isHuggable()
    {
        return false;
    }
}
