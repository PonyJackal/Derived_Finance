import React from "react";
import PropTypes from "prop-types";

class AccordionSection extends React.Component {
  static propTypes = {
    children: PropTypes.instanceOf(Object).isRequired,
    isOpen: PropTypes.bool.isRequired,
    label: PropTypes.string.isRequired,
    onClick: PropTypes.func.isRequired,
  };

  onClick = () => {
    this.props.onClick(this.props.label);
  };

  render() {
    const {
      onClick,
      props: { isOpen, label },
    } = this;

    return (
      <div
        style={{
          background: "#273A46",
          border: "1px solid #86C440",
          padding: "5px 10px",
          width: "100%",
          color: "white",
          marginBottom: "10px",
          borderRadius: "10px",
        }}
      >
        <div
          onClick={onClick}
          style={{
            cursor: "pointer",
            height: "60px",
            display: "flex",
            alignItems: "center",
            justifyContent: "space-between",
          }}
        >
          {label}
          <div style={{ float: "right" }}>
            {!isOpen && (
              <span className="text-white text-base flex items-center">
                Details{" "}
                <svg
                  aria-hidden="true"
                  focusable="false"
                  data-prefix="fas"
                  data-icon="caret-down"
                  className="svg-inline--fa fa-caret-down fa-w-10 h-5 w-5 ml-1"
                  role="img"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 320 512"
                >
                  <path
                    fill="currentColor"
                    d="M31.3 192h257.3c17.8 0 26.7 21.5 14.1 34.1L174.1 354.8c-7.8 7.8-20.5 7.8-28.3 0L17.2 226.1C4.6 213.5 13.5 192 31.3 192z"
                  ></path>
                </svg>
              </span>
            )}
            {isOpen && (
              <span className="text-white text-base flex items-center">
                Close{" "}
                <svg
                  aria-hidden="true"
                  focusable="false"
                  data-prefix="fas"
                  data-icon="caret-up"
                  className="svg-inline--fa fa-caret-up fa-w-10 h-5 w-5 ml-1"
                  role="img"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 320 512"
                >
                  <path
                    fill="currentColor"
                    d="M288.662 352H31.338c-17.818 0-26.741-21.543-14.142-34.142l128.662-128.662c7.81-7.81 20.474-7.81 28.284 0l128.662 128.662c12.6 12.599 3.676 34.142-14.142 34.142z"
                  ></path>
                </svg>
              </span>
            )}
          </div>
        </div>
        {isOpen && (
          <div
            style={{
              background: "#273A46",
              border: "1px solid #86C440",
              marginTop: 10,
              padding: "10px 20px",
              width: "100%",
              color: "white",
              height: "110px",
              borderRadius: "10px",
              display: "grid",
              placeItems: "center",
            }}
          >
            {this.props.children}
          </div>
        )}
      </div>
    );
  }
}

export default AccordionSection;
