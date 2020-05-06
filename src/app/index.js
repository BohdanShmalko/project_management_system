const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('project_management_system', 'user', 'password', {
    host: 'localhost',
    dialect: 'mysql'
});

async function Connect() {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');

        GetAssociations();

    } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
}

const GetAssociations = () => sequelize.query(
    'select \
        task_property.value as `Task`, \
        role.name as `Role`, \
        worker.name as `Worker`\
    from association \
    left join task on association.task_id = task.id \
    left join worker on association.worker_id = worker.id \
    left join role on association.role_id = role.id \
    left join task_property on task.id = task_property.task_id \
    where task_property.key = "Name"',
        { type: sequelize.QueryTypes.SELECT }
    )
    .then(table => {
      console.table(table);
})

Connect();