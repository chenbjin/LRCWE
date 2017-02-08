#!/bin/bash
ITER_NUM=3
VEC_NUM=200
TRAIN_PATH="../gen_data/wikicorpus.1b"
TRIPLET_PATH="../gen_data/easyfreebase.clean.freq"
SYNONYM_PATH="../gen_data/synonyms.wd.ppdb.outjoin"
ANTONYM_PATH="../gen_data/antonyms.wd.filter.f100.pair"

MODEL_PATH="../gen_data/model/lswe-cbow-${VEC_NUM}-model.r.0${ITER_NUM}.bin"
VOCAB_PATH="../gen_data/model/lswe.vocab.1b"

# triplet + synonym + antonym
#./lrcwe -train ${TRAIN_PATH} -triplet ${TRIPLET_PATH} -synonym ${SYNONYM_PATH} -antonym ${ANTONYM_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}

# synonym + antonym
#./lrcwe -train ${TRAIN_PATH} -synonym ${SYNONYM_PATH} -antonym ${ANTONYM_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}

# synonym
#./lrcwe -train ${TRAIN_PATH} -synonym ${SYNONYM_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}

# antonym
./lrcwe -train ${TRAIN_PATH} -antonym ${ANTONYM_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}

# triplet
#./lrcwe -train ${TRAIN_PATH} -triplet ${TRIPLET_PATH} -output ${MODEL_PATH} -save-vocab ${VOCAB_PATH} -size ${VEC_NUM} -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter ${ITER_NUM}
