DEFAULT_PASSWORD = 123456


#----- CADASTRO DOS PRE-REGISTROS -----

pre_registrations = [
  {
    cpf: '111.111.111-11',
    bloc: 1,
    ap: 101
  },
  {
    cpf: '222.222.222-22',
    bloc: 2,
    ap: 102
  },
  {
    cpf: '333.333.333-33',
    bloc: 3,
    ap: 103
  },
  {
    cpf: '444.444.444-44',
    bloc: 4,
    ap: 104
  },
  {
    cpf: '555.555.555-55',
    bloc: 5,
    ap: 201
  },
  {
    cpf: '660.660.660-66',
    bloc: 6,
    ap: 202
  },
  {
    cpf: '777.777.777-77',
    bloc: 7,
    ap: 203
  },
  {
    cpf: '888.888.888-88',
    bloc: 8,
    ap: 204
  },
  {
    cpf: '999.999.999-99',
    bloc: 9,
    ap: 301
  },
  {
    cpf: '111.111.111-00',
    bloc: 10,
    ap: 302
  },
  {
    cpf: '222.222.222-00',
    bloc: 11,
    ap: 303
  },
  {
    cpf: '333.333.333-00',
    bloc: 12,
    ap: 304
  }
]

pre_registrations.each do |pre_registration|
  PreRegistration.find_or_create_by!(pre_registration)
end


#----- CADASTRO DOS USUÁRIOS -----

User.create!(
  user_name: "Administrador",
  role: 'admin',
  email: "admin@admin.com",
  password: DEFAULT_PASSWORD,
  password_confirmation: DEFAULT_PASSWORD,
  pre_registration_id: 1
)

User.create!(
  user_name: "Usuário",
  role: 'user',
  email: "user@user.com",
  password: DEFAULT_PASSWORD,
  password_confirmation: DEFAULT_PASSWORD,
  pre_registration_id: 2
)


#----- CADASTRO DAS ASSEMBLÉIAS -----

assemblies = [
  {
    title: 'Assembléia 1',
    start_time: Time.now,
    finish_time: Time.now + 4.days,
    state: 'open',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  },
  {
    title: 'Assembléia 2',
    start_time: Time.now,
    finish_time: Time.now + 4.days,
    state: 'close',
    description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco
                  laboris nisi ut aliquip ex ea commodo consequat.'
  },
  {
    title: 'Assembléia 3',
    start_time: Time.now,
    finish_time: Time.now + 4.days,
    description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse
                  cillum dolore eu fugiat nulla pariatur.'
  }
]

assemblies.each do |assembly|
  Assembly.find_or_create_by!(assembly)
end


#----- CADASTRO DOS TÓPICOS -----

topics = [
  {
    title: 'Tópico 1',
    assembly_id: 1,
    description: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa
                  qui officia deserunt mollit anim id est laborum.'
  },
  {
    title: 'Tópico 2',
    assembly_id: 1,
    description: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                  accusantium doloremque laudantium.'
  },
  {
    title: 'Tópico 3',
    assembly_id: 1,
    description: 'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.'
  }
]

topics.each do |topic|
  Topic.find_or_create_by!(topic)
end


#----- CADASTRO DAS OPÇÕES -----

options = [
  {
    description: 'Opção 1',
    topic_id: 1
  },
  {
    description: 'Opção 2',
    topic_id: 1
  },
  {
    description: 'Opção 3',
    topic_id: 1
  },
  {
    description: 'Opção 4',
    topic_id: 2
  },
  {
    description: 'Opção 5',
    topic_id: 2
  },
  {
    description: 'Opção 6',
    topic_id: 2
  },
  {
    description: 'Opção 7',
    topic_id: 3
  },
  {
    description: 'Opção 8',
    topic_id: 3
  },
  {
    description: 'Opção 9',
    topic_id: 3
  }
]

options.each do |option|
  Option.find_or_create_by!(option)
end
