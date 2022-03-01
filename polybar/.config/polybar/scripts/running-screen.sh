#!/bin/sh
jl=""
py=""
running_screen=$(screen -list | awk -v jl=$jl -v py=$py '{     
                    if ($1 == "No"){        
                        print " "           
                    }else if ($1 != "1"){   
                        split($1,w,".")    
                    }else{
                        if (w[2] == "jl"){
                            print "%{F#ffbb00}" jl "%{F-}"
                        }else{
                            print py
                        }
                    }
                }')
                
echo $running_screen
