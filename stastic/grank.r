grank = function(data1) {
    alldata = sort(data1)
    tmpdf = data.frame(raw=alldata,  rank=1:length(alldata))
    avgrank = aggregate(tmpdf, by=list(tmpdf$raw),      FUN=mean)
    avgrank$Group.1=NULL
    #merge back
    samp1=data.frame(seq=1:length(data1), raw=data1)
    samp1=merge(samp1, avgrank)
    o1=order(samp1$seq)
    return(samp1$rank[o1])
}
