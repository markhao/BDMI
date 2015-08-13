BDMI.Views.Main = Backbone.CompositeView.extend({
  template: JST['main'],

  className: "main_container group",

  initialize: function() {
    this.addIntroView();
    this.addMovieInTheatersView();
    this.addRankView();
    this.addSearchView();
    this.introMovies = new BDMI.Collections.IntroMovies();
  },

  addIntroView: function() {
    var subview = new BDMI.Views.Intro();
    this.addSubview('.intro',subview);
  },

  addMovieInTheatersView: function() {
    var movies = new BDMI.Collections.Movies();
    movies.fetch();
    var subview = new BDMI.Views.InTheaters({ collection: movies });
    this.addSubview('#new', subview);
  },

  addRankView: function() {
    var subview = new BDMI.Views.Rank();
    this.addSubview('#rank',subview);
  },

  addSearchView: function() {
    var subview = new BDMI.Views.Search();
    this.addSubview('#search',subview);
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});
