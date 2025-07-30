const UserWayWidget = () => {
    return (
      <iframe
        className="uwif userway_p1"
        data-uw-ignore-translate="true"
        name="userway"
        title="UserWay Accessibility Menu"
        allow="clipboard-write"
        style={{
          maxWidth: '100vw',
          visibility: 'visible',
          opacity: 1,
          colorScheme: 'light',
          position: 'fixed',
          bottom: 0,
          left: 0,
          zIndex: 9999,
          width: '500px',
          height: '100%', // adjust as needed
          border: 'none'
        }}
        src="https://cdn.userway.org/widget/2025-07-28-13-18-07/en-US/index.html?rand=1753916442916&amp;services=%7B%22userId%22%3A0%2C%22paidAi%22%3Afalse%7D&amp;tunings=%7B%22widget_position_nudge%22%3Anull%2C%22widget_position_nudge_mobile%22%3Anull%7D&amp;language=%22en-US%22&amp;account=%22Design%20Sketchers%22&amp;widgetPageLang=%22en-US%22"
      />
    );
  };
  
  export default UserWayWidget;
  