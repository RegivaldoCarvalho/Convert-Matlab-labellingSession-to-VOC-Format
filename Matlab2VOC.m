% Convert Matlab Lalbeling Session to a VOC Label

% Load labelingSesssion
load('D:\Python\Power_Grid_Inspection\labelingSessions\Isolador_Pilar_02_09_2018.mat')
% Defina a fote dos dados
Fonte = 'Power_Line_Vale'; 

len = size(labelingSession.ImageSet.ImageStruct,2);


for i=1:len
    
    path = labelingSession.ImageSet.ImageStruct(i).imageFilename; % resgata o endereço completo da foto
    VOC.annotation.path.Text = path;
    % Separa o texto
    expression = '\\';
    splitStr = regexp(path,expression,'split');    
    % Nome da foto
    foto = string(splitStr(size(splitStr,2)));
    VOC.annotation.filename.Text = char(foto); 
    % Localiza o diretório
    folder = string(splitStr(size(splitStr,2)-1));
    VOC.annotation.folder.Text = char(folder);  % Nome do diretório da foto
    VOC.annotation.source.database.Text = Fonte; % Define a Fonte dos dados
    % Características da Imagem
    [height, width, depth] = size(imread(path));
    VOC.annotation.size.width.Text = num2str(width);
    VOC.annotation.size.height.Text = num2str(height);
    VOC.annotation.size.depth.Text = num2str(depth);
    % Segmentação
    VOC.annotation.segmented.Text = '0'
    
    
    number_bboxes = size(labelingSession.ImageSet.ImageStruct(i).objectBoundingBoxes,1);
    
    for j=1:number_bboxes    
              
        % Objetos - Boundboxes
        VOC.annotation.object{1, j}.name.Text = labelingSession.CategorySet.CategoryStruct.categoryName; % Nome da Tag
        VOC.annotation.object{1, j}.pose.Text = 'Unspecified'; 
        VOC.annotation.object{1, j}.truncated.Text = '0';
        VOC.annotation.object{1, j}.difficult.Text = '0';
        % Posição da BoundBox  [x,y,width, height]
        xmin = labelingSession.ImageSet.ImageStruct(i).objectBoundingBoxes(j); 
        ymin = labelingSession.ImageSet.ImageStruct(i).objectBoundingBoxes(j+ number_bboxes);
        xmax = xmin + labelingSession.ImageSet.ImageStruct(i).objectBoundingBoxes(j+(2*number_bboxes));
        ymax = ymin + labelingSession.ImageSet.ImageStruct(i).objectBoundingBoxes(j+(3*number_bboxes));
        VOC.annotation.object{1, j}.bndbox.xmin.Text = xmin;
        VOC.annotation.object{1, j}.bndbox.ymin.Text = ymin;
        VOC.annotation.object{1, j}.bndbox.xmax.Text = xmax;
        VOC.annotation.object{1, j}.bndbox.ymax.Text = ymax;
                
    end
    
    expression = '\.';
    foto1 = regexp(foto,expression,'split');
    nome = sprintf('%s.xml',foto1(1));
    struct2xml(VOC,nome);
    clear VOC;
    
    
end

