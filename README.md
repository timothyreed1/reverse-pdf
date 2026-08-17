# reverse-pdf

A bash script that reverses the page order of a PDF.

## Requirements

- macOS or Linux with bash
- [pdftk-java](https://gitlab.com/pdftk-java/pdftk) installed with brew

## Usage

```bash
./reverse-pdf.sh <input.pdf> [output.pdf]
```

- If `output.pdf` is omitted, the result is written as `<input>-reversed.pdf`.
- The script will not overwrite an existing file.

### Example

```bash
./reverse-pdf.sh scan.pdf
# Wrote: scan-reversed.pdf

./reverse-pdf.sh scan.pdf flipped.pdf
# Wrote: flipped.pdf
```

## AI Disclosure

I planned, coded, and tested every line of this software myself.
