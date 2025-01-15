## Tips for the AI Agent

- **Start in the Project Folder**:
  - Ensure you are in the correct project folder, e.g., `/workspace/projectname`.

- **Python Environment Setup with `uv`**:
  - Confirm that the `.venv` environment with all development packages is created and activated. Use the command `uv sync --all-extras` to install all optional dependencies.
  - When adding new packages, always use `uv add` instead of `uv pip install` because `uv add` updates the `pyproject.toml` file.

- **Pre-Commit Hooks**:
  - If the project utilizes `pre-commit` hooks, install them after setting up the environment and dependencies.
  - If `pre-commit` hooks throw errors, it is often because they have modified some files. To automatically apply fixes, run `pre-commit run --all-files` before attempting to stash or commit. This ensures all fixes are applied correctly without manual intervention.

- **Testing**:
  - If the project includes tests, write tests for any new features you implement.
  - Ensure all tests pass before considering the implementation complete.

- **General Best Practices**:
  - Document any changes or additions you make to the project in a `CHANGELOG.md` file following the "Keep a Changelog" format.
  - Adhere to the project's coding style and guidelines.

- **Prioritize Project Inspection**:
  - Always inspect the existing files, architecture, and design of the project before proceeding with any action, such as creating new files, implementing features, or addressing user queries. This helps ensure that:
    - Features are not partially or redundantly implemented.
    - Existing design issues are identified and addressed.
    - The solution aligns with the project's overall structure and goals.


### Just tips for the AI Agent

- Ensure you are in the correct project folder, e.g., `/workspace/projectname`.
- Install the environment with `just install`
- Ensure that the `.venv` is activated.
- When adding new packages, always use `uv add` instead of `uv pip install` because `uv add` updates the `pyproject.toml` file.
- Before stashing or commiting anything you MUST always run `jsut all` to run all checks.
