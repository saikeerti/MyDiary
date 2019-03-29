<?php
defined('BASEPATH') OR exit('No direct script access allowed');

Class Todo extends CI_Controller{
	function __construct(){
		parent:: __construct();
		$this->load->model('todo_m', 'm');
	}

	function index(){
		$this->load->view('templates/header');
		$this->load->view('todo/index');
		$this->load->view('templates/footer');
	}

	public function showAllTodo(){
		$result = $this->m->showAllTodo();
		echo json_encode($result);
	}

	public function addTodo(){
		$result = $this->m->addTodo();
		$msg['success'] = false;
		$msg['type'] = 'add';
		if($result){
			$msg['success'] = true;
		}
		echo json_encode($msg);
	}

	public function editTodo(){
		$result = $this->m->editTodo();
		echo json_encode($result);
	}

	public function updateTodo(){
		$result = $this->m->updateTodo();
		$msg['success'] = false;
		$msg['type'] = 'update';
		if($result){
			$msg['success'] = true;
		}
		echo json_encode($msg);
	}

	public function deleteTodo(){
		$result = $this->m->deleteTodo();
		$msg['success'] = false;
		if($result){
			$msg['success'] = true;
		}
		echo json_encode($msg);
	}

}