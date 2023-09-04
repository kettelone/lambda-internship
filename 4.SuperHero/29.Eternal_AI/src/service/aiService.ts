// This code is for v4 of the openai package: npmjs.com/package/openai
import OpenAI from 'openai';

const openai = new OpenAI();
import INDIVIDUALS from '../utils/individuals';

class AIService {
  async getAIAnswer(question: string, characterID: keyof typeof INDIVIDUALS) {
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
    return completion.choices[0].message.content;
  }
}

export default new AIService();
