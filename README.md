# Analog Communication: PM and DSB Modulation Over a Noisy Channel (MATLAB)

A MATLAB simulation of an analog communication system with two modulation schemes (Phase Modulation and Double-Sideband AM with carrier), a noisy channel, and matching demodulators. Built as an Electrical Communications course project at Sharif University of Technology.

## What's Inside

- **Modulators:** `PM_Modulation.m`, `DSB_Modulation.m`
- **Demodulators:** `PM_Demodulation.m`, `DSB_Demodulation.m`
- **Channel model:** `Channel.m` — additive noise / band-limited distortion that the modulated signal passes through.
- **Driver:** `Main.m` — runs a synthetic two-tone message (10 Hz + 20 Hz cosines), modulates it with both PM and DSB, passes it through the channel, demodulates, and overlays the original vs. recovered signals.
- **Audio demo:** Reads `Gangnam.mp3`, modulates and demodulates stereo audio per channel, and writes back `GangnamDSB.wav` / `GangnamPM.wav` to demonstrate that the chain is faithful enough to preserve recognizable music.
- **Project writeup:** `Project.pdf` — the original course project description and analysis.

## Requirements

- MATLAB (R2019b or later recommended)
- Signal Processing Toolbox (`obw`, `meanfreq`, `audioread`, `audiowrite`)

## How to Run

```matlab
>> run('Main.m')
```

By default `Main.m` runs the synthetic two-tone demo. Uncomment the relevant block to run the audio-file demo end-to-end.
