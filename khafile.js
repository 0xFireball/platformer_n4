
// project
let project = new Project('platformer_n4');

project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('n4');

resolve(project);