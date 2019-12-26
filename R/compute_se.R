#' Compute the spherical equivalent
#'
#' This function allows you to compute the spherical equivalent of
#' a refraction.
#' @param sph The sphere
#' @param cyl The cylinder
#' @param digits The number of decimals needed
#' @keywords compute, spherical
#' @export
#' @examples
#' compute_se(-1, -0.5)

compute_se <- function(sph = 0,
                       cyl = 0,
                       digits = 3) {

  round(sph + cyl / 2, digits)

}
