1. Добавить тег test для тех видео, у которых его нет

db.videos.updateMany(
  { tags: { $ne: "test" }},  
  { $addToSet: { tags: "test" }}  
);


2. Вывести названия роликов с тегом test

db.videos.find(
  { tags: "test" },  
  { _id: 0, title: 1 }  
);