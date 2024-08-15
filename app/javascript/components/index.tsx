import React from "react";
import { createRoot } from "react-dom/client";

const metronome_container = document.getElementById("metronome-button");

if (!metronome_container) {
  throw new Error("Couldn't find metronome element");
}

const metronome_root = createRoot(metronome_container);

document.addEventListener("DOMContentLoaded", () => {
  metronome_root.render(
    <>
      <p className="font-bold">Yay! You're on Rails!</p>
    </>
  );
});