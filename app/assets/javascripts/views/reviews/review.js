BDMI.Views.Review = Backbone.View.extend({
  template: JST['reviews/review'],

  className: "review-section-item",

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  getTimeAgo: function(){
    return $.timeago(this.model.get('created_at'));
  },

  render: function() {
    var content = this.template({
      review: this.model,
      timeAgo: this.getTimeAgo()
    });
    this.$el.html(content);
    this.generateStars();
    return this;
  },

  generateStars: function() {
        this.$('.small-review-grade').empty();
        var grade = this.model.attributes.vote_average / 2;
        // var grade = 5;
        var star = Math.max(0, (Math.min(5, grade)));
        var blank = 5 - star;
        while (star > 0) {
          var $star = $("<span></span>");
          $star.text("★");
          this.$('.small-review-grade').append($star);
          star--;
        }
        while (blank > 0) {
          var $blank = $("<span></span>");
          $blank.text("☆");
          this.$('.small-review-grade').append($blank);
          blank--;
        }
      }
});
