interface NewUserResponse {
  id: string;
  phoneNumber: string | null;
  email: string;
  name: string | null;
  isSubscribed: boolean;
  freeQuestions: number;
}

export { NewUserResponse };
