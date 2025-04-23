
SECTION "Header", ROM0[$100]
    jp EntryPoint
    ds $150 - @, 0

SECTION "Entry Point", ROM0[$150]
EntryPoint:
    ; Your code here
    ret

