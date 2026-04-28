# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

2D platformer in **Godot 4.3** (GDScript). Game design document is at `C:\Users\Russel\Documents\game-dev-vault\Draft.md`.

## Structure

```
scenes/       .tscn scene files
scripts/      .gd GDScript files
assets/       sprites, audio (not yet populated)
```

## Key scenes and scripts

- `scenes/Level_01.tscn` — main/only level; root scene for the project
- `scenes/Player.tscn` — CharacterBody2D with movement, jump, dash, Camera2D
- `scenes/HUD.tscn` — CanvasLayer with stamina bar and lives display
- `scripts/Player.gd` — all player movement logic; emits `stamina_changed` and `died` signals
- `scripts/GameManager.gd` — autoloaded singleton; tracks lives, respawn position; emits `lives_changed` and `game_over`
- `scripts/Level_01.gd` — wires Player signals → GameManager → HUD
- `scripts/HUD.gd` — `update_stamina(int)` and `update_lives(int)` methods

## Player mechanics (from GDD)

- **Move:** A/D or arrow keys — snappy, no ramp
- **Jump:** Space — single jump, `JUMP_VELOCITY = -500`
- **Dash:** Shift — `DASH_SPEED = 550` for `DASH_DURATION = 0.15s`, costs 1 stamina
- **Stamina:** 3 points, regens 1 per 2 seconds when not dashing
- **Lives:** 3 per level; falling below y=1100 triggers `died` → GameManager respawns or game over

## Autoload

`GameManager` is registered as an autoload singleton in `project.godot`. Access it globally as `GameManager`.

