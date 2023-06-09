import React, { useState } from 'react';
import './Chessboard.css';

const Chessboard = (props) => {
  const [squares, setSquares] = useState(Array(64).fill(null));

  const handleClick = (i) => {
    // const newSquares = [...squares];
    // newSquares[i] = 'X';
    // setSquares(newSquares);
    if (props.bench.length==0){
      return 
    }

    const newPlacement = [...squares];
    

    const hero = props.bench[0];
    newPlacement[i] = hero;
    setSquares(newPlacement);

    props.add(props.bench[0]);
  }

  const renderSquare = (i) => {
    return (
      <div
        className={`square ${squares[i] === 'X' ? 'black' : ''}`}
        onClick={() => handleClick(i)}
      >
        {squares[i] ? <img src={`${squares[i]['src']}`} alt={squares[i]['src'].name} style={{width:50}} /> : null}
      </div>
    );
  }

  const renderBoard = () => {
    const board = [];
    for (let i = 0; i < 8; i++) {
      for (let j = 0; j < 8; j++) {
        board.push(renderSquare(i * 8 + j));
      }
    }
    return board;
  }

  return (
    <div className="board">
      {renderBoard()}
    </div>
  );
}

export default Chessboard;