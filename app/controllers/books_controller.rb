class BooksController < ApplicationController
  # GET /books
  # GET /books.xml
  def index
    @title = "All Books"
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])
    @forum = Forum.where({:book_id => @book.id}).first
    #@forum = Forum.first
    @title = @book.title

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @title = "New Book"
    @book  = Book.new
    #@forum = Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    @title = @book.title
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])
    book_saved = @book.save
    if book_saved
      #forum_hash = {"title" => params[:book][:title], "book_id" => Book.last.id}
      forum_hash = {"title" => params[:book][:title]}
      @forum = Forum.new(forum_hash)
      @forum.book_id = Book.last.id
      forum_saved = @forum.save
    end

    respond_to do |format|
      if book_saved and forum_saved
        format.html { redirect_to(@book, :notice => 'Book was successfully created.') }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(@book, :notice => 'Book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end
end
