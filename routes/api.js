const express = require("express");
const router = express.Router();

router.get("/books", (req, res, next) => {

    const search = req.query.search;
    const min = req.query.minprice;
    const max = req.query.maxprice;
    const sort = req.query.sort;

    // Base query
    let sqlquery = "SELECT * FROM books";
    let conditions = [];
    let params = [];

    // SEARCH extension
    if (search) {
        conditions.push("name LIKE ?");
        params.push(`%${search}%`);
    }

    // PRICE RANGE extension
    if (min && max) {
        conditions.push("price BETWEEN ? AND ?");
        params.push(min, max);
    }

    // If any conditions exist → add WHERE clause
    if (conditions.length > 0) {
        sqlquery += " WHERE " + conditions.join(" AND ");
    }

    // SORT extension
    if (sort === "name") {
        sqlquery += " ORDER BY name ASC";
    } else if (sort === "price") {
        sqlquery += " ORDER BY price ASC";
    }

    // Execute DB query
    db.query(sqlquery, params, (err, result) => {
        if (err) {
            res.json(err);
            return next(err);
        }
        res.json(result);
    });
});

module.exports = router;