const fs = require('fs');
const { Client } = require('pg');
require('dotenv').config();

async function executeSchema() {
    const connectionString = process.env.SUPABASE_CONNECT;
    if (!connectionString) {
        console.error("SUPABASE_CONNECT not found in .env");
        process.exit(1);
    }
    const client = new Client({ connectionString });
    try {
        await client.connect();
        console.log("Connected to PostgreSQL successfully.");
        const sql = fs.readFileSync('seed_inventaris.sql', 'utf8');
        console.log("Executing seed_inventaris.sql...");
        const queries = sql.split(';;;SPLIT_HERE;;;').filter(q => q.trim().length > 0);
        let successCount = 0;
        for (const query of queries) {
            try {
                await client.query(query);
                successCount++;
            } catch (err) {
                console.error("Error executing query:", err.message);
            }
        }
        console.log(`Schema executed successfully. ${successCount} queries run.`);
    } catch (err) {
        console.error("Error executing schema:", err);
    } finally {
        await client.end();
        console.log("Disconnected.");
    }
}
executeSchema();
