## SynCity Root

This is where the core of syncity libraries live.

- `scripts/`: Logic scripts, you can run those using `-s <name>`
- `tools/`: General propose tools for maintenance, data visualization, etc. You can run those by `-t <name>`
- `common.py`: Contains all common global functions for dealing with low level logic
- `db.py`: All database related functions, mostly used for tools
- `helpers.py`: All high level logic functions, spawners and helpers in general
- `settings_manager.py`: Singleton for configurations and settings.
- `unity_vars.py`: Hardcoded list of variable translations from/to Unity3d