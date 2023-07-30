import sys
import re


stack = []
lnum = 0
varset = set()

for ln in sys.stdin:
    lnum += 1

    ln = ln.rstrip()

    spcs = 0
    while spcs < len(ln) and ln[spcs] == ' ': spcs += 1
    ln = '~' * spcs + ln[spcs:]

    ln_ = ' ' * (2 * len(stack)) + ln

    mat = re.match(r'^\$(?:if|for)\(([/\.\-\w]+)\)\$', ln)
    if mat is not None:
        var = mat.group(1)
        stack.append(var)
        varset.add(var)
        print(ln_)
        continue

    mat = re.match(r'^\$else(if)?\$', ln)
    if mat is not None:
        elt = stack[-1]
        print(f'{ln_[2:]:12s}  $-- %%% {elt}')
        continue

    mat = re.match(r'^\$end(?:if|for)\$', ln)
    if mat is not None:
        try:
            elt = stack.pop()
        except IndexError:
            print(f'Line {lnum}', file=sys.stderr)
            raise

        print(f'{ln_[2:]:12s}  $-- %%% {elt}')
        continue

    print(ln_)

vars_ = sorted(varset)

print()
for v in vars_:
    print(f'$-- {v}')
