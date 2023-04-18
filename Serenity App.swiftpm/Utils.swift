//
//  Utils.swift
//  Serenity App
//
//  Created by Muhammad Afif Maruf on 12/04/23.
//

import Foundation

func getRandomStringByTypePath (from arrayName: String) -> String?{
    switch arrayName {
    case "affirmations":
        return affirmations.randomElement()
    case "stories":
        return stories.randomElement()
    default:
        return nil
    }
}

let interactiveSentences = [
    "How have you been spending your time lately?",
    "Have you had any exciting experiences or adventures recently?",
    "What have you been up to today?",
    "Can you tell me about something interesting that happened to you recently?",
    "How has your week been so far?",
    "Have you learned anything new or gained any insights lately?",
    "Is there anything you've been working on that you're particularly proud of?",
    "How have you been feeling both mentally and physically lately?",
    "Have you had any notable conversations or interactions with others lately?",
    "What are some highlights or lowlights of your recent experiences?"
]

let affirmations = [
    "I am doing the best I can, and that's all I can ask of myself.",
    "I trust myself to make the right decisions.",
    "I am capable and confident in my abilities.",
    "I am in control of my thoughts and emotions.",
    "I choose to focus on the present moment and let go of what I can't control.",
    "I am strong and resilient, and I can overcome any obstacles.",
    "I am worthy and deserving of happiness and success.",
    "I have the power to create positive change in my life.",
    "I am grateful for all the good things in my life and choose to focus on them.",
    "I am enough just as I am, and I don't need to be perfect.",
    "I am capable of handling whatever comes my way.",
    "I am resilient and can bounce back from setbacks.",
    "I am worthy of love and respect from myself and others.",
    "I trust myself to make good decisions for myself.",
    "I am learning and growing every day, and that's what matters.",
    "I am strong enough to face any challenge.",
    "I am deserving of happiness and fulfillment.",
    "I am grateful for all the good things in my life, big and small.",
    "I choose to focus on the positives in my life and not dwell on the negatives.",
    "I believe in myself and my ability to achieve my goals.",
    "It's normal to have doubts, but I trust myself to make the right decisions.",
    "It's okay to take a break and recharge when I need it.",
    "It's normal to make mistakes, but I learn and grow from them.",
    "It's okay to ask for help when I need it.",
    "It's normal to have ups and downs, but I know that everything will work out in the end.",
    "It's okay to not have everything figured out right now.",
    "It's normal to feel anxious sometimes, but I have the tools to manage my anxiety.",
    "It's okay to set boundaries and prioritize my own well-being.",
    "It's normal to have different opinions and perspectives, and that's what makes me unique.",
    "It's okay to take things one step at a time and not have everything planned out."
]

let stories = [
    "Did you know that if Thomas Edison had given up on his 10,000th attempt, the world might never have seen the invention of the light bulb? So, keep persevering and remember that each attempt brings you one step closer to success.",
    "If J.K. Rowling had given up after being rejected by 12 publishers, we may never have known the story of Harry Potter. So, keep going and don't let rejection hold you back.",
    "Walt Disney was fired from his job at a newspaper for not being creative enough. If he had given up then, we wouldn't have Disneyland or any of his other creations. Remember his story and keep pushing your creativity.",
    "If Oprah Winfrey had given up after facing numerous obstacles and setbacks, she would never have become the media mogul she is today. Keep persevering and never let obstacles discourage you.",
    "The Beatles were rejected by several record labels before they finally made it big. If they had given up, we may never have heard their music. Keep going and don't let rejection stop you.",
    "Stephen King's first novel, Carrie, was rejected 30 times before it was published. If he had given up, we wouldn't have all the great books and movies he has created. Keep writing and don't let rejection hold you back.",
    "If Michael Jordan had given up after being cut from his high school basketball team, he wouldn't have become one of the greatest basketball players of all time. Keep practicing and never let failure discourage you.",
    "Vincent van Gogh only sold one painting during his lifetime. If he had given up on his art, we wouldn't have the beautiful masterpieces he created. Keep creating and don't let lack of recognition stop you.",
    "If Marie Curie had given up after facing discrimination and sexism in the scientific community, she wouldn't have won two Nobel Prizes. Keep pursuing your passions and don't let discrimination discourage you.",
    "Sylvester Stallone was rejected over 1,500 times before his script for Rocky was accepted. If he had given up, we may never have seen one of the most iconic movies of all time. Keep pushing and don't let rejection hold you back.",
    "If Nelson Mandela had given up on his fight against apartheid, South Africa may never have become the free and democratic country it is today. Keep fighting for what you believe in and don't let adversity stop you."
]

let chatMessage = [
    "Hello there! Have you ever found yourself feeling overwhelmed or stressed out during the day?",
    "Sometimes it can be hard to stay focused and motivated, especially when there's so much going on around us.",
    "But what if I told you that there's an app that can help you practice breathing exercises to calm your mind and boost your mood, as well as provide self-talk to motivate you to be enthusiastic about tackling the day?",
    "This app features a simple and easy-to-use interface that allows you to select from a variety of breathing exercises designed to help you relax, reduce anxiety, and improve your overall well-being.",
    "Whether you need a quick moment of calm during a busy day or a longer meditation session to unwind, this app has got you covered.",
    "But that's not all! This app also includes motivational self-talk to help you start your day off on the right foot.",
    "With inspiring messages and affirmations designed to boost your energy and enthusiasm, you'll be ready to take on any challenge that comes your way.",
    "So, if you're looking for a way to reduce stress, boost your mood, and stay motivated throughout the day, I highly recommend giving this app a try.",
    "So why not you try it today and see how it can help you live your best life?"
]

