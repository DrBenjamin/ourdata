# Copilot Instructions for ourdata R package

Dearest Copilot,
this project is the **R package** for students of the Fresenius University of Applied Sciences.

Structure of the repository:

- `data`: Datasets of the package
- `data-raw/`: Raw data files and scripts to process them.
- `R/`: R scripts containing functions and data documentation.
- `man/`: Documentation files for the R package.
- `inst/rmd/`: R Markdown files with additional information and tutorials.

When generating code snippets or explanations, please follow these guidelines:

1. Output always in Markdown.
2. When referring to a file in this repo, link using `#file:<relative_path>`.
   - Readme: [README.md](#file:README.md)
3. Code‑block format for changes or new files:
   ```python
   // filepath: #file:<relative_path>
   # ...existing code...
   def my_new_function(...):
       ...
   # ...existing code...
   ```
4. Comments and code formatting rules:
   - Always import modules at the top of the file.
   - Use `#` for comments.
   - Start comments with 'Setting', 'Creating', 'Adding', 'Updating' etc.
     (always the gerund form) and before it add an empty line if not the
     beginning of a code block or function.
   - empty lines between functions use 2 lines empty lines and don't fill
     empty lines with spaces.
5. Adhere to PEP 8:
   - 4‑space indentation, snake_case names.
   - Imports at the top of the file.
   - Docstrings in Google or NumPy style.
