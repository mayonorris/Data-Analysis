#!/usr/bin/R
#EDA
## Univariate analysis

### Basic statistics
Super_mark_copy %>% select_if(is.numeric) %>%
     stargazer(type = "latex",
               label = "Summary statistics of numeric variables ")

### Distributions of numeric varibales
Super_mark_copy %>%
        select_if(is.numeric) %>%
        gather(key = "Variable", value = "Value", factor_key = TRUE) %>%
        ggplot(aes(Value)) +
        geom_histogram(aes(y = after_stat(density)), bins = 10, fill = "#0C0E9D",
                       color = "white") +
        geom_density(alpha = 0.5, color = "red3") +
        facet_wrap(~ Variable, scales = "free") +
        labs(title = "Histograms with Density of Numeric Variables",
             y = "") +
        theme_bw() +
        theme(axis.text = element_text(size = 10),
              axis.title = element_text(size = 12),
              plot.title = element_text(size = 14, face = "bold", hjust = 0.5))

### Distributions of categorical varibales
#### Number of transactions by branch
Super_mark_copy %>%
        group_by(Branch) %>%
        mutate(Branch = str_to_title(Branch)) %>%
        tally() %>%
        ggplot(aes(x = reorder(Branch, n), y = n)) +
        geom_bar(stat = "identity", fill = "#97B3C7", color = "black", width = 0.7) +
        geom_text(aes(label = n), size = 4, hjust = 0.5, vjust = -0.38, color = "black") +
        labs(title = "Number of Transactions by Branch",
             x = "Branch",
             y = "Number of Transactions") +
        theme_minimal() +
        theme(panel.grid = element_blank(),
              axis.text = element_blank()) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1),
              axis.title = element_text(size = 12, face = "bold"),
              plot.title = element_text(size = 13, face = "bold", hjust = 0.5))

### Menber type:

Super_mark_copy %>%
        group_by(Customer.type) %>%
        tally() %>%
        mutate(Freq = n / sum(n)) %>%
        ggplot(aes(x = Customer.type, y = Freq)) +
        geom_bar(stat = "identity", fill = "#97B3C7", color = "black", width = 0.5) +
        geom_text(aes(label = scales::percent(Freq, accuracy = 0.1)),
                  position = position_stack(vjust = 0.85), size = 4, color = "black") +
        theme_minimal() +
        labs(title = "Distribution of Customer Types", x = "Customer Type", y = "Frequencies") +
        scale_y_continuous(labels = scales::percent_format(accuracy = 0.8)) +
        theme(panel.grid = element_blank(),
              axis.text = element_blank()) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1),
              axis.title = element_text(size = 12, face = "bold"),
              plot.title = element_text(size = 13, face = "bold", hjust = 0.5))

#### Gender

Super_mark_copy %>%
        group_by(Gender) %>%
        tally() %>%
        mutate(Freq = n / sum(n)) %>%
        ggplot(aes(x = Gender, y = Freq)) +
        geom_bar(stat = "identity", fill = "#97B3C7", color = "black", width = 0.5) +
        geom_text(aes(label = scales::percent(Freq, accuracy = 0.1)),
                  position = position_stack(vjust = 0.85), size = 4, color = "black") +
        theme_minimal() +
        labs(title = "Customer Gender Distribution", x = "Gender", y = "Frequencies") +
        scale_y_continuous(labels = scales::percent_format(accuracy = 0.8)) +
        theme(panel.grid = element_blank(),
              axis.text = element_blank()) +
        theme(axis.text.x = element_text(hjust = 1),
              axis.title = element_text(size = 12, face = "bold"),
              plot.title = element_text(size = 13, face = "bold", hjust = 0.5))

####Product line
Super_mark_copy %>%
        group_by(Product.line) %>%
        tally() %>%
        mutate(Freq = n / sum(n)) %>%
        ggplot(aes(x = reorder(Product.line,n), y = Freq)) +
        geom_bar(stat = "identity", fill = "#97B3C7",
                 color = "black", width = 0.5) +
        geom_text(aes(label = scales::percent(Freq, accuracy = 0.1)),
                  position = position_stack(vjust = 1.08), size = 4, color = "black") +
        theme_minimal() +
        labs(title = "Customer Gender Distribution", x = "",
             y = "Frequencies") +
        coord_flip() +
        scale_y_continuous(labels = scales::percent_format(accuracy = 0.8)) +
        theme(panel.grid = element_blank(),
              axis.text = element_blank()) +
        theme(axis.text.y  = element_text(hjust = 0.5),
              axis.title = element_text(size = 12, face = "bold"),
              plot.title = element_text(size = 13, face = "bold", hjust = 0.5))

####Payment method
Super_mark_copy %>%
        group_by(Payment) %>%
        tally() %>%
        mutate(Freq = n / sum(n)) %>%
        ggplot(aes(x = reorder(Payment,n), y = Freq)) +
        geom_bar(stat = "identity", fill = "#97B3C7",
                 color = "black", width = 0.4) +
        geom_text(aes(label = scales::percent(Freq, accuracy = 0.1)),
                  position = position_stack(vjust = 0.85), size = 4, color = "black") +
        theme_minimal() +
        labs(title = "Payment method Distribution",
             x = "",
             y = " ") +
        scale_y_continuous(labels = scales::percent_format(accuracy = 0.8)) +
        theme(panel.grid = element_blank(),
              axis.text = element_blank()) +
        theme(axis.text.x = element_text(hjust = 0.5),
              axis.title = element_text(size = 12, face = "bold"),
              plot.title = element_text(size = 13, face = "bold", hjust = 0.5))

