import React from "react";
import { createRoot } from "react-dom/client";
import MetronomeButton from "./MetronomeButton";

const metronome_container = document.getElementById("metronome-button");

if (!metronome_container) {
  throw new Error("Couldn't find metronome element");
}

// Handle Metronome action
const metronome_root = createRoot(metronome_container);
const tempo = metronome_container.getAttribute("data-tempo")
const sound = metronome_container.getAttribute("data-sound")

if (!tempo) {
  throw new Error("Couldn't find tempo");
}

if (!sound) {
  throw new Error("Couldn't find sound");
}

const parsedTempo = parseInt(tempo, 10);

document.addEventListener("DOMContentLoaded", () => {
  metronome_root.render(
    <>
      <MetronomeButton tempo={parsedTempo} sound={sound} />
    </>
  );
});