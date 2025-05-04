const apiGatewayUrl = "{{apigateway_url}}";
const apiGatewayRoute = "{{apigateway_route}}";

async function loadVisitorCount() {
  try {
    const response = await fetch(apiGatewayUrl + apiGatewayRoute);
    const data = await response.json();
    const responseContainer = document.getElementById('responseContainer');
    responseContainer.textContent = JSON.stringify(data, null, 2);
  } catch (error) {
    console.error('Error:', error);
  }
}

loadVisitorCount();
