//1. Вывести названия двух произвольных треков с тегом mega

db.videos.find(
{ tags: "mega" }, 
{ title: 1, _id: 0 }
{
    $limit: 2
}
)


//2. Вывести имя юзера с самым минимальным балансом

db.users.find(
    {}, 
    { username: 1, balance: 1, _id: 0 },
    { 
        $limit: 1
    }
)



//3.Используя метод countDocuments(), вывести ко-во заблокированных юзеров с балансом от 10 до 1000 EUR (вкл.)


db.users.countDocuments(
    { 
        isBlocked: true 
    },
        {balance: { $gte: 10, $lte: 1000 } 
    }
);

//4. Используя метод aggregate(), вывести ко-во незаблокированных юзеров не из Germany и не из France с балансом до 1000 EUR (не вкл.)


//5. Принцип работы агрегация в MongoDB

Агрегация в MongoDB — это способ обработки данных, при котором документы из коллекции проходят через несколько этапов, или стадий, где над ними выполняются различные операции, такие как фильтрация, сортировка, группировка и другие. Это похоже на конвейер, где данные на каждом этапе обрабатываются и передаются дальше для следующей обработки.