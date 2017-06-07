zipfile node[:extract][:from] do
  into node[:extract][:into]
end

# Verify overwrite by extracting to the same place twice.

zipfile node[:overwrite][:from] do
  into node[:overwrite][:into]
  overwrite true
end

zipfile node[:overwrite][:from] do
  into node[:overwrite][:into]
  overwrite true
end

zipfile node[:nonexistent_into][:from] do
  into node[:nonexistent_into][:into]
end
