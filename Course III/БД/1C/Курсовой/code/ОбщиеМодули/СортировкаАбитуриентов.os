Процедура СортировкаАбитуриентовСправочник() Экспорт
	//Удаление	
	Выборка = Справочники.СортировкаАбитуриентов.ВыбратьИерархически();
	Пока Выборка.Следующий() Цикл
	   ОбъектСправочника = Выборка.ПолучитьОбъект();
	   ОбъектСправочника.Удалить();
   КонецЦикла;
   Выборка = Документы.ДокументОЗачисленииВГруппу.Выбрать();
	Пока Выборка.Следующий() Цикл
	   ОбъектДокумента = Выборка.ПолучитьОбъект();
	   ОбъектДокумента.Удалить();
   КонецЦикла;
   //Первоначальные настройки
    НастройкиСортировки = Справочники.НастройкиСортировкиАбитуриентов.НайтиПоНаименованию("MAIN_CONFIG");
	КолвоЧеловекВГруппе = НастройкиСортировки.КоличествоСтудентовВГруппе;
	ГлобальнаяНумирацияГрупп = 0;
	СтрокаДляОтчетаTelegram = "<b>*Новая сортировка абитуриентов*</b>"+Символы.ПС;	
	Для ИндексСчетчика = 0 по Перечисления.ПеречислениеСпециальностейАбитуринта.Количество()-1 Цикл

			ИмяГруппы = Перечисления.ПеречислениеСпециальностейАбитуринта.Получить(ИндексСчетчика);
			НоваяГруппа = Справочники.СортировкаАбитуриентов.СоздатьГруппу();
		    НоваяГруппа.Наименование = ИмяГруппы;
			СтрокаДляОтчетаTelegram = СтрокаДляОтчетаTelegram + Символы.ПС + "<b>" + ИмяГруппы + "</b>"+Символы.ПС;
		    НоваяГруппа.Записать();
		Запрос = Новый Запрос;
	    Запрос.Текст = 
	        "ВЫБРАТЬ
	        |   Наименование, СпециальностьАбитурента, СреднийБаллАбитуриента, ТипАттестатаАбитуриента, ПриоритетЗачисленияАбитуриента,
			|   ФормаОплатыАбитуриента, ФотоАбитуриента, РодительАбитуриента, АдресАбитуриента, EmailАбитуриента, ТелефонАбитуриента, ДатаРожденияАбитуриента
	        |ИЗ
	        |   Справочник.Абитуриенты КАК Абитуриенты
	        |УПОРЯДОЧИТЬ ПО
	        |   СреднийБаллАбитуриента";
	    РезультатЗапроса = Запрос.Выполнить();
	    ВыборкаАбитуриентов = РезультатЗапроса.Выбрать();
		ОбщийСчетчикАбитуриентовДляГрупп = 0;
		Пока ВыборкаАбитуриентов.Следующий() Цикл
			Если (ВыборкаАбитуриентов.СпециальностьАбитурента = ИмяГруппы) Тогда
				ОбщийСчетчикАбитуриентовДляГрупп = ОбщийСчетчикАбитуриентовДляГрупп + 1;
			КонецЕсли;
		КонецЦикла;
		ВыборкаАбитуриентов.Сбросить();
		Для СчетчикГрупп = 1 По (Окр(ОбщийСчетчикАбитуриентовДляГрупп/КолвоЧеловекВГруппе+0.5,0,0)) Цикл
				НоваяПодгруппа = Справочники.СортировкаАбитуриентов.СоздатьГруппу();
				ГлобальнаяНумирацияГрупп = ГлобальнаяНумирацияГрупп + 1;
				ТекущееНаименованиеГруппы = "1"+ИмяГруппы+"-"+ГлобальнаяНумирацияГрупп+НастройкиСортировки.ГодГруппы;
		    	НоваяПодгруппа.Наименование = ТекущееНаименованиеГруппы;
				СтрокаДляОтчетаTelegram = СтрокаДляОтчетаTelegram + Символы.ПС + "<a 
