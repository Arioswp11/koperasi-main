<?= $this->extend('template/theme'); ?>
<?= $this->section('content'); ?>
<?php if (isset($edit) && $edit == 1) { ?>
    <div class="card shadow mb-4">
        <div class="card-body">
            <form class="user" method="post">
                <?= csrf_field(); ?>
                <?php
                $inputs = session()->getFlashdata('inputs');
                $errors = session()->getFlashdata('errors');
                if (!empty($errors)) { ?>
                    <div class="alert alert-danger" role="alert">
                        Whoops! Ada kesalahan saat input data, yaitu:
                        <ul>
                            <?php foreach ($errors as $error) : ?>
                                <li><?= esc($error) ?></li>
                            <?php endforeach ?>
                        </ul>
                    </div>
                <?php } ?>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">ID Anggota</label>
                    <div class="col-sm-10">
                        <input type="hidden" class="form-control" id="id_anggota" name="id_anggota" value="<?= $pinjam['id_anggota'] ?>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Tanggal Peminjaman</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="tgl_peminjaman" name="tgl_peminjaman" value="<?= date('Y-m-d', strtotime($pinjam['tgl_peminjaman'])) ?>">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Nominal Peminjaman</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="pokok_peminjaman" name="pokok_peminjaman" onchange="hitungbunga()" value="<?= $pinjam['pokok_peminjaman'] ?>">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Jumlah Kredit Angsuran</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="kredit" name="kredit" onchange="hitungbunga()" value="<?= $pinjam['kredit'] ?>">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Bunga (%) / Tahun</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="bunga" name="bunga" onchange="hitungbunga()" value="<?= $pinjam['bunga'] ?>">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Total Bunga (Rp) / Tahun</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="pokok_bunga" name="pokok_bunga" readonly value="<?= $pinjam['pokok_bunga'] ?>">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Nominal Angsuran</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="pokok_cicilan" name="pokok_cicilan" readonly value="<?= $pinjam['pokok_cicilan'] ?>">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Total Nominal Angsuran</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="total_cicilan" name="total_cicilan" readonly value="<?= $pinjam['total_cicilan'] ?>">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Total Nominal Peminjaman</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="total_peminjaman" name="total_peminjaman" readonly value="<?= $pinjam['total_peminjaman'] ?>">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </div>
                <hr>
            </form>
        </div>
    </div>
<?php } else { ?>
    <div class="card shadow mb-4">
        <div class="card-body">
            <form class="user" method="post">
                <?= csrf_field(); ?>
                <?php
                $inputs = session()->getFlashdata('inputs');
                $errors = session()->getFlashdata('errors');
                if (!empty($errors)) { ?>
                    <div class="alert alert-danger" role="alert">
                        Whoops! Ada kesalahan saat input data, yaitu:
                        <ul>
                            <?php foreach ($errors as $error) : ?>
                                <li><?= esc($error) ?></li>
                            <?php endforeach ?>
                        </ul>
                    </div>
                <?php } ?>
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Anggota</label>
                    <div class="col-sm-10">
                        <select class="custom-select" name="id_anggota">
                            <option selected> -- Pilih Anggota -- </option>
                            <?php foreach ($anggota as $key) : ?>
                                <option value="<?= $key['id'] ?>" <?= (isset($useranggota) && $useranggota['id'] == $key['id']) ? 'selected' : '' ?>><?= $key['nama'] ?> (<?= $key['no_anggota'] ?>)</option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Tanggal Peminjaman</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="tgl_peminjaman" name="tgl_peminjaman" value="<?= date('Y-m-d') ?>">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Nominal Peminjaman</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="pokok_peminjaman" name="pokok_peminjaman" onchange="hitungbunga()">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Jumlah Kredit Angsuran</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="kredit" name="kredit" onchange="hitungbunga()">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Bunga (%) / Tahun</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="bunga" name="bunga" onchange="hitungbunga()">
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Total Bunga (Rp) / Tahun</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="pokok_bunga" name="pokok_bunga" readonly>
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Nominal Angsuran</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="pokok_cicilan" name="pokok_cicilan" readonly>
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Total Nominal Angsuran</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="total_cicilan" name="total_cicilan" readonly>
                    </div>
                </div>
                <div class=" form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Total Nominal Peminjaman</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="total_peminjaman" name="total_peminjaman" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </div>
                <hr>
            </form>
        </div>
    </div>
<?php } ?>
<script type='text/javascript'>
    document.addEventListener("DOMContentLoaded", function() {});

    function hitungbunga(id) {
        var kredit = parseInt(document.getElementById("kredit").value);
        var pokok_peminjaman = parseInt(document.getElementById("pokok_peminjaman").value);
        var bunga = parseInt(document.getElementById("bunga").value);
        var pokokcicilan = 0;
        var bungarp = 0;
        var totalbunga = 0;
        var totalcicilan = 0;
        var totalpeminjaman = 0;
        if (bunga) {
            pokokcicilan = (pokok_peminjaman / kredit);
            bungarp = (pokok_peminjaman * (bunga / 100)) / 12;
            totalbunga = bungarp * kredit;
            totalcicilan = pokokcicilan + bungarp;
            totalpeminjaman = (pokokcicilan * kredit) + totalbunga;
            // alert(totalpeminjaman);
            $("#pokok_bunga").val(bungarp);
            $("#pokok_cicilan").val(pokokcicilan);
            $("#total_cicilan").val(totalcicilan);
            $("#total_peminjaman").val(totalpeminjaman);
        }
    }
</script>

<?= $this->endSection(); ?>