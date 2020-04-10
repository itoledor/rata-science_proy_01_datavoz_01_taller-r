#### SETUP 03 FUNCTIONS                                                   ####

#### Network Functions                                                    ####

first.component<- function(graph){
  cl<-clusters(graph)
  induced.subgraph(graph,which(cl$membership==order(cl$csize, decreasing = T)[1]))}

