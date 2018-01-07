fileXls = "Salary_Degree.xlsx"
MR <- loadWorkbook(fileXls)
Salary_Degree <- readWorksheet(MR,1)
Salary <- Salary_Degree$Salary
Score <- Salary_Degree$Score
Experience <- Salary_Degree$Experience
Degree <- Salary_Degree$Degree
n <- length(Salary)
N_u <- Degree == "No"
No_S <- Salary[N_u]
No_e <- Score[N_u]
No_exp <- Experience[N_u]
Y_u <- Degree == "Yes"
Yes_S <- Salary[Y_u]
Yes_e <- Score[Y_u]
Yes_exp <- Experience[Y_u]




plot(No_e, No_S, col = "blue", main = "Salary against Score", xlab = "Score", ylab = "Salary", xlim=range(No_e, Yes_e), ylim=range(No_S,Yes_S))
points(Yes_e, Yes_S, col= "red")
abline(lm(No_S ~ No_e), col = "blue")
abline(lm(Yes_S ~ Yes_e), col= "red")
plot(No_exp, No_S, col = "blue", main = "Salary against Experience", xlab = "Experience", ylab = "Salary", xlim=range(No_exp, Yes_exp), ylim=range(No_S,Yes_S))
points(Yes_exp, Yes_S, col= "red")
abline(lm(No_S ~ No_exp),col = "blue" )
abline(lm(Yes_S ~ Yes_exp), col= "red")