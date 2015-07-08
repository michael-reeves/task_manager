require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({ title:       'a title',
                         description: 'a description'
                       })
    task = TaskManager.find(1)

    assert_equal 'a title', task.title
    assert_equal 'a description', task.description
    assert_equal 1, task.id
  end

  def test_it_returns_all_tasks
    TaskManager.create({ title:       'title 1',
                         description: 'description 1'
                       })
    TaskManager.create({ title:       'title 2',
                         description: 'description 2'
                       })
    TaskManager.create({ title:       'title 3',
                         description: 'description 3'
                       })

    tasks = TaskManager.all

    assert_equal 3, tasks.count
    assert_equal "title 2", tasks[1].title
  end

  def test_it_finds_a_tasks
    TaskManager.create({ title:       'title 1',
                         description: 'description 1'
                       })
    TaskManager.create({ title:       'title 2',
                         description: 'description 2'
                       })
    TaskManager.create({ title:       'title 3',
                         description: 'description 3'
                       })

    task = TaskManager.find(2)

    assert_equal "title 2", task.title
  end

  def test_it_updates_a_task
    TaskManager.create({ title:       'title 1',
                         description: 'description 1'
                       })
    updated_task = { title:       'new title',
                     description: 'new description'
                   }

    TaskManager.update(1, updated_task)
    task = TaskManager.find(1)

    assert_equal 'new title',       task.title
    assert_equal 'new description', task.description
  end

  def test_it_destroys_a_task
    TaskManager.create({ title:       'title 1',
                         description: 'description 1'
                       })
    TaskManager.create({ title:       'title 2',
                         description: 'description 2'
                       })

    assert_equal 2, TaskManager.all.count

    TaskManager.delete(1)
    assert_equal 1, TaskManager.all.count

    task = TaskManager.all.first
    assert_equal 'title 2', task.title
  end

end
