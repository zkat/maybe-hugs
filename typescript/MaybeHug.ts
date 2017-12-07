interface Cutie {
    name: string;
    acceptsHugs: boolean;
}

export class MaybeHug {
    constructor(private cutie: Cutie) {
        if (cutie === null || cutie === undefined) {
            throw new TypeError('no cutie to maybe hug');
        }
        this.cutie = cutie;
    }
    hug () {
        return this.cutie.acceptsHugs ? 'HUG!' : 'Empathy!';
    }
    love() {
        return `I love ${this.cutie.name}`;
    }
}
