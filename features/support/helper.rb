class Calabash::ABase
  def debug_all
     wait_if_loading                                                                 # wait_for_activity
     puts query("*").to_yaml                                                         # вывод всех видимых элементов экрана полностью - в виде форматированного содержимого
     p query("*").count                                                              # вывод числа видимых элементов
  end

  def count_locator(*parm)                                                              # Legend: def count_element([0]:count/rule ,[1]:string/class   ,[2]:_class = nil ,[3]:prop = nil)
    case parm[0]                                                                        # Usage_1:    count_element          :text ,   'page'          ,   'UIPage'      ,   'isEnabled:1 isSelected:0'
    when String                                                                         # Usage_2:    count_element     10         ,   'page'          ,   'UIPage'      ,   'isEnabled:1 isSelected:0'
      parm.unshift(1)                                                                   # Usage_3:    count_element     10                    ,'UIPage'
    when Symbol
      rule = parm.shift
      parm.unshift(1)
    end
    if parm[2]
      rule = :marked unless rule
      size = query("#{parm[2]} #{rule}:'#{parm[1]}' #{parm[3]}", timeout:30).size
    else
      rule = :class unless rule
      size = query("#{parm[1]}", timeout:30).size
    end
    case
    when size == parm[0]
    when size > parm[0]
      log "NOTIFY! Found #{size} vs expected #{parm[0]} instances of #{parm[2]} #{rule}:'#{parm[1]}' with property #{parm[3]}"
    when size == 0
      raise "No #{parm[2]} #{rule}:'#{parm[1]}' found with property #{parm[3]}"
    else
      raise "Found #{size} vs expected #{parm[0]} instances of #{parm[2]} #{rule}:'#{parm[1]}' with property #{parm[3]}"
    end
  end

  def press_locator(*parm)                                                              # Legend: def press_locator([0]:rule/index ,[1]:string/class      ,[2]:_class = nil ,[3]:prop = nil)
    wait_if_loading
    case parm[0]                                                                        # Usage_1:    press_locator    :id         ,   'button'           ,   'UIButton'    ,   'isEnabled:true isSelected:false'
    when Symbol                                                                         # Usage_2:    press_locator                    'button'           ,    'UIPage'     ,   'isEnabled:true isSelected:false'
      rule = parm.shift                                                                 # Usage_3:    press_locator          index ,           'UIButton'                   ,   'isEnabled:true isSelected:false'
      wait_for_element_exists("* #{parm[1]} #{rule}:'#{parm[0]}' #{parm[2]}", timeout:30)
      touch query("* #{parm[1]} #{rule}:'#{parm[0]}' #{parm[2]}")
    when String
      if parm[1]
        wait_for_element_exists("* #{parm[1]} marked:'#{parm[0]}' #{parm[2]}", timeout:30)
        touch query("* #{parm[1]} marked:'#{parm[0]}' #{parm[2]}")
      else
        wait_for_element_exists("* #{parm[0]}", timeout:30)
        touch query("* #{parm[0]}")
      end
    when Integer
      i = parm.shift - 1
      wait_for_element_exists("* #{parm[0]} index:#{i} #{parm[1]}", timeout:30)
      touch query("* #{parm[0]} index:#{i} #{parm[1]}")
    end
  end

  def wait_locator(*parm)
    wait_for(timeout:30, retry_frequency:0.2) {query("#{parm[0]}")}                     # wait for condition to be true until timeout runs out
  end

  def back
    press_locator 'AppCompatImageButton'                                                # TODO: добавить id к кнопке стрелка (назад)
  end

  def close_alert(button)                                                               # используется в LoginPage.rb при login для закрытия всплывающего окна
      tap_when_element_exists("* id:'button#{button}'")                                 # LoginPage.rb при login для закрытия всплывающего окна "poor password"
      wait_for_elements_do_not_exist("AlertDialogLayout", timeout:10)
  end

  def wait_if_loading
    wait_for_element_does_not_exist "* id:'progress_circular'"
    wait_for_element_does_not_exist "* id:'main_content_progress'"
    wait_for_element_does_not_exist("* MaterialProgressBar id:'progress'", timeout:30)  # wait_for_element_does_not_exist "* id:'progress'"
  end

  def scroll_until_visible(*parm)                                                       # Legend: def scroll_until_visible([0]:rule/string ,[1]:_string ,[2]:direction = nil)
    if element_exists("* RecyclerView")                                                 # Usage_1:    scroll_until_visible    :id          ,   'button' ,    :up/:down
      time = Process.clock_gettime(Process::CLOCK_MONOTONIC)                            # Usage_2:    scroll_until_visible         'button'             ,    :up/:down
      if parm[0].is_a? Symbol
        rule = parm.shift
      else
        rule = 'marked'
      end
      if parm[1].is_a? Symbol
        direction = parm[1]
      else
        direction = :down
      end
      until element_exists("* #{rule}:'#{parm[0]}'") do
        delta = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        break if (delta - time) > 5                                                     # max ожидание прокрутки в секундах
        scroll("RecyclerView", direction)
      end
    end
  end
end

def get_credentials
  ACCOUNTS[ENV['XTC_DEVICE_INDEX'] || '0']
  #ACCOUNTS.values.sample
end

def random_username
  rand(36**8).to_s(36)                                                                  # rand(36**length).to_s(36) <-- generate random strings of lowercase a-z and 0-9
end

def random_psw
  [*('a'..'z'),*('0'..'9')].shuffle[0,8].join                                           # [*('a'..'z'),*('0'..'9')].shuffle[0,length].join <-- generate random string of lowercase a-z and 0-9
end

def check_slider_val(slider_id, value)
  debug_all
  p :value[0]
  if query(slider_id, :value)[0] != value.to_i
    raise("Slider value must be #{value}!")
  end
end

def slider_set_val(slider_id, new_val)
  new_val = new_val.to_f
  max_val = query(slider_id, :maximumValue).first
  old_val = query(slider_id, :value).first
  width = query(slider_id, :frame).first['Width']
  notch_width = (width / max_val) + 2
  if old_val > new_val
    direction = :left
  else
    direction = :right
  end
  half_val = (max_val / 2.0)
  x = ((width / 2) * ((old_val - half_val) / half_val)).ceil
  dx = (old_val - new_val).abs * notch_width
  swipe(direction,
        query: slider_id,
        offset: { x: x, y: 0 },
        :'swipe-delta' => { horizontal: { dx: dx, dy: 0 } })
end

module Helpers                                                    # I also prefer to extract those 2 methods to helpers for better visibility: Then you can include this module where you need those methods
  def get_scenario_variable(symbol)                               # Usage: get_scenario_variable(:@user)
    $world.instance_variable_get(symbol)
  end

  def set_scenario_variable(symbol, value)                        # Usage: set_scenario_variable(:@user, user)
    $world.instance_variable_set(symbol, value)
  end
end
