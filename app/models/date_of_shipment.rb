class Date_of_shipment < ActiveHash::Base
    include ActiveHash::Associations
    has_many :items
    self.data = [
                    {id: 0, name: '---'}, {id: 1, name: '1~2日で発送'}, {id: 2, name: '3~4日で発送'}, {id: 3, '4~7日で発送' }
                ]
end
