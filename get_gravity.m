function g = get_gravity(planet, custom_g)

switch lower(planet)
    case 'earth'
        g = 9.81;
    case 'moon'
        g = 1.62;
    case 'mars'
        g = 3.71;
    case 'jupiter'
        g = 24.79;
    case 'custom'
        g = custom_g;
    otherwise
        error('Invalid planet choice')
end

end