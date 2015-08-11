class MaybeHug:
    def __init__(self, cutie):
        self._cutie = cutie

    def hug(self):
        func = getattr(self._cutie, 'hug', None)
        if callable(func):
            return self._cutie.hug()
        return 'Cutie prefers empathy!'
