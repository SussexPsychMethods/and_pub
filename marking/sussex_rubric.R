
rubric <- list(
  c1 = list(
    name = "Analysis",
    col = "#dc46dc",
    text = "This component reflects the quality of your statistical analysis and your ability to present and interpret data. To score highly in this area, you must write your code and run your analysis thoroughly and correctly, report all the relevant statistics clearly and correctly, visualise your data appropriately, and demonstrate how well you understand what the results mean.",
    grade = rev(c("This write-up is close to the standard of articles found in academic journals. It meets the criteria for an outstanding 1<sup>st</sup> but with additional innovation in, or understanding of, the data analytic tools applied to the research question.",
              "The study and write-up show initiative and originality. It meets the criteria for a clear 1<sup>st</sup> but with exceptional clarity and coherence or perhaps shows a solid use and understanding of analytic tools beyond what has been taught.",
              "The study and write-up show some degree of originality and invention. Excellent data analysis and presentation are evidenced by a correctly executed analysis that is appropriate to address the research question, and by a coherent presentation that implies a full understanding of visualizing, analysing, describing and interpreting data.",
              "This is a basically sound project. Competent data analysis and presentation is evidenced by a correctly conducted analysis that is appropriate to address the research question and by a presentation that is generally coherent and implies a good understanding of visualising, analysing, describing, and interpreting data.",
              "This is an adequate project. Minor deficiencies in data analysis and presentation are evidenced by an analysis that is partially inappropriate to address the research question and/or has some minor errors in execution, or by a presentation with occasional lapses in coherence and/or that implies confusion about visualising, analysing, describing and interpreting data.",
              "This is a perfunctory attempt at writing up the project. There are moderate deficiencies in data analysis and presentation evidenced by an analysis that isinappropriate to address the research question and/or has some errors in execution, or by a presentation thatlacks coherence and/or demonstrates little understanding of visualizing, analysing, describing and interpretingdata.",
              "This is an unacceptable piece of work with substantial shortcomings. There are serious deficiencies in data analysis and presentation as evidenced by an analysis that is inappropriate to address the research question and/or is incorrectly executed, or by a presentation that iscursory, extremely incoherent and/or demonstrates a lack of understanding of visualizing, analysing, describingand interpreting data.",
              "The project is seriously deficient in several respects. No analysis has been attempted or one so ill-conceived as to demonstrate virtually no understanding of visualising, analysing, describing, and interpreting data."
    ))
  ),
  c2 = list(
    name = "Critical thinking",
    col = "#3572db",
    text = "This component captures your ability to evaluate your own and other studies' findings with a critical eye. To score highly in this area, you must discuss evidence-based criticisms of your own and other studies (not just speculations about what might have gone wrong!); and make insightful, novel, or theoretically interesting suggestions for how to continue this research in the future.",
    grade = rev(c("This write-up is close to the standard of articles found in academic journals. The student shows a high level of ability to criticise constructively both past research and the research that they have performed (both on methodological and theoretical grounds) and makes insightful and worthwhile suggestions for future research.",
              "The study and write-up show initiative and originality. The student shows an excellent ability to criticise constructively both past research and the research that has been performed (both on methodological and theoretical grounds) and to make insightful and worthwhile suggestions for future research.",
              "The study and write-up show some degree of originality and invention. The student shows some ability to make non-trivial criticisms of past research and of their own study (both on methodological and theoretical grounds) and to make insightful and worthwhile suggestions for future research.",
              "This is a basically sound project. The student makes some attempt to criticise constructively their own and past research (both on methodological and theoretical grounds) but these may contain some trivial observations. Sensible suggestions for future research are made.",
              "This is an adequate project. The student has demonstrated a lack of ability to constructively criticise their own or past research (either on methodological or theoretical grounds) or to suggest worthwhile future research.",
              "This is a perfunctory attempt at writing up the project. Little evidence of any ability to evaluate the theoretical or methodological limitations of the study performed are presented.",
              "This is an unacceptable piece of work with substantial shortcomings. There is no evidence of any ability to evaluate the theoretical or methodological limitations of thestudy performed.",
              "The project is seriously deficient in several respects. No attempt to evaluate the theoretical or methodological limitations of the study has been performed."
    ))
  ),
  c3 = list(
    name = "Theory understanding",
    col = "#21bdae",
    text = "This component looks at your knowledge and understanding of both the research question and the analysis you have done to answer it. To score highly in this area, you must demonstrate that you understand what your analysis tells you, and discuss how your analysis results do, and do not, inform the overall research question.",
    grade = rev(c("This write-up is close to the standard of articles found in academic journals. The introduction and discussion show a firm understanding of the theoretical issues underlying the research. In particular, the introduction is a focused account of relevant work leading up to the study conducted, and the discussion demonstrates an insightful grasp of the theoretical implications ofthe work.",
              "The study and write-up show initiative and originality. The introduction and discussion show an excellent understanding of the issues underlying the research, and there is clear evidence that the student understands the theoretical implications of their work.",
              "The study and write-up show some degree of originality and invention. The student demonstrates a reasonable understanding of theoretical and methodological issues. The discussion shows a good understanding of the theoretical issues underlying theresearch.",
              "This is a basically sound project. The discussion includes a competent attempt to relate the findings to previous theoretical and empirical research; however, the exposition of theoretical implications is less than in higher bands.",
              "This is an adequate project. A limited attempt to relate the study to previous work (theoretical and empirical) was made.",
              "This is a perfunctory attempt at writing up the project. Little attempt to relate the results to relevant theoretical background material is apparent.",
              "This is an unacceptable piece of work with substantial shortcomings. There is a complete lack of theoretical insight.",
              "The project is seriously deficient in several respects. Complete lack of theoretical insight is demonstrated."
    ))
  ),
  c4 = list(
    name = "Organisation",
    col = "#6fbb00",
    text = "This component captures your writing, both of text and of R script, and your ability to communicate clearly and scientifically. To score highly in this area, you must write clear, error-free, efficient R code; submit an RMarkdown file that knits correctly and produces a consistently and correctly formatted document; organise your report into sections, each of which summarises the relevant information accurately and succinctly; and communicate your ideas, findings, and evidence in a logical, scientific, and understandable way.",
    grade = rev(c("This write-up is close to the standard of articles found in academic journals. It is an outstanding study and write-up that shows initiative, flair, and originality. The write-up is exceptional in terms of clarity and organisation of material. Faultless adherence to project format conventions.",
              "The study and write-up show initiative and originality. The write-up is very well organised and clearly written. The introduction is fairly focused and there is little evidence of wandering off on tangents. There are few errors in adherence to project format conventions.",
              "The study and write-up show some degree of originality and invention. The write-up is well organised and clearly written. The introduction may be slightly less focused than for higher marking bands but largely avoids mentioning work not directly relevant to the current research. There can be minor errors in terms of adherence to project format conventions.",
              "This is a basically sound project. The write-up is fairly well organised and clearly written (possibly with some minor lapses of clarity). The introduction may not be as focused as in higher marking bands but the key relevant material is included. Some errors in adherence to project format guidelines will be tolerated.",
              "This is an adequately organised and moderately competent project, but it may contain some of the following limitations: lack of adherence to standard format, poor organisation of material, poor or clumsy expression.",
              "This is a perfunctory attempt at writing up the project. Basic information about the research is communicated, but there is little attention to comprehensiveness or clarity in describing the procedures used or the results obtained. Presentation is somewhat scrappy.",
              "This is an unacceptable piece of work with substantial shortcomings. It is incomplete or badly written up. Very little effort has been put into describing the method, results and relevant background theory and research. There is incoherence in presentation of background material, procedures, or analysis. The presentation is very poor presentation.",
              "The project is seriously deficient in several respects. There is barely any attempt to mention relevant background theory and research, and to describe the method and results."
    ))
  ),
  c5 = list(
    name = "Research",
    col = "#ff9d00",
    text = "This component reflects the design and grounding of the study you are presenting. To score highly in this area, you must read and reference a variety of academic sources, beyond those given as suggested readings or on the reading list; draw on these wider readings to inform your ideas and understanding of the study; and implement a research design that is appropriate to answer the research question.",
    grade = rev(c("This write-up is close to the standard of articles found in academic journals. There is evidence of wide, independent reading of relevant research (from up to date journalarticles and books). Where students have been required to design the study from scratch, the design isoutstanding in terms of originality, methodological rigour and theoretical significance.",
              "The study and write-up show initiative and originality. There is some evidence of independent reading of relevant research (from up-to-date journal articles and books). Where students have been required to design the study from scratch, the design is very good in terms of originality, methodological rigour, and theoretical significance.",
              "The study and write-up show some degree of originality and invention. There is evidence of some independent reading of relevant research (from up-to date-journalarticles and books), supplementing references already provided on the reading list. Where students have been required to design the study from scratch, the design is good in terms of originality, methodological rigour and theoretical significance.",
              "This is a basically sound project. Background material used for the introduction and discussion does not go substantially beyond that mentioned on the reading list. Where students have been required to design the study from scratch, the student has produced a competently designed and methodologically rigorous study.",
              "This is an adequate project. Where students have been required to design the study from scratch, the design is adequate in terms of methodological rigour. Background material used for the introduction and discussion is limited to textbooks.",
              "This is a perfunctory attempt at writing up the project. Where students have been required to design the study from scratch, the design has some merit but has major methodological flaws or limitations that could have been foreseen and avoided.",
              "This is an unacceptable piece of work with substantial shortcomings. Where students have been required to design the study from scratch, the design isinadequate to address the research issue.",
              "The project is seriously deficient in several respects. Where students have been required to design the study from scratch, either no study was conducted or it was so poorly conceived as to be of no consequence whatsoever for the research issue."
    ))
  )
)
