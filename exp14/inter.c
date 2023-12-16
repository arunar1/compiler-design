#include<stdio.h>
#include<string.h>
int main(){
    int tmp_ch=90,mul[10],add[10],mulj=0,addj=0,i,n;
    char str[100],var;
    printf("Enter the expression without whitespace: ");
    scanf("%s",str);
    n=strlen(str);
    printf("%d\n",n);
    for(i=0;i<n;i++){
        if(str[i]=='+'||str[i]=='-'){
            add[addj]=i;
            addj++;
        }
        if(str[i]=='*'||str[i]=='/'){
            mul[mulj]=i;
            mulj++;
        }
    }
    var = (char)tmp_ch;
    for(i=0;i<mulj;i++){
        printf("%c=%c%c%c\n",var,str[mul[i]-1],str[mul[i]],str[mul[i]+1]);
        str[mul[i]-1]=var;
        str[mul[i]]=var;
        str[mul[i]+1]=var;
        tmp_ch--;
        var = (char)tmp_ch;
    }
    for(i=0;i<addj;i++){
        printf("%c=%c%c%c\n",var,str[add[i]-1],str[add[i]],str[add[i]+1]);
        str[add[i]-1]=var;
        str[add[i]]=var;
        str[add[i]+1]=var;
        tmp_ch--;
        var = (char)tmp_ch;
    }
    return 0;
}