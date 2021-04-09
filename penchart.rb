require 'gruff' # gem install gruff
require 'json'

# --- CONFIG BEGIN ---
# --------------------
require_relative 'config'
# ------------------
# --- CONFIG END ---

label_file = File.read("src/label.#{LANG}.json")
LABELS = JSON.parse(label_file)
vuln_file = File.read('src/data.json')
VULNS = JSON.parse(vuln_file)

# CVSS Score
def draw_CVSSscore
  g = Gruff::Bar.new
  g.font = FONT
  g.minimum_value = 0
  g.maximum_value = 10
  g.title = LABELS['CVSSscore']
  g.data(nil, VULNS['vulnerabilities'].map { |x| x['CVSSscore'].to_f }, PRIMARY_COLOR)
  g.theme = THEME2
  g.show_labels_for_bar_values = true
  g.write('out/CVSSscore.png')
end

# Vulns by risk level
def draw_risk
  g = Gruff::Bar.new
  g.font = FONT
  g.minimum_value = 0
  g.title = LABELS['risk']['label']
  (1..4).each do |i|
    g.data(LABELS['risk'][i.to_s], VULNS['vulnerabilities'].select { |x| x['risk'] == i.to_s }.size)
  end
  g.theme = THEME
  g.y_axis_label = LABELS['vulnerabilities']
  g.write('out/risk.png')
end

# Vulns by impact level
def draw_impact
  g = Gruff::Bar.new
  g.font = FONT
  g.minimum_value = 0
  g.title = LABELS['impact']['label']
  (1..4).each do |i|
    g.data(LABELS['impact'][i.to_s], VULNS['vulnerabilities'].select { |x| x['impact'] == i.to_s }.size)
  end
  g.theme = THEME
  g.y_axis_label = LABELS['vulnerabilities']
  g.write('out/impact.png')
end

# Vulns by exploitation level
def draw_exploitation
  g = Gruff::Bar.new
  g.font = FONT
  g.minimum_value = 0
  g.title = LABELS['exploitation']['label']
  (1..4).each do |i|
    g.data(LABELS['exploitation'][i.to_s], VULNS['vulnerabilities'].select { |x| x['exploitation'] == i.to_s }.size)
  end
  g.theme = THEME
  g.y_axis_label = LABELS['vulnerabilities']
  g.write('out/exploitation.png')
end

# Vulns by remediation priority
def draw_remediationPriority
  g = Gruff::Bar.new
  g.font = FONT
  g.minimum_value = 0
  g.title = LABELS['remediationPriority']['label']
  (1..4).each do |i|
    g.data(LABELS['remediationPriority'][i.to_s], VULNS['vulnerabilities'].select { |x| x['remediationPriority'] == i.to_s }.size)
  end
  g.theme = THEME
  g.y_axis_label = LABELS['vulnerabilities']
  g.write('out/remediationPriority.png')
end

# Vulns by remediation complexity
def draw_remediationComplexity
  g = Gruff::Bar.new
  g.font = FONT
  g.minimum_value = 0
  g.title = LABELS['remediationComplexity']['label']
  (1..4).each do |i|
    g.data(LABELS['remediationComplexity'][i.to_s], VULNS['vulnerabilities'].select { |x| x['remediationComplexity'] == i.to_s }.size)
  end
  g.theme = THEME
  g.y_axis_label = LABELS['vulnerabilities']
  g.write('out/remediationComplexity.png')
end

# Vulns by remediation status
def draw_remediationStatus
  g = Gruff::Bar.new
  g.font = FONT
  g.minimum_value = 0
  g.title = LABELS['remediationStatus']['label']
  (0..3).each do |i|
    g.data(LABELS['remediationStatus'][i.to_s], VULNS['vulnerabilities'].select { |x| x['remediationStatus'] == i.to_s }.size)
  end
  g.theme = {
    colors: %w[grey green orange red],
    marker_color: 'black',
    background_colors: %w[white white]
  }
  g.y_axis_label = LABELS['vulnerabilities']
  g.write('out/remediationStatus.png')
end

if __FILE__ == $PROGRAM_NAME
  draw_CVSSscore
  draw_risk
  draw_impact
  draw_exploitation
  draw_remediationPriority
  draw_remediationComplexity
  draw_remediationStatus
end
