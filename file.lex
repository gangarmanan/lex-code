%{
int ch=0,num=0,lines=0,spl_char=0,sp=0,w=0,neg=0,fr=0;
%}
%%
[A-Za-z]+ {ch=ch+yyleng;w++;}
[+]?[0-9]+     {num++;ch=ch+yyleng;}
[-][0-9]+     {neg++;ch=ch+yyleng;}
[0-9]+[.][0-9]+ {fr++;}
" " {sp++;}
. {spl_char++;}
\n	{lines++;}
%%
int main()
{
FILE *fp;
fp=fopen("first.txt","r");
yyin=fp;
yylex();
printf("\n\tcharaters =%d",ch);
printf("\n\tnumber =%d",num);
printf("\n\tspecial charters =%d",spl_char);
printf("\n\tlines =%d",lines);
printf("\n\tspaces =%d",sp);
printf("\n\tWords =%d",w);
printf("\n\tNEGATIVE NUMBER =%d",neg);
printf("\n\tfraction number =%d",fr);
return 0;
}
int yywrap()
{
return 1;
}
