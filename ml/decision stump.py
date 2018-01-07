# -*- coding: utf8 -*-
import numpy as np
import random
import matplotlib.pyplot as plt
def generate ():
	X=[]
	Y=[]
	for i in range(20):
		x=random.uniform(-1,1)
		X.append(x)
	X.sort()
	for i in range(20):
		noise=random.random()
		if noise<=0.2:
			Y.append(-np.sign(X[i]))
		else:
			Y.append(np.sign(X[i]))
	return X,Y
def decision_stump(X,Y):
	bestcollect=[43,-2,-2]
	for i in range(21):
		error=0
		s=1
		if(i==0):
			theta=(X[0]-1.0)/2.0
		elif(i==20):
			theta=(X[19]+1.0)/2.0
		else:
			theta=(X[i-1]+X[i])/2.0
		for index in range(20):
			if s*np.sign((X[index]-theta))!=Y[index]:
				error+=1
		if(error<bestcollect[0]):
			bestcollect=[error,theta,s]
		s=-1
		error=0
		for index in range(20):
			if s*np.sign((X[index]-theta))!=Y[index]:
				error+=1
		if(error<bestcollect[0]):
			bestcollect=[error,theta,s]
	return bestcollect







outputein=[]
outputeout=[]
for i in range(1000):
	random.seed(i)
	x,y=generate()
	collect=decision_stump(x,y)
	ein=collect[0]/21
	theta=collect[1]
	s=collect[2]
	eout=0.5+0.3*(abs(theta)-1)*s
	outputein.append(ein)
	outputeout.append(eout)
outputein=np.array(outputein)
outputeout=np.array(outputeout)
plt.hist(outputein)
plt.hist(outputeout)
plt.show()



