function [albedo_image, surface_normals] = photometric_stereo(imarray, light_dirs)
% imarray: h x w x Nimages array of Nimages no. of images
% light_dirs: Nimages x 3 array of light source directions
% albedo_image: h x w image
% surface_normals: h x w x 3 array of unit surface normals

[height, width, num] = size(imarray)

imarray_rearrange = reshape(imarray, height * width, num)
imarray_rearrange = transpose(imarray_rearrange)
g = light_dirs \ imarray_rearrange

%% 1.albedo
albedo_image_1D = vecnorm(g)
albedo_image = reshape(albedo_image_1D, height, width)


surface_normals_x_1D = g(1,:) ./ albedo_image_1D
surface_normals_x = reshape(surface_normals_x_1D, height, width)

surface_normals_y_1D = g(2,:) ./ albedo_image_1D
surface_normals_y = reshape(surface_normals_y_1D, height, width)

surface_normals_z_1D = g(3,:) ./ albedo_image_1D
surface_normals_z = reshape(surface_normals_z_1D, height, width)

surface_normals = cat(3, surface_normals_x, surface_normals_y, surface_normals_z)

%% <<< fill in your code below >>>

end

