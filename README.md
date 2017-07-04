# LRCWE
该模型尝试在CBOW模型的训练过程中，更好地利用知识图谱中的知识进行监督，使得训练所得的词向量能更好地识别同义词和反义词，同时能学习到复杂的词语关系表示。

## 代码运行
模型需要提供训练的文本语料train.txt，同义词语料synonym.txt，反义词语料antonym.txt，三元组语料triplet.txt。之后可以编译运行以下代码。
	$ cd src
	$ make
	$ ./lrcwe -train train.txt -synonym synonym.txt -antonym antonym.txt -triplet triplet.txt -output  -save-vocab vocab.txt -belta-rel 0.8 -alpha-rel 0.001 -belta-syn 0.7 -alpha-syn 0.05 -size 200 -window 5 -sample 1e-4 -negative 5 -hs 0 -binary 1 -cbow 1 -iter 3


