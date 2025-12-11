function showLogoutLink() {
  const contextPath = window.location.pathname.split("/")[1];
  window.location.href = `${window.location.origin}/${contextPath}/server/repost_loing.jsp?logout=true`;
}
