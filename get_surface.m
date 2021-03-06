function  height_map = get_surface(surface_normals, image_size, method)
% surface_normals: 3 x num_pixels array of unit surface normals
% image_size: [h, w] of output height map/image
% height_map: height map of object

    
%% <<< fill in your code below >>>
    [height, width] = image_size
    
    fx = surface_normals(:,:,1)./surface_normals(:,:,3)
    fy = surface_normals(:,:,2)./surface_normals(:,:,3)
    cumsumx = cumsum(fx, 2)
    cumsumy = cumsum(fy, 1)
    
    switch method
        case 'column'
            height_map = cumsumy(:,1) + cumsumx
        case 'row'
            height_map = cumsumy + cumsumx(1,:)
        case 'average'
            height_map = ((cumsumy(:,1) + cumsumx) + (cumsumy + cumsumx(1,:)))./2
        case 'random'
            for i = 1: width
                for j = 1 : height
                    for breakx = 1:i
                        for breaky1 = 1:j
                            for breaky2 = breaky1: j
                                sumx1 = cumsum(cumsumx(breaky1, 1:breakx))
                                sumx2 = cumsum(cumsumx(breaky2, breakx:i))
                                sumy1 = cumsum(cumsumy(1: breaky1, 1))
                                sumy2 = cumsum(cumsumy(breaky1: breaky2, breakx))
                                sumy3 = cumsum(cumsumy(breaky2: j, i))
                                height_map(i,j) = sumx1(end)+sumx2(end)+sumy1(end)+sumy2(end)+sumy3(end)
                            end
                        end
                    end
                end
            end
            
                            
                        
                    
    end

end

