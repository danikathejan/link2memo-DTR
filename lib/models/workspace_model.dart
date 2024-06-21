class WorkspaceModel {
  String name;
  String owner;
  String description;
  DateTime createdDate;

  WorkspaceModel({
    required this.name,
    required this.owner,
    required this.description,
    required DateTime createdDate,
  }) : createdDate = DateTime(createdDate.year, createdDate.month, createdDate.day); // Normalizing to date only

  static List<WorkspaceModel> getWorkspaces() {
    List<WorkspaceModel> workspaces = [];

    workspaces.add(
      WorkspaceModel(
        name: 'Numerical Kuppi', 
        owner: 'Nuwan Athukorala', 
        description: 'Numerical methods are a critical branch of mathematics and computer science that focus on devising algorithms for solving mathematical problems numerically.', 
        createdDate: DateTime(2024, 4, 10),
      )
    );

    workspaces.add(
      WorkspaceModel(
        name: 'MSD Kuppi', 
        owner: 'Gayanuka Amarasuriya', 
        description: 'Modular software development is a paradigm that emphasizes the design and construction of software systems in discrete, interchangeable components known as modules.', 
        createdDate: DateTime(2024, 5, 17),
      )
    );

    workspaces.add(
      WorkspaceModel(
        name: 'Power Systems Recorded Lecs', 
        owner: 'Mao Seeya', 
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eleifend egestas blandit. Sed fermentum ipsum eu tortor fermentum consequat. ', 
        createdDate: DateTime(2024, 4, 24),
      )
    );

    return workspaces;
  }
}