# Chaser Schedule (CodeWars)
https://www.codewars.com/kata/628df6b29070907ecb3c2d83

## Summary
A runner, who runs with base speed s with duration t will cover a distances d: d = s * t
However, this runner can sprint for one unit of time with double speed s * 2
After sprinting, base speed s will permanently reduced by 1, and for next one unit of time runner will enter recovery phase and can't sprint again.

Your task, given base speed s and time t, is to find the maximum possible distance d.

## My solution
```rb
def speed_and_time(speed, time_slots)
  sprints = efficient_sprint_times(speed, (time_slots.to_f / 2.0).ceil)
  runs = efficient_run_times(speed, time_slots, sprints)
  runs.sum + sprints.sum
end

def efficient_sprint_times(speed, max_sprint_slots)
  sprint_speeds = []
  max_sprint_slots.times do |i|
    sprint_speed = (speed - i) * 2
    run_speed = speed - sprint_speeds.count
    sprint_speeds << sprint_speed if (sprint_speed + run_speed) >= (speed * 2)
  end
  sprint_speeds
end

def efficient_run_times(speed, time_slots, sprint)
  sprint_slots = sprint.count
  run_slots = time_slots - sprint_slots
  default_run_times = Array.new(run_slots, speed)
  return default_run_times if sprint_slots == 1

  sprint_slots.times do |slot|
    sprint_first = sprint.last > speed && sprint_slots <= run_slots ? 0 : 1
    return default_run_times if slot >= run_slots

    default_run_times[slot] = speed - sprint_first - slot
  end

  default_run_times
end

puts speed_and_time(2, 4) == 10   # 2 + 2 + 2 + 4
puts speed_and_time(2, 3) == 8    # 2 + 2 + 4
puts speed_and_time(1, 1) == 2    # 2
puts speed_and_time(9, 8) == 90   # 9 + 18 + 8 + 16 + 7 + 14 + 6 + 12 = 90
puts speed_and_time(8, 3) == 37   # 16 + 7 + 14 = 37
puts speed_and_time(4, 9) == 41   # 4 + 4 + 4 + 4 + 4 + 4 + 9 + 3 + 6 = 41
puts speed_and_time(7, 8) == 68   # 7 + 7 + 7 + 14 + 6 + 12 + 5 + 10 = 68
puts speed_and_time(8, 7) == 71   # 7 + 7 + 14 + 6 + 12 + 5 + 10 = 71
puts speed_and_time(774, 464) == 458_316
puts speed_and_time(900, 237) == 299_337
puts speed_and_time(847, 97) == 120_134
puts speed_and_time(846, 51) == 64_167
puts speed_and_time(633, 263) == 224_097
puts speed_and_time(284, 185) == 66_118
```

## Favorite Submitted Solutions

```rb
# what the heck!?!?!
def SpeedAndTime(s, t)
    n = [(t + 1) / 2, s - 2 * s / 3].min
    s * (t - 2 * n) + 3 * n * (2 * s - n + 1) / 2
end

def SpeedAndTime(s, t)
  n = [s / 3 + 1, (t + 1) / 2].min
  (t + n) * s - n * (n - 1) * 3 / 2
end

def SpeedAndTime(s, t)
  k = [(t + 1) / 2, s / 3 + 1].min
  s * t + s * k - 3 * k * (k - 1) / 2
end

def SpeedAndTime(s, t)
  (1..(t/2.to_f).ceil).map { |n| (t * s) - (3/2.to_f * n ** 2) + (3/2.to_f * n) + (s * n) }.max.to_i
end

def SpeedAndTime(s, t)
  [run(s,t), sprint(s,t)].max
end

  def run(s, t)
    s<=0 || t<=0 ? 0 : [s + run(s,t-1), t==1 ? s*2 : s*3-1 + sprint(s-1, t-2)].max
  end

  def sprint(s, t)
    s<=0 || t<=0 ? 0 : t==1 ? s*2 : s*3-1 + sprint(s-1, t-2)
  end

def SpeedAndTime(speed, time)
  max_sprints = [speed, time.fdiv(2).ceil].min

  max_sprints.downto(1).map { |sprint_count|
    recovery_count = sprint_count - 1
    time_at_max_speed = time - sprint_count - recovery_count
    distance = time_at_max_speed * speed

    sprint_distance = 2 * sprint_count.times.map { |i| speed - i }.sum
    recovery_distance = recovery_count.times.map { |i| speed - i - 1 }.sum

    distance + sprint_distance + recovery_distance
  }.max
end
```
