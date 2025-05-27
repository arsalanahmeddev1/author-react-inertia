import React from 'react'

const Button = ({children, className=''}) => {
  return (
    <button className={`btn py-11 px-32 radius-60 ${className}`}>
      {children}
    </button>
  )
}

export default Button
