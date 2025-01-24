#!/bin/bash

find \
/files/CONTABILIDADE/output/salva/* \
/files/CONTABILIDADE/processados/ACTR649* \
/files/CONTABILIDADE/processados/ACDC* \
/files/CONTABILIDADE/input/APPD016000_* \
/files/CONTABILIDADE/logs/* \
/files/CONTABILIDADE/processados/APPD016000_* \
/files/CONTABILIDADE/processados/LOTUS* \
/files/CONTABILIDADE/input/PREMREC* \
/files/CONTABILIDADE/processados/rejeitados_premrec* \
/tmp/purga_contabilidade* \
-mtime +7 -type f > /tmp/purga_contabilidade_`date +%Y%m%d%H%M%S.txt`


find \
/files/CONTABILIDADE/output/salva/* \
/files/CONTABILIDADE/processados/ACTR649* \
/files/CONTABILIDADE/processados/ACDC* \
/files/CONTABILIDADE/input/APPD016000_* \
/files/CONTABILIDADE/logs/* \
/files/CONTABILIDADE/processados/APPD016000_* \
/files/CONTABILIDADE/processados/LOTUS* \
/files/CONTABILIDADE/input/PREMREC* \
/files/CONTABILIDADE/processados/rejeitados_premrec* \
/tmp/purga_contabilidade* \
-mtime +7 -type f -exec rm -rf {} \;
