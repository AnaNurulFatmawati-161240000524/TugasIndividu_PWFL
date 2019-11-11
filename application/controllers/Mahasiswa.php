<?php 


class Mahasiswa extends CI_Controller{

	public function tambahmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');


		if (!$this->form_validation->run()==false) {
			$this->Model_mhs->tambah_mhs();
			redirect('C_mhs/');
		}else {
			redirect('C_mhs/tambahmhs');
		}
	}
	public function editmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');

		if ($this->form_validation->run()!=false) {
			$this->Model_mhs->edit_mhs();
			redirect('C_mhs');
		}else{
			redirect('C_mhs/editmhs');
		}
	}

	public function hapusmhs($id) {
		if ($id != ""){
			$this->Model_mhs->hapus_mhs($id);
			redirect('C_mhs');
		}else{
			redirect('C_mhs');
		}
	}
	
}

