##The Psychic Number Trick
### https://github.com/dbb

Based on this Youtube video: http://www.youtube.com/watch?v=VG_pwSl5utU

The "trick" is that you pick any three-digit number with unique, non-zero digits, do some operations with it, and you always end up with the "magic" result: 1089.


Let x be a three-digit number such that its digits are unique and nonzero. Let `a` be the hundreds place, `b` be the tens, and `c` be the ones. So `x = a*100 + b*10 + c`.

If we reverse the digits of `x`, we get: `c*10^2 + b*10 + a`.
Subtracting this from `x` yields:

```
| a*100 + b*10 + c - c*100 - b*10 - a | =
| (a-c)*100 + c - a | = def
```
Where the letters `def` represet the digits of the difference.

Now we can figure out the digits of the difference of `x - x_reversed = "def"`. The middle digit `b` got canceled out, and then we subtracted a number less than 10 from our total. This means that the middle digit of the new number, `e`, *is always 9*. We carry the 1 over to the hundreds place as well and our hundreds digit, `d`, is `|a-c| - 1`. Finally, the ones digit `f` must be `|10 - |a-c|` because this is the number that we subtracted from our hundreds place. To recap:

```
abc - cba = "def" = d*100 + e*10 + f
d = |a - c| - 1
e = 9
f = 10 - |a - c|
```
Now, on the video, we are told to add this difference to its reverse. The rest of this "trick" is simple algebra:

```
  hundreds            tens   ones                 hundreds           tens   ones
{ ( |a-c| -1]*100 ) + (90) + (10 - |a-c| )}  +  { (10 - |a-c|)*100 + (90) + (|a-c| -1)  }

combine like terms:
(|a-c| - 1)*101 + 90*20 + (10 - |a-c|) *101
180 + 101*{ (|a-c| - 1) + (10 - |a-c|) }
now the |a-c| cancels:
180 + 101*( -1 + 10 )
180 + 101*9 = 180 + 909 = 1089
```

Math: 1. Magic: 0.


