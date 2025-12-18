// uploading a document
// POST /api/summary/upload
// Form Data: file (PDF or PPT file) along with userId

// Response:
// {
//   "success": true,
//   "message": "Document uploaded successfully",
//   "data": {
//     "id": "6723f68d-b5b4-4c6a-aefd-1679e6f91ad4",
//     "fileName": "IIIrd sem AE- 2024 Text book.pdf",
//     "mimeType": "application/pdf",
//     "size": 1904771,
//     "status": "uploaded"
//   }
// }

// Generate Summary

// GET http://localhost:5000/api/summary/generate?fileId=6392be6c-ecc8-4105-987d-b3d60cd9d2b3&userId=cmi4kz1610000ijnmm3jun0l9
// 2 query params: fileId, userId

// Response:
// {
//     "success": true,
//     "message": "Summary generated successfully",
//     "data": {
//         "fileId": "6392be6c-ecc8-4105-987d-b3d60cd9d2b3",
//        "summary": "This document provides a detailed analysis and summary of several literary works, focusing on key themes, authorial intent, and critical interpretations. It covers:\n\n*   **Sylvia Plath's \"The Moon and the Yew Tree\":** Examines its autobiographical nature, reflecting Plath's personal struggles, complex parental relationships, a critical view of religion, and the overarching theme of despair.\n*   **Alice Walker's \"Be Nobody's Darling\":** Highlights its advocacy for individuality, self-respect, and non-conformity against societal pressures. It explores life's inherent complexities, the concept of a \"community of outcasts,\" and challenges the notion of living superficially (\"qualified to live among your dead\") while celebrating authentic selfhood.\n*   **Suniti Namjoshi's \"Feminist Fables\":** Critiques patriarchal structures through various fables, illustrating how women's voices are suppressed (\"hold their tongues\"), female achievements are overlooked despite merit, ambitious women are demonized (the \"wicked stepmother\"), traditional marriage is depicted as unequal and unsafe (Bluebeard), and justice systems exhibit gender bias.\n*   **Pablo Neruda's \"Tonight I Can Write the Saddest Lines\":** Analyzes it as a confessional poem, exploring the speaker's profound emotional turmoil following a lost love, characterized by sadness, loneliness, and confusion. It positions writing as a means of processing pain and highlights the journey toward acceptance and healing.\n*   **William Shakespeare's \"Sonnet 116\":** Celebrates true love as a constant, unchanging, and enduring force, comparing it to an \"ever-fixèd mark\" that withstands time, change, and adversity. It emphasizes commitment and loyalty, contrasting with transient affections and societal expectations of his era.\n*   **Francis Bacon's \"Of Love\":** Presents love as a powerful, dualistic force, both alluring (\"Siren\") and destructive (\"Fury\"). Bacon argues love can blind judgment more profoundly than flattery and distinguishes between beneficial, moderate forms of love (nuptial, friendly, charitable) and harmful, lustful \"wanton\" love.\n*   **D. H. Lawrence's \"The Modern Lover\":** Critiques contemporary relationships for being overly intellectualized, cautious, and lacking genuine passion and emotional surrender. Lawrence argues that modern society's emphasis on reason suppresses natural instincts, leading to sterile connections and emotional alienation.\n*   **Czesław Miłosz's \"A Song on the End of the World\":** Explores human perception, depicting the apocalypse not as a dramatic cataclysm but as a quiet, unnoticed event amidst ordinary life. Through peaceful imagery, it prompts reflection on the value of everyday existence and suggests that endings can be personal and subtle rather than grand.\n*   **Wilfred Owen's \"Strange Meeting\":** Uses the symbolic setting of the underworld to expose the profound horrors and futility of war. The encounter between the narrator and an enemy soldier he killed reveals shared humanity, guilt, and the tragic waste of potential, challenging traditional notions of war as noble or heroic.\n*   **Thomas Hardy's \"The Man He Killed\":** Focuses on the senselessness and absurdity of war, depicting how ordinary men, who would otherwise be friends, are forced to kill each other without personal hatred. Hardy employs a casual yet ironic tone to highlight the illogical and dehumanizing nature of conflict.\n*   **Katherine Mansfield's \"The Fly\":** Explores themes of grief, emotional suppression, and the lasting psychological impact of war through the boss's cruel interaction with a fly. The fly symbolizes human suffering and resilience, while the boss's behavior reflects his unresolved sorrow for his dead son, leading to an ending that underscores emotional emptiness and profound forgetfulness.\n\nCollectively, the document offers deep literary insights into themes of human emotion, societal critique, and the complexities of human experience as portrayed in these significant works."
//     }
// }


// get previous summary

// GET http://localhost:5000/api/summary?fileId=6392be6c-ecc8-4105-987d-b3d60cd9d2b3&userId=cmi4kz1610000ijnmm3jun0l9
// 2 query params: fileId, userId

// Response:

