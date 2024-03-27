import re


def displaymatch(match):
    if match is None:
        return None
    return '<Match: %r, groups=%r>' % (match.group(), match.groups())


def p1(s: str):
    lines = s.splitlines(keepends=True)

    res = []
    for (i, line) in enumerate(lines):
        if i == 0:
            res.append("== " + line)
            continue
        if re.match(r"\d+ 语文", line):
            continue

        if line.startswith("a "):
            res.append("---\n")
        res.append(line)
    print("after p1:\n" + ''.join(res))
    return ''.join(res)


def p2(s: str):
    [a, b] = s.split("---", 2)

    # remove the letters and the spaces
    a = re.sub(r"[a-z]| *|[@#]\d", "", a)
    # recover the space of the title
    a = re.sub(r"==", "== ", a)
    # remove the \n
    al = []
    for line in a.splitlines(True):
        if line.isspace():
            continue
        else:
            al.append(line)

    a2 = '。\n'.join(''.join(al[2:]).replace('\n', '').split('。'))

    # remove the spaces
    b = re.sub(r" *", "", b)
    # sub the letters into + sign
    b = re.sub(r"(?m)^ *[a-z] *|^[@#]\d", "+ ", b)
    # remove '\n's between items
    b = re.sub(r"\n", "", b)
    b = '\n+ '.join(b.split("+ "))

    return (al[0].replace('\n', '') + '   '
            + al[1].replace('\n', '') + '\n' + a2 + '\n' + b)


if __name__ == "__main__":

    with open('in.txt', 'r', encoding="UTF-8") as file:
        f = file.read(None)

    res = p2(p1(f))

    with open('out.txt', 'w', encoding="UTF-8") as file:
        file.write(res)
