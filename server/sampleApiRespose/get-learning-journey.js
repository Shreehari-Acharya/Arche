// GET request to http://localhost:5000/api/learning-journeys?userId=1234567890
// userId in query params


// example response:
// {
//     "success": true,
//     "data": [
//         {
//             "id": "cmid8vzsf00d01ijj38xwshpbr",
//             "topicName": "computer Networks",
//             "userId": "cmi4kz1610000ijnmm3jun0l9",
//             "createdAt": "2025-11-24T14:31:22.095Z",
//             "updatedAt": "2025-11-24T14:31:22.095Z"
//             "lastAccessed":"2025-12-11T15:10:03.526Z",
//             "streakCount":1
//         }
//     ]
// }

// GET request to http://localhost:5000/api/learning-journeys?userId=1234567890?learningJourneyId=cmid8vzsf0001ijj38xwshpbr
// userId and learningJourneyId in query params

// example response:
// {
//   "success": true,
//   "data": {
//     "id": "cmid8vzsf0001ijj38xwshpbr",
//     "topicName": "computer Networks",
//     "userId": "cmi4kz1610000ijnmm3jun0l9",
//     "createdAt": "2025-11-24T14:31:22.095Z",
//     "updatedAt": "2025-11-24T14:31:22.095Z",
//     "subTopics": [
//       {
//         "id": "cmid8wglp0004ijj3dn131ju6",
//         "description": "Day 1: Introduction to Computer Networks: Definition, goals, applications.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8whbg002gijj3zth8ztnr",
//             "title": "Introduction to Computer Network 🔥",
//             "url": "https://www.youtube.com/watch?v=NbjBRANGs4s",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0004ijj3dn131ju6",
//             "createdAt": "2025-11-24T14:31:44.813Z",
//             "updatedAt": "2025-11-24T14:31:44.813Z"
//           },
//           {
//             "id": "cmid8whbg002hijj3hqy9ha5n",
//             "title": "What is Computer Network? full Explanation | PAN, LAN, MAN and WAN Network",
//             "url": "https://www.youtube.com/watch?v=Hizdc4XVJ1E",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0004ijj3dn131ju6",
//             "createdAt": "2025-11-24T14:31:44.813Z",
//             "updatedAt": "2025-11-24T14:31:44.813Z"
//           },
//           {
//             "id": "cmid8whbg002iijj3qwugej4t",
//             "title": "Network types / computer science / networks #network #computerscience",
//             "url": "https://www.youtube.com/watch?v=GyRFLkOwmxQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0004ijj3dn131ju6",
//             "createdAt": "2025-11-24T14:31:44.813Z",
//             "updatedAt": "2025-11-24T14:31:44.813Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0005ijj3mmwx0tw4",
//         "description": "Day 2: Network Types: LAN, WAN, MAN, PAN. Network Topologies: Bus, Star, Ring, Mesh, Tree.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8whyu002jijj3mvgpxwp4",
//             "title": "Network Topology",
//             "url": "https://www.youtube.com/watch?v=uSKdjjw5zow",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0005ijj3mmwx0tw4",
//             "createdAt": "2025-11-24T14:31:45.655Z",
//             "updatedAt": "2025-11-24T14:31:45.655Z"
//           },
//           {
//             "id": "cmid8whyu002kijj3lzxmsrq7",
//             "title": "Lec-5: Topologies in Computer Networks | Part-1 | All imp points of Mesh, Star, Hub, Bus, Hybrid",
//             "url": "https://www.youtube.com/watch?v=uDulBxDb7GM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0005ijj3mmwx0tw4",
//             "createdAt": "2025-11-24T14:31:45.655Z",
//             "updatedAt": "2025-11-24T14:31:45.655Z"
//           },
//           {
//             "id": "cmid8whyu002lijj3kz45z6cc",
//             "title": "What is Topology? full Explanation | BUS, STAR, RING, MESH, TREE and Hybrid Topologies",
//             "url": "https://www.youtube.com/watch?v=gGTDFG2Q_UM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0005ijj3mmwx0tw4",
//             "createdAt": "2025-11-24T14:31:45.655Z",
//             "updatedAt": "2025-11-24T14:31:45.655Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0006ijj3iv0jlobv",
//         "description": "Day 3: Network Devices: Hubs, Switches, Routers, Bridges, Gateways.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wifw002mijj3cpzjqa0k",
//             "title": "Hub, Switch, &amp; Router Explained - What&#39;s the difference?",
//             "url": "https://www.youtube.com/watch?v=1z0ULvg_pW8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0006ijj3iv0jlobv",
//             "createdAt": "2025-11-24T14:31:46.269Z",
//             "updatedAt": "2025-11-24T14:31:46.269Z"
//           },
//           {
//             "id": "cmid8wifw002nijj3ecw6s01a",
//             "title": "Lec-13: Switch, Hub &amp; Bridge Explained - What&#39;s the difference?",
//             "url": "https://www.youtube.com/watch?v=vdtqEPKYB5M",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0006ijj3iv0jlobv",
//             "createdAt": "2025-11-24T14:31:46.269Z",
//             "updatedAt": "2025-11-24T14:31:46.269Z"
//           },
//           {
//             "id": "cmid8wifx002oijj3pa3vfbyt",
//             "title": "Hub, Bridge, Switch, Router - Network Devices - Networking Fundamentals - Lesson 1b",
//             "url": "https://www.youtube.com/watch?v=H7-NR3Q3BeI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0006ijj3iv0jlobv",
//             "createdAt": "2025-11-24T14:31:46.269Z",
//             "updatedAt": "2025-11-24T14:31:46.269Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0007ijj3ewl300e4",
//         "description": "Day 4: Network Protocols and Standards: Why needed, examples.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wix0002pijj3ynsukdpu",
//             "title": "Network Protocols Explained: Networking Basics",
//             "url": "https://www.youtube.com/watch?v=1zVZ9cWFnCc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0007ijj3ewl300e4",
//             "createdAt": "2025-11-24T14:31:46.884Z",
//             "updatedAt": "2025-11-24T14:31:46.884Z"
//           },
//           {
//             "id": "cmid8wix0002qijj3bgjyz9jq",
//             "title": "Network Protocols &amp; Communications (Part 1)",
//             "url": "https://www.youtube.com/watch?v=ly8ikWtAY7s",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0007ijj3ewl300e4",
//             "createdAt": "2025-11-24T14:31:46.884Z",
//             "updatedAt": "2025-11-24T14:31:46.884Z"
//           },
//           {
//             "id": "cmid8wix0002rijj3b4402ekx",
//             "title": "What is Protocol? full Explanation | TCP/IP, HTTP, SMTP, FTP, POP, IMAP, PPP and UDP Protocols",
//             "url": "https://www.youtube.com/watch?v=6T6eXk2mAx8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0007ijj3ewl300e4",
//             "createdAt": "2025-11-24T14:31:46.884Z",
//             "updatedAt": "2025-11-24T14:31:46.884Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0008ijj3daig2vo6",
//         "description": "Day 5: Layered Architectures: OSI Model - 7 layers overview.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wjbp002sijj3y4zxp66n",
//             "title": "OSI Model Explained | OSI Animation | Open System Interconnection Model | OSI 7 layers | TechTerms",
//             "url": "https://www.youtube.com/watch?v=vv4y_uOneC0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0008ijj3daig2vo6",
//             "createdAt": "2025-11-24T14:31:47.413Z",
//             "updatedAt": "2025-11-24T14:31:47.413Z"
//           },
//           {
//             "id": "cmid8wjbp002tijj3gdfg15f6",
//             "title": "What is OSI Model?",
//             "url": "https://www.youtube.com/watch?v=Ilk7UXzV_Qc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0008ijj3daig2vo6",
//             "createdAt": "2025-11-24T14:31:47.413Z",
//             "updatedAt": "2025-11-24T14:31:47.413Z"
//           },
//           {
//             "id": "cmid8wjbp002uijj3jslwmw05",
//             "title": "OSI Layers Explained as View❤️",
//             "url": "https://www.youtube.com/watch?v=Ft9teGFahLU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0008ijj3daig2vo6",
//             "createdAt": "2025-11-24T14:31:47.413Z",
//             "updatedAt": "2025-11-24T14:31:47.413Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0009ijj3lj08nlf0",
//         "description": "Day 6: Layered Architectures: TCP/IP Model - 4/5 layers overview, comparison with OSI.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wjv2002vijj3odfuiipk",
//             "title": "Lec-3: TCP/IP Protocol Suite | Internet Protocol Suite | OSI vs TCP/IP",
//             "url": "https://www.youtube.com/watch?v=GfaHdjApnhU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0009ijj3lj08nlf0",
//             "createdAt": "2025-11-24T14:31:48.111Z",
//             "updatedAt": "2025-11-24T14:31:48.111Z"
//           },
//           {
//             "id": "cmid8wjv2002wijj3fp1i0ug1",
//             "title": "What is OSI Model? full Explanation | Networking",
//             "url": "https://www.youtube.com/watch?v=1msEo8PIcbw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0009ijj3lj08nlf0",
//             "createdAt": "2025-11-24T14:31:48.111Z",
//             "updatedAt": "2025-11-24T14:31:48.111Z"
//           },
//           {
//             "id": "cmid8wjv2002xijj3qac9pyc2",
//             "title": "TCP/IP Model : TCP/IP vs OSI Model in Computer Network",
//             "url": "https://www.youtube.com/watch?v=YJomoaGQrLs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0009ijj3lj08nlf0",
//             "createdAt": "2025-11-24T14:31:48.111Z",
//             "updatedAt": "2025-11-24T14:31:48.111Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000aijj3uzcylqzh",
//         "description": "Day 7: Review and Q&A on Introduction and Layered Models.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wkc5002yijj3da3aczw6",
//             "title": "Mock Interview for Freshers | Real Q&amp;A from Round 1&amp; 2 to Deep Technical Question #cciesecurity",
//             "url": "https://www.youtube.com/watch?v=fPejhQequAM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000aijj3uzcylqzh",
//             "createdAt": "2025-11-24T14:31:48.726Z",
//             "updatedAt": "2025-11-24T14:31:48.726Z"
//           },
//           {
//             "id": "cmid8wkc5002zijj3mzhrvjso",
//             "title": "Lecture 1 - Deep Learning Foundations: review of basic DL models and optimization solvers",
//             "url": "https://www.youtube.com/watch?v=6Nctj1GCFVo",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000aijj3uzcylqzh",
//             "createdAt": "2025-11-24T14:31:48.726Z",
//             "updatedAt": "2025-11-24T14:31:48.726Z"
//           },
//           {
//             "id": "cmid8wkc50030ijj3i0g9hea1",
//             "title": "Rob Fergus - Introduction to Convolutional Networks",
//             "url": "https://www.youtube.com/watch?v=D69TBhtwhPI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000aijj3uzcylqzh",
//             "createdAt": "2025-11-24T14:31:48.726Z",
//             "updatedAt": "2025-11-24T14:31:48.726Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000bijj37y3yu3fy",
//         "description": "Day 8: Introduction to Physical Layer: Role, data transmission concepts.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wktc0031ijj3vj7ufzvw",
//             "title": "Lec-4: Physical layer in computer networks in hindi | Functions of Physical layer | OSI",
//             "url": "https://www.youtube.com/watch?v=lg-f92uY1Lc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000bijj37y3yu3fy",
//             "createdAt": "2025-11-24T14:31:49.344Z",
//             "updatedAt": "2025-11-24T14:31:49.344Z"
//           },
//           {
//             "id": "cmid8wktc0032ijj38qwy0l38",
//             "title": "Physical Layer and Media (Part 1)",
//             "url": "https://www.youtube.com/watch?v=rKzDbdGhcdY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000bijj37y3yu3fy",
//             "createdAt": "2025-11-24T14:31:49.344Z",
//             "updatedAt": "2025-11-24T14:31:49.344Z"
//           },
//           {
//             "id": "cmid8wktc0033ijj3m6bve7v0",
//             "title": "Networking Fundamentals: OSI 7 - Layer 1 - the physical layer",
//             "url": "https://www.youtube.com/watch?v=a5SMTyhn0U8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000bijj37y3yu3fy",
//             "createdAt": "2025-11-24T14:31:49.344Z",
//             "updatedAt": "2025-11-24T14:31:49.344Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000cijj3zztw8mod",
//         "description": "Day 9: Guided Transmission Media: Twisted-pair, Coaxial Cable, Fiber Optic Cable.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wlaa0034ijj3xdre04ox",
//             "title": "Lec-9: Types Of Cables in Computer Networks | Coaxial, twisted pair, fibre optic cable",
//             "url": "https://www.youtube.com/watch?v=wuI6FGsOFZU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000cijj3zztw8mod",
//             "createdAt": "2025-11-24T14:31:49.954Z",
//             "updatedAt": "2025-11-24T14:31:49.954Z"
//           },
//           {
//             "id": "cmid8wlaa0035ijj39zpi0rd6",
//             "title": "Guided Transmission Media | Wired Media 🔥",
//             "url": "https://www.youtube.com/watch?v=CYXeiIakVXY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000cijj3zztw8mod",
//             "createdAt": "2025-11-24T14:31:49.954Z",
//             "updatedAt": "2025-11-24T14:31:49.954Z"
//           },
//           {
//             "id": "cmid8wlaa0036ijj3i6a92iia",
//             "title": "Transmission Media In Hindi | Guided and Unguided Media",
//             "url": "https://www.youtube.com/watch?v=WuQKlGaa9Bg",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000cijj3zztw8mod",
//             "createdAt": "2025-11-24T14:31:49.954Z",
//             "updatedAt": "2025-11-24T14:31:49.954Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000dijj3ls3ylvp5",
//         "description": "Day 10: Unguided Transmission Media: Radio Waves, Microwaves, Infrared.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wlx20037ijj3mbfawhjm",
//             "title": "Unguided Transmission Media 🔥",
//             "url": "https://www.youtube.com/watch?v=b6U487URsGA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000dijj3ls3ylvp5",
//             "createdAt": "2025-11-24T14:31:50.775Z",
//             "updatedAt": "2025-11-24T14:31:50.775Z"
//           },
//           {
//             "id": "cmid8wlx20038ijj39d3oonlu",
//             "title": "Transmission media | Radio | Micro | Infrared Waves | CN | Computer Networks | Lec-38",
//             "url": "https://www.youtube.com/watch?v=nAIBpzKDWvA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000dijj3ls3ylvp5",
//             "createdAt": "2025-11-24T14:31:50.775Z",
//             "updatedAt": "2025-11-24T14:31:50.775Z"
//           },
//           {
//             "id": "cmid8wlx20039ijj3s4466zkr",
//             "title": "What are Radio Waves and Microwaves?",
//             "url": "https://www.youtube.com/watch?v=arKeXHqrpsQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000dijj3ls3ylvp5",
//             "createdAt": "2025-11-24T14:31:50.775Z",
//             "updatedAt": "2025-11-24T14:31:50.775Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000eijj36lxmhtmy",
//         "description": "Day 11: Data Encoding Techniques: Analog-to-Analog, Digital-to-Analog (ASK, FSK, PSK).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wmmk003aijj3glamsjjk",
//             "title": "ask fsk psk modulation | Digital to Analog Encoding | Hindi | Niharika Panda",
//             "url": "https://www.youtube.com/watch?v=8UiMvP5nKyM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000eijj36lxmhtmy",
//             "createdAt": "2025-11-24T14:31:51.693Z",
//             "updatedAt": "2025-11-24T14:31:51.693Z"
//           },
//           {
//             "id": "cmid8wmmk003bijj3yjumd1gj",
//             "title": "Computer Networks || Digital to Analog Conversion | ASK | FSK | PSK | QAM",
//             "url": "https://www.youtube.com/watch?v=hD0aNrSDPnI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000eijj36lxmhtmy",
//             "createdAt": "2025-11-24T14:31:51.693Z",
//             "updatedAt": "2025-11-24T14:31:51.693Z"
//           },
//           {
//             "id": "cmid8wmmk003cijj3kmilfkip",
//             "title": "Digital to Analog Modulation - ASK, FSK, PSK",
//             "url": "https://www.youtube.com/watch?v=sTVvvxmZ2G4",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000eijj36lxmhtmy",
//             "createdAt": "2025-11-24T14:31:51.693Z",
//             "updatedAt": "2025-11-24T14:31:51.693Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000fijj3gygbx9l9",
//         "description": "Day 12: Data Encoding Techniques: Digital-to-Digital (NRZ, RZ, Manchester, Differential Manchester).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wn0t003dijj31cybd7zg",
//             "title": "Lec-7: Manchester encoding and differential Manchester encoding in Hindi | Computer Network",
//             "url": "https://www.youtube.com/watch?v=3IaB2a8tXLA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000fijj3gygbx9l9",
//             "createdAt": "2025-11-24T14:31:52.206Z",
//             "updatedAt": "2025-11-24T14:31:52.206Z"
//           },
//           {
//             "id": "cmid8wn0t003eijj367xazjt1",
//             "title": "Line coding in digital communication- Polar, Unipolar, Bipolar, RZ ,NRZ in simple way | HINDI",
//             "url": "https://www.youtube.com/watch?v=rHPa0VU27l0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000fijj3gygbx9l9",
//             "createdAt": "2025-11-24T14:31:52.206Z",
//             "updatedAt": "2025-11-24T14:31:52.206Z"
//           },
//           {
//             "id": "cmid8wn0t003fijj3vdz7etki",
//             "title": "Manchester Encoding in 2 minutes",
//             "url": "https://www.youtube.com/watch?v=XKtxxZ327UM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000fijj3gygbx9l9",
//             "createdAt": "2025-11-24T14:31:52.206Z",
//             "updatedAt": "2025-11-24T14:31:52.206Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000gijj3aiyue5q2",
//         "description": "Day 13: Multiplexing: FDM, TDM, WDM, CDM.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wnhz003gijj39se6u5mp",
//             "title": "Types of Multiplexing | FDM TDM WDM | Analog Digital | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=WXof7bg_Zys",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000gijj3aiyue5q2",
//             "createdAt": "2025-11-24T14:31:52.823Z",
//             "updatedAt": "2025-11-24T14:31:52.823Z"
//           },
//           {
//             "id": "cmid8wnhz003hijj3s3gw4b9i",
//             "title": "Frequency division multiplexing|Time division multiplexing|FDM|WDM| TDM| computer networks in detail",
//             "url": "https://www.youtube.com/watch?v=IR-p1A_PQ3w",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000gijj3aiyue5q2",
//             "createdAt": "2025-11-24T14:31:52.823Z",
//             "updatedAt": "2025-11-24T14:31:52.823Z"
//           },
//           {
//             "id": "cmid8wnhz003iijj31s4cp9fr",
//             "title": "Frequency Division Multiplexing (FDM) Explained",
//             "url": "https://www.youtube.com/watch?v=UwWmDwbsDBs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000gijj3aiyue5q2",
//             "createdAt": "2025-11-24T14:31:52.823Z",
//             "updatedAt": "2025-11-24T14:31:52.823Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000hijj31oap7zt0",
//         "description": "Day 14: Review and Q&A on Physical Layer.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wnx0003jijj3jwneurei",
//             "title": "Kvaser CAN Protocol Course: The CAN Physical Layer (Part 4)",
//             "url": "https://www.youtube.com/watch?v=qR2tLyfT6jA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000hijj31oap7zt0",
//             "createdAt": "2025-11-24T14:31:53.364Z",
//             "updatedAt": "2025-11-24T14:31:53.364Z"
//           },
//           {
//             "id": "cmid8wnx0003kijj3c065l8d7",
//             "title": "Copper Cabling - Physical Layer - Introduction to Networks - CCNA - KevTechify | vid 27",
//             "url": "https://www.youtube.com/watch?v=p_x0bR94TIA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000hijj31oap7zt0",
//             "createdAt": "2025-11-24T14:31:53.364Z",
//             "updatedAt": "2025-11-24T14:31:53.364Z"
//           },
//           {
//             "id": "cmid8wnx0003lijj3avcexi0h",
//             "title": "CCNA Mock Interview 2025: Real Network Engineer Q&amp;A #ccna #networking #cybersecurity #fresherjobs",
//             "url": "https://www.youtube.com/watch?v=LfC-EXafxXU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000hijj31oap7zt0",
//             "createdAt": "2025-11-24T14:31:53.364Z",
//             "updatedAt": "2025-11-24T14:31:53.364Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000iijj35rp05be9",
//         "description": "Day 15: Introduction to Data Link Layer: Role, Framing concepts.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8woac003mijj3vlki11j6",
//             "title": "Lec-21: Data link layer in computer Networks and its Responsibilities",
//             "url": "https://www.youtube.com/watch?v=JRgmPco0KWI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000iijj35rp05be9",
//             "createdAt": "2025-11-24T14:31:53.845Z",
//             "updatedAt": "2025-11-24T14:31:53.845Z"
//           },
//           {
//             "id": "cmid8woac003nijj3i0guh6j0",
//             "title": "Framing (Part 1)",
//             "url": "https://www.youtube.com/watch?v=NhpzBldHOYo",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000iijj35rp05be9",
//             "createdAt": "2025-11-24T14:31:53.845Z",
//             "updatedAt": "2025-11-24T14:31:53.845Z"
//           },
//           {
//             "id": "cmid8woac003oijj3qualzqdk",
//             "title": "Framing in Data Link Layer 🔥",
//             "url": "https://www.youtube.com/watch?v=BKuHTeHip9o",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000iijj35rp05be9",
//             "createdAt": "2025-11-24T14:31:53.845Z",
//             "updatedAt": "2025-11-24T14:31:53.845Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000jijj3ccss57yk",
//         "description": "Day 16: Error Detection: Parity Check, Checksum.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8worf003pijj3rjgxn2mh",
//             "title": "Error Detecting Code : Parity Explained | Odd Parity and Even Parity",
//             "url": "https://www.youtube.com/watch?v=Bwih7_AT1oI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000jijj3ccss57yk",
//             "createdAt": "2025-11-24T14:31:54.460Z",
//             "updatedAt": "2025-11-24T14:31:54.460Z"
//           },
//           {
//             "id": "cmid8worf003qijj3kio1azic",
//             "title": "Parity Check 🔥",
//             "url": "https://www.youtube.com/watch?v=PGVlAV7yZdw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000jijj3ccss57yk",
//             "createdAt": "2025-11-24T14:31:54.460Z",
//             "updatedAt": "2025-11-24T14:31:54.460Z"
//           },
//           {
//             "id": "cmid8worf003rijj3238y1otd",
//             "title": "Parity Check || Error Detection || Data Link Layer Design Issues || Error Control || Even || Odd",
//             "url": "https://www.youtube.com/watch?v=deBEd184NeQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000jijj3ccss57yk",
//             "createdAt": "2025-11-24T14:31:54.460Z",
//             "updatedAt": "2025-11-24T14:31:54.460Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000kijj3kv9coyfw",
//         "description": "Day 17: Error Detection: Cyclic Redundancy Check (CRC).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wp8g003sijj3rjwyyr2r",
//             "title": "Lec-29: Cyclic Redundancy Check(CRC)  for Error Detection and Correction  | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=5Q-Yv6_0Qcw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000kijj3kv9coyfw",
//             "createdAt": "2025-11-24T14:31:55.072Z",
//             "updatedAt": "2025-11-24T14:31:55.072Z"
//           },
//           {
//             "id": "cmid8wp8g003tijj3vyznr9n3",
//             "title": "Cyclic Redundancy Check (CRC) - Part 1",
//             "url": "https://www.youtube.com/watch?v=A9g6rTMblz4",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000kijj3kv9coyfw",
//             "createdAt": "2025-11-24T14:31:55.072Z",
//             "updatedAt": "2025-11-24T14:31:55.072Z"
//           },
//           {
//             "id": "cmid8wp8g003uijj3tiytc4oc",
//             "title": "Cyclic Redundancy Check (CRC): Advanced Error Detection Technique in Computer Networks",
//             "url": "https://www.youtube.com/watch?v=zoyvTjxT9DI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000kijj3kv9coyfw",
//             "createdAt": "2025-11-24T14:31:55.072Z",
//             "updatedAt": "2025-11-24T14:31:55.072Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000lijj3d6tnok6j",
//         "description": "Day 18: Error Correction: Hamming Codes basics.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wq0y003vijj3nia4ajjn",
//             "title": "Hamming Code | Error Detection",
//             "url": "https://www.youtube.com/watch?v=1A_NcXxdoCc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000lijj3d6tnok6j",
//             "createdAt": "2025-11-24T14:31:56.098Z",
//             "updatedAt": "2025-11-24T14:31:56.098Z"
//           },
//           {
//             "id": "cmid8wq0y003wijj3iq49town",
//             "title": "Lec-30: Hamming Code for Error Detection &amp; Correction both with easiest examples",
//             "url": "https://www.youtube.com/watch?v=V5Iu52tbZEQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000lijj3d6tnok6j",
//             "createdAt": "2025-11-24T14:31:56.098Z",
//             "updatedAt": "2025-11-24T14:31:56.098Z"
//           },
//           {
//             "id": "cmid8wq0y003xijj33cbtmagv",
//             "title": "Hamming Code || Error Detection and Error Correction",
//             "url": "https://www.youtube.com/watch?v=cb0T4UE0c4w",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000lijj3d6tnok6j",
//             "createdAt": "2025-11-24T14:31:56.098Z",
//             "updatedAt": "2025-11-24T14:31:56.098Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000mijj39scfuo90",
//         "description": "Day 19: Flow Control: Stop-and-Wait protocol.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wqi0003yijj3gls3ynzg",
//             "title": "Stop-and-Wait Protocol",
//             "url": "https://www.youtube.com/watch?v=n09DfvemnTQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000mijj39scfuo90",
//             "createdAt": "2025-11-24T14:31:56.713Z",
//             "updatedAt": "2025-11-24T14:31:56.713Z"
//           },
//           {
//             "id": "cmid8wqi0003zijj3dhx21p63",
//             "title": "Lec-25: Various Flow Control Protocols | Stop&amp;Wait , GoBackN &amp; Selective repeat in Data Link Layer",
//             "url": "https://www.youtube.com/watch?v=yNedVgNyE8Q",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000mijj39scfuo90",
//             "createdAt": "2025-11-24T14:31:56.713Z",
//             "updatedAt": "2025-11-24T14:31:56.713Z"
//           },
//           {
//             "id": "cmid8wqi00040ijj3wm871j64",
//             "title": "Flow Control || Data Link Layer Design Issues|| Stop and Wait Protocol ||  Sliding Window Protocol",
//             "url": "https://www.youtube.com/watch?v=0Ico08tGVHU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000mijj39scfuo90",
//             "createdAt": "2025-11-24T14:31:56.713Z",
//             "updatedAt": "2025-11-24T14:31:56.713Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000nijj3hicb6dxv",
//         "description": "Day 20: Flow Control: Sliding Window protocols (Go-Back-N, Selective Repeat).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wqz30041ijj3297g2dlv",
//             "title": "Lec-25: Various Flow Control Protocols | Stop&amp;Wait , GoBackN &amp; Selective repeat in Data Link Layer",
//             "url": "https://www.youtube.com/watch?v=yNedVgNyE8Q",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz30042ijj3qksk62fb",
//             "title": "Sliding Window Protocol",
//             "url": "https://www.youtube.com/watch?v=LnbvhoxHn8M",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz30043ijj3luxxqj7m",
//             "title": "Go-Back-N ARQ",
//             "url": "https://www.youtube.com/watch?v=QD3oCelHJ20",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz30044ijj3i647z7cu",
//             "title": "Lec-23: Go-Back-N ARQ (Automatic Repeat Request) | Data Link layer",
//             "url": "https://www.youtube.com/watch?v=zc88y9HTAOA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz30045ijj3yn1szb1t",
//             "title": "Sliding window protocol | Types of sliding window protocol | 1 Bit | Go-Back-N ARQ |Selective Repeat",
//             "url": "https://www.youtube.com/watch?v=7Eo4Kd3gkA0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz30046ijj30gd7hl05",
//             "title": "Go-Back-N ARQ Protocol || Data link layer || Computer networks",
//             "url": "https://www.youtube.com/watch?v=SmsJyMye43E",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz30047ijj3q27ny8x2",
//             "title": "CN 12 : Sliding Window Protocols | Go-Back-N ARQ | Selective Repeat ARQ with Example",
//             "url": "https://www.youtube.com/watch?v=5A-nvZHFHX0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz30048ijj3o46a7qx1",
//             "title": "CN |  Flow Control methods | Go Back N | Ravindrababu Ravula | Free GATE CS Classes",
//             "url": "https://www.youtube.com/watch?v=ZLtkhsgQp8U",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz30049ijj34vp0w7df",
//             "title": "Sliding Window Protocol (Solved Problem 1)",
//             "url": "https://www.youtube.com/watch?v=_amTFCVhXNw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz3004aijj35lxh6m35",
//             "title": "Flow Control || Data Link Layer Design Issues|| Stop and Wait Protocol ||  Sliding Window Protocol",
//             "url": "https://www.youtube.com/watch?v=0Ico08tGVHU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz3004bijj39r6n63nt",
//             "title": "Flow Control in Data Link Layer 🔥",
//             "url": "https://www.youtube.com/watch?v=jXl6drIzw5U",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz3004cijj35xlidihe",
//             "title": "Sliding window protocol in computer Networks Explained in Hindi",
//             "url": "https://www.youtube.com/watch?v=ADBC2e_WAzM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz3004dijj3ygh9vz36",
//             "title": "3.13 Go-Back-N ARQ Sliding Window Protocol",
//             "url": "https://www.youtube.com/watch?v=uM4glyAWD4Q",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz3004eijj3na3z7f9p",
//             "title": "Selective Repeat ARQ Protocol || Data link layer || Computer networks",
//             "url": "https://www.youtube.com/watch?v=lHYVToJtkF4",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004fijj302dna1t4",
//             "title": "Selective Repeat ARQ",
//             "url": "https://www.youtube.com/watch?v=WfIhQ3o2xow",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004gijj320ba3lo3",
//             "title": "1 Bit Sliding Window protocol | One Bit Sliding Window protocol | Data link layer| Computer networks",
//             "url": "https://www.youtube.com/watch?v=WgSuj2TEmwU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004hijj30bkvg1zs",
//             "title": "Example of Go-Back-N protocol And Selective-Repeat Protocol",
//             "url": "https://www.youtube.com/watch?v=xEM0cm42mtQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004iijj34693575o",
//             "title": "sliding window protocol | 1 bit | sliding window protocol using go back n |  selective repeat | CN",
//             "url": "https://www.youtube.com/watch?v=JOaV6g6aTNo",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004jijj3jkh0k4cq",
//             "title": "selective repeat protocol | sliding window protocol | transport layer",
//             "url": "https://www.youtube.com/watch?v=utw437Q64Ig",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004kijj33w7y4rdb",
//             "title": "3.15 Selective Repeat ARQ Sliding Window Protocol",
//             "url": "https://www.youtube.com/watch?v=7z8A8EQik_w",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004lijj3j3y2rr9u",
//             "title": "SLIDING WINDOW PROTOCOL",
//             "url": "https://www.youtube.com/watch?v=T-DN__d75AY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004mijj3fcr8io9h",
//             "title": "Piggybacking in Computer Networks",
//             "url": "https://www.youtube.com/watch?v=ShunsiYKa-c",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004nijj3ql6obgu6",
//             "title": "SELECTIVE REPEAT ARQ   selective repeat sliding window protocol",
//             "url": "https://www.youtube.com/watch?v=QUnAMJO0waI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004oijj3yis5n3ce",
//             "title": "CN 16 Sliding Window Protocol in Flow Control",
//             "url": "https://www.youtube.com/watch?v=D-1nxn8gLc8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           },
//           {
//             "id": "cmid8wqz4004pijj3m3y7rgrq",
//             "title": "Flow Control | Stop &amp; Wait | Go Back N | Selective Repeat | Computer network",
//             "url": "https://www.youtube.com/watch?v=aQ_F94HdIaU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000nijj3hicb6dxv",
//             "createdAt": "2025-11-24T14:31:57.327Z",
//             "updatedAt": "2025-11-24T14:31:57.327Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000oijj3fblbpua1",
//         "description": "Day 21: Review and Q&A on Error/Flow Control.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wr7x004qijj3pwbtvc7g",
//             "title": "My FAVORITE Error Handling Technique",
//             "url": "https://www.youtube.com/watch?v=YA0Wq1rcs6U",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000oijj3fblbpua1",
//             "createdAt": "2025-11-24T14:31:57.645Z",
//             "updatedAt": "2025-11-24T14:31:57.645Z"
//           },
//           {
//             "id": "cmid8wr7x004rijj3w3ncyvku",
//             "title": "Error Handling in Power Automate flows | Try Catch Scope Action",
//             "url": "https://www.youtube.com/watch?v=qLADf8ne5qQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000oijj3fblbpua1",
//             "createdAt": "2025-11-24T14:31:57.645Z",
//             "updatedAt": "2025-11-24T14:31:57.645Z"
//           },
//           {
//             "id": "cmid8wr7x004sijj3p24uxpzj",
//             "title": "Power Automate: Error Handling on multiple flows REUSABLY | Try Catch | Send errors in Teams Message",
//             "url": "https://www.youtube.com/watch?v=zJEi5IaTgdY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000oijj3fblbpua1",
//             "createdAt": "2025-11-24T14:31:57.645Z",
//             "updatedAt": "2025-11-24T14:31:57.645Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000pijj3lszavy9v",
//         "description": "Day 22: Medium Access Control (MAC): Random Access Protocols (ALOHA, CSMA).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wrmd004tijj3j0pq8zgv",
//             "title": "Lec-31: Various Medium Access Control Protocols in Data Link Layer | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=G0h0dC4Zycs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd004uijj3g20btfmx",
//             "title": "Multiple Access Protocols",
//             "url": "https://www.youtube.com/watch?v=YAjfUc7Tt24",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd004vijj3c22yj0i8",
//             "title": "Lec-32: What is Pure Aloha in Hindi | MAC Layer Protocol",
//             "url": "https://www.youtube.com/watch?v=WYM9nFYnYAg",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd004wijj34b8pa2z7",
//             "title": "L34-2: Random Assignment Scheme - ALOHA, SLOTTED ALOHA, CSMA/CD, CSMA/CA | Mobile Computing",
//             "url": "https://www.youtube.com/watch?v=0TTugI2IKQ8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd004xijj3g1gydx66",
//             "title": "Pure Aloha in Computer Networks",
//             "url": "https://www.youtube.com/watch?v=qz3eMslL8MY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd004yijj3sbgk2zd2",
//             "title": "Lec-34: Carrier Sense Multiple Access in Computer Network || CSMA || Computer Networks",
//             "url": "https://www.youtube.com/watch?v=IftFvfSywCQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd004zijj32sxqpg4k",
//             "title": "CSMA (Carrier Sense Multiple Access) Protocol in Computer Networks",
//             "url": "https://www.youtube.com/watch?v=8wptjECeGA8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0050ijj3jsmfneea",
//             "title": "Controlled Access Protocols || Reservation || Polling || Token Passing || Computer Networks",
//             "url": "https://www.youtube.com/watch?v=SX7fHX-IKek",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0051ijj3z1buaxlg",
//             "title": "mac protocols, aloha, csma, csma/cd, csma/ca, reservation, token passing, polling, fdma, tdma, cdma",
//             "url": "https://www.youtube.com/watch?v=tZGOIY5ARjE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0052ijj3h2swtkz5",
//             "title": "Pure Aloha",
//             "url": "https://www.youtube.com/watch?v=j4-r0e7DjqY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0053ijj3csrsheke",
//             "title": "3.3 Everything About Pure ALOHA",
//             "url": "https://www.youtube.com/watch?v=9lEvqxp9ODQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0054ijj3bhoel26x",
//             "title": "CSMA/CD and CSMA/CA Explained",
//             "url": "https://www.youtube.com/watch?v=iKn0GzF5-IU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0055ijj37xh6055j",
//             "title": "CSMA/CD protocol in computer networks | Carrier Sense Multiple Access With Collision Detection  | CN",
//             "url": "https://www.youtube.com/watch?v=xGzDbJz-AJ8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0056ijj3pj21xq9z",
//             "title": "Computer Networks 37 | Medium Access Control Part 01 ( Pure Aloha) | CS &amp; IT | GATE Crash Course",
//             "url": "https://www.youtube.com/watch?v=gpIBcqQu0zU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0057ijj3v30u2uoi",
//             "title": "Medium Access Control (MAC) protocols",
//             "url": "https://www.youtube.com/watch?v=J8SjkhXTnNw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0058ijj3qqont64z",
//             "title": "Random access protocols(Aloha and CSMA protocols)and controlled access protocol",
//             "url": "https://www.youtube.com/watch?v=ZGgaw2Rkv_o",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd0059ijj3947vb7jw",
//             "title": "Pure Aloha 🔥",
//             "url": "https://www.youtube.com/watch?v=kMtI1E46IAE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd005aijj3466iqub1",
//             "title": "Lec-35: Carrier Sense Multiple Access/ Collision Detection | CSMA/CD | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=v_z888gQWq0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd005bijj36af2b3e0",
//             "title": "Carrier Sense Multiple Access (CSMA) – Part 1",
//             "url": "https://www.youtube.com/watch?v=MAZi6VoekYw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd005cijj3rk3395zi",
//             "title": "Medium Access Control: ALOHA",
//             "url": "https://www.youtube.com/watch?v=_6fczjai6A8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd005dijj3mab3e6gm",
//             "title": "Wired LAN MAC Protocols Explained: From Aloha to CSMA/CD",
//             "url": "https://www.youtube.com/watch?v=HUabdz8xJ2I",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd005eijj37ho9hi5u",
//             "title": "Introduction to Multiple Access Protocol",
//             "url": "https://www.youtube.com/watch?v=OrE5SfwGpGc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd005fijj33hk915d2",
//             "title": "ALOHA Random Access Protocol",
//             "url": "https://www.youtube.com/watch?v=g32GA0YR26U",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrmd005gijj312ss5son",
//             "title": "Random Access Protocol - CSMA, CSMA/CD, CSMA/CA - Media Access Control - Networking",
//             "url": "https://www.youtube.com/watch?v=CIWxXcxlnIU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           },
//           {
//             "id": "cmid8wrme005hijj36rybww0i",
//             "title": "Medium Access Control (MAC) Protocols",
//             "url": "https://www.youtube.com/watch?v=b5chVFn3kH0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000pijj3lszavy9v",
//             "createdAt": "2025-11-24T14:31:58.165Z",
//             "updatedAt": "2025-11-24T14:31:58.165Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000qijj3nl4xa5lv",
//         "description": "Day 23: Medium Access Control (MAC): CSMA/CD (Ethernet).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8ws6b005iijj3evcbzqhg",
//             "title": "Lec-31: Various Medium Access Control Protocols in Data Link Layer | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=G0h0dC4Zycs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000qijj3nl4xa5lv",
//             "createdAt": "2025-11-24T14:31:58.884Z",
//             "updatedAt": "2025-11-24T14:31:58.884Z"
//           },
//           {
//             "id": "cmid8ws6c005jijj3phvz2rke",
//             "title": "CSMA/CD and CSMA/CA Explained",
//             "url": "https://www.youtube.com/watch?v=iKn0GzF5-IU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000qijj3nl4xa5lv",
//             "createdAt": "2025-11-24T14:31:58.884Z",
//             "updatedAt": "2025-11-24T14:31:58.884Z"
//           },
//           {
//             "id": "cmid8ws6c005kijj3gl3elxhd",
//             "title": "Lec-35: Carrier Sense Multiple Access/ Collision Detection | CSMA/CD | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=v_z888gQWq0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000qijj3nl4xa5lv",
//             "createdAt": "2025-11-24T14:31:58.884Z",
//             "updatedAt": "2025-11-24T14:31:58.884Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000rijj3dwflp93a",
//         "description": "Day 24: Medium Access Control (MAC): CSMA/CA (Wi-Fi basics).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wspn005mijj3hpgcyeni",
//             "title": "CSMA/CD and CSMA/CA Explained",
//             "url": "https://www.youtube.com/watch?v=iKn0GzF5-IU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000rijj3dwflp93a",
//             "createdAt": "2025-11-24T14:31:59.579Z",
//             "updatedAt": "2025-11-24T14:31:59.579Z"
//           },
//           {
//             "id": "cmid8wspn005lijj36aklnohb",
//             "title": "Lec-31: Various Medium Access Control Protocols in Data Link Layer | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=G0h0dC4Zycs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000rijj3dwflp93a",
//             "createdAt": "2025-11-24T14:31:59.579Z",
//             "updatedAt": "2025-11-24T14:31:59.579Z"
//           },
//           {
//             "id": "cmid8wspn005nijj34yvujle6",
//             "title": "Multiple Access Protocols",
//             "url": "https://www.youtube.com/watch?v=YAjfUc7Tt24",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000rijj3dwflp93a",
//             "createdAt": "2025-11-24T14:31:59.579Z",
//             "updatedAt": "2025-11-24T14:31:59.579Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000sijj3303hq4gl",
//         "description": "Day 25: Controlled Access Protocols: Polling, Token Passing.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wtax005oijj3o2wrmtxn",
//             "title": "Controlled Access Protocols || Reservation || Polling || Token Passing || Computer Networks",
//             "url": "https://www.youtube.com/watch?v=SX7fHX-IKek",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000sijj3303hq4gl",
//             "createdAt": "2025-11-24T14:32:00.346Z",
//             "updatedAt": "2025-11-24T14:32:00.346Z"
//           },
//           {
//             "id": "cmid8wtax005pijj3y3fr92od",
//             "title": "Controlled Access Protocol – Token Passing",
//             "url": "https://www.youtube.com/watch?v=ac5JI20hUjE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000sijj3303hq4gl",
//             "createdAt": "2025-11-24T14:32:00.346Z",
//             "updatedAt": "2025-11-24T14:32:00.346Z"
//           },
//           {
//             "id": "cmid8wtax005qijj3chd655ll",
//             "title": "Controlled Access Protocol – Reservation",
//             "url": "https://www.youtube.com/watch?v=baaPXiQ44vs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000sijj3303hq4gl",
//             "createdAt": "2025-11-24T14:32:00.346Z",
//             "updatedAt": "2025-11-24T14:32:00.346Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000tijj3noxarqhy",
//         "description": "Day 26: Channelization Protocols: FDMA, TDMA, CDMA.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wtth005rijj3j47rqf9t",
//             "title": "Channelization Protocols",
//             "url": "https://www.youtube.com/watch?v=KviHyRss-dE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000tijj3noxarqhy",
//             "createdAt": "2025-11-24T14:32:01.014Z",
//             "updatedAt": "2025-11-24T14:32:01.014Z"
//           },
//           {
//             "id": "cmid8wtth005sijj3x8cnhbit",
//             "title": "3.10 FDMA TDMA CDMA Channelization Protocol",
//             "url": "https://www.youtube.com/watch?v=HFNbkmub6MQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000tijj3noxarqhy",
//             "createdAt": "2025-11-24T14:32:01.014Z",
//             "updatedAt": "2025-11-24T14:32:01.014Z"
//           },
//           {
//             "id": "cmid8wtth005tijj3bs0zfnki",
//             "title": "2.7 Channelization Protocol: FDMA, TDMA, CDMA",
//             "url": "https://www.youtube.com/watch?v=lWnSwyMayF0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000tijj3noxarqhy",
//             "createdAt": "2025-11-24T14:32:01.014Z",
//             "updatedAt": "2025-11-24T14:32:01.014Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000uijj3cpw6ow2r",
//         "description": "Day 27: Data Link Layer Protocols: PPP, HDLC.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wuea005uijj3d1wgwdnb",
//             "title": "High-Level Data Link Control (HDLC)",
//             "url": "https://www.youtube.com/watch?v=N2tgsPUPEBE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000uijj3cpw6ow2r",
//             "createdAt": "2025-11-24T14:32:01.762Z",
//             "updatedAt": "2025-11-24T14:32:01.762Z"
//           },
//           {
//             "id": "cmid8wuea005vijj3dje6xu1x",
//             "title": "Point-to-Point Protocol (PPP)",
//             "url": "https://www.youtube.com/watch?v=kKCwkRT_U8I",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000uijj3cpw6ow2r",
//             "createdAt": "2025-11-24T14:32:01.762Z",
//             "updatedAt": "2025-11-24T14:32:01.762Z"
//           },
//           {
//             "id": "cmid8wuea005wijj3x1loeq0r",
//             "title": "⛓️ HDLC in Networking Explained in 60s | 🖥️ Data Link Layer Protocol #Shorts",
//             "url": "https://www.youtube.com/watch?v=0ctavNrRxHU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000uijj3cpw6ow2r",
//             "createdAt": "2025-11-24T14:32:01.762Z",
//             "updatedAt": "2025-11-24T14:32:01.762Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000vijj3rm34mrit",
//         "description": "Day 28: Ethernet: Frame format, MAC addressing, Switches vs. Hubs.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wuw1005xijj3zqgv3zzk",
//             "title": "Lec-38: Ethernet Frame Format (IEEE-802.3) in Data Link Layer",
//             "url": "https://www.youtube.com/watch?v=ewpq3qxx5Ls",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000vijj3rm34mrit",
//             "createdAt": "2025-11-24T14:32:02.401Z",
//             "updatedAt": "2025-11-24T14:32:02.401Z"
//           },
//           {
//             "id": "cmid8wuw1005yijj3r8gmescw",
//             "title": "The Data Link Layer, MAC Addressing, and the Ethernet Frame",
//             "url": "https://www.youtube.com/watch?v=_b4dXKB8Pt8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000vijj3rm34mrit",
//             "createdAt": "2025-11-24T14:32:02.401Z",
//             "updatedAt": "2025-11-24T14:32:02.401Z"
//           },
//           {
//             "id": "cmid8wuw1005zijj3qxqwkcja",
//             "title": "Hub, Switch, &amp; Router Explained - What&#39;s the difference?",
//             "url": "https://www.youtube.com/watch?v=1z0ULvg_pW8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000vijj3rm34mrit",
//             "createdAt": "2025-11-24T14:32:02.401Z",
//             "updatedAt": "2025-11-24T14:32:02.401Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000wijj39t0nbg2g",
//         "description": "Day 29: Introduction to Network Layer: Role, logical addressing.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wv4b0060ijj3j46wpp44",
//             "title": "Lec-40: Network Layer | Responsibilities of Network Layer | OSI Model | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=rW1jPlYgp_0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000wijj39t0nbg2g",
//             "createdAt": "2025-11-24T14:32:02.700Z",
//             "updatedAt": "2025-11-24T14:32:02.700Z"
//           },
//           {
//             "id": "cmid8wv4b0061ijj3bbuhuzew",
//             "title": "4.6 What is Logical or IP Addressing",
//             "url": "https://www.youtube.com/watch?v=P7g--FJdUXE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000wijj39t0nbg2g",
//             "createdAt": "2025-11-24T14:32:02.700Z",
//             "updatedAt": "2025-11-24T14:32:02.700Z"
//           },
//           {
//             "id": "cmid8wv4b0062ijj32nu46q3x",
//             "title": "Addressing in Networking",
//             "url": "https://www.youtube.com/watch?v=yDTC6sbYFFE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000wijj39t0nbg2g",
//             "createdAt": "2025-11-24T14:32:02.700Z",
//             "updatedAt": "2025-11-24T14:32:02.700Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000xijj36d05179l",
//         "description": "Day 30: IPv4 Addressing: Classful Addressing (A, B, C, D, E).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wvmp0063ijj3od5fc2fv",
//             "title": "Classful Addressing (Part 1)",
//             "url": "https://www.youtube.com/watch?v=VkgfyLf1raY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000xijj36d05179l",
//             "createdAt": "2025-11-24T14:32:03.362Z",
//             "updatedAt": "2025-11-24T14:32:03.362Z"
//           },
//           {
//             "id": "cmid8wvmp0064ijj3kmq89vxy",
//             "title": "4.7 Classful Addressing Complete Discussion",
//             "url": "https://www.youtube.com/watch?v=QmAqpEkXAvo",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000xijj36d05179l",
//             "createdAt": "2025-11-24T14:32:03.362Z",
//             "updatedAt": "2025-11-24T14:32:03.362Z"
//           },
//           {
//             "id": "cmid8wvmq0065ijj3ou3u1wu1",
//             "title": "IP address classes explained | class A , B ,C ,D ,E | Free CCNA 200-301",
//             "url": "https://www.youtube.com/watch?v=0dFNpNgiTAA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000xijj36d05179l",
//             "createdAt": "2025-11-24T14:32:03.362Z",
//             "updatedAt": "2025-11-24T14:32:03.362Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000yijj32ejdqarg",
//         "description": "Day 31: IPv4 Addressing: Classless Inter-Domain Routing (CIDR).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8ww6r0066ijj3s54nnlw0",
//             "title": "Lec-47: What is Classless Addressing (CIDR) in Hindi | CIDR vs Classful Addressing",
//             "url": "https://www.youtube.com/watch?v=N-ywmOpWehE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000yijj32ejdqarg",
//             "createdAt": "2025-11-24T14:32:04.084Z",
//             "updatedAt": "2025-11-24T14:32:04.084Z"
//           },
//           {
//             "id": "cmid8ww6r0067ijj3kytbr7in",
//             "title": "Lec-19: What is CIDR Addressing | Classless Inter-Domain Routing with Examples | Most Important",
//             "url": "https://www.youtube.com/watch?v=7u0XnqS-5xs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000yijj32ejdqarg",
//             "createdAt": "2025-11-24T14:32:04.084Z",
//             "updatedAt": "2025-11-24T14:32:04.084Z"
//           },
//           {
//             "id": "cmid8ww6r0068ijj36hiywd30",
//             "title": "IP addressing and Subnetting | CIDR | Subnet | TechTerms",
//             "url": "https://www.youtube.com/watch?v=OqsXzkXfwRw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000yijj32ejdqarg",
//             "createdAt": "2025-11-24T14:32:04.084Z",
//             "updatedAt": "2025-11-24T14:32:04.084Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp000zijj3mtnndp2q",
//         "description": "Day 32: Subnetting: Basic concepts and calculations.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wwnw0069ijj39d2t0qlg",
//             "title": "What is subnetting ? How subnetting works ? What is subnet mask? | Explained with real-life exmples",
//             "url": "https://www.youtube.com/watch?v=qulRjRFavJI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006aijj3mqvbo6oc",
//             "title": "Subnetting Explained: Networking Basics",
//             "url": "https://www.youtube.com/watch?v=hbdT_Q9DM8w",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006bijj3sdqg87yy",
//             "title": "Subnetting",
//             "url": "https://www.youtube.com/watch?v=UHRPtNZ_Rz4",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006cijj3gzn34zcq",
//             "title": "Lec-48: Subnetting in Classful Addressing with Examples in Hindi | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=rdb2ki4iGuo",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006dijj3u3thzlcq",
//             "title": "Subnetting Made Simple",
//             "url": "https://www.youtube.com/watch?v=nFYilGQ-p-8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006eijj3u22od1fx",
//             "title": "Subnet Mask - Explained",
//             "url": "https://www.youtube.com/watch?v=s_Ntt6eTn94",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006fijj3xd0wvt55",
//             "title": "Subnetting (Solved Problem 1)",
//             "url": "https://www.youtube.com/watch?v=EZTQ61njgKI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006gijj3tidah9im",
//             "title": "IP address network and host portion | subnet mask  explained in simple terms | CCNA 200-301 |",
//             "url": "https://www.youtube.com/watch?v=eHV1aOnu7oM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006hijj3j77xduhv",
//             "title": "IP addressing and Subnetting | CIDR | Subnet | TechTerms",
//             "url": "https://www.youtube.com/watch?v=OqsXzkXfwRw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006iijj315w50zhm",
//             "title": "what is an IP Address? // You SUCK at Subnetting // EP 1",
//             "url": "https://www.youtube.com/watch?v=5WfiTHiU4x8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006jijj32lyloxav",
//             "title": "Subnetting in Classful Addressing with Examples in Hindi | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=Dtl8b1Sp2LM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006kijj3mtkici3u",
//             "title": "4.9 Complete Subnetting in One video",
//             "url": "https://www.youtube.com/watch?v=eWb35_xIKho",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006lijj3upat660t",
//             "title": "subnetting is simple",
//             "url": "https://www.youtube.com/watch?v=ecCuyq-Wprc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006mijj32fumz5zo",
//             "title": "Free CCNA | Subnetting (Part 1) | Day 13 | CCNA 200-301 Complete Course",
//             "url": "https://www.youtube.com/watch?v=bQ8sdpGQu8c",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006nijj3zjoa7x5k",
//             "title": "Basics of Subnetting | How to find Subnet Mask, Network ID, Host IP Address from CIDR Value | 2018",
//             "url": "https://www.youtube.com/watch?v=q7wNcYliJ1Q",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006oijj3ecisw1kp",
//             "title": "How to solve ANY Subnetting Problems in 60 seconds or less - Subnetting Mastery - Part 3 of 7",
//             "url": "https://www.youtube.com/watch?v=5-wlfAdcmFQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006pijj3hwm8k8w8",
//             "title": "Subnet Masks Explained #subnetmask #shorts",
//             "url": "https://www.youtube.com/watch?v=koD9T8fww3M",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006qijj3sgrs5ix1",
//             "title": "Professor Messer - Seven Second Subnetting",
//             "url": "https://www.youtube.com/watch?v=ZxAwQB8TZsM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnw006rijj352r39b4e",
//             "title": "Subnetting Part-1Hindi/Urdu Bhupinder Rajput | Learn subnetting in 20 Minutes Guaranteed",
//             "url": "https://www.youtube.com/watch?v=DqU3KVCyFNg",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnx006sijj39wzxqjjc",
//             "title": "IP Subnetting tutorial | How to subnet IPv4 addresses",
//             "url": "https://www.youtube.com/watch?v=7hIbzlxbebc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnx006tijj324eksj43",
//             "title": "How to Find Subnet Mask Shorts",
//             "url": "https://www.youtube.com/watch?v=3h1ERejLaaw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnx006uijj39650xfye",
//             "title": "IP Subnetting Self test!!✨",
//             "url": "https://www.youtube.com/watch?v=JnbX1VRBMdc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnx006vijj3g1bo8zu2",
//             "title": "What is Default Subnet Mask of Class A ? #ccna #networking #interview",
//             "url": "https://www.youtube.com/watch?v=IPRhdra5dOM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnx006wijj3bmu1j410",
//             "title": "How to Calculate Subnet Masks in Seconds! (No Math Degree Needed) | Cyber nanban",
//             "url": "https://www.youtube.com/watch?v=Rs-QUlenvwg",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           },
//           {
//             "id": "cmid8wwnx006xijj38pjupau8",
//             "title": "Calculate Valid Subnet and Usable Host Ipv4 address.#network#ccnanetworkengineer #ccna #computer",
//             "url": "https://www.youtube.com/watch?v=I3Psh2xwafI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp000zijj3mtnndp2q",
//             "createdAt": "2025-11-24T14:32:04.700Z",
//             "updatedAt": "2025-11-24T14:32:04.700Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0010ijj3gk7ymghp",
//         "description": "Day 33: Subnetting: Variable Length Subnet Mask (VLSM).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wx4y006yijj3psseu0z9",
//             "title": "Lec-49: Variable Length Subnet Masking(VLSM) in Hindi with Examples | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=mhVATrk0OhU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y006zijj3czfus8nh",
//             "title": "Variable Length Subnet Masking (VLSM) - Solved Problem 1",
//             "url": "https://www.youtube.com/watch?v=N7BEDtZ7G4g",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0070ijj37h560df9",
//             "title": "What is Subnetting? || Variable Length Subnet Mask (VLSM) with Example",
//             "url": "https://www.youtube.com/watch?v=NuTSRXR4CTg",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0071ijj3oq1dp3vr",
//             "title": "Subnetting | Variable Length Subnet Mask (VLSM) explained step-by-step | Bangla",
//             "url": "https://www.youtube.com/watch?v=nnZbVs6JSZ8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0072ijj35dab3vv0",
//             "title": "VLSM For Network Engineer | Variable Length Subnet Mask | #vlsm #subnetting #ccna",
//             "url": "https://www.youtube.com/watch?v=LVa31aiCUbs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0073ijj3jgbtws7g",
//             "title": "Subnetting using vlsm example 1",
//             "url": "https://www.youtube.com/watch?v=oCodPgKvNkM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0074ijj3dwxggj5x",
//             "title": "VLSM/Variable length subnet Mask{subnetting Part-5}-Hindi/Urdu l how to do VLSM | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=Y8rf9imNIRI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0075ijj3u7ohz0ds",
//             "title": "Variable Length Subnet Mask (VLSM) Math Problem Solution",
//             "url": "https://www.youtube.com/watch?v=EeafluXqgMc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0076ijj3cqcx8vzl",
//             "title": "Do you STILL suck at subnetting?? (THE FINAL TEST) // EP 9",
//             "url": "https://www.youtube.com/watch?v=OD2vG5st4zI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0077ijj3i0eqetma",
//             "title": "2023 AL ICT REVISION - DAY 03 PART 03 (Variable Length Subnetting | VLSM)",
//             "url": "https://www.youtube.com/watch?v=6vQ24mr4IUg",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0078ijj313s93g1o",
//             "title": "Video Tutorial VLSM",
//             "url": "https://www.youtube.com/watch?v=P5t2gN2l7ZI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y0079ijj3npjt6064",
//             "title": "Subnet Masks Explained #subnetmask #shorts",
//             "url": "https://www.youtube.com/watch?v=koD9T8fww3M",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y007aijj3im8t37wt",
//             "title": "VLSM Subnetting - subnetting a subnet",
//             "url": "https://www.youtube.com/watch?v=RLCd5u0sjoU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y007bijj3emfpt1iz",
//             "title": "Networking: Classless Subnetting | Variable Length Subnet Mask [VLSM] | CIDR Notation",
//             "url": "https://www.youtube.com/watch?v=BZBY7W1iYP4",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y007cijj3ynx6ac7x",
//             "title": "VLSM (Variable Length Subnet Mask) Explained with Numerical Class A,B,C | Subnetting | Networking.",
//             "url": "https://www.youtube.com/watch?v=M6x9Jb5Ef3c",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y007dijj3c88ad6m8",
//             "title": "IP Subnetting in Tamil | FLSM vs VLSM | Subnetting Explained Tamil | Part 1",
//             "url": "https://www.youtube.com/watch?v=n2GuUXqIft4",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y007eijj39xvsde87",
//             "title": "3. Subnetting -- Variable Length Subnet Mask VLSM",
//             "url": "https://www.youtube.com/watch?v=t8T5AwNWcjs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y007fijj31ago2fhd",
//             "title": "Lec-52: VLSM in Classless Addressing(CIDR) | Variable Length Subnet Masking",
//             "url": "https://www.youtube.com/watch?v=DFjz3yxe3aU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4y007gijj3btp1lqpm",
//             "title": "Easy VLSM Subnetting | Step by step VLSM",
//             "url": "https://www.youtube.com/watch?v=IgthYZ9N1vs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4z007hijj3pp6jk6px",
//             "title": "Free CCNA | Subnetting (Part 3 - VLSM) | Day 15 | CCNA 200-301 Complete Course",
//             "url": "https://www.youtube.com/watch?v=z-JqCedc9EI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4z007iijj31qg1gd1v",
//             "title": "VLSM - Variable-length Subnet Masking - Security+",
//             "url": "https://www.youtube.com/watch?v=utK8R0zv_xA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4z007jijj30h8r88b5",
//             "title": "Variable-Length Subnet Mask (VLSM) - Subnetting Mastery - FLSM and VLSM Appendix Part 2 of 2",
//             "url": "https://www.youtube.com/watch?v=amKyfbg5G2Q",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4z007kijj3zfbgnghw",
//             "title": "Variable length subnetting",
//             "url": "https://www.youtube.com/watch?v=qOIK1xRraQI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4z007lijj3f6vyb93a",
//             "title": "Variable Length Subnetting?? || Make Computer Network Easy 🖥 || Part -22",
//             "url": "https://www.youtube.com/watch?v=lNNValejB2s",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           },
//           {
//             "id": "cmid8wx4z007mijj3ugce00sf",
//             "title": "Variable Length Subnet Mask (VLSM)",
//             "url": "https://www.youtube.com/watch?v=dlzyL2uAW6A",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0010ijj3gk7ymghp",
//             "createdAt": "2025-11-24T14:32:05.314Z",
//             "updatedAt": "2025-11-24T14:32:05.314Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0011ijj3jpar5d3m",
//         "description": "Day 34: Network Address Translation (NAT), Private IP Addresses.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wxje007nijj3ct9t70ds",
//             "title": "NAT Explained - Network Address Translation",
//             "url": "https://www.youtube.com/watch?v=FTUV0t6JaDA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0011ijj3jpar5d3m",
//             "createdAt": "2025-11-24T14:32:05.834Z",
//             "updatedAt": "2025-11-24T14:32:05.834Z"
//           },
//           {
//             "id": "cmid8wxje007oijj3eeupy096",
//             "title": "Lec-62: NAT Explained - Network Address Translation with example in Hindi",
//             "url": "https://www.youtube.com/watch?v=47PUj7OSGkA",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0011ijj3jpar5d3m",
//             "createdAt": "2025-11-24T14:32:05.834Z",
//             "updatedAt": "2025-11-24T14:32:05.834Z"
//           },
//           {
//             "id": "cmid8wxje007pijj32f8o4hlo",
//             "title": "Network Address Translation - Computerphile",
//             "url": "https://www.youtube.com/watch?v=01ajHxPLxAw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0011ijj3jpar5d3m",
//             "createdAt": "2025-11-24T14:32:05.834Z",
//             "updatedAt": "2025-11-24T14:32:05.834Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0012ijj34zaczbcc",
//         "description": "Day 35: Review and Q&A on IPv4 Addressing and Subnetting.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wxyd007qijj36lw04jxi",
//             "title": "IP addressing and Subnetting | CIDR | Subnet | TechTerms",
//             "url": "https://www.youtube.com/watch?v=OqsXzkXfwRw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0012ijj34zaczbcc",
//             "createdAt": "2025-11-24T14:32:06.373Z",
//             "updatedAt": "2025-11-24T14:32:06.373Z"
//           },
//           {
//             "id": "cmid8wxyd007rijj3659urfgm",
//             "title": "IP address network and host portion | subnet mask  explained in simple terms | CCNA 200-301 |",
//             "url": "https://www.youtube.com/watch?v=eHV1aOnu7oM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0012ijj34zaczbcc",
//             "createdAt": "2025-11-24T14:32:06.373Z",
//             "updatedAt": "2025-11-24T14:32:06.373Z"
//           },
//           {
//             "id": "cmid8wxyd007sijj3l2avmjvd",
//             "title": "what is ip address classes\\ip address \\imp question for job interview #shorts #viral #youtubeshorts",
//             "url": "https://www.youtube.com/watch?v=K9aCSNVzEmQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0012ijj34zaczbcc",
//             "createdAt": "2025-11-24T14:32:06.373Z",
//             "updatedAt": "2025-11-24T14:32:06.373Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0013ijj3gdtiq5f9",
//         "description": "Day 36: IPv6 Addressing: Need for IPv6, address format.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wyb3007tijj3pw5o00zx",
//             "title": "Lec-56: IPv6 Header Format in Hindi | IPv4 Vs IPv6 in Computer Networks",
//             "url": "https://www.youtube.com/watch?v=U3rGOTxwXAI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0013ijj3gdtiq5f9",
//             "createdAt": "2025-11-24T14:32:06.832Z",
//             "updatedAt": "2025-11-24T14:32:06.832Z"
//           },
//           {
//             "id": "cmid8wyb3007uijj3i8e5f0wx",
//             "title": "IPv6 address basics and features explained in simple terms  |  ccna 200-301 |",
//             "url": "https://www.youtube.com/watch?v=Mo01x0LPxio",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0013ijj3gdtiq5f9",
//             "createdAt": "2025-11-24T14:32:06.832Z",
//             "updatedAt": "2025-11-24T14:32:06.832Z"
//           },
//           {
//             "id": "cmid8wyb3007vijj33i3wjj4b",
//             "title": "IPv6 Addresses Explained | Cisco CCNA 200-301",
//             "url": "https://www.youtube.com/watch?v=irhS0ASkvy8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0013ijj3gdtiq5f9",
//             "createdAt": "2025-11-24T14:32:06.832Z",
//             "updatedAt": "2025-11-24T14:32:06.832Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0014ijj3nu3t8dbk",
//         "description": "Day 37: IPv6 Address Types: Unicast, Multicast, Anycast.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wyvi007wijj3caxillkc",
//             "title": "IPv6 address types | unicast | multicast | anycast | link local |  ccna 200-301",
//             "url": "https://www.youtube.com/watch?v=LU9Dz6WF40A",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0014ijj3nu3t8dbk",
//             "createdAt": "2025-11-24T14:32:07.567Z",
//             "updatedAt": "2025-11-24T14:32:07.567Z"
//           },
//           {
//             "id": "cmid8wyvi007xijj3y9jm4agy",
//             "title": "IPv6 Address Types | Unicast, Multicast, Anycast &amp; More | Networking",
//             "url": "https://www.youtube.com/watch?v=HP3ZI6pDSYg",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0014ijj3nu3t8dbk",
//             "createdAt": "2025-11-24T14:32:07.567Z",
//             "updatedAt": "2025-11-24T14:32:07.567Z"
//           },
//           {
//             "id": "cmid8wyvi007yijj3tw70n348",
//             "title": "Lec-20: Unicast, Broadcast &amp; Multicast in Computer Networks",
//             "url": "https://www.youtube.com/watch?v=EcWhJbEWxHU",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0014ijj3nu3t8dbk",
//             "createdAt": "2025-11-24T14:32:07.567Z",
//             "updatedAt": "2025-11-24T14:32:07.567Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0015ijj33pas5fns",
//         "description": "Day 38: Transition from IPv4 to IPv6: Dual Stack, Tunneling, Translation.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wzcl007zijj3l8ovn506",
//             "title": "L58: IPv4 to IPv6 Transition and Difference b/w IPv4 and IPv6 | Data Communication Network Lectures",
//             "url": "https://www.youtube.com/watch?v=DMnCkbcJ-qw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0015ijj33pas5fns",
//             "createdAt": "2025-11-24T14:32:08.182Z",
//             "updatedAt": "2025-11-24T14:32:08.182Z"
//           },
//           {
//             "id": "cmid8wzcl0080ijj3ka1cr3ub",
//             "title": "IPv4 to IPv6 transition - Dual Stack",
//             "url": "https://www.youtube.com/watch?v=s0TNGC9GP48",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0015ijj33pas5fns",
//             "createdAt": "2025-11-24T14:32:08.182Z",
//             "updatedAt": "2025-11-24T14:32:08.182Z"
//           },
//           {
//             "id": "cmid8wzcl0081ijj3dc3acf26",
//             "title": "Transition from IPV4 to IPV6 | Dual Stack | Tunneling | Header Translation |  Computer Networks",
//             "url": "https://www.youtube.com/watch?v=X48i6r77at8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0015ijj33pas5fns",
//             "createdAt": "2025-11-24T14:32:08.182Z",
//             "updatedAt": "2025-11-24T14:32:08.182Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0016ijj3ax0pbcws",
//         "description": "Day 39: ICMP (Internet Control Message Protocol): Error reporting, Query messages.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8wzto0082ijj3f8az7ekh",
//             "title": "Internet Control Message Protocol (ICMP) Part-1 Explained in Hindi l Computer Network Course",
//             "url": "https://www.youtube.com/watch?v=tAKx2RCgqow",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0016ijj3ax0pbcws",
//             "createdAt": "2025-11-24T14:32:08.796Z",
//             "updatedAt": "2025-11-24T14:32:08.796Z"
//           },
//           {
//             "id": "cmid8wzto0083ijj3gjw2tjbx",
//             "title": "Internet Control Message Protocol ( ICMP ) 🔥",
//             "url": "https://www.youtube.com/watch?v=pxZek0t1GOw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0016ijj3ax0pbcws",
//             "createdAt": "2025-11-24T14:32:08.796Z",
//             "updatedAt": "2025-11-24T14:32:08.796Z"
//           },
//           {
//             "id": "cmid8wzto0084ijj3x05c6nej",
//             "title": "What is ICMP (Internet Control Message Protocol)?",
//             "url": "https://www.youtube.com/watch?v=xTqtm7-k25o",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0016ijj3ax0pbcws",
//             "createdAt": "2025-11-24T14:32:08.796Z",
//             "updatedAt": "2025-11-24T14:32:08.796Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0017ijj3w0acns3m",
//         "description": "Day 40: ARP (Address Resolution Protocol): Functioning, ARP Cache.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8x0bl0085ijj3u0pxw70b",
//             "title": "Lec-61: ARP Explained- Address Resolution Protocol | Network Layer",
//             "url": "https://www.youtube.com/watch?v=IUSyV2BVh4A",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0017ijj3w0acns3m",
//             "createdAt": "2025-11-24T14:32:09.441Z",
//             "updatedAt": "2025-11-24T14:32:09.441Z"
//           },
//           {
//             "id": "cmid8x0bl0086ijj3qd3707t3",
//             "title": "ARP Explained - Address Resolution Protocol",
//             "url": "https://www.youtube.com/watch?v=cn8Zxh9bPio",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0017ijj3w0acns3m",
//             "createdAt": "2025-11-24T14:32:09.441Z",
//             "updatedAt": "2025-11-24T14:32:09.441Z"
//           },
//           {
//             "id": "cmid8x0bl0087ijj3bhm3wnvj",
//             "title": "Address Resolution Protocol (ARP) Explained in Hindi l Computer Network Course",
//             "url": "https://www.youtube.com/watch?v=-IXPDypf2cs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0017ijj3w0acns3m",
//             "createdAt": "2025-11-24T14:32:09.441Z",
//             "updatedAt": "2025-11-24T14:32:09.441Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0018ijj33x4wn3h1",
//         "description": "Day 41: RARP (Reverse Address Resolution Protocol) and BOOTP/DHCP basics.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8x0rt0088ijj3ly63568f",
//             "title": "Reverse Address Resolution Protocol (RARP) Explained in Hindi l Computer Network Course",
//             "url": "https://www.youtube.com/watch?v=myDrL9YaxjM",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0018ijj33x4wn3h1",
//             "createdAt": "2025-11-24T14:32:10.026Z",
//             "updatedAt": "2025-11-24T14:32:10.026Z"
//           },
//           {
//             "id": "cmid8x0rt0089ijj3j60jz67o",
//             "title": "RARP - Reverse Address Resolution Protocol in Computer Networks",
//             "url": "https://www.youtube.com/watch?v=qdYgDafId3U",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0018ijj33x4wn3h1",
//             "createdAt": "2025-11-24T14:32:10.026Z",
//             "updatedAt": "2025-11-24T14:32:10.026Z"
//           },
//           {
//             "id": "cmid8x0rt008aijj33nsbmofi",
//             "title": "Reverse Address Resolution Protocol ( RARP )",
//             "url": "https://www.youtube.com/watch?v=dtrraGgJ-KQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0018ijj33x4wn3h1",
//             "createdAt": "2025-11-24T14:32:10.026Z",
//             "updatedAt": "2025-11-24T14:32:10.026Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp0019ijj31brl9lcf",
//         "description": "Day 42: Review and Q&A on IPv6 and supporting protocols.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8x1ei008bijj396ncqhhf",
//             "title": "Lec-91: Need of IPv6 Protocol | Why IPv6 is Required",
//             "url": "https://www.youtube.com/watch?v=0os5MOAKRL0",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0019ijj31brl9lcf",
//             "createdAt": "2025-11-24T14:32:10.843Z",
//             "updatedAt": "2025-11-24T14:32:10.843Z"
//           },
//           {
//             "id": "cmid8x1ei008cijj3em7v3brc",
//             "title": "Internet Protocol - IPv4 vs IPv6 as Fast As Possible",
//             "url": "https://www.youtube.com/watch?v=aor29pGhlFE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0019ijj31brl9lcf",
//             "createdAt": "2025-11-24T14:32:10.843Z",
//             "updatedAt": "2025-11-24T14:32:10.843Z"
//           },
//           {
//             "id": "cmid8x1ei008dijj3xeczkekm",
//             "title": "IPv6 from scratch - the very basics of IPv6 explained",
//             "url": "https://www.youtube.com/watch?v=oItwDXraK1M",
//             "duration": 30,
//             "subTopicId": "cmid8wglp0019ijj31brl9lcf",
//             "createdAt": "2025-11-24T14:32:10.843Z",
//             "updatedAt": "2025-11-24T14:32:10.843Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp001aijj3t3cak0h7",
//         "description": "Day 43: Routing Concepts: Static vs. Dynamic routing, routing tables.",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8x1pw008eijj32yiat2b9",
//             "title": "Lec-57: What is Routing Protocols | Various types of Routing Protocols",
//             "url": "https://www.youtube.com/watch?v=rA0p0ouD3aE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001aijj3t3cak0h7",
//             "createdAt": "2025-11-24T14:32:11.252Z",
//             "updatedAt": "2025-11-24T14:32:11.252Z"
//           },
//           {
//             "id": "cmid8x1pw008fijj3ppzv2orw",
//             "title": "CN 19 : Static Routing VS Dynamic Routing with Example",
//             "url": "https://www.youtube.com/watch?v=FEdhERayt-U",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001aijj3t3cak0h7",
//             "createdAt": "2025-11-24T14:32:11.252Z",
//             "updatedAt": "2025-11-24T14:32:11.252Z"
//           },
//           {
//             "id": "cmid8x1pw008gijj37h0ma90x",
//             "title": "Routing Tables | CCNA - Explained",
//             "url": "https://www.youtube.com/watch?v=CGmTvukObOw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001aijj3t3cak0h7",
//             "createdAt": "2025-11-24T14:32:11.252Z",
//             "updatedAt": "2025-11-24T14:32:11.252Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp001bijj3h3ub9so5",
//         "description": "Day 44: Routing Algorithms: Distance Vector Routing (RIP basics).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8x2co008hijj3rh5kh8pu",
//             "title": "Lec-58: Distance vector routing algorithm in hindi | Computer Networks",
//             "url": "https://www.youtube.com/watch?v=5ZuP5qjbKSI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001bijj3h3ub9so5",
//             "createdAt": "2025-11-24T14:32:12.072Z",
//             "updatedAt": "2025-11-24T14:32:12.072Z"
//           },
//           {
//             "id": "cmid8x2co008iijj3qut41ril",
//             "title": "Lec-57: What is Routing Protocols | Various types of Routing Protocols",
//             "url": "https://www.youtube.com/watch?v=rA0p0ouD3aE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001bijj3h3ub9so5",
//             "createdAt": "2025-11-24T14:32:12.072Z",
//             "updatedAt": "2025-11-24T14:32:12.072Z"
//           },
//           {
//             "id": "cmid8x2co008jijj3y47hpn5s",
//             "title": "Distance Vector Routing Algorithm in Computer Networks",
//             "url": "https://www.youtube.com/watch?v=JMzbdR9iBFY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001bijj3h3ub9so5",
//             "createdAt": "2025-11-24T14:32:12.072Z",
//             "updatedAt": "2025-11-24T14:32:12.072Z"
//           }
//         ]
//       },
//       {
//         "id": "cmid8wglp001cijj3j4ph43fv",
//         "description": "Day 45: Routing Algorithms: Link State Routing (OSPF basics).",
//         "learningJourneyId": "cmid8vzsf0001ijj38xwshpbr",
//         "createdAt": "2025-11-24T14:31:43.883Z",
//         "updatedAt": "2025-11-24T14:31:43.883Z",
//         "videoResources": [
//           {
//             "id": "cmid8x354008kijj3taacjil1",
//             "title": "OSPF Explained | Step by Step",
//             "url": "https://www.youtube.com/watch?v=kfvJ8QVJscc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x354008lijj3cmj9ijej",
//             "title": "What is OSPF? | OSPF Routing Protocol Tutorial for Beginners in Hindi",
//             "url": "https://www.youtube.com/watch?v=-Dx5Y80Onl4",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x354008mijj3ln39rmkm",
//             "title": "Lec-57: What is Routing Protocols | Various types of Routing Protocols",
//             "url": "https://www.youtube.com/watch?v=rA0p0ouD3aE",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x354008nijj3gkcfsyo7",
//             "title": "Lec-60: Link state routing in computer networks in Hindi",
//             "url": "https://www.youtube.com/watch?v=kW6zV-040SY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x354008oijj3ohn8q1pg",
//             "title": "OSPF in just over a minute!  #ospf #networking #telecomtech",
//             "url": "https://www.youtube.com/watch?v=QRskqfMkXgI",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008pijj3frh4nkxh",
//             "title": "What is OSPF and How Does It Work?",
//             "url": "https://www.youtube.com/watch?v=Xb3CbIDMDRk",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008qijj3bd4q3e9l",
//             "title": "OSPF Protocol made Simple",
//             "url": "https://www.youtube.com/watch?v=yMJBeC_9g2k",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008rijj3un0ixa13",
//             "title": "Link State Routing Algorithm in Computer Networks",
//             "url": "https://www.youtube.com/watch?v=eXXM7ukL4_k",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008sijj3se82hg8h",
//             "title": "Link State Routing Algorithm Part-1 Explained with Example in Hindi l Computer Network Course",
//             "url": "https://www.youtube.com/watch?v=W9wthihPw4g",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008tijj3oelhqv3q",
//             "title": "EGP / IGP :: Distance Vector / Link State :: Dynamic Routing Protocols :: OSPF EIGRP BGP RIP IS-IS",
//             "url": "https://www.youtube.com/watch?v=KjNYEzEBRD8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008uijj370mn5hva",
//             "title": "OSPF seven Stages - Video By Sikandar Shaik || Dual CCIE (RS/SP) # 35012",
//             "url": "https://www.youtube.com/watch?v=OA2AXBVK--w",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008vijj3t85z35zz",
//             "title": "Routing and Routing Protocols Simplified: BGP, OSPF, RIP",
//             "url": "https://www.youtube.com/watch?v=rLNmrFh-sd8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008wijj3lj9itn0w",
//             "title": "Link State Routing || OSPF Routing Protocol using Cisco Packet Tracer",
//             "url": "https://www.youtube.com/watch?v=driCogL6QPc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008xijj3urz7edq7",
//             "title": "Understanding Routing! | ICT#8",
//             "url": "https://www.youtube.com/watch?v=gQtgtKtvRdo",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008yijj3zr0zrkdo",
//             "title": "Link state routing protocols:   IS to IS and OSPF",
//             "url": "https://www.youtube.com/watch?v=K4prZSnOUTQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x355008zijj3jfy2ccrr",
//             "title": "Distance Vector Routing,Link state routing #computerscience",
//             "url": "https://www.youtube.com/watch?v=zlWIkXTb5Ys",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x3550090ijj3gnb7mjpu",
//             "title": "What are Routing Protocols and their Types?",
//             "url": "https://www.youtube.com/watch?v=pAopv0-lKxY",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x3550091ijj3djx0yz29",
//             "title": "How BGP works - IRL",
//             "url": "https://www.youtube.com/watch?v=EJKmkVFN4A4",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x3550092ijj345babwfi",
//             "title": "OSPF Routing Protocol using Cisco Packet Tracer",
//             "url": "https://www.youtube.com/watch?v=3SHtTW3EFuc",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x3550093ijj32ggpgbp4",
//             "title": "Link State Routing Protocols Explained in Hindi | CCNA Routing Basics",
//             "url": "https://www.youtube.com/watch?v=Y8lFrus3Dzk",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x3550094ijj301xfv5we",
//             "title": "🌐🛠️OSPF Protocol Explained in Tamil | #thillaithetechie",
//             "url": "https://www.youtube.com/watch?v=JQxqjStXOxs",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x3550095ijj3wd77nt4s",
//             "title": "How OSPF Works in Networking | CCNA &amp; CCNP Must-Know Routing Protocol Explained",
//             "url": "https://www.youtube.com/watch?v=kLj_aLAZEBw",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x3550096ijj3nhaccpy7",
//             "title": "What is BGP (Border Gateway Protocol)? An Introduction",
//             "url": "https://www.youtube.com/watch?v=A1KXPpqlNZ4",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x3550097ijj38ubco88e",
//             "title": "OSPF in TAMIL :: Detailed introduction about OSPF :: CCNA Taml",
//             "url": "https://www.youtube.com/watch?v=vhuepwE4hF8",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           },
//           {
//             "id": "cmid8x3550098ijj3sffham97",
//             "title": "OSPF Introduction #ospf #networking #ccna",
//             "url": "https://www.youtube.com/watch?v=SRQEsH3GQQQ",
//             "duration": 30,
//             "subTopicId": "cmid8wglp001cijj3j4ph43fv",
//             "createdAt": "2025-11-24T14:32:13.097Z",
//             "updatedAt": "2025-11-24T14:32:13.097Z"
//           }
//         ]
//       }
//     ]
//   }
// }