// {
//     "success": true,
//     "data": {
//         "fileId": "58f76773-5df9-4250-95bd-b497d93914a1",
//         "summary": "This document provides a comprehensive overview of Artificial Neural Networks (ANNs), starting from their biological inspiration to their mathematical models, learning algorithms, and practical applications. It delves into the fundamental components of neurons, explains the role of activation functions, compares ANNs with traditional machine learning models, and details the Perceptron learning algorithm and a step-by-step example of backpropagation.\n\nHere's a descriptive summary of the document:\n\nThe document begins by introducing **Artificial Neural Networks (ANNs)** as computational models inspired by the human brain. ANNs are designed to recognize patterns and learn relationships by passing signals between interconnected nodes, or \"neurons.\"\n\nA deep dive into the **Neuron**, the basic functional unit of the nervous system, is provided. It outlines the biological neuron's structure:\n\n- **Dendrites:** Branch-like structures that receive signals from other neurons and carry them *towards* the cell body.\n\n- **Soma (Cell Body):** The main part of the neuron that integrates incoming signals and sends processed signals to the axon.\n\n- **Nucleus:** Located within the soma, it contains genetic material and controls neuron activities.\n\n- **Axon:** A long, cable-like projection that carries electrical signals *away* from the soma to other neurons' dendrites.\n\n- **Synapse:** The crucial junction between two neurons where signals are transferred, chemically or electrically, often involving **Axon Terminals** that release neurotransmitters.\nThis biological inspiration is translated into a **general artificial neuron model**, where inputs are weighted, summed with a bias, and then passed through an activation function to produce an output, expressed as `a = f(wp + b)`.\n\n**Activation Functions** are highlighted as critical components that decide whether a neuron should \"fire\" or not. Their primary role is to introduce non-linearity into the network, enabling ANNs to learn complex, non-linear patterns beyond simple straight lines. Without them, an ANN would behave like a linear model. The document lists various types of activation functions, including Hard Limit, Linear, Sigmoid (Log-Sigmoid), Hyperbolic Tangent Sigmoid, and their applications.\n\nAs a **Machine Learning Model**, ANNs are described as powerful tools for pattern recognition and learning complex input-output relationships. Their architecture consists of an **Input Layer**, one or more **Hidden Layers** (performing computations), and an **Output Layer** (producing predictions). Neurons within these layers process information by applying weights and biases to inputs and then passing the result through an activation function. ANNs learn from data by iteratively adjusting these weights and biases during training, primarily using algorithms like **backpropagation** and **gradient descent** to minimize error. They are particularly adept at capturing non-linear relationships, making them suitable for complex real-world data across numerous applications such as image recognition, speech recognition, natural language processing, medical diagnosis, and finance. The document also emphasizes that ANNs form the **foundation of Deep Learning**, where Deep Neural Networks (DNNs) are essentially ANNs with multiple hidden layers.\n\nA detailed comparison table showcases **how Neural Networks are superior to traditional ML models** (like Logistic Regression, SVM, Decision Trees, kNN, Naïve Bayes) across several features:\n\n- **Complex, Nonlinear Data:** NNs excel due to their Universal Approximation capability.\n\n- **Automatic Feature Extraction:** Deep layers in NNs can learn hierarchical features, reducing manual feature engineering.\n\n- **Performance on Large/Unstructured Data:** NNs scale and perform significantly better, especially with images, audio, and text.\n\n- **Scalability & High-Dimensional Data:** NNs, particularly with specialized architectures (CNN, RNN, Transformers), handle these effectively.\n\n- **Generalization & Learning Representation:** NNs learn abstract internal representations (deep features).\nHowever, NNs generally incur **higher computation costs** (often requiring GPUs) and possess **higher training complexity** compared to traditional models, which tend to have better **interpretability**.\n\nThe document then introduces **Perceptron Learning**, defining the Perceptron as the simplest type of artificial neuron, used for binary classification (0 or 1) based on a weighted sum of inputs. It details the Perceptron model (`y = f(∑wixi + b)`), which typically uses a step function as its activation. The **Perceptron Learning Rule** is explained, outlining how weights and biases are updated when the perceptron's output is incorrect, based on a learning rate (`η`), target output (`t`), and perceptron output (`y`). The algorithm steps involve initialization, computing output for each training example, comparing it to the target, and updating weights and biases if there's an error, repeating until all examples are correctly classified or a maximum number of epochs is reached. Crucially, the document highlights that Perceptrons **can learn linearly separable problems** (like AND, OR gates) but **cannot solve non-linearly separable problems** (like XOR).\n\nFinally, the document provides a comprehensive **Backpropagation Example** to illustrate the learning process in a multi-layer ANN. This practical walkthrough demonstrates:\n1.  **Forward Propagation:** Calculating the net inputs and activations for each hidden neuron, and then for the output neuron, ultimately yielding a predicted output.\n2.  **Backward Propagation:**\n    *   Calculating the error between the predicted and target output.\n    *   Determining the output layer gradient and the delta for the output.\n    *   Updating the weights connecting hidden neurons to the output neuron, and the output layer bias, based on this delta.\n    *   Propagating the error back to the hidden layer, calculating hidden layer gradients and deltas.\n    *   Updating the weights connecting the input neurons to each hidden neuron, and the hidden layer biases.\nThis iterative process, shown for a single sample, updates all network parameters (weights and biases) to minimize the error, thereby demonstrating how ANNs learn."
//     }
// }

// Get list of all previous summaries for a user

// GET http://localhost:5000/api/summary/list?userId=cmi4kz1610000ijnmm3jun0l9
// 1 query param: userId

// Response:
// array of summaries 
// {
//     "success": true,
//     "data": [
//         {
//             "id": "58f76773-5df9-4250-95bd-b497d93914a1",
//             "originalName": "ML unit 4 FINAL.pdf",
//             "mimeType": "application/pdf",
//             "size": 666479,
//             "createdAt": "2025-12-18T12:24:39.238Z"
//         },
//            {
//             "id": "6392be6c-ecc8-4105-987d-b3d60cd9d2b3",
//             "originalName": "Literary Analysis.pdf",
//             "mimeType": "application/pdf",
//             "size": 1234567,
//             "createdAt": "2025-12-20T10:15:30.000Z"
//            }
//     ]
// }
