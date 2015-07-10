require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def test_homepage_displays_welcome_message
    # WWUD What would the user do
    # they would go to the webpage
    # they would look at the rendered page with their eyes
    # they would hopefully see the stuff they're looking for
    visit '/'

    assert page.has_content? "Welcome to the Task Manager"

    within("#greeting") do
      assert page.has_content? "Welcome to the Task Manager"
    end

  end

  def test_user_can_fill_in_task_form
    visit "/"
    click_link "New Task"
    assert_equal "/tasks/new", current_path

    # want to file in title with 'pizza'
    fill_in("task[title]", with: "pizza")
    fill_in('task[description]', with: "longer pizza")

    click_button('Submit')
    assert_equal "/tasks", current_path

    within ".container" do
      assert page.has_content? 'pizza'
    end
  end

  def test_user_can_update_a_task
    task = TaskManager.create({ title:       'title 1',
                                description: 'description 1'
                              })
    visit "/"
    click_link "Task Index"

    assert_equal '/tasks', current_path

    assert page.has_content? 'title 1'

    find(:xpath, "//a[@href='/tasks/#{task.id}/edit']").click
  end

  def test_user_sees_index_of_tasks

  end

end
