// This code is for v4 of the openai package: npmjs.com/package/openai
import OpenAI from 'openai';

import aiRepository from '../repository/AIRepository/aiRepository';
const openai = new OpenAI();
import INDIVIDUALS from '../utils/individuals';

class AIService {
  async getAIAnswer(
    question: string,
    characterID: keyof typeof INDIVIDUALS,
    userId: string
  ) {
    const completion = await openai.chat.completions.create({
      messages: [
        {
          role: 'system',
          content: `On behalf of ${INDIVIDUALS[characterID]} answer the following question:
        "${question}?".Make the answer maximum one paragraph long. The answer must be in the form of direct speech.`
        }
      ],
      model: 'gpt-3.5-turbo'
    });
    const answer = completion.choices[0].message.content;
    if (answer) {
      await aiRepository.saveConversation(question, answer, userId);
    }
    return answer;
  }
}

export default new AIService();
