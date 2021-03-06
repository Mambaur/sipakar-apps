class Disease {
  String idpenyakit;
  String namaPenyakit;
  String penanganan;
  String gambar;
  String keterangan;

  Disease({this.idpenyakit, this.namaPenyakit, this.penanganan, this.gambar, this.keterangan});

  Disease.fromJson(Map<String, dynamic> json) {
    idpenyakit = json['idpenyakit'];
    namaPenyakit = json['nama_penyakit'];
    penanganan = json['penanganan'];
    gambar = json['gambar'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idpenyakit'] = this.idpenyakit;
    data['nama_penyakit'] = this.namaPenyakit;
    data['penanganan'] = this.penanganan;
    data['gambar'] = this.gambar;
    data['keterangan'] = this.keterangan;
    return data;
  }
}
