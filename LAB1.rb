#ZAD1 
puts "ZAD1"
myname = "Krzysiek"
puts myname.upcase
puts myname.downcase
puts myname.reverse
puts myname.length

#ZAD2
puts "ZAD2"
6.times {puts "Dam rade nauczyc sie Ruby'ego"}

#ZAD3
puts "ZAD3"
owoce=["Jabłko", "Banan", "Gruszka"]
owoce.each {|owoc| puts "Lubię jeść #{owoc}"}

#ZAD4
puts "ZAD4"
def powitanie (imie)
    puts "Witaj #{imie} jak idzie ci nauka Ruby'ego?"
end

powitanie("Krzysiek")

#ZAD5
puts "ZAD5"
liczba=5
if liczba>5
    puts "Liczba jest duża"
elsif liczba==5
    puts "Liczba jest równa 5"
else 
    puts "Liczba jest mała"
end
unless liczba==0
    puts "To nie jest zero"
end

#ZAD6
puts "ZAD6"

jestem_ptakiem=false
puts "Leć stąd" unless jestem_ptakiem

#ZAD7
puts "ZAD7"

puts "Podaj  imie"
imie = gets.chomp
puts "Podaj wiek"
wiek= gets.chomp.to_i
do_setki=100-wiek
puts "Cześć #{imie} do setki zostało ci #{do_setki} lat"

#ZAD8
puts "ZAD8"

puts "Witaj w kinie uzytkowniku!"
puts "Podaj imie!"
imiepierwsze=gets.chomp
puts "POdaj wiek!"
wiekpierwszy=gets.chomp.to_i
if wiekpierwszy>=18
    puts "Zapraszamy #{imiepierwsze} do kina!"
else
    puts "Przepraszamy #{imiepierwsze},Ten film jest dla dorosłych, nie możesz wejść!"
    brakujacywiek=18-wiekpierwszy
    puts "#{imiepierwsze} musisz poczekac jeszcze #{brakujacywiek} lata, żeby obejrzeć ten film!"
end

#ZAD9
puts "ZAD9"

produkty=[]
3.times do 
    puts "Co chcesz kupić?"
    produkty<<gets.chomp
end
puts "Twoja lista zakupow:"
produkty.sort!
produkty.each{|produkt| puts produkt}

#ZAD10
puts "ZAD10"
produkty=[]
wybor=[]
while wybor !="koniec"
    puts "Podaj produkt lub wpisz 'koniec' zeby zakonczyc"
    wybor=gets.chomp
    produkty<<wybor unless  wybor=="koniec"
end

puts "Oto twoja lista zakupow:"
produkty.sort.each{|produkt| puts produkt}

#ZAD11
puts "ZAD11"

saldo=1000
while true
    system "cls"

    puts "Witaj w bankomacie co chesz zrobic:?"
    puts "1.Sprawdz saldo"
    puts "2.Wplac pieniadze"
    puts "3.Wyplac pieniadze"
    puts "4.Wyjdz"

    wybor=gets.chomp

    case wybor
        when "1"
            puts "Twoje saldo wynosi #{saldo}"
            gets
        when "2"
            puts "Ile chesz wplacic?"
            wplata=gets.chomp.to_i
            saldo=saldo+wplata 
            puts "Saldo po wplacie #{saldo}"
            gets
        when "3"
            puts "Ile chcesz wyplacic?"
            wyplata=gets.chomp.to_i
            if wyplata > saldo
            puts "Nie masz wystarczajaco srodkow na koncie"
            else
                saldo=saldo-wyplata
                puts "Saldo po wyplacie #{saldo}"
            end
            gets
        when "4"
            puts "Dziekujemy za skorzystanie z bankomatu, do widzenia!"
            break
    end
end