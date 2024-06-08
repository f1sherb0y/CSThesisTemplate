import re


def replace_outside_brackets(text):
    # Define a regular expression pattern to match content outside brackets
    pattern = r"(?:(?<=^)|(?<=[\]\)\}]))(.*?)(?=[\[\(\{]|$)"

    # Function to replace commas and periods
    def replace_commas_periods(match):
        return match.group(0).replace(",", "，").replace(".", "。")

    # Replace commas and periods outside brackets
    return re.sub(pattern, replace_commas_periods, text, flags=re.DOTALL)


def process_file(input_file, output_file):
    with open(input_file, "r", encoding="utf-8") as f:
        content = f.read()

    # Replace commas and periods outside brackets
    new_content = replace_outside_brackets(content)

    with open(output_file, "w", encoding="utf-8") as f:
        f.write(new_content)


# Example usage
input_file = "final/body.tex"
output_file = "final/body.tex"
process_file(input_file, output_file)
