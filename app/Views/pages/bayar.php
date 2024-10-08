<?= $this->extend('template/theme'); ?>
<?= $this->section('content'); ?>
<div class="row">
    <div class="col-xl-12 col-lg-8">
        <div class="card shadow mb-4">
            <div class="card-body">
                <?php
                if (!empty(session()->getFlashdata('success'))) { ?>
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
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>No Anggota</th>
                                <th>Nama Anggota</th>
                                <th>Tgl Pembayaran</th>
                                <th>Angsuran</th>
                                <th>Total Angsuran</th>
                                <th>Sisa Angsuran</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($bayar as $key => $row) : ?>
                                <tr>
                                    <td><?= $key + 1; ?></td>
                                    <td><?= $row->no_anggota; ?></td>
                                    <td><?= $row->nama; ?></td>
                                    <td><?= date('Y-m-d H:i', strtotime($row->tgl_pembayaran)); ?></td>
                                    <td><?= number_format($row->nominal); ?></td>
                                    <td><?= number_format($row->saldo); ?></td>
                                    <td><?= number_format($row->sisa); ?></td>
                                    <?php if (session()->get('logged_in') == TRUE && session()->get('admin') == TRUE) : ?>
                                        <td>
                                            <div class="form-button-action">
                                                <a href="<?php echo base_url('anggota/' . $row->id . '/edit'); ?>" class="btn btn-primary btn-circle">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a href="<?php echo base_url('anggota/' . $row->id . '/delete'); ?>" class="btn btn-danger btn-circle" onclick="return confirm('Apakah Anda yakin ingin menghapus data ini?');">
                                                    <i class="fa fa-trash"></i>
                                                </a>
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