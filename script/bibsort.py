from pybtex.database import parse_file, BibliographyData
from pybtex.database.output.bibtex import Writer
import os
import re
import argparse

def sort_bib_items(bib_file, file_list, output_file):
    # Read the .bib file
    bib_data = parse_file(bib_file)

    # Create a dictionary to store the citation order
    citation_order = {}

    # Process each file in the list
    for file_index, file_path in enumerate(file_list):
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()

        # Find all the citation keys in the file
        citation_keys = re.findall(r'\\cite{([^}]+)}', content)

        # Update the citation order based on the occurrence within the file
        for citation_index, citation_key in enumerate(citation_keys):
            if citation_key not in citation_order:
                citation_order[citation_key] = (file_index, citation_index)

    # Create a new BibliographyData object to store the sorted entries
    sorted_bib_data = BibliographyData()

    # Sort the bib entries based on the citation order
    for key in sorted(citation_order, key=citation_order.get):
        if key in bib_data.entries:
            sorted_bib_data.add_entry(key, bib_data.entries[key])

    # Add any remaining entries that were not found in the citation order
    for key, entry in bib_data.entries.items():
        if key not in sorted_bib_data.entries:
            sorted_bib_data.add_entry(key, entry)

    # Write the sorted bib entries to the output file
    writer = Writer()
    with open(output_file, 'w', encoding='utf-8') as bibtex_file:
        bibtex_file.write(writer.to_string(sorted_bib_data))


if __name__ == '__main__':
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description='Sort bib items based on the order of occurrence in files.')
    parser.add_argument('bib_file', help='Path to the input .bib file')
    parser.add_argument('output_file', help='Path to the output .bib file')
    parser.add_argument('file_list', nargs='+', help='List of files to consider for citation order')

    args = parser.parse_args()

    # Call the function with the provided arguments
    sort_bib_items(args.bib_file, args.file_list, args.output_file)