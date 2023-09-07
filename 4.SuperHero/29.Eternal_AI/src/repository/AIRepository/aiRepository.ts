import db from '../../database/db';
import { questionsAnswers } from '../../database/schema/questionsAnswers';

class AIRepository {
  async saveConversation(question: string, answer: string, userId: string) {
    await db.insert(questionsAnswers).values({ question, answer, userId });
  }
}

export default new AIRepository();
