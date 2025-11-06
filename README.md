# Real-Time Audio Visualizer (Web)

A comprehensive, real-time audio visualization app built with modern web standards. It captures audio from microphone or local files, performs FFT-based analysis, and renders multiple visualization modes (waveform, frequency bars, spectrogram, and WebGL particle effects) with responsive design and accessibility.

## Quick Start

- Option A (Python): `python -m http.server 4000`
- Option B (Node): `npx serve -l 4000`

Then open `http://localhost:4000/` and navigate to `Real-Time Audio Visualizer`.

Project entry: `./audio-visualizer/index.html`

## Features

- Audio input: Microphone (Web Audio API `getUserMedia`) or File upload
- FFT analysis: `AnalyserNode` with `fftSize=2048`, time and frequency data
- Visualizations:
  - `Waveform` (Canvas 2D)
  - `Frequency Bars` (Canvas 2D)
  - `Spectrogram` waterfall (Canvas 2D)
  - `Particles` (WebGL, Three.js)
- Controls: source, visualization, color scheme, sensitivity, scale
- Performance: requestAnimationFrame loop, FPS meter, smoothing, pixel ratio awareness
- Responsive layout: resizes canvases to viewport
- Accessibility: labeled controls, keyboard navigation, `aria-live` status
- Error handling: permission prompts, graceful fallbacks for device access and audio playback

## Structure

- `audio-visualizer/index.html` – Single-file module with UI, logic, and rendering (Canvas and WebGL via Three.js CDN)
- `index.html` – Main hub linking to the visualizer and other demos

## Configuration & Customization

- Colors: change Primary/Background via the top control bar
- Sensitivity: scales frequency energy for bars/particles/spectrogram
- Scale: affects overall amplitude/size in visualizations
- FFT size: currently `2048`; adjust inside `ensureAudio()` if needed
- Smoothing: `analyser.smoothingTimeConstant = 0.8`; lower for snappier response

## Best Practices Followed

- Efficient rendering: minimal per-frame work, batched updates, reuse buffers
- WebGL for complex visuals (particles) with Three.js
- Graceful error handling around mic access and file playback
- 60fps target with FPS metric and pixel ratio tuning

## Testing Guide

Cross-browser (Chrome, Firefox, Safari, Edge):
- Microphone permissions: verify prompt behavior and denial handling
- File upload: test different audio codecs/bitrates
- Visual modes: switch across all four while audio is playing
- Performance: confirm FPS > 55 on typical hardware; check high-DPI displays
- Resize: test landscape/portrait, different window sizes

Audio sources & quality levels:
- Clean speech (podcast), music tracks (various genres), noisy environment mic
- Low/high bitrate files, variable sample rates

Performance validation:
- Observe `FPS` readout under normal and heavy system load
- Try changing `sensitivity/scale` and confirm responsiveness
- On slower machines, lower `pixelRatio` (handled automatically) and consider reducing `barCount`

Accessibility checks:
- Keyboard: Tab navigation through controls, Space toggles Start/Stop
- ARIA: roles/labels present; `status` uses `aria-live="polite"`
- Contrast: adjust background/primary colors to meet WCAG

## Troubleshooting

- Mic blocked: Allow site microphone permissions or switch to File mode
- No WebGL: Particles mode requires WebGL; fall back to 2D modes
- Cross-origin audio: For remote files, ensure CORS enabled or use local files
- Safari/WebKit: May require user gesture before `AudioContext` starts; click Start

## License

This repo is for demo/training purposes. Use freely.
