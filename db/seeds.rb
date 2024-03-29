# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(account: 'admin', password: 'qweasdzxc321', password_confirmation: 'qweasdzxc321', email: 'admin@cd.2bc.tw', privilege: '4')

# user = User.new
# user.email = 'test@example.com'
# user.password = 'qweasdzxc321'
# user.password_confirmation = 'qweasdzxc321'
# user.encrypted_password = '#$taawktljasktlw4aaglj'
# user.save!

Agent.create(name: 'Visa')
Agent.create(name: 'Master')
Agent.create(name: 'JCB')
Agent.create(name: 'American Express')

Bank.create(name: '台灣銀行', swift_number: '004')
Bank.create(name: '土地銀行', swift_number: '005')
Bank.create(name: '合庫商銀', swift_number: '006')
Bank.create(name: '第一銀行', swift_number: '007')
Bank.create(name: '華南銀行', swift_number: '008')
Bank.create(name: '彰化銀行', swift_number: '009')
Bank.create(name: '上海銀行', swift_number: '011')
Bank.create(name: '台北富邦', swift_number: '012')
Bank.create(name: '國泰世華', swift_number: '013')
Bank.create(name: '高雄銀行', swift_number: '016')
Bank.create(name: '兆豐商銀', swift_number: '017')
# Bank.create(name: '農業金庫', swift_number: '018')
Bank.create(name: '花旗銀行', swift_number: '021')
# Bank.create(name: '美國銀行', swift_number: '022')
Bank.create(name: '美國運通', swift_number: '024')
# Bank.create(name: '首都銀行', swift_number: '025')
Bank.create(name: '澳盛銀行', swift_number: '039')
Bank.create(name: '臺灣企銀', swift_number: '050')
Bank.create(name: '渣打商銀', swift_number: '052')
Bank.create(name: '台中銀行', swift_number: '053')
# Bank.create(name: '京城商銀', swift_number: '054')
# Bank.create(name: '德意志銀行', swift_number: '072')
# Bank.create(name: '東亞銀行', swift_number: '075')
Bank.create(name: '匯豐銀行', swift_number: '081')
Bank.create(name: '瑞興銀行', swift_number: '101')
Bank.create(name: '華泰銀行', swift_number: '102')
Bank.create(name: '臺灣新光商銀', swift_number: '103')
Bank.create(name: '陽信銀行', swift_number: '108')
# Bank.create(name: '板信銀行', swift_number: '118')
Bank.create(name: '三信銀行', swift_number: '147')
Bank.create(name: '中華郵政', swift_number: '700')
Bank.create(name: '聯邦銀行', swift_number: '803')
Bank.create(name: '遠東銀行', swift_number: '805')
Bank.create(name: '元大銀行', swift_number: '806')
Bank.create(name: '永豐銀行', swift_number: '807')
Bank.create(name: '玉山銀行', swift_number: '808')
Bank.create(name: '凱基銀行', swift_number: '809')
Bank.create(name: '星展銀行', swift_number: '810')
Bank.create(name: '台新銀行', swift_number: '812')
Bank.create(name: '大眾銀行', swift_number: '814')
Bank.create(name: '日盛銀行', swift_number: '815')
Bank.create(name: '安泰銀行', swift_number: '816')
Bank.create(name: '中國信託', swift_number: '822')

CardType.create(name: '信用卡')
CardType.create(name: '簽帳卡')
CardType.create(name: 'Combo卡')

@visa = Agent.find_by_name("Visa")
@master = Agent.find_by_name("Master")
@jcb = Agent.find_by_name("JCB")

CardLevel.create(agent_id: @visa.id, level: '0', name: '普卡')
CardLevel.create(agent_id: @visa.id, level: '1', name: '金卡')
CardLevel.create(agent_id: @visa.id, level: '2', name: '白金卡')
CardLevel.create(agent_id: @visa.id, level: '3', name: '御璽卡')
CardLevel.create(agent_id: @visa.id, level: '4', name: '無限卡')
CardLevel.create(agent_id: @master.id, level: '0', name: '普卡')
CardLevel.create(agent_id: @master.id, level: '1', name: '金卡')
CardLevel.create(agent_id: @master.id, level: '2', name: '白金卡')
CardLevel.create(agent_id: @master.id, level: '3', name: '鈦金卡')
CardLevel.create(agent_id: @master.id, level: '4', name: '世界卡')
CardLevel.create(agent_id: @master.id, level: '5', name: '世界之極卡')
CardLevel.create(agent_id: @jcb.id, level: '0', name: '普卡')
CardLevel.create(agent_id: @jcb.id, level: '1', name: '金卡')
CardLevel.create(agent_id: @jcb.id, level: '2', name: '白金卡')
CardLevel.create(agent_id: @jcb.id, level: '3', name: '晶緻卡')
CardLevel.create(agent_id: @jcb.id, level: '4', name: '尊緻卡')
CardLevel.create(agent_id: @jcb.id, level: '5', name: '極緻卡')
