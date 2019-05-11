#! /bin/awk -f

BEGIN {
   RS = "<";
   FS = "="
}

$1  ~ /[ ]*[aA][[:blank:]]*/ {
   i=1
   text=""
   while (i <= NF)
   {
        if (tolower($i) ~ /href/)
        {
            
            len=split ($(i+1), spl1, "[[:blank:]]*['\"][[:blank:]]*");
            if (len > 1)
                text = spl1[len-1]
            else
                text = spl1[1]
            gsub(">", "", text)
            gsub("&quot;", "\"", text)
			gsub("&lt;", "<", text)
			gsub("&gt;", ">", text)
			sub("&amp;", "\\&", text)
	        print  text
            break
        }
        ++i;
   }
}





