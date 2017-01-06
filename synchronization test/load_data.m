function [data, t] = load_data(filename)

data = importdata(filename);
data = data.data;
t = data(:,1);

end