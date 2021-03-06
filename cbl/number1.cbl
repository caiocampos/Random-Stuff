IDENTIFICATION      DIVISION.
PROGRAM-ID.         TEST001.
AUTHOR.             CAIO CAMPOS.
DATE-WRITTEN        16/04/2014.
DATE-COMPILED.

ENVIRONMENT         DIVISION.

CONFIGURATION       SECTION.
SPECIAL-NAMES.      DECIMAL-POINT IS COMMA.

DATA                DIVISION.
WORKING-STORAGE     SECTION.
01 VALS.
    05 VAL1         PIC 9(4).
    05 VAL2         PIC 9(4).
01 RES              PIC 9(4)V99.



PROCEDURE           DIVISION.
INITIALIZE          VAL1
                    VAL2
                    RES
ACCEPT              VALS
COMPUTE             RES = VAL1 + VAL2
COMPUTE             RES = RES / 2
DISPLAY             '(' VAL1 ' + ' VAL2 ') / 2 = ' RES.
STOP RUN.