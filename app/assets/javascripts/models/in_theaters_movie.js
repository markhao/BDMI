BDMI.Models.InTheatersMovie = Backbone.Model.extend({
  urlRoot: "/api/in_theaters_movies",

  parse: function(payload) {
    if(payload.images) {
      this.images().set(payload.images);
      delete payload.images;
    }
    if(payload.reviews) {
      this.reviews().set(payload.reviews);
      delete payload.reviews;
    }
    if(payload.posters) {
      this.posters().set(payload.posters);
      delete payload.posters;
    }

    return payload;
  },

  images: function() {
    if(this._images === undefined) {
      this._images = new BDMI.Collections.MovieImages();
    }
    return this._images;
  },

  reviews: function() {
    if(this._reviews === undefined) {
      this._reviews = new BDMI.Collections.Reviews();
    }
    return this._reviews;
  },

  posters: function() {
    if(this._posters === undefined) {
      this._posters = new BDMI.Collections.MoviePosters();
    }
    return this._posters;
  }
});
