import React, { useState, useRef, useEffect } from 'react';

interface MetronomeProps {
  tempo: number;
  sound: string;
}

const MetronomeButton = ({ tempo, sound }: MetronomeProps) => {
  const [isPlaying, setIsPlaying] = useState(false);
  const timerRef = useRef<number>(0);
  const beat = new Audio(sound);

  const handleClick = () => {
    setIsPlaying(!isPlaying);
  };

  useEffect(() => {
    if (isPlaying) {
      timerRef.current = setInterval(() => {
        beat.play();
      }, (60 / tempo) * 1000);
    } else {
      clearInterval(timerRef.current);
    }
    return () => clearInterval(timerRef.current);
  }, [isPlaying, tempo]);

  return (
    <button className="btn btn-primary" onClick={handleClick}>
      {isPlaying ? 'Stop metronome for the song' : 'Start metronome for the song'}
    </button>
  );
}

export default MetronomeButton
