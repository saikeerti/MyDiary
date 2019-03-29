<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Todo_m extends CI_Model{
	public function showAllTodo(){
		$this->db->where('user_id', $this->session->userdata('user_id'));
		$query = $this->db->get('todos');
		if($query->num_rows() > 0){
			return $query->result();
		}else{
			return false;
		}
	}

	public function addTodo(){
		$field = array(
			'todoname'=>$this->input->post('txtTodoName'),
			'bydate'=>$this->input->post('txtBydate'),
			'created_at'=>date('Y-m-d H:i:s'),
			'user_id' => $this->session->userdata('user_id')
			);
		$this->db->insert('todos', $field);
		if($this->db->affected_rows() > 0){
			return true;
		}else{
			return false;
		}
	}

	public function editTodo(){
		$id = $this->input->get('id');
		$this->db->where('id', $id);
		$query = $this->db->get('todos');
		if($query->num_rows() > 0){
			return $query->row();
		}else{
			return false;
		}
	}

	public function updateTodo(){
		$id = $this->input->post('txtId');
		$field = array(
		'todoname'=>$this->input->post('txtTodoName'),
		'bydate'=>$this->input->post('txtBydate'),
		'updated_at'=>date('Y-m-d H:i:s'),
		'user_id' => $this->session->userdata('user_id')
		);
		$this->db->where('id', $id);
		$this->db->update('todos', $field);
		if($this->db->affected_rows() > 0){
			return true;
		}else{
			return false;
		}
	}

	function deleteTodo(){
		$id = $this->input->get('id');
		$this->db->where('id', $id);
		$this->db->delete('todos');
		if($this->db->affected_rows() > 0){
			return true;
		}else{
			return false;
		}
	}
}