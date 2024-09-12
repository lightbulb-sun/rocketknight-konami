    org 0
    incbin "rocketknight.md"

    org $0007ea
            jmp     activate_konami_code

    org $000a8e
            jmp     activate_stage_select

    org $0fb000
activate_konami_code:
            ; taken from $0007e0 in JP version
            jsr     $001124 ; JP: $001156

            ; replace original instructions
            move.w  $ffb004, d0
            beq     .branch
            jmp     $0007f0
.branch
            jmp     $0007f6


activate_stage_select:
            ; taken from $000a8a in JP version
            tst.w   $ffb004
            bne     .one
            move.w  #$2c, $fffb12
            btst    #6, $ffb070
            beq     .two
            tst.b   $fffb1c
            beq     .two
            jsr     $006116 ; JP: $0061ba
            addq.w  #1, $ffb004
            rts
.one
            jsr     $006166 ; JP: $00620a
            tst.w   $ffb006
            bne     .two
            rts
.two
            jmp     $000a94
