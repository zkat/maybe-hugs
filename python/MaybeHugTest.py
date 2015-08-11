import unittest
from MaybeHug import MaybeHug

class MaybeHugTest(unittest.TestCase):
    class cutie():
        def hug(self):
            return 'HUG!'

    class NoHugs(): pass

    def testGethug(self):
        res  = MaybeHug(MaybeHugTest.cutie()).hug()
        self.assertEqual(res, 'HUG!')

    def testNoHug(self):
        res  = MaybeHug(MaybeHugTest.NoHugs()).hug()
        self.assertEqual(res,'Cutie prefers empathy!')

def main():
    unittest.main()

if __name__ == "__main__":
    main()
