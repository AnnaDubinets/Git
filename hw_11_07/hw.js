//1.Вывести среднюю реакцию по всем публикациям

db.posts.aggregate([
    {
        $group: {
            _id: null,
            averageReaction: { $avg: "$reaction" }
        }
    },
    {
        $project: {
            _id: 0,
            averageReaction: 1
        }
    }
]);


//2.Вывести среднюю реакцию авторов из USA

db.posts.aggregate([
    {
        $lookup: {
            from: "users",
            localField: "authorId",
            foreignField: "_id",
            as: "author"
        }
    },
    {
        $unwind: "$author"
    },
    {
        $match: { "author.country": "USA" }
    },
    {
        $group: {
            _id: null,
            avgReaction: { $avg: "$reaction" }
        }
    },
    {
        $project: {
            _id: 0,
            avgReaction: 1
        }
    }
])

//3.Увеличить баланс всех не заблокированных юзеров на 0.5%

db.users.updateMany(
    { isBlocked: false },
    { $mul: { balance: 1.005 } }
)

//4.Вывести ко-во реакций с оценкой 4

db.reactions.countDocuments({ rating: 4 })
