import 'dart:math';

class AliasGenerator {
  static String generate() {
    final random = Random();
    final adjective = adjectives[random.nextInt(adjectives.length)];
    final noun = nouns[random.nextInt(nouns.length)];
    return "$adjective$noun";
  }

  static const adjectives = [
    "Abiding",
    "Abounding",
    "Academic",
    "Acceptable",
    "Accepting",
    "Accessible",
    "Acclaimed",
    "Accommodating",
    "Accountable",
    "Accurate",
    "Actionable",
    "Active",
    "Actual",
    "Adaptive",
    "Adequate",
    "Admirable",
    "Adored",
    "Advantageous",
    "Advisable",
    "Affectionate",
    "Agreeable",
    "Alert",
    "Alluring",
    "Amazed",
    "Amicable",
    "Amusing",
    "Appealing",
    "Appetizing",
    "Appreciative",
    "Approachable",
    "Appropriate",
    "Ardent",
    "Arresting",
    "Artful",
    "Artistic",
    "Aspiring",
    "Assertive",
    "Assured",
    "Assuring",
    "Astonishing",
    "Astounding",
    "Astronomical",
    "Astute",
    "Athletic",
    "Attainable",
    "Attractive",
    "Auspicious",
    "Authoritative",
    "Avid",
    "Awake",
    "Aware",
    "Banging",
    "Beaming",
    "Bedazzled",
    "Bedazzling",
    "Believable",
    "Beneficial",
    "Benign",
    "Bewildering",
    "Bewitching",
    "Bilingual",
    "Blameless",
    "Blazing",
    "Blessed",
    "Blissful",
    "Blooming",
    "Blossoming",
    "Blushing",
    "Bodacious",
    "Boisterous",
    "Bold",
    "Bouncy",
    "Boundless",
    "Boyish",
    "Brainy",
    "Brave",
    "Brawny",
    "Brazen",
    "Breathtaking",
    "Breezy",
    "Bright",
    "Buoyant",
    "Bustling",
    "Calming",
    "Candid",
    "Capable",
    "Captivated",
    "Captivating",
    "Carefree",
    "Careful",
    "Caring",
    "Cautious",
    "Ceaseless",
    "Celebrated",
    "Celestial",
    "Centered",
    "Cerebral",
    "Ceremonial",
    "Certified",
    "Changeable",
    "Charismatic",
    "Charitable",
    "Charmed",
    "Charming",
    "Chatty",
    "Cheeky",
    "Cheerful",
    "Cheery",
    "Childlike",
    "Chivalrous",
    "Choice",
    "Chuckling",
    "Cinematic",
    "Civilized",
    "Classic",
    "Classical",
    "Clean",
    "Clear",
    "Clearheaded",
    "Clever",
    "Close",
    "Coachable",
    "Cognitive",
    "Coherent",
    "Cohesive",
    "Collaborative",
    "Collegial",
    "Colloquial",
    "Colorful",
    "Comfortable",
    "Comforted",
    "Comforting",
    "Commanding",
    "Commemorative",
    "Commendable",
    "Committed",
    "Communicative",
    "Compact",
    "Compassionate",
    "Compelling",
    "Competent",
    "Complete",
    "Completed",
    "Complex",
    "Complimentary",
    "Comprehensive",
    "Conceivable",
    "Concerted",
    "Concise",
    "Confidential",
    "Confirmable",
    "Confirmed",
    "Congruent",
    "Connected",
    "Conscientious",
    "Conscious",
    "Consensual",
    "Consenting",
    "Conservative",
    "Consistent",
    "Consoling",
    "Conspiratorial",
    "Constant",
    "Constructive",
    "Consummate",
    "Contemplative",
    "Contemporary",
    "Content",
    "Contented",
    "Contributive",
    "Convenient",
    "Conventional",
    "Conversational",
    "Convincing",
    "Coolest",
    "Cooperative",
    "Coordinated",
    "Copious",
    "Coquettish",
    "Correctable",
    "Corresponding",
    "Cosmic",
    "Courageous",
    "Courteous",
    "Coveted",
    "Creamy",
    "Creative",
    "Credible",
    "Crisp",
    "Crucial",
    "Crunchy",
    "Cuddly",
    "Cultured",
    "Cunning",
    "Curable",
    "Curative",
    "Curious",
    "Current",
    "Customary",
    "Cute",
    "Dainty",
    "Dapper",
    "Daring",
    "Dashing",
    "Daughterly",
    "Dazzling",
    "Dear",
    "Debonair",
    "Decadent",
    "Decisive",
    "Decorative",
    "Decorous",
    "Dedicated",
    "Deep",
    "Defendable",
    "Defensible",
    "Definable",
    "Definitive",
    "Delectable",
    "Deliberate",
    "Deliberative",
    "Delicious",
    "Delighted",
    "Delightful",
    "Demonstrative",
    "Demure",
    "Dependable",
    "Designer",
    "Desirous",
    "Detailed",
    "Devoted",
    "Devout",
    "Didactic",
    "Dignified",
    "Diplomatic",
    "Direct",
    "Disarming",
    "Disciplined",
    "Discriminating",
    "Distinct",
    "Distinguished",
    "Distracting",
    "Diverse",
    "Diversified",
    "Dizzying",
    "Doable",
    "Dogged",
    "Dogmatic",
    "Domestic",
    "Dominant",
    "Doting",
    "Dreamy",
    "Dressy",
    "Driven",
    "Dutiful",
    "Dynamic",
    "Early",
    "Earnest",
    "Earthy",
    "Eccentric",
    "Economical",
    "Ecstatic",
    "Edgy",
    "Educated",
    "Educational",
    "Effervescent",
    "Effortless",
    "Effusive",
    "Egalitarian",
    "Elaborate",
    "Electric",
    "Electrifying",
    "Elegant",
    "Elevated",
    "Eligible",
    "Elite",
    "Eloquent",
    "Emblematic",
    "Emboldened",
    "Empirical",
    "Enamored",
    "Enchanted",
    "Enchanting",
    "Encouraged",
    "Encouraging",
    "Endearing",
    "Endurable",
    "Enduring",
    "Energizing",
    "Enforceable",
    "Engrossing",
    "Enhanced",
    "Enigmatic",
    "Enjoyable",
    "Enlightened",
    "Enough",
    "Enterprising",
    "Entertained",
    "Entertaining",
    "Enthralled",
    "Enthused",
    "Enthusiastic",
    "Enticing",
    "Entire",
    "Entranced",
    "Enumerable",
    "Enviable",
    "Equitable",
    "Erect",
    "Essential",
    "Established",
    "Eternal",
    "Ethereal",
    "Ethical",
    "Euphoric",
    "Even",
    "Eventful",
    "Everlasting",
    "Evocative",
    "Exact",
    "Exalted",
    "Exceptional",
    "Excitable",
    "Excited",
    "Exciting",
    "Exclusive",
    "Executable",
    "Exhaustive",
    "Exhilarated",
    "Exhilarating",
    "Exotic",
    "Expansive",
    "Expectant",
    "Expected",
    "Expedient",
    "Expeditious",
    "Expensive",
    "Expert",
    "Express",
    "Expressionistic",
    "Expressive",
    "Exquisite",
    "Extensive",
    "Extraordinary",
    "Extravagant",
    "Exuberant",
    "Fabled",
    "Factual",
    "Famous",
    "Fascinated",
    "Fascinating",
    "Fashionable",
    "Fastidious",
    "Fateful",
    "Fatherly",
    "Fathomable",
    "Favorable",
    "Fearless",
    "Fertile",
    "Fervent",
    "Fetching",
    "Fierce",
    "Fiery",
    "Fine",
    "Firm",
    "First",
    "Fit",
    "Flamboyant",
    "Flashy",
    "Flattered",
    "Flattering",
    "Flavorful",
    "Flawless",
    "Flexible",
    "Flirtatious",
    "Flowery",
    "Fluent",
    "Fluffy",
    "Focused",
    "Fond",
    "Foreseeable",
    "Forgivable",
    "Forgiving",
    "Formal",
    "Formative",
    "Formidable",
    "Forthright",
    "Fortuitous",
    "Fortunate",
    "Forward",
    "Foxy",
    "Fragrant",
    "Frank",
    "Fraternal",
    "Free",
    "Fresh",
    "Friendly",
    "Frisky",
    "Fulfilled",
    "Fulfilling",
    "Full",
    "Fun",
    "Functional",
    "Fundamental",
    "Futuristic",
    "Gainful",
    "Gallant",
    "Game",
    "Generous",
    "Genial",
    "Genuine",
    "Giddy",
    "Gifted",
    "Giggling",
    "Giving",
    "Glaring",
    "Glittering",
    "Glorious",
    "Glossy",
    "Glowing",
    "Golden",
    "Graceful",
    "Gracious",
    "Grandiose",
    "Gratified",
    "Gratifying",
    "Greatest",
    "Grinning",
    "Gripping",
    "Groomed",
    "Groovy",
    "Guaranteed",
    "Guiltless",
    "Gutsy",
    "Hallowed",
    "Handsome",
    "Hardworking",
    "Hardy",
    "Harmless",
    "Harmonic",
    "Harmonious",
    "Heady",
    "Hearty",
    "Heavenly",
    "Helpful",
    "Heroic",
    "Historical",
    "Holistic",
    "Homey",
    "Honorable",
    "Hopeful",
    "Hot",
    "Huggable",
    "Human",
    "Humble",
    "Hygienic",
    "Idealistic",
    "Illuminating",
    "Illustrious",
    "Immaculate",
    "Immense",
    "Immortal",
    "Immovable",
    "Impartial",
    "Impassioned",
    "Impenetrable",
    "Impervious",
    "Important",
    "Impressive",
    "Improved",
    "Improving",
    "Inalienable",
    "Incandescent",
    "Inclusive",
    "Incomparable",
    "Industrious",
    "Influential",
    "Informative",
    "Informed",
    "Ingenuous",
    "Inhabitable",
    "Innovative",
    "Inquisitive",
    "Insightful",
    "Invaluable",
    "Inviting",
    "Iridescent",
    "Joyful",
    "Kindhearted",
    "Knowing",
    "Laudable",
    "Learned",
    "Likeable",
    "Loveable",
    "Lovely",
    "Loving",
    "Marketable",
    "Maternal",
    "Meaningful",
    "Meditative",
    "Merry",
    "Miraculous",
    "Motivational",
    "Moving",
    "Naughty",
    "Neighborly",
    "Notable",
    "Nutritious",
    "Observant",
    "Optimistic",
    "Parental",
    "Paternal",
    "Patient",
    "Peerless",
    "Perceptive",
    "Personable",
    "Phenomenal",
    "Playful",
    "Precocious",
    "Premium",
    "Pretty",
    "Productive",
    "Proud",
    "Pure",
    "Quirky",
    "Resilient",
    "Reverent",
    "Romantic",
    "Scrupulous",
    "Seemly",
    "Sociable",
    "Stimulating",
    "Suave",
    "Successful",
    "Talented",
    "Tasteful",
    "Thrifty",
    "Upright",
    "Valiant",
    "Winning",
    "Zestful",
  ];

