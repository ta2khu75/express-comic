const connection = require("../config/database");
const { fields } = require("../config/upload");
const selectUser = async () => {
        const [results, fields] = await connection.execute("Select * from Users")
        console.log(results);
        return results;
}
const findUser = async (id) => {
        const [results, fields] = await connection.execute("Select * from Users where id=?", [id]);
        console.log(results);
        return results;
}
const deleteUser = async (id) => {
        const [results, fields] = await connection.execute("Delete from Users where id=?", [id]);
        console.log(results);
        return results;
}
const updateUser = async (user) => {
        const { results, fields } = await connection.execute("update Users set name=?, email=?, city=? where id=?", [user.name, user.email, user.city, user.id])
        return results;
}
const insertUser = async (user) => {
        const { results, fields } = await connection.execute("insert into Users (name, email, city) values (?, ?, ?)", [user.name, user.email, user.city])
        console.log(results);
        return results
}
module.exports = { selectUser, findUser, insertUser, updateUser, deleteUser }