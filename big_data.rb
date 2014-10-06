puts "Hello"
puts "Today we will be looking at GE's historial stock prices"
puts "This program will calculate the mean, standard deviation, z-score, and median of the stock"

f = File.open("ge_stock.csv","a+")
info = f.readlines

i = 0
while i < info.length
	info[i] = info[i].split(",")
	i+=1
end

i = 0
sum = 0
while i < info.length
	sum = info[i][1].to_f + sum
	i+=1
end
mean = sum/(info.length)

i = 0
sum1 = 0
while i < info.length
	sum1 = (info[i][1].to_f - mean)**2 + sum1
	i+=1
end
d = sum1/(info.length - 1)
dev = Math.sqrt(d)

mid = (info.length/2)
median = info[mid][1]

puts "\n"
puts "The mean of GE's historial stock is " + mean.round(2).to_s
puts "The standard deviation of GE's historial stock is " + dev.round(2).to_s 
puts "The median of GE's historial stock is " + median.to_s
puts "If you would like to look at the z-scores open the z-score.txt file"

file = File.open("z-score.txt","w")

i = 0
while i < info.length
	z = (info[i][1].to_f - mean)/dev
	file << z
	file << "\n"
	i+=1
end
