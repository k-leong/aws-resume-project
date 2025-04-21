const apiRoute = config.apigateway_route;
const apiUrl = config.apigateway_url + apiRoute;

// async function updateAndReturnResponseContainer(apiUrl) {
//   try {
//     const response = await fetch(apiUrl);
//     const response_1 = await response.json();
//     const responseContainer = document.getElementById('responseContainer');
//     responseContainer.textContent = JSON.stringify(response_1, null, 2);
//     return responseContainer;
//   } catch (error) {
//     console.error(error);
//     return null;
//   }
// }
console.log(apiUrl)
document.addEventListener('DOMContentLoaded', () => {
  // fetch('./config.json')
  // .then(response => response.json())
  // .then(config => {
  //   console.log(config)
  //   let apiRoute = config.apigateway_route;
  //   console.log(apiRoute)
  //   const apiUrl = config.apigateway_url + apiRoute;
  //   console.log(apiUrl)
    fetch(apiUrl)
    .then(response => response.json())
    .then(response => {
      const responseContainer = document.getElementById('responseContainer')
      responseContainer.textContent = JSON.stringify(response, null, 2)
    })
    .catch(error => console.error('Error:', error));
  })
