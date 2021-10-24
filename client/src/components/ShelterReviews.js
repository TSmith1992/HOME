import React from "react";

export default function ShelterReviews({ currentUser, reviewsS }) {
  return (
    <div className="container1">
      {reviewsS
        .filter((review) => review.shelter.id === currentUser.shelters[0].id)
        .map((lReview) => (
          <div key={lReview.id} class="saloncard">
            <h1>ANONYMOUS:</h1>
            <strong>Review Score: </strong>
            {lReview.score}
            <br></br>
            <strong>Review: </strong>
            {lReview.review}
          </div>
        ))}
    </div>
  );
}
