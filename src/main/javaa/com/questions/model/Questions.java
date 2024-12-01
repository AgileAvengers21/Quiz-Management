package com.questions.model;

public class Questions {
	private String question;
    private String a;
    private String b;
    private String c;
    private String d;
    private String answer;
    
    public Questions() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    
	public Questions(String question, String a, String b, String c, String d, String answer) {
		super();
		this.question = question;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.answer = answer;
	}



	public String getQuestion() {
        return question;
    }
    public void setQuestion(String question) {
        this.question = question;
    }
    public String getA() {
        return a;
    }
    public void setA(String a) {
        this.a = a;
    }
    public String getB() {
        return b;
    }
    public void setB(String b) {
        this.b = b;
    }
    public String getC() {
        return c;
    }
    public void setC(String c) {
        this.c = c;
    }
    public String getD() {
        return d;
    }
    public void setD(String d) {
        this.d = d;
    }
    public String getAnswer() {
        return answer;
    }
    public void setAnswer(String answer) {
        this.answer = answer;
    }



	@Override
	public String toString() {
		return "Questions [question=" + question + ", a=" + a + ", b=" + b + ", c=" + c + ", d=" + d + ", answer="
				+ answer + "]";
	}
    
}

