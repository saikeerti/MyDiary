<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Note_m extends CI_Model{
	public function showAllNote(){
		$current_user = $this->session->userdata('user_id');
		$this->db->where('user_id' , $current_user)->order_by('id');
		$query = $this->db->get('notes');
		if($query->num_rows() > 0){
			return $query->result();
		}else{
			return false;
		}
	}

	public function addNote(){
		$field = array(
			'notename'=>$this->input->post('txtNoteName'),
			'content'=>$this->input->post('txtContent'),
			'created_at'=>date('Y-m-d H:i:s'),
			'user_id' => $this->session->userdata('user_id')
			);
		$this->db->insert('notes', $field);
		if($this->db->affected_rows() > 0){
			return true;
		}else{
			return false;
		}
	}

	public function editNote(){
		$id = $this->input->get('id');
		$this->db->where('id', $id);
		$query = $this->db->get('notes');
		if($query->num_rows() > 0){
			return $query->row();
		}else{
			return false;
		}
	}

	public function updateNote(){
		$id = $this->input->post('txtId');
		$field = array(
		'notename'=>$this->input->post('txtNoteName'),
		'content'=>$this->input->post('txtContent'),
		'updated_at'=>date('Y-m-d H:i:s'),
		'user_id' => $this->session->userdata('user_id')
		);
		$this->db->where('id', $id);
		$this->db->update('notes', $field);
		if($this->db->affected_rows() > 0){
			return true;
		}else{
			return false;
		}
	}

	function deleteNote(){
		$id = $this->input->get('id');
		$this->db->where('id', $id);
		$this->db->delete('notes');
		if($this->db->affected_rows() > 0){
			return true;
		}else{
			return false;
		}
	}
}