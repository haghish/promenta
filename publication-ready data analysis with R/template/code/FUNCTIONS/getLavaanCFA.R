getLavaanCFA = function(fit) {
  suppressPackageStartupMessages(
    require(lavaan) 
  )
  
  model = formatC(round(fitMeasures(fit, c("chisq", "df",
                                           "pvalue",
                                           "cfi",
                                           "tli", "rmsea", 
                                           "rmsea.ci.lower", 
                                           "rmsea.pvalue", 
                                           "srmr")), 3), 
                  format='f', digits=3 )
  
  results = as.data.frame(model)
  row.names(results) = c("X2", "Df", "X2 p-val", "CFI","TLI", "RMSEA",
                         "RMSEA 95% CI", "RMSEA p-val",
                         "SRMR")
  ci = fitMeasures(fit, c("rmsea.ci.lower", "rmsea.ci.upper"))
  ci = paste(formatC(round(ci, 3),format='f', digits=3 ),
             collapse = " - ")
  results[,1] = as.character(results[,1])
  results[7, 1] = ci
  return(results)
}
