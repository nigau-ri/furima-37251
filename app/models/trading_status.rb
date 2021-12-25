class TradingStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '販売中' }
  ]

  include ActiveHash::Associations

end