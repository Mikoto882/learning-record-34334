class Subject < ActiveHash::Base
  self.data = [
    { id: 1, name: '教科を選択してください' },
    { id: 2, name: '英語' },
    { id: 3, name: '数学' },
    { id: 4, name: '数学Ⅰ' },
    { id: 5, name: '数学A' },
    { id: 6, name: '数学Ⅱ' },
    { id: 7, name: '数学B' },
    { id: 8, name: '数学Ⅲ' },
    { id: 9, name: '国語' },
    { id: 10, name: '現代文' },
    { id: 11, name: '古典' },
    { id: 12, name: '理科' },
    { id: 13, name: '物理' },
    { id: 14, name: '化学' },
    { id: 15, name: '生物' },
    { id: 16, name: '地学' },
    { id: 17, name: '社会' },
    { id: 18, name: '歴史' },
    { id: 19, name: '地理' },
    { id: 20, name: '公民' },
    { id: 21, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :learns

end
