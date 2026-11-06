![Banner](src/Data/Misc/banner/lts_banner_both.png)

[Libre Train Sim](https://libretrainsim.de) is a free and open source train driving simulator created using the Godot Engine. It is licensed under the [GPL v3 license](LICENSE).

**[Play](https://www.libretrainsim.de/download/)** ► **[Contribute](https://github.com/Libre-TrainSim/Libre-TrainSim/wiki/Contribute-to-Libre-TrainSim)**

---

## About

This project was initially created by Jean28518. As the project attracted new contributers, we moved the repository into the [Libre Train Sim Organisation](https://github.com/Libre-TrainSim/). We want to create a modern, fully free train driving simulator running on Linux, Mac, Windows, and Android.

## Leave Feedback

Nothing is perfect. If you found a bug, please feel encouraged to create a [bug report](https://github.com/Libre-TrainSim/Libre-TrainSim/issues/new/). If you want to give more detailed feedback, you can fill out this [form](https://www.libretrainsim.org/feedback/).

**Thank you! :heart:**

## Development Progress

[Follow the development here](https://github.com/Libre-TrainSim/Libre-TrainSim/projects)

## Installation (for contributors)

Fork and clone the repository. This project targets **Godot 3.5.x** (see `.github/workflows/export.yml` for the exact patch version used in CI). Install that version of [Godot](https://godotengine.org/download), start the editor, and import the `src` folder as the project root (open `src/project.godot`).

### CI and local checks

Pull requests run a **headless project check** (`--check-only`) so broken scenes or scripts are caught before a full export. To run the same check locally (requires a Godot 3.x binary):

```bash
export GODOT_BIN="/path/to/Godot_v3.5.2-stable_linux_headless.64"
./scripts/ci_validate.sh
```

See [MODERNIZATION.md](MODERNIZATION.md) for the technical roadmap (Godot 4 port is intentional follow-up work, not a single PR).

## Links

- Website: <https://www.libretrainsim.de/>
- GitHub: <https://www.github.com/Libre-TrainSim/Libre-TrainSim>
- YouTube: <https://www.youtube.com/channel/UCsPsL_AkVUZMmKOKJgm7xsQ>
- Itch.io: <https://jean28518.itch.io/libre-train-sim>
- Google Play: <https://play.google.com/store/apps/details?id=org.godotengine.libretrainsim>
- Flathub: <https://flathub.org/apps/details/org.libretrainsim.Libre-TrainSim>
- Discord: <https://discord.gg/AQdAtZZ>
