#include <stdio.h>
#include <iostream>
#include <math.h>
#include <locale.h>
#include <ncurses.h>
#include <string>
#include <cmath>
#include <iomanip>

#define pi 3.1415
#define e 0.00001
#define doublepi 9.8696

using namespace std;

//Функция валидации для n11_3
bool validation(int s1, int s2, int s3) {
    return (s1==s2) || (s1==s3) || (s2==s3) ? true : false;
}

//Функция точки для n11_4
bool tochka(int t1, int t2){
    return ((t1 <= -2) && (t1 >= -6) && (t2 >2) &&(t2 < 7)) || ((t1 <= -4) &&(t1 >= -6)&&(t2 >= -3)&&(t2 <= 2)) ? true : false
;}

//Строктура для n13_1
struct point
 {
  char name[10];
  int x;
  int y;
 };

//Функция НОД для n13_2
int nod(int a, int b,int n){
    if (a%b==0){
      n=b;
    }
    else{
      int r=b;
      b=a%b;
      a=r;
      n=b;
    }
  return n;
}

//Далее номера практических и работ
int n11_1(){

  int x,y;
  long double c;
  printw("x="); scanw("%d",&x);
  printw("y="); scanw("%d",&y);
  c=log10((y-sqrt(log10(x)))*(x-(y/(x+pow(x,2)/4))));
  printw("Result: => %Lf",c);

cout<<"\n";
return 0;  
}

int n11_2(){

  int x,y,sum,raz,proiz;
    float fix;
    float chast;
    printw("x="); scanw("%d",&x);
  printw("y="); scanw("%d",&y);
	
  sum=x+y;
  raz=x-y;
  proiz=x*y;
  chast=x/y;

  printw("Result:\nSumma => %d\nRasnost => %d\nProizvedeniye => %d\nChastnoye => %fl",sum,raz,proiz,chast);

printw("\n");
return 0;
}

int n11_3(){

  int a,b,c;
  bool trigger;

  printw("a="); scanw("%d",&a);
  printw("b="); scanw("%d",&b);
  printw("c="); scanw("%d",&c);
  trigger = validation(a,b,c);
  printw("\nResult: ");
    (trigger == 1) ? printw("True") : printw("False");

printw("\n");
return 0; 
}

int n11_4(){

  int x,y;
    bool trigger;

  printw("x => "); scanw("%d",&x);
  printw("y => "); scanw("%d",&y);

  trigger = tochka(x,y);
    (trigger == 1) ? printw("True") : printw("False");

printw("\n");
return 0;
}

int n12_1(){
    setlocale(LC_ALL, "ru_RU.utf8");

    int k,a;
    long double result;
    printw("|1| Вычисление длинны окружности\n|2| Вычисление радиуса окружности\n|3| Вычисление диаметра окружности\n=> ");
    scanw("%d",&k);

  switch (k){
      case 1:
          scanw("%d",&a);
          result = sqrt(a)/(4 * pi);
          printw("%ld",result);
          break;

      case 2:
          scanw("%d",&a);
          result = pi * sqrt(a);
          printw("%ld",result);
          break;

      case 3:
          scanw("%d",&a);
          result = pi * sqrt(a / 2);
          printw("%ld",result);
          break;

      default:
          printw("???");
          break;
      }

printw("\n");
return 0;
}

int n12_2(){    
    setlocale(LC_ALL, "rus");
    double x,c,sum,y;
  int n,q; 
  sum=0;
  n=1;
  
  initx:  
      printw("x => "); scanw("%d",&x);
  
  if ((x*x)>(doublepi/4)){
      printw("\nПовторите ввод\n");
      goto initx;
  } 
  
  c=sin(x)*sin(x); 
  sum=c; 
  y=log(cos(x));
  cout<<"Значение ln cos(x) = "<<setprecision(5)<<y; 
  cout<<"N слагаемое S(x)"; 
  
  do{ 
      cout<<"\n"<<n; 
      c=c*(n*sin(x)*sin(x))/(n+1);
      sum+=c; 
      cout<<setw(12)<<setprecision(5)<<c; 
      cout<<setw(12)<<setprecision(5)<<-0.5*sum; 
      n++;
  } 
  while ((fabs(c)>=e)&&(n<1000)); 
  cout<<"\n\nЗаданная точность достигается за "<<n-1<<" шага"; 
  cout<<"\nСумма ряда: "<<setprecision(5)<<-0.5*sum; 

printw("\n");
return 0;
}

int n13_1(){    
    setlocale(LC_ALL, "rus");

  int i, j, ind1, ind2;
  double s, d;
  int num_points;
  double x,c,sum,y;
  int n,q; 
  sum=0;
  n=1;
  
  initx:  
      cout<<"x => ";cin>>x;
  
  if ((x*x)>(doublepi/4)){
      cout<<"\nПовторите ввод\n";
      goto initx;
  } 
  
  c=sin(x)*sin(x); 
  sum=c; 
  y=log(cos(x));
  
  cout<<"Значение ln cos(x) = "<<setprecision(5)<<y; 
  cout<<"N слагаемое S(x)"; 
  
  do{ 
      cout<<"\n"<<n; 
      c=c*(n*sin(x)*sin(x))/(n+1);
      sum+=c; 
      cout<<setw(12)<<setprecision(5)<<c; 
      cout<<setw(12)<<setprecision(5)<<-0.5*sum; 
      n++;
  } 
  while ((fabs(c)>=e)&&(n<1000)); 
  cout<<"\n\nЗаданная точность достигается за "<<n-1<<" шага"; 
  cout<<"\nСумма ряда: "<<setprecision(5)<<-0.5*sum; 

printw("\n");
return 0;
}

int n13_2(){

    int c1, c2;

    cout<<"Введите два числа для нахождения НОД =>";
    cin>>c1;
    cin>>c2;

    int n=0;
    if (c1 < c2){
      int p=c2; c2=c1; c1=p;}
    do{
      n = nod(c1,c2,n);
    } while (c1%c2!=0);

    if (n!=1){
      cout << "НОД => " << n << endl;
    }
    else{
      cout << "Числа не имеют НОД" << endl;
    }

printw("\n");
return 0;
}
