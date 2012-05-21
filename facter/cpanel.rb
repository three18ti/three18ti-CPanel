Facter.add(:role) do
  has_weight 100
  setcode do
    if File.exist? "/etc/init.d/cpanel"
      "cpanel_server"
    end
  end
end
