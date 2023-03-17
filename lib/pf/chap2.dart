// ignore_for_file: prefer_const_constructors

import 'package:eclipsis/Screens/homepage.dart';
import 'package:eclipsis/pf/bookgen.dart';
import 'package:eclipsis/pf/chap3.dart';
import 'package:flutter/material.dart';

class Chap2 extends StatelessWidget {
  const Chap2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookGen(
        chapname: "Perverse Incentives",
        para1:
        "Humans are notoriously rigid, but throw some incentives in the mix, and they’ll become pretty malleable. It’s one of the reasons why the insurance industry is built on a very competitive incentive structure. It’s a product few people want to buy. So you have to have a rather extravagant commission structure. Agents (including us) get paid a lot of money when we make a sale. And sometimes, these incentives can turn perverse — forcing these people to do the most despicable things.",
        para2:
        "The agent in question had played a dirty trick. He knew that our man was unlikely to get a health plan with his past medical history. Insurance companies don’t mention this explicitly, but it’s an unsaid rule within the retail industry. Cancer patients are a no-go, even if they are in remission. No matter how high you push the premiums, it’s unlikely to compensate for the substantial risks insurance companies will likely take when they cover somebody diagnosed with cancer. And while this may come as a surprise to some of our readers, industry incumbents (including agents) have known this detail forever",
        para3:
        "So you’d expect them to be honest with this information. However, that isn’t always the case. Some agents will tell you no such thing. They’ll convince you it’s not a problem. They want to make the sale come what may. And if they believe suppressing material facts will help you land a policy, they’ll do just that. Sure, the insurer may stumble on this nefarious scheme. But that doesn’t happen all the time. And once the policy is issued, the agent stands to make a windfall, at least until you find out that it’s all a sham.",
        para4:
        "In this case, the agent in question likely concealed this detail to profit off the unsuspecting individual. He filled out the application for the customer without any mention of cancer. Now, consider that most insurance companies call customers and conduct an independent evaluation if a pre-existing disease is mentioned. But without any declaration, they’ll likely issue the policy without further intervention. In other cases, agents may coach their customers to hide sensitive details. They’ll tell them it’s a non-issue and coerce them to follow their cues. And if it’s a family friend — as was the case with our customer, most people wouldn’t think twice",
        para5:
        "Another gimmick they pull off is the infamous age-premium discount. When customers push for a discount, agents are left with no choice but to comply. But insurance companies seldom offer such discounts. So agents do the only thing they can. They fill out the application — only they take your age and cut it down by ten years. 50 instead of 60, 25 instead of 35. It looks like an honest mistake, but it’s not. The premiums meanwhile drop substantially. It seems like a bargain at the price point, but it’s only because the agent lied on your proposal form.",
        para6:
        "This is why it’s imperative for you always to double-check the application. If it’s an online platform, you’ll likely have to do it on your own or at least prompt a sales executive to fill it for you. You’ll have to be doubly careful if it’s an offline agent. Seek out the application and check for any discrepancies. Mistakes can creep in despite vigilance. So spend some time combing through the application, especially if you feel something is amiss. You can even call the insurer directly if you have any additional concerns. But never trust anybody implicitly. Because their incentives may not bode well for your ambitions.",
        nextpg: Chap3(),
        prevpg: HomePage(),
      ),
    );
  }
}