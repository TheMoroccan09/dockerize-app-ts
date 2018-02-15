/**
 * Created by themoroccan09 on 05/10/17.
 */
export class Server {
    private static _singleton : Server;

    constructor(){
        console.log('Class instancied')
    }

    public sayHello(){
        console.log('Hello World!')
    }
    public static singleton(){
        return this._singleton || (this._singleton = new this())
    }
}
