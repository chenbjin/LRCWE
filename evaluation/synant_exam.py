import sys
import math
import logging
import scipy.stats, scipy.spatial
from sklearn import metrics
from gensim.models.word2vec import Word2Vec
from utils import load_vocab

logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

def load_model(filename,binary=True):
	model = Word2Vec.load_word2vec_format(filename, binary=binary)
	return model

def load_questions(filename):
	vocab = load_vocab('../gen_data/model/vocab.1b')
	question = []
	label = []
	with open(filename) as fin:
		for line in fin:
			arr = line.strip().split('\t')
			if arr[0].strip() not in vocab or arr[1].strip() not in vocab:
				continue
			question.append((arr[0].strip(),arr[1].strip()))
			if arr[2].strip() == "ANT":
				label.append(1)
			else:
				label.append(0)
	return question, label

def similarity(v1,v2):
	inner = sum([v1[i] * v2[i] for i in range(len(v1))])
	sum1 = math.sqrt(sum([v1[i] * v1[i] for i in range(len(v1))]))
	sum2 = math.sqrt(sum([v2[i] * v2[i] for i in range(len(v2))]))
	if sum1 == 0 or sum2 == 0: return -1
	return inner * 1.0 / (sum1 * sum2)

def similarity_scipy(v1, v2):
	return 1 - scipy.spatial.distance.cosine(v1, v2)

def main():
	if len(sys.argv) < 2:
		print "Usage: python toefl_exam.py model"
		return
	modelfile = sys.argv[1]
	model = load_model(modelfile)
	ques, label = load_questions('../gen_data/ANT-SYN-TestSet/test600-pairs.adj')
	print len(ques), len(label)
	cnt = 0
	sims = []
	for pair in ques:
		sim = 0.0
		resw = None
		if pair[0] not in model or pair[1] not in model:
			print 'word not find: %s, %s'%(pair[0],pair[1])
		else:
			sim = similarity(model[pair[0]],model[pair[1]])
		sims.append(sim)
	print metrics.roc_auc_score(label,sims)

if __name__ == '__main__':
	main()
