const express=require("express")
const routes=express.Router();
const {bai1get, bai1insert, bai1delete, bai1update, bai1edit, bai2}=require("../controller/lab5")
// import all controllers
// import SessionController from './app/controllers/SessionController';

// Add routes
routes.get('/bai1', bai1get);
routes.post('/bai1/insert', bai1insert);
routes.post('/bai1/delete/:id', bai1delete);
routes.get('/bai1/edit/:id', bai1edit);
routes.post('/bai1/update', bai1update);
routes.get('/bai2', bai2);
module.exports = routes;
