Процедура 
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.ДокументОВозвратеДокументов.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ДокументОВозвратеДокументов.EmailАбитуриентаВозврат,
	|	ДокументОВозвратеДокументов.АдресАбитуриентаВозврат,
	|	ДокументОВозвратеДокументов.Дата,
	|	ДокументОВозвратеДокументов.ДатаРожденияВозврат,
	|	ДокументОВозвратеДокументов.Номер,
	|	ДокументОВозвратеДокументов.ТелефонАбитуриентаВозврат,
	|	ДокументОВозвратеДокументов.ФИОАбитуриентаВозврат,
	|	ДокументОВозвратеДокументов.СписокДокументов.(
	|		Документ,
	|		Номер
	|	)
	|ИЗ
	|	Документ.ДокументОВозвратеДокументов КАК ДокументОВозвратеДокументов
	|ГДЕ
	|	ДокументОВозвратеДокументов.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьСписокДокументовШапка = Макет.ПолучитьОбласть("СписокДокументовШапка");
	ОбластьСписокДокументов = Макет.ПолучитьОбласть("СписокДокументов");
	Подвал = Макет.ПолучитьОбласть("Подвал");

	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьСписокДокументовШапка);
		ВыборкаСписокДокументов = Выборка.СписокДокументов.Выбрать();
		Пока ВыборкаСписокДокументов.Следующий() Цикл
			ОбластьСписокДокументов.Параметры.Заполнить(ВыборкаСписокДокументов);
			ТабДок.Вывести(ОбластьСписокДокументов, ВыборкаСписокДокументов.Уровень());
		КонецЦикла;

		Подвал.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Подвал);

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры 

