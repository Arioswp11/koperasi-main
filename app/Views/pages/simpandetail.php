<?= $this->extend('template/theme'); ?>
<?= $this->section('content'); ?>
<div class="row">
    <!-- Pie Chart -->
    <div class="col-xl-12 col-lg-8">
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Data Simpan</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body">
                <div class="row">
                    <!-- Nama Anggota Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Nama Anggota
                                        </div>
                                        <!-- Menampilkan nama dan nomor anggota dari data yang relevan -->
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <?= $anggota['nama']; ?> (<?= $anggota['no_anggota']; ?>)
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-user fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Bulan <?= date('F') ?>
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            Rp. <?= number_format($dashboard[0]['simpan_bulan'], 2, ',', '.'); ?>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Annual) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Total
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            Rp. <?= number_format($dashboard[0]['simpan_total'], 2, ',', '.'); ?>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xl-12 col-lg-8">
        <div class="card shadow mb-4">
            <div class="card-body">
                <?php if (!empty(session()->getFlashdata('success'))) { ?>
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <?php echo session()->getFlashdata('success'); ?>
                    </div>
                <?php } ?>
                <?php if (!empty(session()->getFlashdata('warning'))) { ?>
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <div class="alert alert-warning">
                        <?php echo session()->getFlashdata('warning'); ?>
                    </div>
                <?php } ?>
                <?php if (session()->get('logged_in') == TRUE && session()->get('admin') == TRUE) : ?>
                    <a href="<?= base_url('simpan/new'); ?>" class="btn btn-success btn-icon-split" style="margin-bottom: 25px;">
                        <span class="icon text-white-50">
                            <i class="fas fa-plus"></i>
                        </span>
                        <span class="text">Tambah Simpanan</span>
                    </a>
                <?php endif; ?>
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Tgl Transaksi</th>
                                <th>Simpan</th>
                                <th>Saldo</th>
                                <?php if (session()->get('logged_in') == TRUE && session()->get('admin') == TRUE) : ?>
                                    <th>Action</th>
                                <?php endif; ?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $saldo = 0; ?>
                            <?php foreach ($simpan as $key => $row) : ?>
                                <?php $saldo += $row['nominal']; ?>
                                <tr>
                                    <td><?= $key + 1; ?></td>
                                    <td><?= date('Y-m-d H:i', strtotime($row['tgl_transaksi'])); ?></td>
                                    <td>Rp. <?= number_format($row['nominal'], 2, ',', '.'); ?></td>
                                    <td>Rp. <?= number_format($saldo, 2, ',', '.'); ?></td>
                                    <?php if (session()->get('logged_in') == TRUE && session()->get('admin') == TRUE) : ?>
                                        <td>
                                            <div class="form-button-action">
                                                <!-- Edit Button -->
                                                <form action="<?= base_url('simpan/' . $row['id'] . '/edit'); ?>" method="post" style="display:inline;">
                                                    <input type="hidden" name="_method" value="PUT">
                                                    <button type="submit" class="btn btn-info btn-circle">
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                </form>
                                                <!-- Delete Button -->
                                                <form action="<?= base_url('simpan/' . $row['id'] . '/delete'); ?>" method="post" style="display:inline;">
                                                    <input type="hidden" name="_method" value="DELETE">
                                                    <button type="submit" class="btn btn-danger btn-circle" onclick="return confirm('Apakah Anda yakin ingin menghapus data ini?');">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    <?php endif; ?>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection(); ?>