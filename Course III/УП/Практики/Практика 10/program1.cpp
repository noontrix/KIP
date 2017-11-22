#include <iostream>
using namespace std;

struct Item {
    int info;
    Item* next;
};

int main()
{
	int arr[4], i, m;
    Item* first = 0;
    Item* p;

    cout<<"Начальный m: "<<m<<"Адрес: "<<&m<<"\n";
    // Создать список
    for (;;) {
        // Вводить числа, пока не введем 0
        cout << " Введи число " << endl;
        cin >> m;
        if (!m)
            break;

        // Создать новый элемент списка
        p = new Item;
        p->info = m;
        cout << "адрес " << m << "  " << p << "  " << endl;

        // Присоединить новый элемент к началу списка
        p->next = first;
        first = p;
    }

    cout<<"После создания списка m: "<<m<<"Адрес: "<<&m<<"\n";

    // Пройти список и вывести элементы
    i=0;
    p = first;
    while (p) {
    	cout<<"Информация: "<<p->info<<" Адрес: "<<p<<" Указывает на: "<<p->next<<"\n";
       if (i<4){
       	arr[i]=p->info;
       	i++;
       }
        p = p->next;
    }

    cout<<"Введите искомое число: ";
   	cin>>m;
   	i=0;
   	p = first;
    while (p){
    	if ((p->info) == m){
    		cout<<"Искомый элемент есть в списке "<<"\n";
    		i++;
    	}
    	p = p->next;
    }
    if (i==0)
    	cout<<"Искомого элемента нет в списке\n";


    while (first) {
        p = first;
        first = first->next;
        delete p;
        cout<<"Информация после удаления: "<<p->info<<" Адрес: "<<p<<" Указывает на: "<<p->next<<"\n";
    }

    cout<<"Вывод массива:\n";
    for (i=0;i<4;i++){
    	cout<<"Информация: "<<arr[i]<<" Адрес "<<&arr[i]<<"\n";
    }

return 0;
}

