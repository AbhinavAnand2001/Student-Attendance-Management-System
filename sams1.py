import tkinter as tk
from tkinter import messagebox
import mysql.connector

# Establish a connection to the MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="studentattendancemanagementsystem"
)

# Define the Student model
class Student:
    def __init__(self, id, first_name, last_name, email, department):
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.department = department

# Add student function
def add_student(first_name, last_name, email, department):
    cursor = db.cursor()
    cursor.execute("INSERT INTO Student (FirstName, LastName, Email, Department) VALUES (%s, %s, %s, %s)",
                   (first_name, last_name, email, department))
    db.commit()
    messagebox.showinfo("Success", "Student added successfully.")

# Update student function
def update_student(id, first_name, last_name, email, department):
    cursor = db.cursor()
    cursor.execute("UPDATE Student SET FirstName=%s, LastName=%s, Email=%s, Department=%s WHERE StudentID=%s",
                   (first_name, last_name, email, department, id))
    db.commit()
    messagebox.showinfo("Success", "Student updated successfully.")

# Delete student function
def delete_student(id):
    cursor = db.cursor()
    cursor.execute("DELETE FROM Student WHERE StudentID=%s", (id,))
    db.commit()
    messagebox.showinfo("Success", "Student deleted successfully.")

# Get all students function
def get_all_students():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM Student")
    return cursor.fetchall()

# Create a tkinter window for managing students
def create_student_window():
    def add_student_handler():
        add_student(first_name_entry.get(), last_name_entry.get(), email_entry.get(), department_entry.get())
        update_listbox()

    def update_student_handler():
        selected_student = students_listbox.curselection()
        if selected_student:
            student_id = students_listbox.get(selected_student)[0]
            update_student(student_id, first_name_entry.get(), last_name_entry.get(), email_entry.get(), department_entry.get())
            update_listbox()
        else:
            messagebox.showwarning("Warning", "Please select a student to update.")

    def delete_student_handler():
        selected_student = students_listbox.curselection()
        if selected_student:
            student_id = students_listbox.get(selected_student)[0]
            delete_student(student_id)
            update_listbox()
        else:
            messagebox.showwarning("Warning", "Please select a student to delete.")

    def update_listbox():
        students_listbox.delete(0, tk.END)
        students = get_all_students()
        for student in students:
            students_listbox.insert(tk.END, student)

    window = tk.Tk()
    window.title("Student Management")

    first_name_label = tk.Label(window, text="First Name:")
    first_name_label.pack()
    first_name_entry = tk.Entry(window)
    first_name_entry.pack()

    last_name_label = tk.Label(window, text="Last Name:")
    last_name_label.pack()
    last_name_entry = tk.Entry(window)
    last_name_entry.pack()

    email_label = tk.Label(window, text="Email:")
    email_label.pack()
    email_entry = tk.Entry(window)
    email_entry.pack()

    department_label = tk.Label(window, text="Department:")
    department_label.pack()
    department_entry = tk.Entry(window)
    department_entry.pack()

    add_button = tk.Button(window, text="Add Student", command=add_student_handler, width=20, height=2)
    add_button.pack()

    update_button = tk.Button(window, text="Update Student", command=update_student_handler, width=20, height=2)
    update_button.pack()

    delete_button = tk.Button(window, text="Delete Student", command=delete_student_handler, width=20, height=2)
    delete_button.pack()

    students_listbox = tk.Listbox(window)
    students_listbox.pack()

    update_listbox()

    window.mainloop()

# Call the function to create the student management window
create_student_window()
