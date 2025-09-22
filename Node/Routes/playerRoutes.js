const express = require('express');
const fs = require('fs');
const router = express.Router();

const initalResources = {
    metal : 500,
    crystal : 300,
    deuterium : 100,
}

global.players = {};

router.post('/register', (req, res) => {
    const {name, password} = req.body;

    if(global.players[name])
    {
        return res.status(400).send({message : '이미 등록된 사용자입니다. '});
    }

    global,players[name] = {
        playername : name,
        password : password,
        resoureces: {
            metal : 500,
            crystal : 300,
            deuterium : 100
        },
        planets:[]
    };

    saveResources();

    res.send({message : '등록 완료' , player:name});


});

router.post('/login', (req, res) => {
    
    const {name, password} = req.body;

    if(!gloabal.players[name])
    {
        return res.status(404).send({message : '플레이어를 찾을 수 없습니다. '})
    }

    if(password !== global.players[name].password)
    {
        return res.status(401).send({message : '비밀번호가 틀렸습니다.'});
    }

    const reqponsePayLoad = {
        playerName: player,playerName,
        metal : player.resoureces.metal,
        crystal : player.resoureces.crystal,
        deuterium : player.resoureces.deuterium
    }

    console.log("Login response playload :", reqponsePayLoad);
    res.send(reqponsePayLoad);


});

module.exports = router;