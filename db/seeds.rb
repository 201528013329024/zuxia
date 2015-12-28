# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#encoding :UTF-8
managers = [
    {
      :name => 'XHG',
      :password => '614025581',
      :email => 'hgxu1993@163.com',
      :sex => 'male',
      :academy => '',
      :telephone_number => '13021215377',
      :qq_number => '614025581',
      :wechart => '614025581',
      :alipay => '614025581@qq.com'
    }
]

managers.each do |m|
  Manager.create!(m)
end

routes = [
    {
      :start_end => '雁栖湖校区-玉泉路校区',
      :drive_data => '2015-12-19',
      :drive_time => '7:00',
      :ticket_num =>  '50',
      :price => '6.0',
      :bus_id =>  '1'
    },
    {
        :start_end => '雁栖湖校区-奥运村校区',
        :drive_data => '2015-12-19',
        :drive_time => '7:30',
        :ticket_num =>  '50',
        :price => '6.0',
        :bus_id =>  '2'
    },
    {
        :start_end => '雁栖湖校区-中关村校区',
        :drive_data => '2015-12-19',
        :drive_time => '8:00',
        :ticket_num =>  '50',
        :price => '6.0',
        :bus_id =>  '3'
    },
    {
        :start_end => '雁栖湖校区-怀柔城区',
        :drive_data => '2015-12-19',
        :drive_time => '8:30',
        :ticket_num =>  '50',
        :price => '3.0',
        :bus_id =>  '4'
    },
    {
        :start_end => '玉泉路校区-雁栖湖校区',
        :drive_data => '2015-12-19',
        :drive_time => '9:00',
        :ticket_num =>  '50',
        :price => '6.0',
        :bus_id =>  '1'
    },
    {
        :start_end => '奥运村校区-雁栖湖校区',
        :drive_data => '2015-12-19',
        :drive_time => '9:30',
        :ticket_num =>  '50',
        :price => '6.0',
        :bus_id =>  '2'
    },
    {
        :start_end => '中关村校区-雁栖湖校区',
        :drive_data => '2015-12-19',
        :drive_time => '10:00',
        :ticket_num =>  '50',
        :price => '6.0',
        :bus_id =>  '3'
    },
    {
        :start_end => '怀柔城区-雁栖湖校区',
        :drive_data => '2015-12-19',
        :drive_time => '10:30',
        :ticket_num =>  '50',
        :price => '3.0',
        :bus_id =>  '4'
    }
]

routes.each do |r|
  Route.create!(r)
end

users = [
    {
        :name => '徐浩广',
        :email => 'hgxu1993@163.com',
        :password => '614025581',
        :telephone_number => '13021215377',
        :role => '学生'
    },
    {
        :name => '方业全',
        :email => '1620690414@qq.com',
        :password => '1620690414',
        :telephone_number => '13161693509',
        :role => '学生'
    },
    {
        :name => '魏路奇',
        :email => '229825018@qq.com',
        :password => '229825018',
        :telephone_number => '13020050600',
        :role => '学生'
    },
    {
        :name => '张护望',
        :email => '308393521@qq.com',
        :password => '308393521',
        :telephone_number => '15201619536',
        :role => '学生'
    }
]

users.each do |u|
  User.create!(u)
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')