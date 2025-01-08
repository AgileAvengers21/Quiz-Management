package com.instructions.model;

public class Instruction {
	private String instruction;

	public Instruction() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Instruction(String instruction) {
		super();
		this.instruction = instruction;
	}

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	@Override
	public String toString() {
		return "Instruction [instruction=" + instruction + "]";
	}

}
