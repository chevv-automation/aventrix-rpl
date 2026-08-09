const fs = require('fs');
const { Client } = require('pg');
require('dotenv').config();

async function executeSchema() {
    const connectionString = process.env.SUPABASE_CONNECT;
    
    if (!connectionString) {
        console.error("SUPABASE_CONNECT not found in .env");
        process.exit(1);
    }

    const client = new Client({
        connectionString,
        // Typically Supabase uses port 6543 for transaction pooling, but 5432 works if connected directly
        // The user provided connection string in .env
    });

    try {
        await client.connect();
        console.log("Connected to PostgreSQL successfully.");

        const sql = fs.readFileSync('schema.sql', 'utf8');
        console.log("Executing schema.sql...");
        
        await client.query(sql);
        
        console.log("Schema executed successfully.");
    } catch (err) {
        console.error("Error executing schema:", err);
    } finally {
        await client.end();
        console.log("Disconnected.");
    }
}

executeSchema();
