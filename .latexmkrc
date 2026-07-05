# LaTeX Build Configuration for CV

# Ensure build directory exists
mkdir 'build' unless -d 'build';

# Set output directory for auxiliary files
$out_dir = 'build';

# Use pdflatex as the PDF generator
$pdf_mode = 1;

# LaTeX command with error handling
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error';

# Maximum number of runs to resolve cross-references
$max_repeat = 5;

# Clean up auxiliary files after successful build
$clean_ext = "aux log out toc";

# Enable file change monitoring for continuous builds (optional)
$preview_mode = 1;
