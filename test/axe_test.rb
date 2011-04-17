$LOAD_PATH.unshift File.dirname(__FILE__)
require 'helper'

class AxeTest < Test::Unit::TestCase

  def test_basic_run
    assert_command '', 'tail -f log/development.log'
  end

  def test_query_run
    assert_command 'INSERT', "tail -f log/development.log | grep \"INSERT\""
  end

  def test_queries_run
    assert_command 'params INSERT active_record',
      "tail -f log/development.log | grep \"params\\|INSERT\\|active_record\""
  end

  def test_environment_run
    assert_command '-e test', 'tail -f log/test.log'
  end

  def test_environments_run
    assert_command '-e test -e staging', 'tail -f log/staging.log'
  end

  def test_num_run
    assert_command '-n 100', 'tail -n 100 log/development.log'
  end

  def test_nums_run
    assert_command '-n 100 -n 200', 'tail -n 200 log/development.log'
  end

  def test_queries_environment_num_run
    assert_command 'params INSERT active_record -e test -n 100',
      "tail -n 100 log/test.log | grep \"params\\|INSERT\\|active_record\""
  end

  def test_queries_environment_run
    assert_command 'params INSERT active_record -e test',
      "tail -f log/test.log | grep \"params\\|INSERT\\|active_record\""
  end

  def test_mixed_query_with_num_and_environment
    assert_command 'params -e test INSERT -n 100 active_record',
      "tail -n 100 log/test.log | grep \"params\\|INSERT\\|active_record\""
  end
end