href="""+НастройкиСортировки.СсылкаНаСайтСЖурналами+ТекущееНаименованиеГруппы+".xlsx"">"+ТекущееНаименованиеГруппы+"</a>" + Символы.ПС;
				НоваяПодгруппа.Родитель =  НоваяГруппа.Ссылка;
		    	НоваяПодгруппа.Записать();
				СчетчикЧеловекВГруппе = 0;
				Пока ВыборкаАбитуриентов.Следующий() Цикл	
					Если (ВыборкаАбитуриентов.СпециальностьАбитурента = ИмяГруппы) Тогда
						//Структура для записи в документ "ДокументОЗачисленииВГруппу"
						НовыйДокументЗачисления = Документы.ДокументОЗачисленииВГруппу.СоздатьДокумент();
	НовыйДокументЗачисления.ФИОАбитуриента = ВыборкаАбитуриентов.Наименование;
						НовыйДокументЗачисления.ГруппаАбитуриента = ТекущееНаименованиеГруппы;
						НовыйДокументЗачисления.СпециальностьАбитурента = ВыборкаАбитуриентов.СпециальностьАбитурента;
						НовыйДокументЗачисления.СреднийБаллАбитуриента = ВыборкаАбитуриентов.СреднийБаллАбитуриента;
						НовыйДокументЗачисления.ФормаОплатыАбитуриента = ВыборкаАбитуриентов.ФормаОплатыАбитуриента;
						НовыйДокументЗачисления.ДатаРожденияАбитуриента = ВыборкаАбитуриентов.ДатаРожденияАбитуриента;
НовыйДокументЗачисления.Дата = ТекущаяДата();						НовыйДокументЗачисления.Записать(РежимЗаписиДокумента.Проведение);
						
						
						//Структура для записи в справочник "СортировкаАбитуриентов"
						Абитуриент = Справочники.СортировкаАбитуриентов.СоздатьЭлемент();
						Абитуриент.Родитель = НоваяПодгруппа.Ссылка;
						Абитуриент.Наименование = ВыборкаАбитуриентов.Наименование;
						Абитуриент.СпециальностьАбитурента = ВыборкаАбитуриентов.СпециальностьАбитурента;
						Абитуриент.СреднийБаллАбитуриента = ВыборкаАбитуриентов.СреднийБаллАбитуриента;
						Абитуриент.ТипАттестатаАбитуриента = ВыборкаАбитуриентов.ТипАттестатаАбитуриента;
						Абитуриент.ПриоритетЗачисленияАбитуриента = ВыборкаАбитуриентов.ПриоритетЗачисленияАбитуриента;
						Абитуриент.ФормаОплатыАбитуриента = ВыборкаАбитуриентов.ФормаОплатыАбитуриента;
						Абитуриент.ФотоАбитуриента = ВыборкаАбитуриентов.ФотоАбитуриента;
						Абитуриент.РодительАбитуриента =  Справочники.РодителиАбитуриентов.НайтиПоНаименованию(ВыборкаАбитуриентов.РодительАбитуриента).Ссылка;
						Абитуриент.АдресАбитуриента = ВыборкаАбитуриентов.АдресАбитуриента;
						Абитуриент.EmailАбитуриента =  ВыборкаАбитуриентов.EmailАбитуриента;
						Абитуриент.ТелефонАбитуриента = ВыборкаАбитуриентов.ТелефонАбитуриента;
						Абитуриент.ДатаРожденияАбитуриента = ВыборкаАбитуриентов.ДатаРожденияАбитуриента; 
						Абитуриент.Записать();
						СтрокаДляОтчетаTelegram = СтрокаДляОтчетаTelegram + "<i>" + Строка(Число(СчетчикЧеловекВГруппе)+1) + ". " + Абитуриент.Наименование + "</i>" + 
Символы.ПС;
						СчетчикЧеловекВГруппе = СчетчикЧеловекВГруппе + 1;
						
						Если (СчетчикЧеловекВГруппе = КолвоЧеловекВГруппе) Тогда
							Прервать;
						КонецЕсли;
					КонецЕсли;		
				КонецЦикла;
			КонецЦикла;				
		КонецЦикла;
		
		СоздатьОтчетTelegram(СтрокаДляОтчетаTelegram,"Сортировка абитуриентов от "+ТекущаяДата(),"Сортировка абитуриентов по группам",4);
КонецПроцедуры

