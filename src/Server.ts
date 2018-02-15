/**
 * Created by themoroccan09 on 05/10/17.
 */

import * as express from 'express'


class Server {
    public express

    constructor(){
        this.express = express()
        this.provideRoutes()
    }

    private provideRoutes (): void {
        const router = express.Router()

        router.get('/', (req, res) => {
            res.json({
                message: 'Hello World!'
            })
        })
        this.express.use('/', router)
    }
}

export default new Server().express
