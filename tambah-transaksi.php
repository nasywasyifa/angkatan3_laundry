<?php
session_start();
include 'koneksi.php';
$queryCustomer = mysqli_query($koneksi, "SELECT * FROM customer");
$queryPaket = mysqli_query($koneksi, "SELECT * FROM paket");
$row = [];
while ($data = mysqli_fetch_assoc($queryPaket)) {
  $rowPaket[] = $data;
}

//jika button simpan  di tekan

if (isset($_POST['simpan'])) {
  $kode_transaksi = $_POST['kode_transaksi'];
  $customer_name = $_POST['customer_name'];
  $tanggal_transaksi = $_POST['tanggal_transaksi'];
  $status_transaksi = $_POST['status_transaksi'];

  $insert = mysqli_query($koneksi,  "INSERT INTO transaksi (kode_transaksi, customer_name, tanggal_transaksi, status_transaksi) VALUES ('$kode_transaksi', '$customer_name', '$tanggal_transaksi' ,'$status_transaksi')");

  header("location:transaksi.php?tambah=berhasil");
}

$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$queryEdit = mysqli_query($koneksi, "SELECT * FROM transaksi WHERE id ='$id'");
$rowEdit = mysqli_fetch_assoc($queryEdit);

//jika button edit di klik
if (isset($_POST['edit'])) {
  $kode_transaksi = $_POST['kode_transaksi'];
  $customer_name = $_POST['customer_name'];
  $tanggal_transaksi = $_POST['tanggal_transaksi'];
  $status_transaksi = $_POST['status_transaksi'];

  $update = mysqli_query($koneksi, "UPDATE transaksi SET kode_transaksi='$kode_transaksi',
    customer_name='$customer_name', tanggal_transaksi='$tanggal_transaksi', status_transaksi='$status_transaksi' WHERE id='$id'");
  header("location:transaksi.php?ubah=berhasil");
}

// data level
$tampilLevel = mysqli_query($koneksi, "SELECT * FROM transaksi ORDER BY id Desc");
?>

<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free">

<head>
  <meta charset="utf-8" />
  <meta
    name="viewport"
    content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

  <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

  <meta name="description" content="" />

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

  <?php include 'inc/head.php' ?>
</head>

<body>
  <!-- Layout wrapper -->
  <div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
      <!-- Menu -->

      <?php include 'inc/sidebar.php'; ?>
      <!-- / Menu -->

      <!-- Layout container -->
      <div class="layout-page">
        <!-- Navbar -->

        <?php include 'inc/nav.php'; ?>

        <!-- / Navbar -->
        <!-- Content wrapper -->
        <div class="content-wrapper">
          <!-- Content -->

          <div class="container-xxl flex-grow-1 container-p-y">
            <div class="row">
              <div class="col-sm-6">
                <div class="card">
                  <div class="card-header"><?php echo isset($_GET['edit']) ? 'Edit' : 'Tambah' ?> Transaksi</div>
                  <div class="card-body">
                    <?php if (isset($_GET['hapus'])): ?>
                      <div class="alert alert-success" role="alert">
                        Data berhasil dihapus</div>
                    <?php endif ?>

                    <form action="" method="post" enctype="multipart/form-data">
                      <div class="mb-3 row">
                        <div class="col-sm-12">
                          <label for="" class="form-label">Pelanggan</label>
                          <select class="form-control" name="id_level" id="">
                            <option value="">--Pilih Pelanggan--</option>
                            <?php
                            while ($row = mysqli_fetch_assoc($queryCustomer)) {
                            ?>
                              <option value="<?= $row['id'] ?>"><?= $row['customer_name'] ?></option>
                            <?php
                            }
                            ?>
                          </select>
                        </div>

                      </div>

                      <div class="mb-3 row">
                        <div class="col-sm-6">
                          <label for="" class="form-label">No Invoice</label>
                          <input type="text" class="form-control" name="kode_transaksi" readonly value="#">

                        </div>
                        <div class="col-sm-6">
                          <label for="" class="form-label">Tanggal Transaksi</label>
                          <input type="date" class="form-control" name="tanggal_transaksi" placeholder=""
                            value="<?php echo isset($_GET['edit']) ? $rowEdit['tanggal_transaksi'] : '' ?>"
                            required>
                        </div>
                      </div>
                      <div class="mb-3">
                        <button class="btn btn-primary" name="<?php echo isset($_GET['edit']) ? 'edit' : 'simpan' ?>" type="submit">
                          Simpan
                        </button>
                      </div>
                    </form>
                  </div>

                </div>
              </div>
              <div class="col-sm-6">
                <div class="card">
                  <div class="card-header"> Detail Transaksi</div>
                  <div class="card-body">
                    <?php if (isset($_GET['hapus'])): ?>
                      <div class="alert alert-success" role="alert">
                        Data berhasil dihapus</div>
                    <?php endif ?>

                    <form action="" method="post" enctype="multipart/form-data">
                      <div class="mb-3 row">
                        <div class="col-sm-3">
                          <label for="" class="form-label">Paket</label>
                        </div>
                        <div class="col-9">

                          <select class="form-control" name="id_paket" id="">
                            <option value="">--Pilih Paket--</option>
                            <?php
                            foreach ($rowPaket as $key => $value) {
                            ?>
                              <option value="<?php echo $value['id'] ?>"><?php echo $value['nama_paket'] ?></option>
                            <?php
                            }
                            ?>
                          </select>
                        </div>
                      </div>



                      <div class="mb-3 row">
                        <div class="col-sm-3">
                          <label for="" class="form-label">Qty</label>
                        </div>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" name="qty[]" value="" placeholder="Qty">
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <div class="col-sm-3">
                          <label for="" class="form-label">Paket</label>
                        </div>
                        <div class="col-9">

                          <select class="form-control" name="id_paket" id="">
                            <option value="">--Pilih Paket--</option>
                            <?php
                            foreach ($rowPaket as $key => $value) {
                            ?>
                              <option value="<?php echo $value['id'] ?>"><?php echo $value['nama_paket'] ?></option>
                            <?php
                            }
                            ?>
                          </select>
                        </div>
                      </div>



                      <div class="mb-3 row">
                        <div class="col-sm-3">
                          <label for="" class="form-label">Qty</label>
                        </div>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" name="qty[]" value="" placeholder="Qty">
                        </div>
                      </div>
                      <div class="mb-3">
                        <button class="btn btn-primary" name="<?php echo isset($_GET['edit']) ? 'edit' : 'simpan' ?>" type="submit">
                          Simpan
                        </button>
                      </div>
                    </form>
                  </div>

                </div>
              </div>
            </div>

          </div>


        </div>
        <!-- / Content -->

        <!-- Footer -->
        <footer class="content-footer footer bg-footer-theme">
          <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
            <div class="mb-2 mb-md-0">
              ©
              <script>
                document.write(new Date().getFullYear());
              </script>
              , made with ❤️ by
              <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
            </div>
            <div>
              <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
              <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

              <a
                href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                target="_blank"
                class="footer-link me-4">Documentation</a>

              <a
                href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                target="_blank"
                class="footer-link me-4">Support</a>
            </div>
          </div>
        </footer>
      </div>
      <!-- / Footer -->

      <div class="content-backdrop fade"></div>
    </div>
    <!-- Content wrapper -->
  </div>
  <!-- / Layout page -->
  </div>

  <!-- Overlay -->
  <div class="layout-overlay layout-menu-toggle"></div>
  </div>
  <!-- / Layout wrapper -->


  <!-- Core JS -->
  <!-- build:js assets/vendor/js/core.js -->
  <script src="assets/assets/vendor/libs/jquery/jquery.js"></script>
  <script src="assets/assets/vendor/libs/popper/popper.js"></script>
  <script src="assets/assets/vendor/js/bootstrap.js"></script>
  <script src="assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

  <script src="assets/assets/vendor/js/menu.js"></script>
  <!-- endbuild -->

  <!-- Vendors JS -->
  <script src="assets/assets/vendor/libs/apex-charts/apexcharts.js"></script>

  <!-- Main JS -->
  <script src="assets/assets/js/main.js"></script>

  <!-- Page JS -->
  <script src="assets/assets/js/dashboards-analytics.js"></script>

  <!-- Place this tag in your head or just before your close body tag. -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
</body>

</html>