  static const nouns = [
    "Ability",
    "Abroad",
    "Abuse",
    "Access",
    "Accident",
    "Active",
    "Activity",
    "Address",
    "Administration",
    "Adult",
    "Advance",
    "Advantage",
    "Advertising",
    "Advice",
    "Affair",
    "Affect",
    "Agent",
    "Airport",
    "Alarm",
    "Alcohol",
    "Alternative",
    "Ambition",
    "Amount",
    "Analysis",
    "Analyst",
    "Anger",
    "Angle",
    "Animal",
    "Annual",
    "Answer",
    "Anxiety",
    "Anybody",
    "Anything",
    "Anywhere",
    "Apartment",
    "Appeal",
    "Appearance",
    "Apple",
    "Application",
    "Appointment",
    "Area",
    "Assignment",
    "Assist",
    "Assistance",
    "Assistant",
    "Associate",
    "Association",
    "Assumption",
    "Atmosphere",
    "Attack",
    "Attempt",
    "Attention",
    "Attitude",
    "Audience",
    "Author",
    "Average",
    "Award",
    "Awareness",
    "Baby",
    "Back",
    "Bake",
    "Balance",
    "Ball",
    "Band",
    "Baseball",
    "Basis",
    "Bathroom",
    "Battle",
    "Beach",
    "Bear",
    "Beat",
    "Beer",
    "Beginning",
    "Being",
    "Bell",
    "Belt",
    "Bench",
    "Bend",
    "Bike",
    "Bill",
    "Bird",
    "Birth",
    "Bitter",
    "Black",
    "Blame",
    "Blank",
    "Blind",
    "Block",
    "Blood",
    "Blow",
    "Blue",
    "Board",
    "Boat",
    "Body",
    "Bone",
    "Bonus",
    "Book",
    "Boot",
    "Border",
    "Boss",
    "Bother",
    "Bottle",
    "Bottom",
    "Boyfriend",
    "Brain",
    "Branch",
    "Brave",
    "Bread",
    "Break",
    "Breakfast",
    "Breast",
    "Breath",
    "Brick",
    "Bridge",
    "Brief",
    "Brilliant",
    "Broad",
    "Brother",
    "Brown",
    "Brush",
    "Buddy",
    "Bunch",
    "Cabinet",
    "Cable",
    "Cake",
    "Calendar",
    "Call",
    "Calm",
    "Camera",
    "Camp",
    "Cancer",
    "Candidate",
    "Candle",
    "Care",
    "Career",
    "Carpet",
    "Carry",
    "Case",
    "Category",
    "Cause",
    "Celebration",
    "Cell",
    "Chain",
    "Chair",
    "Challenge",
    "Champion",
    "Championship",
    "Chance",
    "Change",
    "Channel",
    "Chapter",
    "Character",
    "Charge",
    "Charity",
    "Chart",
    "Check",
    "Cheek",
    "Chemical",
    "Chemistry",
    "Chest",
    "Chicken",
    "Child",
    "Childhood",
    "Chip",
    "Chocolate",
    "Choice",
    "Church",
    "Cigarette",
    "City",
    "Claim",
    "Class",
    "Classic",
    "Classroom",
    "Clerk",
    "Click",
    "Client",
    "Climate",
    "Clock",
    "Closet",
    "Clothes",
    "Cloud",
    "Club",
    "Clue",
    "Coach",
    "Coast",
    "Coat",
    "Code",
    "Coffee",
    "Cold",
    "Collar",
    "Collection",
    "College",
    "Combination",
    "Combine",
    "Comfort",
    "Comfortable",
    "Command",
    "Comment",
    "Commercial",
    "Commission",
    "Committee",
    "Common",
    "Communication",
    "Community",
    "Company",
    "Comparison",
    "Competition",
    "Complaint",
    "Complex",
    "Computer",
    "Concentrate",
    "Concept",
    "Concern",
    "Concert",
    "Conclusion",
    "Condition",
    "Conference",
    "Confidence",
    "Conflict",
    "Confusion",
    "Connection",
    "Consequence",
    "Consideration",
    "Consist",
    "Constant",
    "Construction",
    "Contact",
    "Contest",
    "Context",
    "Contract",
    "Contribution",
    "Control",
    "Conversation",
    "Convert",
    "Cook",
    "Cookie",
    "Copy",
    "Corner",
    "Cost",
    "Count",
    "Counter",
    "Country",
    "County",
    "Couple",
    "Courage",
    "Course",
    "Court",
    "Cousin",
    "Craft",
    "Crash",
    "Crazy",
    "Cream",
    "Creative",
    "Credit",
    "Crew",
    "Criticism",
    "Current",
    "Curve",
    "Dance",
    "Dare",
    "Dark",
    "Data",
    "Database",
    "Date",
    "Deal",
    "Dealer",
    "Dear",
    "Death",
    "Debate",
    "Debt",
    "Decision",
    "Deep",
    "Definition",
    "Degree",
    "Delay",
    "Delivery",
    "Demand",
    "Department",
    "Departure",
    "Dependent",
    "Deposit",
    "Depression",
    "Depth",
    "Description",
    "Design",
    "Designer",
    "Desire",
    "Desk",
    "Detail",
    "Development",
    "Device",
    "Devil",
    "Diamond",
    "Diet",
    "Difference",
    "Dinner",
    "Direction",
    "Director",
    "Dirt",
    "Disaster",
    "Discipline",
    "Discount",
    "Discussion",
    "Disease",
    "Dish",
    "Disk",
    "Display",
    "Distance",
    "Distribution",
    "District",
    "Divide",
    "Doctor",
    "Doubt",
    "Draft",
    "Drag",
    "Drama",
    "Draw",
    "Drawer",
    "Drawing",
    "Dream",
    "Dress",
    "Drink",
    "Drive",
    "Driver",
    "Drop",
    "Dust",
    "Ease",
    "Economy",
    "Edge",
    "Editor",
    "Education",
    "Effect",
    "Effective",
    "Efficiency",
    "Elevator",
    "Emergency",
    "Emotion",
    "Emphasis",
    "Employ",
    "Employee",
    "Employer",
    "Engine",
    "Engineer",
    "Engineering",
    "Entertainment",
    "Enthusiasm",
    "Entrance",
    "Entry",
    "Environment",
    "Equal",
    "Equipment",
    "Equivalent",
    "Error",
    "Escape",
    "Essay",
    "Establishment",
    "Estate",
    "Estimate",
    "Evening",
    "Event",
    "Evidence",
    "Exam",
    "Examination",
    "Example",
    "Exchange",
    "Excitement",
    "Excuse",
    "Exercise",
    "Exit",
    "Experience",
    "Expert",
    "Explanation",
    "Expression",
    "Extension",
    "Extent",
    "External",
    "Fact",
    "Factor",
    "Fail",
    "Failure",
    "Fall",
    "Familiar",
    "Fault",
    "Fear",
    "Feedback",
    "Feel",
    "Feeling",
    "Fight",
    "Figure",
    "File",
    "Fill",
    "Film",
    "Final",
    "Finance",
    "Finding",
    "Finger",
    "Finish",
    "Fire",
    "Fish",
    "Floor",
    "Flow",
    "Fold",
    "Following",
    "Food",
    "Foot",
    "Football",
    "Force",
    "Forever",
    "Form",
    "Formal",
    "Fortune",
    "Foundation",
    "Frame",
    "Freedom",
    "Friend",
    "Friendship",
    "Front",
    "Fruit",
    "Funeral",
    "Funny",
    "Future",
    "Gain",
    "Garbage",
    "Gather",
    "Gear",
    "Gene",
    "General",
    "Gift",
    "Girl",
    "Girlfriend",
    "Give",
    "Glad",
    "Glass",
    "Golf",
    "Good",
    "Government",
    "Grab",
    "Grade",
    "Grand",
    "Grandfather",
    "Grandmother",
    "Grass",
    "Great",
    "Green",
    "Grocery",
    "Ground",
    "Group",
    "Growth",
    "Guarantee",
    "Guard",
    "Guess",
    "Guest",
    "Guidance",
    "Guide",
    "Hair",
    "Half",
    "Hall",
    "Hand",
    "Handle",
    "Hang",
    "Head",
    "Health",
    "Hearing",
    "Heart",
    "Heat",
    "Heavy",
    "Height",
    "Hell",
    "Hello",
    "Help",
    "Hide",
    "High",
    "Highlight",
    "Highway",
    "Hire",
    "Historian",
    "Hole",
    "Holiday",
    "Home",
    "Homework",
    "Honey",
    "Hook",
    "Hope",
    "Horror",
    "Horse",
    "Hospital",
    "Host",
    "Hotel",
    "Hour",
    "House",
    "Housing",
    "Human",
    "Hunt",
    "Hurry",
    "Hurt",
    "Ideal",
    "Illegal",
    "Image",
    "Imagination",
    "Impact",
    "Implement",
    "Importance",
    "Impress",
    "Impression",
    "Improvement",
    "Incident",
    "Income",
    "Increase",
    "Independence",
    "Independent",
    "Indication",
    "Individual",
    "Industry",
    "Inevitable",
    "Inflation",
    "Influence",
    "Information",
    "Initial",
    "Initiative",
    "Injury",
    "Insect",
    "Inside",
    "Inspection",
    "Inspector",
    "Instance",
    "Instruction",
    "Insurance",
    "Intention",
    "Interaction",
    "Interest",
    "Internal",
    "International",
    "Internet",
    "Interview",
    "Introduction",
    "Investment",
    "Invite",
    "Iron",
    "Island",
    "Issue",
    "Item",
    "Joint",
    "Joke",
    "Judge",
    "Judgment",
    "Juice",
    "Jump",
    "Junior",
    "Jury",
    "Kind",
    "King",
    "Kiss",
    "Kitchen",
    "Knee",
    "Knife",
    "Ladder",
    "Lady",
    "Lake",
    "Land",
    "Landscape",
    "Language",
    "Lead",
    "Leader",
    "Leadership",
    "Leading",
    "League",
    "Leather",
    "Leave",
    "Level",
    "Lift",
    "Light",
    "Limit",
    "Line",
    "Listen",
    "Literature",
    "Living",
    "Load",
    "Loan",
    "Local",
    "Location",
    "Look",
    "Loss",
    "Lunch",
    "Machine",
    "Magazine",
    "Mail",
    "Main",
    "Maintenance",
    "Major",
    "Make",
    "Male",
    "Manager",
    "Manner",
    "Manufacturer",
    "Mark",
    "Market",
    "Marketing",
    "Marriage",
    "Master",
    "Match",
    "Mate",
    "Material",
    "Math",
    "Matter",
    "Maximum",
    "Maybe",
    "Meal",
    "Meaning",
    "Measurement",
    "Meat",
    "Media",
    "Medicine",
    "Medium",
    "Meet",
    "Meeting",
    "Member",
    "Membership",
    "Memory",
    "Mention",
    "Menu",
    "Mess",
    "Message",
    "Metal",
    "Method",
    "Middle",
    "Midnight",
    "Might",
    "Milk",
    "Mind",
    "Mine",
    "Minimum",
    "Minor",
    "Minute",
    "Mirror",
    "Miss",
    "Mission",
    "Mobile",
    "Mode",
    "Money",
    "Monitor",
    "Month",
    "Mood",
    "Morning",
    "Mortgage",
    "Most",
    "Mother",
    "Motor",
    "Mountain",
    "Mouse",
    "Mouth",
    "Move",
    "Music",
    "Nail",
    "Name",
    "Nasty",
    "Nation",
    "National",
    "Native",
    "Natural",
    "Nature",
    "Neat",
    "Necessary",
    "Neck",
    "Negative",
    "Negotiation",
    "News",
    "Newspaper",
    "Night",
    "Nobody",
    "Noise",
    "Normal",
    "North",
    "Nose",
    "Note",
    "Nothing",
    "Notice",
    "Novel",
    "Number",
    "Nurse",
    "Object",
    "Objective",
    "Obligation",
    "Occasion",
    "Offer",
    "Office",
    "Officer",
    "Opening",
    "Operation",
    "Opinion",
    "Opportunity",
    "Opposite",
    "Option",
    "Orange",
    "Order",
    "Ordinary",
    "Organization",
    "Original",
    "Other",
    "Outcome",
    "Outside",
    "Oven",
    "Owner",
    "Pace",
    "Pack",
    "Package",
    "Page",
    "Pain",
    "Paint",
    "Painting",
    "Pair",
    "Panic",
    "Paper",
    "Parent",
    "Park",
    "Parking",
    "Part",
    "Particular",
    "Partner",
    "Party",
    "Pass",
    "Passage",
    "Passenger",
    "Passion",
    "Past",
    "Path",
    "Patience",
    "Patient",
    "Pattern",
    "Peace",
    "Pension",
    "People",
    "Percentage",
    "Perception",
    "Performance",
    "Period",
    "Permission",
    "Permit",
    "Person",
    "Personal",
    "Personality",
    "Perspective",
    "Phase",
    "Philosophy",
    "Phone",
    "Photo",
    "Phrase",
    "Physical",
    "Physics",
    "Piano",
    "Pick",
    "Pitch",
    "Pizza",
    "Place",
    "Plan",
    "Plane",
    "Plant",
    "Plastic",
    "Plate",
    "Platform",
    "Play",
    "Player",
    "Pleasure",
    "Plenty",
    "Poem",
    "Poet",
    "Poetry",
    "Point",
    "Police",
    "Policy",
    "Politics",
    "Pollution",
    "Position",
    "Positive",
    "Possession",
    "Possibility",
    "Possible",
    "Potential",
    "Pound",
    "Power",
    "Practice",
    "Preference",
    "Preparation",
    "Presence",
    "Present",
    "Presentation",
    "President",
    "Press",
    "Pressure",
    "Price",
    "Pride",
    "Priest",
    "Primary",
    "Principle",
    "Print",
    "Prior",
    "Priority",
    "Private",
    "Prize",
    "Problem",
    "Procedure",
    "Process",
    "Produce",
    "Product",
    "Profession",
    "Professional",
    "Professor",
    "Profile",
    "Profit",
    "Program",
    "Progress",
    "Project",
    "Promise",
    "Promotion",
    "Prompt",
    "Proof",
    "Property",
    "Proposal",
    "Protection",
    "Psychology",
    "Public",
    "Pull",
    "Punch",
    "Purchase",
    "Purple",
    "Purpose",
    "Quantity",
    "Quarter",
    "Queen",
    "Question",
    "Quiet",
    "Quit",
    "Quote",
    "Race",
    "Radio",
    "Rain",
    "Raise",
    "Range",
    "Rate",
    "Reaction",
    "Read",
    "Reading",
    "Reality",
    "Reason",
    "Reception",
    "Recipe",
    "Recognition",
    "Recommendation",
    "Record",
    "Recording",
    "Reflection",
    "Refrigerator",
    "Refuse",
    "Region",
    "Register",
    "Regret",
    "Regular",
    "Relation",
    "Relationship",
    "Relative",
    "Release",
    "Relief",
    "Remote",
    "Remove",
    "Rent",
    "Repair",
    "Repeat",
    "Replacement",
    "Reply",
    "Report",
    "Representative",
    "Republic",
    "Reputation",
    "Request",
    "Requirement",
    "Research",
    "Reserve",
    "Resident",
    "Resist",
    "Resolution",
    "Resolve",
    "Resort",
    "Resource",
    "Respect",
    "Respond",
    "Response",
    "Responsibility",
    "Rest",
    "Restaurant",
    "Result",
    "Return",
    "Reveal",
    "Revenue",
    "Review",
    "Revolution",
    "Reward",
    "Rice",
    "Rich",
    "Ride",
    "Risk",
    "River",
    "Road",
    "Rock",
    "Role",
    "Roll",
    "Roof",
    "Room",
    "Rope",
    "Rough",
    "Round",
    "Safety",
    "Sail",
    "Salad",
    "Salary",
    "Sale",
    "Salt",
    "Sample",
    "Sand",
    "Sandwich",
    "Satisfaction",
    "Save",
    "Savings",
    "Scale",
    "Scene",
    "Schedule",
    "Scheme",
    "School",
    "Science",
    "Score",
    "Scratch",
    "Screen",
    "Screw",
    "Season",
    "Seat",
    "Second",
    "Secret",
    "Secretary",
    "Section",
    "Sector",
    "Security",
    "Selection",
    "Self",
    "Sell",
    "Senior",
    "Sense",
    "Sensitive",
    "Sentence",
    "Series",
    "Serve",
    "Service",
    "Shame",
    "Shape",
    "Shift",
    "Shine",
    "Ship",
    "Shirt",
    "Shock",
    "Shoe",
    "Shoot",
    "Shop",
    "Shopping",
    "Shot",
    "Shoulder",
    "Show",
    "Shower",
    "Sick",
    "Side",
    "Sign",
    "Signal",
    "Signature",
    "Significance",
    "Silly",
    "Silver",
    "Simple",
    "Sing",
    "Singer",
    "Single",
    "Site",
    "Situation",
    "Size",
    "Skill",
    "Skin",
    "Slice",
    "Slide",
    "Slip",
    "Smell",
    "Smile",
    "Smoke",
    "Snow",
    "Society",
    "Sock",
    "Soft",
    "Software",
    "Soil",
    "Solid",
    "Solution",
    "Sort",
    "Sound",
    "Soup",
    "Source",
    "South",
    "Space",
    "Spare",
    "Speaker",
    "Special",
    "Specialist",
    "Specific",
    "Speech",
    "Speed",
    "Spell",
    "Spend",
    "Spirit",
    "Spiritual",
    "Spite",
    "Split",
    "Sport",
    "Spot",
    "Spray",
    "Spread",
    "Spring",
    "Square",
    "Stable",
    "Staff",
    "Stage",
    "Stand",
    "Standard",
    "Star",
    "Start",
    "State",
    "Statement",
    "Station",
    "Status",
    "Stay",
    "Steak",
    "Steal",
    "Step",
    "Stick",
    "Still",
    "Stock",
    "Stomach",
    "Stop",
    "Storage",
    "Store",
    "Storm",
    "Story",
    "Strain",
    "Stranger",
    "Strategy",
    "Street",
    "Strength",
    "Stress",
    "Stretch",
    "Strike",
    "String",
    "Strip",
    "Stroke",
    "Structure",
    "Struggle",
    "Student",
    "Studio",
    "Study",
    "Stuff",
    "Stupid",
    "Style",
    "Subject",
    "Substance",
    "Success",
    "Suck",
    "Sugar",
    "Suggestion",
    "Suit",
    "Support",
    "Surgery",
    "Surprise",
    "Surround",
    "Survey",
    "Suspect",
    "Sweet",
    "Swim",
    "Swimming",
    "Swing",
    "Switch",
    "Sympathy",
    "System",
    "Table",
    "Tackle",
    "Tale",
    "Talk",
    "Task",
    "Teach",
    "Teacher",
    "Teaching",
    "Team",
    "Tear",
    "Technology",
    "Telephone",
    "Television",
    "Tell",
    "Temperature",
    "Temporary",
    "Tennis",
    "Tension",
    "Term",
    "Test",
    "Text",
    "Thanks",
    "Theme",
    "Theory",
    "Thing",
    "Thought",
    "Throat",
    "Tone",
    "Tongue",
    "Tonight",
    "Tool",
    "Total",
    "Touch",
    "Tough",
    "Tour",
    "Tourist",
    "Towel",
    "Tower",
    "Town",
    "Track",
    "Trade",
    "Tradition",
    "Traffic",
    "Train",
    "Trainer",
    "Training",
    "Transition",
    "Transportation",
    "Trash",
    "Travel",
    "Treat",
    "Tree",
    "Trick",
    "Trip",
    "Trouble",
    "Truck",
    "Trust",
    "Turn",
    "Uncle",
    "Understanding",
    "Union",
    "Unique",
    "Unit",
    "University",
    "Upper",
    "Usual",
    "Vacation",
    "Valuable",
    "Value",
    "Variation",
    "Variety",
    "Vast",
    "Vegetable",
    "Vehicle",
    "Version",
    "Video",
    "View",
    "Village",
    "Virus",
    "Visit",
    "Visual",
    "Voice",
    "Volume",
    "Wait",
    "Wake",
    "Walk",
    "Wash",
    "Watch",
    "Water",
    "Wealth",
    "Wear",
    "Week",
    "Weekend",
    "Weight",
    "Weird",
    "Welcome",
    "West",
    "Western",
    "Wheel",
    "Whereas",
    "While",
    "White",
    "Whole",
    "Wife",
    "Window",
    "Wine",
    "Wing",
    "Winner",
    "Winter",
    "Wish",
    "Witness",
    "Woman",
    "Wonder",
    "Wood",
    "Word",
    "Work",
    "Worker",
    "Working",
    "World",
    "Worry",
    "Worth",
    "Wrap",
    "Writer",
    "Writing",
    "Yard",
    "Year",
    "Yellow",
    "Youth",
    "Zone",
  ];
}
