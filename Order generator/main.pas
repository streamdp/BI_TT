unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, mysql57conn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBCtrls, Spin, math, DateUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    MySQL57Connection1: TMySQL57Connection;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  district_id:Array [1..51] of integer = (1,1,1,1,3,4,2,3,2,2,2,1,1,3,2,1,3,2,4,1,3,1,2,1,1,3,2,1,2,2,3,2,3,4,3,1,3,3,3,2,2,3,4,3,1,3,3,3,2,3,1);
  comment:Array [1..20] of String =('Прошу упаковать получше','Прошу упаковать получше','Позвоните по пути','просьба позвонить перед тем как подниматься на этаж','Приезжайте скорее! Хочу кушать','Прошу упаковать получше','Упакуйте в 2 пакета','хочу сюрприз','Прошу упаковать получше','хочу сюрприз','Прошу упаковать получше','просьба позвонить перед тем как подниматься на этаж','Приезжайте скорее! Хочу кушать','Прошу упаковать получше',
  'Упакуйте в 2 пакета','хочу сюрприз','Прошу упаковать получше','хочу сюрприз','Прошу упаковать получше','просьба позвонить перед тем как подниматься на этаж');
  reviewkitchen:Array [1..24] of String = (
  'Огромное спасибо поварам за такую вкуснотищу. Безумно вкусные суши. И десертные блинчики супер)!',
  'Очень вкусно и все на высшем уровне, особенно обслуживание. Суши самые вкусные. Открывайте больше точек и не жалейте конкурентов!!! Вы лучшие!!!',
  'Очень, очень и очень вкусно!!!! Наисвежайшие суши, просто едим и еще хочется!!!Доставка долговато, но ради этой вкуснятины стоит подождать)))) Пожалуй лучшие суши в городе!',
  'Самые вкусные суши в городе. Перепробовали много ресторанов, теперь заказываем только здесь.',
  'Самые лучшие суши у вас! Респект су-шефу! Заказываем только у вас всегда, у других даже не хочется. Всегда свежие продукты, превосходный вкус. Хочется ещё попросить, чтоб добавили в меню горячие суши!!! Спасибо вам за то, что вы есть!',
  'По поводу предновогодних праздников сделала заказ, для сотрудников, на суши Вашей компании. Очарованы сочетанием вкусовых качеств продуктов, их свежестью, оригинальностью исполнения. Чувствуется рука художника-сушиста!',
  'Суши и роллы ОЧЕНЬ вкусные, качество на высоте, но есть два небольших «но»: - время выполнения доставки покороче бы, полтора часа - это слишком много - ОЧЕНЬ не хватает системы скидок для постоянных клиентов',
  'Ребят , так держать ! Самые крутые суши в городе !! Цена и качество !!! Хороший и быстрый сервис !',
  'ОГРОМНОЕ СПАСИБО!!! У вас Самые Вкусные роллы!!!! Испытала Огромное Удовольствие от сегодняшних роллов! Су-Шефу моё искреннее Спасибо!!!',
  'Спасибо огромное за праздник!! Заказала по совету подруги и не прогадала!! очень было приятно также получить подарки от шеф-повара в честь дней рождения мужа и брата!! Сами суши большие, вкусные, свежие, оформление просто выше всяких похвал!!',
  'Оочень осторожно отношусь к доставке еды на дом. Впервые сегодня заказали у вас суши-роллы и суп. Это было потрясающе вкусно! Как в хорошем ресторане, будем с мужем ваши клиентами. Спасибо!!',
  'Беру суши только здесь, т. к. здесь они самые вкусные. Хочу получить скидочную карту :)',
  'Суши каждый раз вкуснейшие! Мой фаворит Филадельфия! Все на высоте! Вы лучшие! Огромное вам спасибо!)))',
  'Добрый день! Спасибо огромное за вкуснейшие суши и очень качественный сервис! Заказываем Просуши уже более 5-ти лет, всегда все отлично.',
  'Спасибо большое! Доставка оперативна, даже раньше чем было оговорено, что очень радует. Суши вкусные, свежие. Буду здесь заказывать ещё. Рекомендую!',
  'Роллы супер! Доставка на достаточно высоком уровне. Всегда привозят, в сказанное диспетчером время. Заказывали много раз. Но вот вчера была не очень приятная ситуация, когда у курьера не было сдачи. Вопрос был решен, но хотелось бы, чтобы такое больше не повторялось. С уважением, ваш постоянный клиент)',
  'Это лучшие суши в городе. Спасибо.',
  'Заказала суши в свой день рождения, привезли классный комплимент от шеф повара! Все очень понравилось, буду заказывать еще. Спасибо',
  'Спасибо за оперативность и качество! Отдельно за подарок :) Очень приятно!',
  'Просуши как всегда на высоте!!! Приятно радуют комплиментами и самыми вкусными, свежими роллами. Отличный коллектив и профессионалы своего дела. Ваши клиенты-навечно.',
  'Заказали Филадельфия татаки, привезли варенный лосось, на сайте в составе указан \"лосось\", ранее всегда был с\\л и выход был гораздо больше, к сожалению Вы испортились, больше заказывать и рекомендовать не будем',
  'Часто заказываю суши и тар тары, но обеденный сет заказала сегодня впервые. Ребята, это супервкусно! Удивительно большая порция и все на самом деле вкусно! Самый достойный обеденный сет, который я пробовала! Спасибо!',
  'Здраствуйте!!! Все всегда на высоте и суши и с доставкой нет никаких проблем. Одни вы возите за город аг.Прилуки.Спасибо за вашу работу)))!!',
  'Вчера заказывали роллы на день рождения, как всегда очень вкусные и красивые! Доставка во время. Девушка оператор очень приятная. Отдельное спасибо шеф-повару за подарок ко дню рождению. Всё супер!!!'
   );

  reviewcouriers:Array[1..5] of String = (
  'Долго не мог понять куда доставлять заказ!',
  'Все хорошо!',
  'Грубый! К тому же неоказалось сдачи!',
  '',
  '');

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    MySQL57Connection1.Connected:=true;
  except
    ShowMessage(' Не могу подключиться к базе данных');
  exit;
  end;
  try
    SQLTransaction1.Active:=true;
  except
    ShowMessage(' Не могу создать транзакцию');
  exit;
  end;
  try
    SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.sql.add('SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'utf8'+#39+',character_set_results='+#39+'utf8'+#39+';');
    SQLQuery1.ExecSQL;
    SQLQuery1.SQL.Clear;
    SQLQuery1.sql.add('SELECT * from  basket;');
    SQLQuery1.Open;
  except
    ShowMessage(' Ошибка при выполнении SQL запроса.');
  exit;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j,courier_id, rkid, rcid, oid,
    kitchen_id,commentCourier_id,
    customer_id,order_id,
    basket_id,product_id,bank_id:integer;
    dateDone,datecc,orderDate,dateTransaction:TDateTime;
    Value:float;

begin
  randomize;
  DefaultFormatSettings.DecimalSeparator:='.';
  DefaultFormatSettings.DateSeparator:= '-';
  DefaultFormatSettings.TimeSeparator:=':';
  DefaultFormatSettings.ShortDateFormat:= 'yyyy-mm-dd ';
  DefaultFormatSettings.ShortTimeFormat:= 'hh:mm:ss';

  //получаем  последние значение order_id и orderDate
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT   max(order_id) as oid, max(orderDate) as datecc  FROM orders ;');
  SQLQuery1.Open;
  oid:=SQLQuery1.FieldByName('oid').AsInteger+1;
  datecc:=SQLQuery1.FieldByName('datecc').AsDateTime;

  //получаем  последние значение reviewKitchen_id
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT  reviewKitchen_id as rkid FROM reviewkitchen ORDER BY reviewKitchen_id DESC LIMIT 1;');
  SQLQuery1.Open;
  rkid:=SQLQuery1.FieldByName('rkid').AsInteger+1;

  //получаем  последние значение reviewCourier_id
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT  reviewCourier_id as rcid  FROM reviewcouriers ORDER BY reviewCourier_id DESC LIMIT 1;');
  SQLQuery1.Open;
  rcid:=SQLQuery1.FieldByName('rcid').AsInteger+1;

  //цикл генерации строк от текущего order_id до значения заданного пользователем (по умолчанию 100 строк)
  for i:=oid to oid+SpinEdit1.Value do
  begin
    kitchen_id:=i;
    commentCourier_id:=i;
    order_id:=i;
    bank_id:=i;
    courier_id:= randomrange(1,12); //случайный курьер
    customer_id:=RandomRange(1,52); //случайный клиент

    if HourOf(datecc)<SpinEdit2.Value-1 then
          datecc:=datecc+0.01+Random()/100-oid*0.0000005 //дата заказа, с уменьшением интервала между заказами с течением времени.
    else
          datecc:=datecc+0.506944444; //меняем сутки
   // datecc:=datecc+0.01+Random()/100-oid*0.000001;

    orderDate:=datecc;
    dateDone:=datecc+0.01+Random()/100+oid*0.0000007; //дата приготовления заказа  кухней, с увеличением интервала между заказами с течением времени.
    dateTransaction:=dateDone+0.01+Random()/100+oid*0.00000011; //дата оплаты заказа  клиентом, с увеличением интервала между оплатами с течением времени.


    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('INSERT INTO commentcouriers (commentCourier_id, customer_id, coment, datecc) VALUES (:commentCourier_id, :customer_id, :coment, :datecc);');
    SQLQuery1.Params.ParamByName('commentCourier_id').AsInteger:=commentCourier_id;
    SQLQuery1.Params.ParamByName('coment').AsString:=comment[RandomRange(1,21)];
    SQLQuery1.Params.ParamByName('customer_id').AsInteger:=customer_id;
    SQLQuery1.Params.ParamByName('datecc').AsDateTime:=datecc;
    SQLQuery1.ExecSQL;


    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('INSERT INTO kitchens (kitchen_id, courier_id, dateDone, commentCourier_id) VALUES (:kitchen_id, :courier_id,:dateDone,:commentCourier_id);');
    SQLQuery1.Params.ParamByName('kitchen_id').AsInteger:=kitchen_id;
    SQLQuery1.Params.ParamByName('courier_id').AsInteger:=courier_id;
    SQLQuery1.Params.ParamByName('dateDone').AsDateTime:=dateDone;
    SQLQuery1.Params.ParamByName('commentCourier_id').AsInteger:=commentCourier_id;
    SQLQuery1.ExecSQL;


    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('INSERT INTO orders (order_id, customer_id, orderDate, district_id, kitchen_id) VALUES (:order_id, :customer_id, :orderDate, :district_id, :kitchen_id);');
    SQLQuery1.Params.ParamByName('order_id').AsInteger:=order_id;
    SQLQuery1.Params.ParamByName('customer_id').AsInteger:=customer_id;
    SQLQuery1.Params.ParamByName('orderDate').AsDateTime:=orderDate;
    SQLQuery1.Params.ParamByName('district_id').AsInteger:=district_id[customer_id];
    SQLQuery1.Params.ParamByName('kitchen_id').AsInteger:=kitchen_id;
    SQLQuery1.ExecSQL;


    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('SELECT max(basket_id) as bid FROM basket');
    SQLQuery1.Open;
    basket_id:=SQLQuery1.FieldByName('bid').AsInteger+1;

    for j:=1 to RandomRange(1,6) do       //добавляем в корзину к заказу случайное количество еды
    begin
        product_id:=RandomRange(1,93);

        SQLQuery1.Close;
        SQLQuery1.SQL.Clear;
        SQLQuery1.SQL.Add('INSERT INTO basket (basket_id, product_id, quantity, order_id) VALUES (:basket_id, :product_id, :quantity, :order_id);');
        SQLQuery1.Params.ParamByName('basket_id').AsInteger:=basket_id;
        SQLQuery1.Params.ParamByName('product_id').AsInteger:=product_id;
        SQLQuery1.Params.ParamByName('quantity').AsInteger:=RandomRange(1,4);
        SQLQuery1.Params.ParamByName('order_id').AsInteger:=order_id;
        SQLQuery1.ExecSQL;

        basket_id:=basket_id+1;
    end;

    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('SELECT sum(quantity*price) as val from basket join prices where  basket.product_id=prices.product_id and order_id=:order_id');
    SQLQuery1.Params.ParamByName('order_id').AsInteger:=order_id;
    SQLQuery1.Open;
    Value:=SQLQuery1.FieldByName('val').AsFloat;   //получили стоимость заказа на основе данных в таблице prices


    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('INSERT INTO bank (bank_id, order_id, courier_id, dateTransaction, Amount) VALUES (:bank_id, :order_id, :courier_id, :dateTransaction, :Amount);');
    SQLQuery1.Params.ParamByName('bank_id').AsInteger:=bank_id;
    SQLQuery1.Params.ParamByName('order_id').AsInteger:=order_id;
    SQLQuery1.Params.ParamByName('courier_id').AsInteger:=courier_id;
    SQLQuery1.Params.ParamByName('dateTransaction').AsDateTime:=dateTransaction;
    SQLQuery1.Params.ParamByName('Amount').AsFloat:=Value;
    SQLQuery1.ExecSQL;

    if RandomRange(1,5)=2 then    //иногда добавляем отзыв о кухне
    begin
         SQLQuery1.Close;
         SQLQuery1.SQL.Clear;
         SQLQuery1.SQL.Add('INSERT INTO reviewkitchen (reviewKitchen_id, kitchen_id, customer_id, review, stars) VALUES (:reviewKitchen_id, :kitchen_id, :customer_id, :review, :stars);');
         SQLQuery1.Params.ParamByName('reviewKitchen_id').AsInteger:=rkid;
         SQLQuery1.Params.ParamByName('kitchen_id').AsInteger:=kitchen_id;
         SQLQuery1.Params.ParamByName('customer_id').AsInteger:=customer_id;
         SQLQuery1.Params.ParamByName('review').AsString:=reviewkitchen[RandomRange(1,25)];
         SQLQuery1.Params.ParamByName('stars').AsInteger:=RandomRange(2,5);
         SQLQuery1.ExecSQL;
         rkid:=rkid+1;
    end;

    if RandomRange(1,7)=3 then    //иногда добавляем отзыв о курьере
    begin
         SQLQuery1.Close;
         SQLQuery1.SQL.Clear;
         SQLQuery1.SQL.Add('INSERT INTO reviewcouriers (reviewCourier_id, courier_id, customer_id, review, stars) VALUES (:reviewCourier_id, :courier_id, :customer_id, :review, :stars);');
         SQLQuery1.Params.ParamByName('reviewCourier_id').AsInteger:=rcid;
         SQLQuery1.Params.ParamByName('courier_id').AsInteger:=courier_id;
         SQLQuery1.Params.ParamByName('customer_id').AsInteger:=customer_id;
         SQLQuery1.Params.ParamByName('review').AsString:=reviewkitchen[RandomRange(1,6)];
         SQLQuery1.Params.ParamByName('stars').AsInteger:=RandomRange(2,5);
         SQLQuery1.ExecSQL;
         rcid:=rcid+1;
    end;
    memo1.Lines.Add('Проход завершен!'+'Обработано '+IntToStr(order_id)+' заказов, последняя дата - '+DateTimeToStr(orderDate));
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SQLQuery1.Active:=false;
  SQLTransaction1.Commit;
  MySQL57Connection1.Connected:=false;
  memo1.Lines.Add('Отключены он БД!');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  SQLQuery1.Active:=false;
  SQLTransaction1.Commit;
  MySQL57Connection1.Connected:=false;
end;

end.

