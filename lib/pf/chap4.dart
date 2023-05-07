// ignore_for_file: prefer_const_constructors

import 'package:app1/pf/bookgen.dart';
import 'package:app1/pf/chap1.dart';
import 'package:app1/pf/chap2.dart';
import 'package:app1/pf/chap3.dart';
import 'package:app1/screens/homepage.dart';
import 'package:app1/screens/navigator.dart';
import 'package:flutter/material.dart';

class Chap4 extends StatelessWidget {
  const Chap4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookGen(
        chapname: "Understanding co-paymets",
        para1:
            "Skin in the game — It’s an idea propounded by many people, but none more so than the trader-philosopher-statistician Nassim Nicholas Taleb. To have skin in the game is to seek symmetry.If you get hurt, I get hurt. If you succeed, I succeed.When you apply this simple maxim to a business arrangement, it will likely benefit both parties. Look at all the examples around you. A pilot will likely heed safety instructions if her life is on the line. A chef will probably keep a clean station if he has to eat the food he cooks. A footsoldier is likely to follow a general if the general is leading from the front. Your incentives and penalties align with those you intend to work with. That’s when you truly have skin in the game",
        para2:
            "But in the insurance business, things aren’t so straightforward. When you buy a health insurance policy, there’s a pure transfer of risk, i.e. the insurance company is expected to compensate you fully during a medical emergency. You can decide to splurge if you so wish, and insurance companies will be obligated to pay for every expense you incur. You have no skin in the game once you’ve bought the policy. And from an insurer’s point of view, this is a massive problem. They want you to be accountable in some way. They want you to be penny-pinching at the hospital even if you won’t be paying the bill yourself. They want you to have some skin in the game, and to this extent, they devise clever schemes to protect their downside. ",
        para3:
            "Consider, for instance, this case study.You’re about to buy health insurance, and the agent pitches a policy with a cover totalling ₹5 Lakhs. The price is reasonable, at ₹7000 a year, but you want to haggle some more. And that’s when he drops the big surprise. He promises to cut down the premium by 25% (roughly ₹1800/year) if only you agree to a 20% co-payment clause. We will talk about what this means, but right now, you’re caught up in the moment. Saving ₹1800 is a big deal, so you sign off on the agreement without giving it a second thought.Unfortunately, nine months later, you suffer an accident. You’re hospitalised and need extensive care, and the bill adds up to ₹2 Lakh. No problem. You’ve got insurance. However, the insurer only pays ₹1,60,000. They ask you to pay the remaining ₹40,000 out of pocket and remind you of the co-payment clause.",
        para4:
            "See, when you signed off on the contract, you promised to share the load with the insurer. You wilfully declared that you’d pay 20% of the bill if you were hospitalised. And now, you have to pay up. When you start doing the math, you begin to see how lopsided this arrangement is. You saved ₹1,800, sure. But you had to pay ₹40,000 because of the co-payment clause. It would take ~22 years of premium savings to make up for this fatal mistake. On the flip side, this is a massive victory for the insurer. Not only did they manage to save ₹40,000, but they also got you to penny-pinch. Once you realise you’re obligated to pay 20% of the bill, you’ll cut back on all the frivolous expenses. You’ll book cheaper rooms.You’ll second guess optional procedures. You will request hospital personnel to be prudent with their spending. But it would help if you didn’t have to do any of these. It would help if you only were thinking about making a full recovery and not penny-pinching at your most vulnerable moment.",
        para5:
            "If anything, co-payments seldom make sense unless they are mandatory or you’re buying a policy for someone old with pre-existing diseases. In which case, a co-payment clause can bring down premiums drastically. But otherwise, you’re better off simply opting out of this seeming “bargain.”The other trick up an insurer’s sleeve is the room rent allocation. Often, policies will have a cap on room rent — the kind of money you can spend renting a hospital room. Imagine the cap is set at 1% of your sum insured. 1% of ₹5 lakh insured is ₹5,000 each day. That’s not a lot. But what if you’re hospitalised and want a pick a better room— one that costs ₹10,000 a day?Well, of course, you could. But you have to do the math again.You’ll be staying here for a couple of days. So that means you’ll have to pay an extra ₹10,000 (2 days*5000). That’s not a lot, but two days later, you’re discharged, and your insurance company drops a bombshell.You’ll have to pay an extra ₹25,000",
        para6:
            "Well, their carefully worded policy document notes that most services rendered in your room, including surgeon fee, consultant fee, other diagnostic exams, etc., will not be covered fully. Instead, they’ll only pay a part of it because you picked a too expensive room.How much will they pay? Well, here’s their math. The cap on room rent was fixed at ₹5,000, remember? Your actual room rent stood at ₹10,000. So they’ll cover half your room rent and half the cost of all the services rendered in your room. For instance, if you have to undergo an operation, the surgeon’s fee adds up to ₹50,000. They’ll only pay ₹25,000. The rest is on you.These rental caps are a big no-no, and people now realise this. This is why insurance companies are getting creative while going about their business. Now, most insurers impose restrictions on the kind of rooms you can pick. Say — a single private room and nothing fancy.If you prefer something more expensive, you may have to co-pay a part of the bill. And while a single private room could do just fine, you may want to consider a comprehensive plan with no such restrictions. You tend to get better care when you’re admitted to a more expensive room. You’ll have more attendants. You’ll have round-the-clock service, and you could also get a family member to stay with you. It’s not a dealbreaker. But it’s still food for thought.Bottom line — Saving a couple of a thousand rupees by opting for a plan with co-pay and room rent caps may seem like a bargain at the time of purchase. However, if you have the money, you would do well to stay away from these items",
        nextpg: NavPage(
          pageIndex: 0,
        ),
        prevpg: Chap3(),
      ),
    );
  }
}
