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

        const sql = fs.readFileSync('seed_profiles.sql', 'utf8');
        console.log("Executing seed_profiles.sql...");
        
        const queries = sql.split(';;;SPLIT_HERE;;;').filter(q => q.trim().length > 0);
        let successCount = 0;
        for (const query of queries) {
            try {
                await client.query(query);
                successCount++;
            } catch (err) {
                // If it's a duplicate ENUM value error, we can ignore it
                if (err.code === '42710') {
                    // Duplicate object
                } else {
                    console.error("Error executing query:", err.message);
                }
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
