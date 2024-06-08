import argparse

import fitz


def is_grayscale(color_dict, tolerance=10):
    for color_value in color_dict.keys():
        r, g, b = color_value
        if abs(r - g) > tolerance or abs(g - b) > tolerance or abs(r - b) > tolerance:
            return False
    return True


def is_color_page(page):
    """判断页面是否包含彩色内容"""
    pixmap = page.get_pixmap()
    colors = pixmap.color_count(colors=True)
    return not is_grayscale(colors)


def split_pdf(input_file, color_file, bw_file):
    """将PDF分割为彩色页和黑白页"""
    doc = fitz.open(input_file)
    color_doc = fitz.open()
    bw_doc = fitz.open()
    color_count = 0
    bw_count = 0

    for i in range(0, doc.page_count, 2):
        print(f"Processing page {i}...")
        page1 = doc.load_page(i)
        assert page1 is not None
        if i + 1 < doc.page_count:
            page2 = doc.load_page(i + 1)
            assert page2 is not None
        else:
            print(f"Page {i+1} not found, skipping...")
            page2 = None

        if is_color_page(page1) or (page2 and is_color_page(page2)):
            color_doc.insert_pdf(doc, from_page=i, to_page=i + 1)
            color_count += 2
        else:
            bw_doc.insert_pdf(doc, from_page=i, to_page=i + 1)
            bw_count += 2

    print(
        f"Processed {doc.page_count} pages, {color_count} color pages, {bw_count} black & white pages."
    )

    if color_count != 0:
        color_doc.save(color_file)
    if bw_count != 0:
        bw_doc.save(bw_file)
    color_doc.close()
    doc.close()

    bw_doc.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Split PDF into color and black & white pages"
    )
    parser.add_argument("input_file", help="Path to the input PDF file")
    parser.add_argument(
        "-c",
        "--color",
        default="color_pages.pdf",
        help="Path to the output color pages PDF file (default: color_pages.pdf)",
    )
    parser.add_argument(
        "-b",
        "--bw",
        default="bw_pages.pdf",
        help="Path to the output black & white pages PDF file (default: bw_pages.pdf)",
    )

    args = parser.parse_args()

    split_pdf(args.input_file, args.color, args.bw)
