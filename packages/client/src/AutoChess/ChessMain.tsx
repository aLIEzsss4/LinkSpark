import React, { useState } from 'react';
import './Chessboard.css';
import Chessboard from './Chessboard';

const initHero=()=>{
  const srcList=[
    'https://n.sinaimg.cn/sinacn20122/488/w644h644/20200112/48b4-imztzhn1606827.jpg',
    'https://n.sinaimg.cn/sinacn20122/488/w644h644/20200112/86ed-imztzhn1610595.jpg',
    'https://n.sinaimg.cn/sinacn20122/488/w644h644/20200112/99ee-imztzhn1610686.jpg',
    'https://n.sinaimg.cn/sinacn20122/488/w644h644/20200112/7eef-imztzhn1610766.jpg',
    'https://n.sinaimg.cn/sinacn20122/488/w644h644/20200112/87d0-imztzhn1610842.jpg',
    'https://n.sinaimg.cn/sinacn20122/488/w644h644/20200112/40b6-imztzhn1610905.jpg',
    'https://n.sinaimg.cn/sinacn20122/488/w644h644/20200112/8a32-imztzhn1610955.jpg',
  ]
  const heroes = []
  for (let i = 0; i < 5; i++) {
    const lv = Math.floor(Math.random() * 2) + 1;
    const cost = lv === 1 ? 1 : 3;
    const name = `Hero ${i + 1}`;
    const src = srcList[i];

    heroes.push({
      name,
      lv,
      cost,
      src
    })
  }

  return heroes;
}

const Game = () => {
  const [coins, setCoins] = useState(1);
  const [bench, setBench] = useState([]);
  const [placement, setPlacement] = useState([]);
  const [heroes, setHeroes] = useState(initHero());

  const handleBuy = (hero) => {
    console.log(hero)
    if (coins >= hero.cost) {
      setCoins(coins - hero.cost);
      setBench([...bench, hero]);
      setHeroes(heroes.filter(h => h !== hero));

    }
  }

  const handleMoveToBoard = (hero) => {
    setBench(bench.filter(h => h !== hero));
    setPlacement([...placement, hero]);
  }

  const handleMoveToBench = (hero) => {
    setPlacement(placement.filter(h => h !== hero));
    setBench([...bench, hero]);
  }

  const refresh=()=>{
   setHeroes(initHero())
    setCoins(coins=> coins-=2);

  }

  return (
    <div className="game">
      <div className="coin-area">Coins: {coins}</div>
      <div className="coin-area" onClick={() => setCoins(c => c += 1)}>add coins</div>
      <div className="coin-area" onClick={refresh}>refresh hero</div>
      <div className="hero-area" style={{ display: 'flex' }} >
        {heroes.map(hero => (
          <div key={hero.name} onClick={() => handleBuy(hero)}>
            <img src={`${hero.src}`} alt={hero.name} style={{ width: 60, height: 60  }} />
            <span>{hero.name}</span>
            <span>Cost: {hero.cost} </span>
            <span>Lv: {hero.lv} </span>
          </div>
        ))}
      </div>
      <Chessboard bench={bench} placement={placement} add={handleMoveToBoard} remove={handleMoveToBench} />

      <div className="bench-area">
        {bench.map(hero => (
          <div key={hero.name} onClick={() => handleMoveToBoard(hero)}>
            <img src={`${hero.src}`} alt={hero.name} style={{ height:60 }}  />
            {/* <span>{hero.name}</span> */}
          </div>
        ))}
      </div>
      {/* <div className="placement-area">
        {placement.map(hero => (
          <div key={hero.name} onClick={() => handleMoveToBench(hero)}>
            <img src={`${hero.src}`} alt={hero.name} />
            <span>{hero.name}</span>
          </div>
        ))}
      </div> */}
    </div>
  );
}

export default Game;
