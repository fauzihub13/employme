import 'dart:convert';

class JobResponseModel {
  final List<Job>? data;
  final Pagination? pagination;
  final Links? links;
  final Meta? meta;

  JobResponseModel({
    this.data,
    this.pagination,
    this.links,
    this.meta,
  });

  factory JobResponseModel.fromJson(String str) =>
      JobResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JobResponseModel.fromMap(Map<String, dynamic> json) =>
      JobResponseModel(
        data: json["data"] == null
            ? []
            : List<Job>.from(json["data"]!.map((x) => Job.fromMap(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromMap(json["pagination"]),
        links: json["links"] == null ? null : Links.fromMap(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "pagination": pagination?.toMap(),
        "links": links?.toMap(),
        "meta": meta?.toMap(),
      };
}

class Job {
  final int? id;
  final String? title;
  final Company? company;
  final Salary? salary;
  final String? category;
  final String? location;
  final String? workArrangement;
  final String? jobType;
  final String? description;
  final String? requirements;
  final String? responsibilities;
  final String? benefits;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic expiresAt;
  final String? postedAtHuman;
  final dynamic expiresInDays;

  Job({
    this.id,
    this.title,
    this.company,
    this.salary,
    this.category,
    this.location,
    this.workArrangement,
    this.jobType,
    this.description,
    this.requirements,
    this.responsibilities,
    this.benefits,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
    this.postedAtHuman,
    this.expiresInDays,
  });

  factory Job.fromJson(String str) => Job.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Job.fromMap(Map<String, dynamic> json) => Job(
        id: json["id"],
        title: json["title"],
        company:
            json["company"] == null ? null : Company.fromMap(json["company"]),
        salary: json["salary"] == null ? null : Salary.fromMap(json["salary"]),
        category: json["category"],
        location: json["location"],
        workArrangement: json["work_arrangement"],
        jobType: json["job_type"],
        description: json["description"],
        requirements: json["requirements"],
        responsibilities: json["responsibilities"],
        benefits: json["benefits"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        expiresAt: json["expires_at"],
        postedAtHuman: json["posted_at_human"],
        expiresInDays: json["expires_in_days"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "company": company?.toMap(),
        "salary": salary?.toMap(),
        "category": category,
        "location": location,
        "work_arrangement": workArrangement,
        "job_type": jobType,
        "description": description,
        "requirements": requirements,
        "responsibilities": responsibilities,
        "benefits": benefits,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "expires_at": expiresAt,
        "posted_at_human": postedAtHuman,
        "expires_in_days": expiresInDays,
      };
}

class Company {
  final int? id;
  final String? name;
  final String? logoPath;
  final String? industry;
  final String? location;

  Company({
    this.id,
    this.name,
    this.logoPath,
    this.industry,
    this.location,
  });

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        logoPath: json["logo_path"],
        industry: json["industry"],
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "logo_path": logoPath,
        "industry": industry,
        "location": location,
      };
}

class Salary {
  final String? min;
  final String? max;
  final String? formatted;

  Salary({
    this.min,
    this.max,
    this.formatted,
  });

  factory Salary.fromJson(String str) => Salary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Salary.fromMap(Map<String, dynamic> json) => Salary(
        min: json["min"],
        max: json["max"],
        formatted: json["formatted"],
      );

  Map<String, dynamic> toMap() => {
        "min": min,
        "max": max,
        "formatted": formatted,
      };
}

class Links {
  final String? next;
  final dynamic prev;
  final String? first;
  final String? last;

  Links({
    this.next,
    this.prev,
    this.first,
    this.last,
  });

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        next: json["next"],
        prev: json["prev"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toMap() => {
        "next": next,
        "prev": prev,
        "first": first,
        "last": last,
      };
}

class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toMap())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class Pagination {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;
  final Links? links;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        links: json["links"] == null ? null : Links.fromMap(json["links"]),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
        "links": links?.toMap(),
      };
}

final JobResponseModel fakeJobData = JobResponseModel(
  data: [
    Job(
      id: 1,
      title: "Software Engineer",
      company: Company(
        id: 101,
        name: "TechCorp",
        logoPath: "https://i.pinimg.com/736x/93/e8/88/93e8886d6d4fc26d170965a3ccf958f5.jpg",
        location: "San Francisco, CA",
      ),
      salary: Salary(
        min: "80000",
        max: "120000",
        formatted: "\$80,000 - \$120,000",
      ),
      location: "San Francisco, CA",
      jobType: "Full-time",
    ),
    Job(
      id: 2,
      title: "Product Designer",
      company: Company(
        id: 102,
        name: "DesignStudio",
        logoPath: "https://i.pinimg.com/736x/93/e8/88/93e8886d6d4fc26d170965a3ccf958f5.jpg",
        location: "New York, NY",
      ),
      salary: Salary(
        min: "70000",
        max: "100000",
        formatted: "\$70,000 - \$100,000",
      ),
      location: "New York, NY",
      jobType: "Remote",
    ),
    Job(
      id: 3,
      title: "Data Scientist",
      company: Company(
        id: 103,
        name: "AI Solutions",
        logoPath: "https://i.pinimg.com/736x/93/e8/88/93e8886d6d4fc26d170965a3ccf958f5.jpg",
        location: "Austin, TX",
      ),
      salary: Salary(
        min: "90000",
        max: "130000",
        formatted: "\$90,000 - \$130,000",
      ),
      location: "Austin, TX",
      jobType: "Contract",
    ),
  ],
  pagination: Pagination(
    total: 3,
    count: 3,
    perPage: 3,
    currentPage: 1,
    totalPages: 1,
  ),
  links: Links(
    next: null,
    prev: null,
    first: "https://example.com/api/jobs?page=1",
    last: "https://example.com/api/jobs?page=1",
  ),
  meta: Meta(
    currentPage: 1,
    from: 1,
    lastPage: 1,
    path: "https://example.com/api/jobs",
    perPage: 3,
    to: 3,
    total: 3,
  ),
);
