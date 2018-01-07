setwd("C:\\Users\\賴柏霖\\Desktop\\統計\\SME10e_EXCEL_DATA_SETS\\ch12 xlsx")
name="Xr12-35.xlsx"
df1=loadWorkbook(name)
df2=readWorksheet(df1,1)
df2<-df2[-c(123:144),]
df2<-df2[-c(49,77,94),]
sampl=df2[,2]
tcv=qt(1-0.025,118)
mean1=mean(sampl)
std=sd(sampl)
lcl=mean1-tcv*std/sqrt(119)
ucl=mean1+tcv*std/sqrt(119)
ans<-c(lcl,ucl)//12.35end










setwd("C:\\Users\\賴柏霖\\Desktop\\統計\\SME10e_EXCEL_DATA_SETS\\ch12 xlsx")
neme="Xr12-75.xlsx"
df1=loadWorkbook(neme)
df2=readWorksheet(df1,1)
sampl=df2$Demand
std=sd(sampl)
vars=std^2
qleft=qchisq(0.025,24)
qright=qchisq(1-0.025,24)
qwe=24*vars/250
if(qwe<=qleft|qwe>=qright) print("can reject null h0")
hist(sampl,col='red')
 