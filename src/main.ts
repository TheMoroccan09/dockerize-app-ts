/**
 * Created by themoroccan09 on 05/10/17.
 */
import server from './Server'

const port = 3000

server.listen(port, (err) => {
    if (err) {
        return console.log(err)
    }
    return console.log(`server is listening on ${port}`)
})
