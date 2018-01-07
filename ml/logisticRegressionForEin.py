# -*- coding: utf8 -*-
import numpy as np
import random
#import matplotlib
#matplotlib.use("Agg")
import matplotlib.pyplot as plt
import math
traindata=np.loadtxt("train.txt",dtype="f")
traindata=np.insert(traindata,0,1.0,axis=1)
testdata=np.loadtxt("test.txt",dtype="f")
testdata=np.insert(testdata,0,1.0,axis=1)
def sigmoi(x):
	return 1/(1+math.exp(-x))
def  batchGradecent(data,weight):
	tempgrad= np.zeros(21)
	grad=np.zeros(21)
	for i in range(1000):
		tempput=0.0
		tempput=sigmoi(np.dot(weight,data[i][:-1])*-1.0*data[i][21])
		for j in range(21):
			tempgrad[j]+=tempput*data[i][j]*data[i][21]*-1.0
	for i in range(21):
		grad[i]=tempgrad[i]/1000
	return grad
def stochasticGradecent(data,weight,time):
	if time>999:
		time=time-1000
	grad=np.zeros(21)
	put=0.0
	put=sigmoi(np.dot(weight,data[time][:-1])*-1*data[time][21])
	for  i in range(21):
		grad[i]=put*data[time][i]*data[time][21]*-1.0
	return grad
def updataw(weight,ita,grad):
	for i in range(21):
		weight[i]=weight[i]-ita*grad[i]
	return weight
def calculateError01(weight,data):
	error=0.0
	for i in range(1000):
		if(np.sign(np.dot(weight,data[i][:-1]))!=data[i][21]):
			error+=1
	return error/1000
def calculateErrorlogistic(weight,data):
	error=0.0
	for i in range(1000):
		error+=math.log(1+math.exp(-1.0*data[i][21]*np.dot(weight,data[i][:-1])))
	return error/1000


ita1=0.01 #19題
ita2=0.001

def do(ita):
	batchein=0.0
	stocein=0.0
	batchweight=np.zeros(21)
	stochasticweight=np.zeros(21)
	batcherrorcollect=[]
	stocerrorcollect=[]
	for i in range(2000):
		batchgrad=batchGradecent(traindata,batchweight)
		stochasticgrad=stochasticGradecent(traindata,stochasticweight,i)
		batchweight=updataw(batchweight,ita,batchgrad)
		
		batchein=calculateError01(batchweight,traindata)
		batcherrorcollect.append(batchein)
		stochasticweight=updataw(stochasticweight,ita,stochasticgrad)
		
		stocein=calculateError01(stochasticweight,traindata)
		stocerrorcollect.append(stocein)
	batchein=calculateError01(batchweight,traindata)
	stocein=calculateError01(stochasticweight,traindata)
	print("batchein=",batchein,"ita= ",ita)
	print("stocein=",stocein,"ita= ",ita)
	ein=[batchein,stocein]
	plt.title("ita= "+str(ita))
	plt.grid(True)
	xlab=np.arange(0,2000,1)
	plt.plot(xlab,batcherrorcollect,'bs')
	plt.plot(xlab,stocerrorcollect,'g^')
	plt.show()
	#xbacthnew=np.linspace(batchweightcollect[0],batchweightcollect[1999],1999)
	#power_smooth=spline()
#	plt.title("ita= "+str(ita))
#	plt.hist(ein)
#	plt.show()
	
	

	
do(ita1)
do(ita2)






	



