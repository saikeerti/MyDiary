<?php
defined('BASEPATH') OR exit('No direct script access allowed');

Class Note extends CI_Controller{
	function __construct(){
		parent:: __construct();
		$this->load->model('note_m', 'm');
	}

	function index(){
		$this->load->view('templates/header');
		$this->load->view('note/index');
		$this->load->view('templates/footer');
	}

	public function showAllNote(){
		$result = $this->m->showAllNote();
		echo json_encode($result);
	}

	public function addNote(){
		$result = $this->m->addNote();
		$msg['success'] = false;
		$msg['type'] = 'add';
		if($result){
			$msg['success'] = true;
		}
		echo json_encode($msg);
	}

	public function editNote(){
		$result = $this->m->editNote();
		echo json_encode($result);
	}


	public function updateNote(){
		$result = $this->m->updateNote();
		$msg['success'] = false;
		$msg['type'] = 'update';
		if($result){
			$msg['success'] = true;
		}
		echo json_encode($msg);
	}

	public function deleteNote(){
		$result = $this->m->deleteNote();
		$msg['success'] = false;
		if($result){
			$msg['success'] = true;
		}
		echo json_encode($msg);
	}

}