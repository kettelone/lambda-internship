// This code is for v4 of the openai package: npmjs.com/package/openai
import OpenAI from 'openai';
const openai = new OpenAI();

class AIService {
  async getAIAnswer(message: string) {
    const completion = await openai.chat.completions.create({
      messages: [{ role: 'system', content: message }],
      model: 'gpt-3.5-turbo'
    });
    return completion.choices[0].message.content;
  }
}

export default new AIService();
