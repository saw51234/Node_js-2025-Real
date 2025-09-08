let express = require('express');     //express 모듈 가져오기
let app = express();                   //express 를 app 이름으로 정의하고 사용한다

app.get('/', function(req, res){        //기본 라우터에서 헬로 월드를 반환
    res.send('Hello world');
});

app.get('/about', function(req, res){        //기본 라우터에서 about data를 반환
    res.send('Player data 5123');
});

app.listen(3000, function(){

    console.log('listening on port 3000');      //3000포트에서 입력을 대기
});