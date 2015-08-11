class MaybeHug:
    def __init__(self, cuite):
        self._cuite = cuite

    def hug(self):
        func = getattr(self._cuite, 'hug', None)
        if callable(func):
            return self._cuite.hug()
        return 'Cutie prefers empathy!'
