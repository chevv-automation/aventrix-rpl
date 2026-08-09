const { Client } = require('pg');
require('dotenv').config();

async function capitalizeFields() {
    const connectionString = process.env.SUPABASE_CONNECT;
    
    if (!connectionString) {
        console.error("SUPABASE_CONNECT not found in .env");
        process.exit(1);
    }

    const client = new Client({ connectionString });

    try {
        await client.connect();
        console.log("Connected to PostgreSQL successfully.");

        const query = `
            UPDATE profiles
            SET 
              nama = initcap(nama),
              alamat_rumah = initcap(alamat_rumah),
              tempat_lahir = initcap(tempat_lahir);
        `;
        
        console.log("Executing UPDATE query...");
        const res = await client.query(query);
        console.log(`Updated ${res.rowCount} rows successfully.`);
    } catch (err) {
        console.error("Error executing query:", err.message);
    } finally {
        await client.end();
        console.log("Disconnected.");
    }
}

capitalizeFields();
