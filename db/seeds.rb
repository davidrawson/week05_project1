require_relative ('../models/artist')
require_relative ('../models/album')
require_relative ('../models/stock')
require ('pry-byebug')

Artist.delete_all()
Stock.delete_all()
Album.delete_all()


artist1 = Artist.new ({'name'=>'Adam and the Ants'})
artist1.save()
artist2 = Artist.new ({'name'=>'Bonzo Dog Doo Dah Band'})
artist2.save()
artist3 = Artist.new ({'name'=>'Cocteau Twins'})
artist3.save()
artist4 = Artist.new ({'name'=>'De La Soul'})
artist4.save()
artist5 = Artist.new ({'name'=>'The Pixies'})
artist5.save()
artist6 = Artist.new ({'name'=>'Beyonce'})
artist6.save()


album1 = Album.new ({'title'=>'Dirk Wears White Sox', 'artist_id'=> artist2.id, 'format' => 'vinyl', 'thumb_url'=>'https://img.discogs.com/G1a4GuqwHiPbqqAD66n-C7vQTqY=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-5609601-1397913204-9190.jpeg.jpg'})
album1.save()
album2 = Album.new ({'title'=>'Gorilla', 'artist_id'=> artist2.id, 'format' => 'vinyl', 'thumb_url'=>'https://img.discogs.com/KmZtb3qx8yLtqYvPAQ9w21Af8G8=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-1691107-1237212119.jpeg.jpg'})
album2.save()
album3 = Album.new ({'title'=>'Heaven Or Las Vegas', 'artist_id'=> artist2.id, 'format' => 'cd', 'thumb_url'=>'https://img.discogs.com/kF7j5wvXt2iHw-CX7f2W-vvxilk=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-184990-1373209830-7619.jpeg.jpg'})
album3.save()
album4 = Album.new ({'title'=>'3 Feet High And Rising', 'artist_id'=> artist2.id, 'format' => 'cd', 'thumb_url'=>'https://img.discogs.com/uSFaDLRrkcVdniMyg9rdKk5jFDI=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-1005555-1248464166.jpeg.jpg'})
album4.save()
album5 = Album.new ({'title'=>'Garlands', 'artist_id'=> artist3.id, 'format' => 'vinyl', 'thumb_url'=>'https://img.discogs.com/f-5ernIGgPL11ErE_JPUHakgK0M=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-62111-1347313125-7470.jpeg.jpg'})
album5.save()
album6 = Album.new ({'title'=>'Surfer Rosa', 'artist_id'=> artist5.id, 'format' => 'cd', 'thumb_url'=>'https://img.discogs.com/sDLhOqh2lDpCuAtgiaSJ8OzJJ7w=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-371355-1252316823.jpeg.jpg'})
album6.save()
album7 = Album.new ({'title'=>'Doolittle', 'artist_id'=> artist5.id, 'format' => 'cd', 'thumb_url'=>'https://img.discogs.com/p_Nri97fl0m9Y9w6LYXQrg9VI8Y=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-2805906-1396136015-2237.jpeg.jpg'})
album7.save()
album8 = Album.new ({'title'=>'Trompe Le Monde', 'artist_id'=> artist5.id, 'format' => 'cd', 'thumb_url'=>'https://img.discogs.com/C-Tp0lcyfGgvG0lThhx7RN_M4Ew=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-369383-1104606687.jpg.jpg'})
album8.save()
album9 = Album.new ({'title'=>'Lemonade', 'artist_id'=> artist6.id, 'format' => 'cd', 'thumb_url'=>'https://img.discogs.com/dBvveDFI37bhHwaiNAObIdIFRA0=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-8486714-1477575010-6969.jpeg.jpg'})
album9.save()

stock1 = Stock.new({
  'album_id' => album1.id,
  'quantity' => '2',
  'buy_price' => '4.50',
  'sell_price' => '12.00',
  'reorder_level' => '1' })
stock1.save()

stock2 = Stock.new({
  'album_id' => album2.id,
  'quantity' => '12',
  'buy_price' => '2.50',
  'sell_price' => '8.00',
  'reorder_level' => '1' })
stock2.save()

stock3 = Stock.new({
  'album_id' => album3.id,
  'quantity' => '5',
  'buy_price' => '6.50',
  'sell_price' => '12.00',
  'reorder_level' => '4' })
stock3.save()

stock4 = Stock.new({
  'album_id' => album4.id,
  'quantity' => '5',
  'buy_price' => '4.50',
  'sell_price' => '14.00',
  'reorder_level' => '3' })
stock4.save()

stock5 = Stock.new({
  'album_id' => album5.id,
  'quantity' => '2',
  'buy_price' => '7.50',
  'sell_price' => '14.00',
  'reorder_level' => '1' })
stock5.save()

stock6 = Stock.new({
  'album_id' => album6.id,
  'quantity' => '5',
  'buy_price' => '4.50',
  'sell_price' => '8.00',
  'reorder_level' => '3' })
stock6.save()

stock7 = Stock.new({
  'album_id' => album7.id,
  'quantity' => '5',
  'buy_price' => '4.50',
  'sell_price' => '10.00',
  'reorder_level' => '6' })
stock7.save()

stock8 = Stock.new({
  'album_id' => album8.id,
  'quantity' => '5',
  'buy_price' => '4.50',
  'sell_price' => '10.00',
  'reorder_level' => '5' })
stock8.save()

stock9 = Stock.new({
  'album_id' => album9.id,
  'quantity' => '12',
  'buy_price' => '4.50',
  'sell_price' => '12.00',
  'reorder_level' => '8' })
stock9.save()

binding.pry
nil
