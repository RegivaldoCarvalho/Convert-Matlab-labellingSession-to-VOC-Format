% Load ground truth from labelling session
% It is assumed the file is called gTruth
load('C:\Users\Andy\OneDrive\Desktop\Coding\Matlab\Labelling\cat.mat')

len = size(gTruth.DataSource.Source, 1)
label_names = gTruth.LabelData.Properties.VariableNames;

for i = 1:len
    path = char(gTruth.DataSource.Source(i));
    % Get file name from path
    splitStr = split(path,"\");
    file_name = char(splitStr(end));
    VOC.annotation.folder.Text = 'FOLDER';
    VOC.annotation.filename.Text = file_name;
    VOC.annotation.path.Text = path;
    VOC.annotation.source.database.Text = 'Unknown';
    % Size
    [height, width, depth] = size(imread(path));
    VOC.annotation.size.width.Text = num2str(width);
    VOC.annotation.size.height.Text = num2str(height);
    VOC.annotation.size.depth.Text = num2str(depth);
    % Currently only supports 1 label
    %n_labels = width(gTruth.LabelData)
    
    bboxes = (gTruth.LabelData.(1)(i)); %(i)(row)
    bboxes = cell2mat(bboxes);
    bbox_size = size(bboxes);
    n_bbox = bbox_size(1);
    
    % Matlab BBox (x1, y1, w, h)
    for j = 1:bbox_size(1) % bbox_size(1) = num of bboxes
        VOC.annotation.object{1, j}.name.Text = char(label_names(1));
        VOC.annotation.object{1, j}.pose.Text = 'Unspecified';
        VOC.annotation.object{1, j}.truncated.Text = '0';
        VOC.annotation.object{1, j}.difficult.Text = '0';
        VOC.annotation.object{1, j}.bndbox.xmin.Text = bboxes(j, 1);
        VOC.annotation.object{1, j}.bndbox.ymin.Text = bboxes(j, 2);
        VOC.annotation.object{1, j}.bndbox.xmax.Text = bboxes(j, 1)+bboxes(j, 3);
        VOC.annotation.object{1, j}.bndbox.ymax.Text = bboxes(j, 2)+bboxes(j, 4);
    end
    
    split_name = split(file_name, '.jpg');
    file_path = char(join(splitStr(1:size(splitStr)-1),'\'));
    xml_name = sprintf('%s\\%s.xml', file_path, char(split_name(1)));
    struct2xml(VOC,xml_name);
    disp(i)
    clear VOC
end