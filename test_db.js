
const {MongoClient} = require("mongodb");
const url = "mongodb+srv://mohammadapdelsalam:flutterNodjes65@mohamed.ziame88.mongodb.net/?retryWrites=true&w=majority&appName=mohamed";

const client = new MongoClient(url);


const main = async()=>{
    
   await  client.connect();
   console.log("connected successfully to server");
   const db = client.db("mohamed");
   const collection = db.collection("courses");
  await collection.insertOne({
    "title": "javaScript",
    "price": 20
   })

  const data = await collection.find().toArray();
  console.log("data",data);
    
}

main();