BDMI.Views.InTheatersItem = Backbone.CompositeView.extend({
  template: JST['movie/in_theaters_item'],

  className: "in_theaters_item",

  events: {
    "click":"handleClick",
    "hover":"handleHover",
    "mouseenter .small_image": "handleEnter",
    "mouseleave .small_image": "handleLeave"
  },

  initialize: function() {
    this.poster = this.model.posters().sample();
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    debugger
    var content = this.template({ movie: this.model, poster: this.poster });
    this.$el.html(content);
    this.generateStars();
    return this;
  },

  handleClick: function(event) {
    $(event.currentTarget).addClass('animated flipOutX');
    $(event.currentTarget).one('webkitAnimationEnd', function() {
      this.movieShow();
      this.render();
    }.bind(this));
  },

  movieShow: function() {
    window.scrollTo(0, 0);
    Backbone.history.navigate("#/movies/"+this.model.id, { trigger: true });
  },

  handleEnter: function(event) {
    $(event.currentTarget).addClass('animated infinite pulse');
  },

  handleLeave: function(event) {
    $(event.currentTarget).removeClass('animated infinite pulse');
  },


  generateStars: function() {
        this.$('.small_movie_score').empty();
        var grade = Math.floor(this.model.attributes.vote_average / 2);
        var star = Math.max(0, (Math.min(5, grade)));
        var blank = 5 - star;
        while (star > 0) {
          var $star = $("<span></span>");
          $star.text("★");
          this.$('.small_movie_score').append($star);
          star--;
        }
        while (blank > 0) {
          var $blank = $("<span></span>");
          $blank.text("☆");
          this.$('.small_movie_score').append($blank);
          blank--;
        }
      }
});
