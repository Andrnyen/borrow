package com.borrow.borrow;

import com.borrow.borrow.models.User;
import com.borrow.borrow.repositories.UserRepository;
import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@SpringBootApplication
@RestController
@EnableMongoRepositories(basePackageClasses = UserRepository.class) // Enable your repository
public class BorrowApplication implements CommandLineRunner {
    @Autowired
    private UserRepository userRepository;

    public static void main(String[] args) {
        // Load environment variables from .env
        Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();
        // Set environment variables as system properties
        dotenv.entries().forEach(dotenvEntry -> {
            System.setProperty(dotenvEntry.getKey(), dotenvEntry.getValue());
        });

        SpringApplication.run(BorrowApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

////      Insert a new user using the repository
//        User newUser = new User("John", "Doe");
//        userRepository.save(newUser);
//
//        System.out.println("Inserted a new user using UserRepository.");

        List<User> foundUsers = userRepository.findByLastName("Doe");
        for (User user : foundUsers) {
            System.out.println("Found user: " + user.getFirstName());
        }
    }
}


// DO NOT USE - GENERIC METHOD OF DIRECTLY ACCESSING COLLECTIONS
//    @Override
//    public void run(String... args) throws Exception {
//        Dotenv dotenv = Dotenv.load();
//        String connectionString = dotenv.get("MONGODB_URI");
//
//        ServerApi serverApi = ServerApi.builder()
//                .version(ServerApiVersion.V1)
//                .build();
//
//        MongoClientSettings settings = MongoClientSettings.builder()
//                .applyConnectionString(new ConnectionString(connectionString))
//                .serverApi(serverApi)
//                .build();
//        // Create a new client and connect to the server
//        try (MongoClient mongoClient = MongoClients.create(settings)) {
//            try {
//                // Send a ping to confirm a successful connection
//                MongoDatabase database = mongoClient.getDatabase("admin");
//                database.runCommand(new Document("ping", 1));
//                System.out.println("Pinged your deployment. You successfully connected to MongoDB!");
//            } catch (MongoException e) {
//                e.printStackTrace();
//            }
//            // Insert a new document
//            MongoDatabase database = mongoClient.getDatabase("borrowDb");
//            MongoCollection<Document> collection = database.getCollection("users");
//
//            Document newDocument = new Document("firstName", "John")
//                    .append("lastName", "Doe")
//                    .append("email", "john.doe@example.com");
//
//            collection.insertOne(newDocument);
//
//            System.out.println("Inserted a new document into the collection.");
//        }
//    }
