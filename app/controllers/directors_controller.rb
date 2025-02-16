class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id})

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def youngest
    ordered = Director.where.not({ :dob => nil }).order({ :dob => :asc })
    @youngest_director = ordered.last

    @youngest = @youngest_director.name
    youngestdob = @youngest_director.dob

    @month = youngestdob.strftime("%B")
    @day = youngestdob.strftime("%e")
    @year = youngestdob.strftime("%Y")

    render({ :template => "director_templates/youngest"})

  end 

  def eldest
    ordered = Director.where.not({ :dob => nil }).order({ :dob => :asc })
    @eldest_director = ordered.first

    @eldest = @eldest_director.name
    eldestdob = @eldest_director.dob

    @month = eldestdob.strftime("%B")
    @day = eldestdob.strftime("%e")
    @year = eldestdob.strftime("%Y")



    render({ :template => "director_templates/eldest"})

  end



end
