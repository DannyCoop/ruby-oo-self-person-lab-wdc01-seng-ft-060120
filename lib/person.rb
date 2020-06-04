require 'pry'
class Person
    attr_reader \
        :name,
        :happiness,
        :hygiene
    attr_accessor :bank_account

    def initialize(name)
        @name = name
        @bank_account = 25.0
        @happiness = 8
        @hygiene = 8
    end

    def happiness=(happiness)
        @happiness = bound_0_to_10(happiness)
    end
    
    def hygiene=(hygiene)
        @hygiene = bound_0_to_10(hygiene)
    end

    #helper: hygiene/happiness
    #returns number but cant go outside of bounds (0..10)
    def bound_0_to_10(num)
        if num >= 10
            return 10
        elsif num < 0
            return 0
        else
            return num
        end
    end

    def happy?
        @happiness > 7            
    end

    def clean?
        @hygiene > 7
    end

    # method should accept a salary amount and add this to the person's
    #  bank account. Then the method should return 
    #  the string "all about the benjamins".
    def get_paid(salary)
        @bank_account += salary
        return "all about the benjamins"
    end
    # The take_bath method should increment the person's hygiene points by four 
    # and return the string "♪ Rub-a-dub just relaxing in the tub ♫".
    def take_bath
        self.hygiene=(@hygiene + 4)
        return "♪ Rub-a-dub just relaxing in the tub ♫"        
    end
    
    # The work_out method should increment the person's happiness by two points, 
    # decrease their hygiene by three points, and return the Queen lyrics, "♪ another 
    # one bites the dust ♫".
    def work_out
        self.happiness  = (@happiness + 2) 
        self.hygiene    = (@hygiene - 3)
        return "♪ another one bites the dust ♫"
    end
    # he call_friend method should accept another instance of the Person class, or 
    # "friend". The method should increment the caller and the callee's happiness 
    # points by three. If Stella calls her friend Felix, the method should return 
    # "Hi Felix! It's Stella. How are you?"
    def call_friend(friend)        
        self.happiness = (@happiness + 3)
        friend.happiness = (friend.happiness + 3)
        #binding.pry
        return "Hi #{friend.name}! It's #{self.name}. How are you?"        
    end

    # Finally, the start_conversation method should 
    # accept two arguments, the person to start a 
    # conversation with and the topic of conversation.
    def start_conversation(person,topic)
        # If the topic is politics, both people get 
        # sadder and the method returns "blah blah partisan blah lobbyist".
        if topic == "politics"
            self.happiness = @happiness - 2
            person.happiness = person.happiness - 2
            return "blah blah partisan blah lobbyist"
        # If the topic is weather, both people get a little happier 
        # and the method returns "blah blah sun blah rain".
        elsif topic == "weather"
            self.happiness      = self.happiness + 1
            person.happiness    = person.happiness + 1
            return "blah blah sun blah rain"
        # If the topic is not politics or weather, their happiness points 
        # don't change and the method returns "blah blah blah blah blah".    
        else
            return "blah blah blah blah blah"
        end        
    end
end