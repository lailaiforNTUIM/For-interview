# -*- coding: utf8 -*-
import numpy as np
import os
import random
import math
import matplotlib.pyplot as plt


def generate ():
	deminsion=3
	datanumber=1000
	X=np.matrix([[0 for x in range(deminsion)] for y in range(datanumber)])
	Y=np.matrix([[0 for x in range(1)] for y in range(datanumber)])
	for i in range(datanumber):
		random.seed(random.uniform(1,1000))
		X[i,0]=1
		X[i,1]=random.uniform(-1,1)
		X[i,2]=random.uniform(-1,1)
		f=pow(X[i,1],2)+pow(X[i,2],2)-0.6
		noise=random.random()
		if noise <=0.1:
			Y[i,0]=np.sign(f*-1)
		else:
			Y[i,0]=np.sign(f)
	return X,Y

def transform(X):
	deminsion=6
	datanumber=1000
	Z=np.matrix([[0 for x in range(deminsion)] for y in range(datanumber)])
	for i in range(datanumber):
		Z[i,0]=1
		Z[i,1]=X[i,1]
		Z[i,2]=X[i,2]
		Z[i,3] = X[i,1] * X[i,2];  
		Z[i,4] = X[i,1] * X[i,1];  
		Z[i,5] = X[i,2] * X[i,2];  
	return Z

def linearRegression(Z,Y):
	Ztranspose=Z.transpose()
	inverse=np.linalg.pinv(Ztranspose*Z)
	w=inverse*Ztranspose*Y
	return w
def calculateE(Z,w,y,datanumber):
	ein=0.0
	yhat=Z*w
	for i in range(datanumber):
		if np.sign(yhat[i,0])!=y[i,0]:
			ein+=1
	return (ein/datanumber)
printeout=[]
totaleout=0.0
for i in range(1000):
	X,Y=generate()
	Xtest,Ytest=generate()
	Z=transform(X)
	Ztest=transform(Xtest)
	weight=linearRegression(Z,Y)
	teout=calculateE(Ztest,weight,Ytest,1000)
	totaleout+=teout
	printeout.append(teout)
averageeout=totaleout/1000
print "averageout= ",averageeout
plt.hist(printeout,bins='auto')
plt.show()





