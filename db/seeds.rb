#---
# Excerpted from "Agile Web Development with Rails 5.1",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails51 for more book information.
#---
# encoding: utf-8
puts 'CLEANING PRODUCTS'
Product.delete_all
puts 'SEEDING PRODUCTS'
Product.create!(title: "Men's Burton Name Dropper Camber Snowboard",
  description:
    %{<p>
      Let your riding speak for itself with the <em>Name Dropper's</em> next-generation,
      park-tuned performance. Off-Axis means all of its key ingredients, from
      the edges to the poppy core profile, match the angles of your stance for
      enhanced grip, smoother takeoffs, and stomped landings. PurePop Camber
      amplifies ollies and loosens up the overall feel for a more playful take
      on traditional camber, while the addition of effortlessly flexing Off-Axis
      Squeezebox Low enhances the overall soft freestyle feel.
      </p>},
  image_url: 'mn_name_drop.png',
  price: 495.00)
# . . .
Product.create!(title: "Men's Burton Descendant Camber Snowboard",
  description:
    %{<p>
      Dominate the park while getting maximum bang for your buck with the
      feature-packed <em>Burton Descendant</em>. True twin shaping gives it a freestyle
      punch, allowing you to ride in either direction with equal control. Soft
      and playful, it also steps up stability and edge control with the catch-free,
      park-tuned feel of PurePop Camber. Squeezebox Low provides a softer flex
      that maintains snappiness and ollie power. The Channel® gives you ultimate
      control of your stance and the fastest setup possible in a system
      compatible with bindings from all major brands.
      </p>},
  image_url: 'mn_rewind.png',
  price: 446.55)
# . . .

Product.create!(title: "Women's Burton Rewind Camber Snowboard",
  description:
    %{<p>
      With an extra poppy flex, the souped-up <em>Burton Rewind</em> is for riders who
      charge hard, and like to flaunt a freestyle attitude backed by steady park
      progression. The flat, ultra-thin, and skate-like profile improves the ride,
      thanks to Filet-O-Flex design, yet rips harder than any soft board out there.
      Ramped-up grip and a fast yet low-maintenance sintered base offer control
      and durability in variable conditions, while the Off-Axis construction
      perfectly aligns the board's design to your body's stance and positioning for
      board feel that fits like a glove.
      </p>},
  image_url: 'wm_rewind.png',
  price: 469.95)
  
puts 'SEEDING PRODUCTS FINISHED'
