require_relative ('../models/artist')
require_relative ('../models/album')
#require ('../models/artist')


artist1 = Artist.new ({'name'=>'Adam and the Ants'})
artist1.save()
artist2 = Artist.new ({'name'=>'Bonzo Dog Doo Dah Band'})
artist2.save()
artist3 = Artist.new ({'name'=>'Cocteau Twins'})
artist3.save()
artist4 = Artist.new ({'name'=>'De La Soul'})
artist4.save()


album1 = Album.new ({'title'=>'Dirk Wears White Sox', 'artist_id'=> artist2.id, 'format' => 'vinyl', 'thumb_url'=>'https://img.discogs.com/G1a4GuqwHiPbqqAD66n-C7vQTqY=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-5609601-1397913204-9190.jpeg.jpg'})
album1.save()
album2 = Album.new ({'title'=>'Gorilla', 'artist_id'=> artist2.id, 'format' => 'vinyl', 'thumb_url'=>'https://img.discogs.com/KmZtb3qx8yLtqYvPAQ9w21Af8G8=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-1691107-1237212119.jpeg.jpg'})
album2.save()
album3 = Album.new ({'title'=>'Heaven Or Las Vegas', 'artist_id'=> artist2.id, 'format' => 'vinyl', 'thumb_url'=>'https://img.discogs.com/kF7j5wvXt2iHw-CX7f2W-vvxilk=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-184990-1373209830-7619.jpeg.jpg'})
album3.save()
album4 = Album.new ({'title'=>'3 Feet High And Rising', 'artist_id'=> artist2.id, 'format' => 'vinyl', 'thumb_url'=>'https://img.discogs.com/uSFaDLRrkcVdniMyg9rdKk5jFDI=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-1005555-1248464166.jpeg.jpg'})
album4.save()
