// В рамках БД social_network выведите данные о трех произвольных реакциях на публикации (проекция: оценка, имяавторареакции, заголовок_публикации)

db.post_reactions.aggregate([

    { $limit: 3 },
    {
        $lookup: {
            from: 'users',
            localField: 'user_id',
            foreignField: '_id',
            as: 'user'
        }
    },
    { $unwind: '$user' },
    {
        $lookup: {
            from: 'posts',
            localField: 'post_id',
            foreignField: '_id',
            as: 'post'
        }
    },
    { $unwind: '$post' },
    {
        $project: {
            _id: 0,
            reactoin_value: '$value',
            reaction_author_fullname: '$reaction_author.fullname', 
            post_title: '$post.title'  
        }
    }
])