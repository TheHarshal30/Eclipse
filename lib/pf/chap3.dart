// ignore_for_file: prefer_const_constructors

import 'package:app1/pf/bookgen.dart';
import 'package:app1/pf/chap1.dart';
import 'package:app1/pf/chap2.dart';
import 'package:app1/pf/chap4.dart';
import 'package:flutter/material.dart';

class Chap3 extends StatelessWidget {
  const Chap3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookGen(
        chapname: "Understanding Premiums",
        para1:
            "When we ask people to pick a cover while buying a health insurance policy, most people choose a sum no more significant than ₹2–3 lakhs. Ask them to justify this response, and they’ll often fall back on their lived experience. Hospitalisations are rare. And when they happen, it’s the usual suspects doing the damage — Malaria, a broken bone, or lousy appendicitis. Medical expenses seldom exceed the ₹2–3 lakh mark, and a cover above this sum seems needless.",
        para2:
            "But this isn’t a good way to think about health insurance. Sure, ₹2–3 lakhs isn’t a modest sum by any account. But it isn’t a life-changing sum either. If you’re ever hospitalised for an ailment, you will likely be able to put together this kind of money without an insurer. It won’t be pleasant, and it most certainly won’t be easy. But it’s something that you can hope to cobble together if you need the cash.What will cripple you, however, is the bone marrow transplant that costs ₹25 lakhs. Or the recurring cancer treatment that can push you to the brink of financial ruin. Your only option then is to binge on debt or crowdfund your treatment — Seek help from friends and family. If that doesn’t do, you’ll have to settle for the public healthcare system and see what they can do for you. ",
        para3:
            "Sure, there is a case to be made that the relatively inexpensive treatments (₹1–2 lakhs) aren’t the ones you should be worried about. That it’s cancer and the transplants that do the most damage. But ask yourself this — How expensive do these treatments get? What kind of money do people usually shell out when recovering from such ailments? In our experience, even the more expensive treatments hardly ever breach the ₹20 lakh mark. You’d have to struggle to find a comprehensive list of treatments that will cost you more. You could raise a massive bill by staying in a deluxe room at a luxurious hospital. But in most cases, people are prudent with their spending.When they find out their treatment could cost a lot of money, they find a hospital (and a room) that fits their budget. So the likelihood of racking up a ₹50 lakh bill is so remote that it may not even be worth considering at the moment.Also, the agent’s reasoning is riddled with logical inconsistencies.",
        para4:
            "At best, the idea that a ₹50 lakh cover will protect you from all difficulties is dubious. What if you had to avail a treatment that costs well over a crore? What if such treatments can only be availed outside India? What if it’s a disease that insurance companies don’t cover at all? Sure, you could try and optimise for these use cases. But it’s a never-ending cycle. I could always draw up a list of diseases and scenarios where your insurance wouldn’t protect you, and you would have to try and source a policy that does.There is no end to this. The truth is that no cover can protect you from all tragic outcomes, and the agent, in this case, is simply trying to extract a higher premium by heightening your anxiety.Also, in most cases, health insurance policies offer you significantly higher protection than you may have imagined. For instance, with a comprehensive approach, you could get a base cover of say ₹ ten lakhs, a no-claim bonus that could add another ₹ ten lakhs in a couple of years, and a restoration benefit that would offer you an additional ₹ ten lakhs worth of protection",
        para5:
            "All in all, you’d be covering for most exigencies by picking a cover anywhere between ₹10–20 lakhs without spending a fortune. Now some people will read this: “If you can get ₹30 lakhs worth of protection with a ₹10 lakh cover, why not go for something lower?”You could. But bear in mind that healthcare costs don’t stay the same. They increase at about 6–7% every year, and within just a few years, the ₹5 lakh cover may seem wholly inadequate. You could also try and beef up your body at the time, but bear in mind that insurance companies will only let you do this if you’re in tip-top shape.If you’ve made massive claims in the past or you have a heart condition, insurance companies may not afford you that opportunity. So if you’re seeking comprehensive protection for at least the next ten years, then a ₹5 lakh cover may not cut it.But is there a case to be made for a little cover? Is there no utility once you go lower? Well, of course not. As you get older, the risk of hospitalisation increases somewhat disproportionately, and your premium could jump manifold if you already have pre-existing conditions. So, a minor cover may make sense for older folks if the tips look prohibitive",
        para6:
            "Also, if you’re in no position to pay these premiums consistently yearly, it most certainly makes sense to pick a more petite figure.Remember, the last thing you want to do is buy a policy, pay those premiums diligently for a couple of years and then forego it altogether because you can’t put up the tips. We routinely hear from people who abstain from their policy after falling short of funds. On some occasions, you could attribute this misfortune or a tight budget.On other events, it’s entirely attributable to the impossible burden of ever-increasing premiums. And while you should be worried about both outcomes, the latter often catches people off-guard. Health insurance premiums don’t stay the same. Instead, they keep changing as you renew your policy each year.",
        nextpg: Chap4(),
        prevpg: Chap2(),
      ),
    );
  }
}
