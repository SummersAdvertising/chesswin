class Admin::CasestudiesController < AdminController
  # GET /casestudies
  # GET /casestudies.json
  def index
    @casestudies = Casestudy.order( "created_at DESC" ).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casestudies }
    end
  end

  # GET /casestudies/1
  # GET /casestudies/1.json
  def show
    @casestudy = Casestudy.find(params[:id])
    @photos = @casestudy.photos.order( :created_at )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @casestudy }
    end
  end

  # GET /casestudies/new
  # GET /casestudies/new.json
  def new
    @casestudy = Casestudy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @casestudy }
    end
  end

  # GET /casestudies/1/edit
  def edit
    @casestudy = Casestudy.find(params[:id])
    @photos = @casestudy.photos.order( :created_at => "desc" )
  end

  # POST /casestudies
  # POST /casestudies.json
  def create
  
    @casestudy = Casestudy.new(params[:casestudy])

    respond_to do |format|
      if @casestudy.save
        format.html { redirect_to admin_casestudy_path(@casestudy), notice: 'Casestudy was successfully created.' }
        format.json { render json: @casestudy, status: :created, location: @casestudy }
      else
        format.html { render action: "new" }
        format.json { render json: @casestudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /casestudies/1
  # PUT /casestudies/1.json
  def update
    @casestudy = Casestudy.find(params[:id])

    respond_to do |format|
      if @casestudy.update_attributes(params[:casestudy])
        format.html { redirect_to admin_casestudy_path(@casestudy), notice: 'Casestudy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @casestudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casestudies/1
  # DELETE /casestudies/1.json
  def destroy
    @casestudy = Casestudy.find(params[:id])
    @casestudy.destroy

    respond_to do |format|
      format.html { redirect_to admin_casestudies_url }
      format.json { head :no_content }
    end
  end
end
