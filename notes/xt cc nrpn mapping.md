# Midi CC to NRPN mappings for the Shruthi XT

Name - Parameter Range - NRPN number - CC number

Oscillator 1 shape  0-33  0 20
Oscillator 1 parameter  0-127 1 21
Oscillator 1 range  -24-24  2 22
Modulation operator 0-13  3 28
Oscillator 2 shape  0-33  4 24
Oscillator 2 parameter  0-127 5 25
Oscillator 2 range  -24-24  6 26
Oscillator 2 detune 0-127 7 27
Oscillator balance  0-63  8 29
Sub oscillator volume 0-63  9 30
Noise volume  0-63  10  31
Sub oscillator/transient generator shape  0-10  11  23
Filter cutoff 0-127 12  14, 74
Filter resonance  0-63  13  15, 71
Envelope->cutoff modulation amount  0-63  14  102
Lfo->cutoff modulation amount 0-63  15  103
Envelope 1 attack 0-127 16  104
Envelope 1 decay  0-127 17  105
Envelope 1 sustain  0-127 18  106
Envelope 1 release  0-127 19  107
Envelope 2 attack 0-127 20  108, 73
Envelope 2 decay  0-127 21  109
Envelope 2 sustain  0-127 22  110
Envelope 2 release  0-127 23  111
LFO 1 waveform  0-20  24  112
LFO 1 rate  0-143 25  113
LFO 1 rise time 0-127 26  114
LFO 1 master/slave  0-3 27  115
LFO 2 waveform  0-20  28  116
LFO 2 rate  0-143 29  117
LFO 2 rise time 0-127 30  118
LFO 2 master/slave  0-3 31  119
Modulation n source 0-27  32 + 3 * (n – 1)  .
Modulation n destination  0-26  33 + 3 * (n – 1)  .
Modulation n amount -63-63  34 + 3 * (n – 1)  .
Operator n source 1 0-31  94 + 3 * (n – 1)  .
Operator n source 2 0-31  95 + 3 * (n – 1)  .
Operator n operation  0-9 96 + 3 * (n – 1)  .
Sequencer mode  0-6 100 75
Tempo 35-248  101 .
Groove template 0-5 102 76
Groove amount 0-127 103 77
Arpeggiator direction 0-3 104 78
Arpeggiator range 1-4 105 79
Arpeggiator pattern 0-15  106 80
Sequencer clock division  0-11  107 81
Octave transposition  0-11  . 82
Scale/raga  0-11  . 83
Portamento  0-11  . 84
Legato  0-11  . 68
The following control changes are specific to special filter boards:

Parameter CC number
SVF Filter cutoff 2 12
SVF Filter resonance 2  13
SVF Filter mode 1 85
SVF Filter mode 2 86
DSP FX param 1  12
DSP FX param 2  13
DSP FX mode 87
DSP FX program  88
Polivoks filter mode  89
Polivoks overdrive  90
Polivoks FM feedback  91
4PM filter mode 92
4PM resonance flavor  93
Delay time  12
Delay level 13
Delay feedback  94
Delay EQ flavor 95



{
  "attributes" :  {
    "_parameter_range" : [ "none", "saw", "square", "triang", "zsaw", "zreso", "ztri", "zpulse", "zsync", "pad", "fm", "waves", "tampur", "digitl", "metall", "bowed", "slap", "organ", "male", "user", "8bits", "crush", "pwm", "noise", "vowel", "belish", "polatd", "cello", "clpswp", "female", "fmtvoc", "frmnt2", "res3hp", "electp", "vibes" ]
  } = 35

}

dsp mode:
l>f h>f f>l f>h >fx

dsp program:
distort crusher +cmbflt ringmod delay fbdly dubdly !fbdly !dbdly /16dly /12dly /8dly 3/16dly looper pitch

sp mode:
lp bp hp ap


Parameter CC  NRPN
SSM Filter highpass 12 84       0-127
SVF Filter cutoff 2 12 84       0-127
SVF Filter resonance 2  13 85   0-63
SVF Filter mode 1 85 92         0-5
SVF Filter mode 2 86 93         0-5
DSP FX param 1  12 84           0-127
DSP FX param 2  13 85           0-63
DSP FX mode 87 92               0-5
DSP FX program  88 93           0-15
Polivoks filter mode  89 92     0-1
Polivoks overdrive  90 84       0-1
Polivoks FM feedback  91 85     0-1
4PM filter mode 92 92           0-14
4PM resonance flavor  93 93     0-3
Delay time  12 84               0-127
Delay level 13 85               0-63
Delay feedback  94 92           0-15
Delay EQ flavor 95 93           0-15
SP mode 96 92                   0-3
SP feedback 12 84               0-127


These don't have nrpns in xt?:

Octave transposition  0-11  108 82
Scale/raga  0-32  109 83
Portamento  0-63  110 84
Legato  0-1  111 68











