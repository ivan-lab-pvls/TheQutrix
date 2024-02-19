import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:financial_app/model/income_item.dart';
import 'package:financial_app/model/expense_item.dart';
import 'package:financial_app/model/news_item.dart';
import 'package:financial_app/model/user.dart';
import 'package:financial_app/pages/add_transactions_page.dart';
import 'package:financial_app/pages/full_news_page.dart';
import 'package:financial_app/pages/news_page.dart';
import 'package:financial_app/pages/operations_page.dart';
import 'package:financial_app/pages/profile_page.dart';
import 'package:financial_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<NewsItem> newsList = [
  NewsItem(
    title: 'America’s Economy Slowed—It Probably Won’t Stumble',
    author: 'Aaron Back',
    text:
        'The U.S. economy took a breather in January following brisk growth at the end of last year, but it remains fundamentally healthy.Retail sales fell 0.8% in January from December, the Commerce Department said Thursday—much worse than expectations for a 0.3% decline. Also Thursday, Federal Reserve data showed January industrial production edging down 0.1% compared with expectations for a 0.2% increase. Technical issues with how the retail sales data was seasonally adjusted might have weighed on the reading, and cold weather in January likely had an impact on both retail sales and industrial production. But those factors don’t explain away all the weakness. ',
    date: '02/16/2024',
    image: 'https://images.wsj.net/im-926123?width=700&size=1.4988290398126465',
  ),
  NewsItem(
    title: 'Tokyo supermarket stocks more chicken for inflation-weary shoppers',
    author: 'Tim Kelly',
    text:
        'TOKYO (Reuters) - Hiromichi Akiba is stocking his Tokyo supermarket with more chicken because customers who used to buy beef are switching to cheaper meat as rising prices put a squeeze on their spending, his business and Japan\'s economy. Japan unexpectedly fell into recession at the end of last year as domestic consumption, which accounts for more than half of the nation\'s economy, faltered. The 0.4% fall in economic output on an annualised basis in the three months to December means that Germany, rather than Japan, is now the world\'s third-biggest economy behind the United States and China. It isn\'t the first economic downturn Akiba has faced. He opened his store in 1992 as the economic boom that made Japan the world\'s No. 2 economy gave way to stagnation. It is, however, one of the toughest yet as inflation and a sustained depreciation of the Japanese yen push up labour, transport and energy costs that are difficult to pass on to the shoppers who come to his discount supermarket looking for bargains. "Customers used to come with lists knowing what they wanted to buy, but now more are deciding what to get after seeing what is cheap," he said at his store in a Tokyo suburb next to baskets offering quartered Chinese cabbage heads for 52 cents and crowns of broccoli for 67 cents.',
    date: '02/16/2024',
    image:
        'https://s.yimg.com/ny/api/res/1.2/4O25UZMRynyzj.nJSxdgpg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ0Mg--/https://media.zenfs.com/en/reuters-finance.com/b2a210f7be89e099fd7452c3a3820008',
  ),
  NewsItem(
    title: 'Oil Holds Large Gain as Equity Market Surge Eclipses IEA Warning',
    author: 'Yongchang Chin',
    text:
        'Brent crude traded just below \$83 a barrel after rising 1.5% on Thursday, while West Texas Intermediate was near \$78, near its highest close since mid-November. Oil’s gains came as US equities closed at another record and the dollar eased, making commodities more attractive for overseas buyers. Crude is trading close to the upper end of the tight range that it’s been in this year, with both benchmarks on course for their fourth weekly gains in the past five. Still, there are concerns highlighted by the Paris-based International Energy Agency that oil markets could be in surplus all year as global demand growth loses steam. OPEC+ has been implementing supply cuts to support prices. Russia has nearly reached its target for voluntary reductions for the first time since making the pledge last year, according to Bloomberg calculations based on official data for January. Elsewhere, Iraq and Kazakhstan have pledged compliance with their targets after failing to fully cut production as promised last month. In the Middle East, exchanges of fire between Hezbollah and Israel intensified in a further escalation of the week’s cross-border fire that’s raising alarm of a wider war. In Gaza, Israel arrested dozens of Hamas combatants in Nasser Hospital, with grenades and mortar shells found.',
    date: '01/16/2024',
    image:
        'https://s.yimg.com/ny/api/res/1.2/vcQuHMFMKspni0qGy_l8WA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTM5Nw--/https://media.zenfs.com/en/bloomberg_markets_842/938230178f2dffa8a15bfe49b4a3201b',
  ),
  NewsItem(
    title:
        'Gabon to buy Carlyle\'s oil business, preempting \$1.3 billion sale',
    author: 'Ron Bousso',
    text:
        'LONDON (Reuters) - Gabon\'s national oil company has agreed to acquire Carlyle\'s Assala Energy after it used its right to preempt the sale of the business for \$1.3 billion to France\'s Maurel & Prom, the firms said on Friday.Maurel & Prom had agreed in August to acquire Assala Energy for \$730 million, a deal which also included rolling over a \$600 million credit facility. But following a military coup in the west African country in late August, the Gabonese national oil firm sought to exercise its preemptive right on the acquisition in November. The French energy company Maurel & Prom said the new purchase agreement to Gabon Oil Company "supersedes" the deal it had made with the private equity giant. Carlyle said the terms of the new deal were "materially the same". Maurel & Prom shares were little changed at 0910 GMT. Carlyle\'s non-U.S. energy arm CIEP first invested in Assala in 2017 when it acquired Shell\'s ageing operations in Gabon for \$628 million. Gabon produces about 200,000 barrels a day (bpd) of crude oil, making it the second-smallest OPEC producer. Assala has increased its production in the African country by 30% since the 2017 acquisition to 45,000 bpd, and has also increased the size of its oil and gas reserves by 160% through exploration, Carlyle said last August.',
    date: '02/16/2024',
    image:
        'https://s.yimg.com/ny/api/res/1.2/N9qZ8kW0gEpO8XNt4rf0nQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ1MQ--/https://media.zenfs.com/en/reuters-finance.com/d0ad081cdc9bae6a90d4e80a0c405b88',
  ),
  NewsItem(
    title:
        'Algeria\'s black market for foreign currency underlines its economic woes',
    author: 'Tim Kelly',
    text:
        'The widening parallel exchange rate underscores how everyday Algerians have lost buying power as the government has juggled competing priorities, trying to combat inflation and maintain state spending, subsidies and price controls that keep people afloat. In the oil-rich North African nation, business owners are rumored to be dumping their assets and scrounging up euros on the black market so their wealth isn\'t stuck. Middle-class people also rely on euros and dollars to buy things in short supply like medicine, vehicle parts or certain foods.Last week, the official exchange rate allowed one euro to be sold for 145 Algerian dinar, while on the same day, currency traders were selling one euro for nearly 241 dinars on the black market — 66% higher than the official exchange rate. Rabah Belamane, a 72-year-old retired teacher from Algiers, told The Associated Press that the official rate is a fiction and that his pension doesn\'t go as far as it used to in either dinar or euro. “The real value of the dinar is on the informal market, not in the bank, which uses an artificial rate to lie to the public," Belamane said.',
    date: '02/16/2024',
    image:
        'https://s.yimg.com/ny/api/res/1.2/dB6Oqr9uCoasi6DnJ_yh9Q--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ3MA--/https://media.zenfs.com/en/ap_finance_articles_694/72b781ac3f2155084b0ed2b90cecddfe',
  ),
  NewsItem(
    title: 'Australians Opt for Chicken Over Pricey Steak as Inflation Bites',
    author: 'Keira Wright ',
    text:
        'Poultry producer Inghams Group Ltd reported a 268.6% spike in net income from 12 months earlier, half-year results showed Friday. Earnings before interest, taxes, depreciation and amortization climbed 28.8%. The result was driven in-part by consumers switching to relatively cheaper chicken and choosing to eat at home in response to soaring costs for everything from mortgage repayments to rents and gasoline. “While there has been a significant acceleration in inflation in recent times which has seen poultry prices rise, poultry continues to be the protein of choice and remains significantly more affordable than red meat,” Inghams said in its earnings statement. The firm reckons it produces 440 million kilograms of chicken a year, mostly sold in Australia and New Zealand. Poultry prices in Australia fell 1.4% in the final three months of 2023 from the prior quarter, according to Bloomberg’s proprietary Barbecue Index. While it showed beef slid about 1.5% and lamb more than 12%, both came down from higher levels.',
    date: '02/16/2024',
    image:
        'https://s.yimg.com/ny/api/res/1.2/L68wvCRX5M.sK.cEHzfagg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTM5Nw--/https://media.zenfs.com/en/bloomberg_markets_842/4e8c1e2011183075c055c30c97befc88',
  ),
  NewsItem(
    title: 'Guyana Is Trying to Keep Its Oil Blessing From Becoming a Curse',
    author: 'Patricia Laya',
    text:
        'Guyana has undergone a huge transformation in the near decade since a massive oil discovery off its shores. That’s on full display at the Georgetown Marriott hotel. By sundown, oil executives in branded shirts step out of vans and mingle with tables of development bank officials, already debriefing over yucca balls and iced beers. A basic room at the chronically sold-out hotel can cost more than \$600 on an average night in January. Those prices nearly triple by the time Guyana’s annual oil conference starts in mid-February, drawing in big energy CEOs and world leaders to the tiny nation of 800,000. The arrival of the “Marriott crew” is a sign of the change that’s swept the country since Exxon Mobil Corp. struck oil in its waters in 2015. New wells pump out 645,000 barrels everyday, which resulted in \$1.6 billion in revenue for Guyana’s government in 2023. The nation’s economy quadrupled in size over the last five years, going from one of the lowest performing in the region to the fastest growing in the world for two years straight. The oil deposits are so large relative to Guyana’s population that some projections show it overtaking Kuwait to become the world’s largest per-capita crude producer, accounting for 16% of net growth in oil supply through 2028.',
    date: '02/16/2024',
    image:
        'https://s.yimg.com/ny/api/res/1.2/ypIaxz8sYuP.yGutVp0WLQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ3MA--/https://media.zenfs.com/en/bloomberg_markets_842/47be78ea519112d6d78098417638f0b4',
  ),
  NewsItem(
    title: 'Marketmind: Rate hopes trump economic jitters',
    author: 'Jamie McGeever',
    text:
        'Asian stocks are on track for their fourth weekly rise in a row if they can avoid falling more than 1% on Friday, which would mark the longest winning streak in over a year. The regional and global backdrop for Asian markets on Friday looks relatively supportive, at least from an interest rate perspective, if not an economic one. Figures on Thursday showed that Japan and Britain slipped into recession at the end of last year, and U.S. retail sales last month fell much more than expected. But the upshot of that could be relatively looser monetary policy. That\'s how it played out on Wall Street and in Japan on Thursday - the Nikkei chalked up another 34-year high to come within 1,000 points of its all-time peak, as traders bet that Japan\'s shock slide into recession will force the Bank of Japan to go slow on normalizing monetary policy. The Nikkei is the stock market darling of the year, up a staggering 14% since Jan. 1. The yen\'s fall through 150.00 per dollar to within sight of its recent 33-year low has been a key driver of the Nikkei\'s rally, but not on Thursday - it got swept along in the global wave of non-dollar currency appreciation.',
    date: '02/16/2024',
    image:
        'https://s.yimg.com/ny/api/res/1.2/PdIRsxTz.OSnhdekCT9aSw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ4OA--/https://media.zenfs.com/en/reuters-finance.com/83c1edaac406eb7993dfaafe4fa546d4',
  ),
  NewsItem(
    title:
        'Recession has struck some of the world\'s top economies. The US keeps defying expectations',
    author: 'STAN CHOE',
    text:
        'Both Japan and the United Kingdom said Thursday their economies likely weakened during the final three months of 2023. For each, it would be the second straight quarter that’s happened, which fits one lay definition for a recession. Yet in the United States, the economy motored ahead in last year’s fourth quarter for a sixth straight quarter of growth. It’s blown past many predictions coming into last year that a recession seemed inevitable because of high interest rates meant to slow the economy and inflation. Give much of the credit to U.S. households, who have continued to spend at a solid rate despite many challenges. Their spending makes up the majority of the U.S. economy. Government stimulus helped households weather the initial stages of the pandemic and a jump in inflation, and now pay raises are helping them catch up to high prices for the goods and services they need. On Thursday, a report showed that fewer U.S. workers filed for unemployment benefits last week. It’s the latest signal of a remarkably solid job market, even though a litany of layoff announcements has grabbed attention recently. Continued strength there should help prop up the economy.',
    date: '02/15/2024',
    image:
        'https://s.yimg.com/ny/api/res/1.2/qNcjzrl1b.kB10dBWugajA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ3MA--/https://media.zenfs.com/en/ap_finance_articles_694/e65cbcd8d306a42bbe0976c78d3030cc',
  ),
  NewsItem(
    title: 'Oil Rises as Risk-On Mood Overpowers IEA’s Demand Warning',
    author: 'Julia Fanzeres',
    text:
        'West Texas Intermediate gained 1.8% to settle above \$78 a barrel, erasing Wednesday’s decline, as equities advanced and the dollar fell for a second day. The weakening US currency, which makes the commodity cheaper for overseas buyers, encouraged money managers to buy the dip, traders said. Earlier in the session, prices fell after the Paris-based IEA said the crude market could be in surplus all year, pointing to expanding non-OPEC+ supplies and a slowdown in consumption. Even after the advance, crude remains in the \$10 range it has been stuck in this year. Tensions in the Middle East and efforts by OPEC+ to curb production have been countered by robust supplies from drillers outside the cartel and concerns worldwide demand growth will slow over 2024. Another headwind has come from expectations that US interest rates could remain higher for longer as inflation persists. Still, market metrics continue to signal tight conditions, with timespreads for both major benchmarks holding in a bullish, backwardated structure despite shrinking slightly. Refiners’ profits from making fuels like diesel and gasoline also remain elevated.',
    date: '02/15/2024',
    image:
        'https://s.yimg.com/ny/api/res/1.2/_R87ltuq1gAGVlCWAeFlAg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ3MA--/https://media.zenfs.com/en/bloomberg_markets_842/fed0b30474799769c4343258cf5b5320',
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IncomeItem> incomeList = [];
  List<ExpenseItem> expenseList = [];
  @override
  void initState() {
    super.initState();
    getExpensesIncomesUserSP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        getContent(),
        Column(
          children: [
            if (page == EPageOnSelect.operationsPage)
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  AddTransactionsPage(
                                    callBackIncome: (income) {
                                      incomeList.add(income);
                                      addExpensesIncomesUserSP(
                                          expenseList, incomeList, user);
                                      setState(() {});
                                    },
                                    callBackExpense: (expense) {
                                      expenseList.add(expense);
                                      addExpensesIncomesUserSP(
                                          expenseList, incomeList, user);
                                      setState(() {});
                                    },
                                  )),
                        );
                      },
                      child: Container(
                        height: 56,
                        width: 56,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            color: Color(0xFFAA69DE), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            BottomBar(
              callBack: () {
                setState(() {});
              },
            ),
          ],
        )
      ]),
    );
  }

  Widget getContent() {
    if (page == EPageOnSelect.homePage) {
      return Expanded(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 65, 16, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hello, have a nice day!',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 181,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover, image: AssetImage('assets/5.png')),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 31),
                      child: Column(
                        mainAxisAlignment:
                            incomeList.isEmpty && expenseList.isEmpty
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                        children: [
                          if (incomeList.isEmpty && expenseList.isEmpty)
                            const Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'This will show your income and expenses when you make the entry',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          if (incomeList.isNotEmpty || expenseList.isNotEmpty)
                            const Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      'This month\'s income',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Inter',
                                          color: Color(0xFFF0F0F0),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (incomeList.isNotEmpty || expenseList.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      '\$ ${getTotalIncomes()}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (incomeList.isNotEmpty || expenseList.isNotEmpty)
                            const Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      'This month\'s expense',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Inter',
                                          color: Color(0xFFF0F0F0),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (incomeList.isNotEmpty || expenseList.isNotEmpty)
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '\$ ${getTotalExpenses()}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset('assets/IMG.png')
                ]),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'News',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: getNews(),
            )
          ],
        )),
      );
    } else if (page == EPageOnSelect.profile) {
      return const ProfilePage();
    } else if (page == EPageOnSelect.operationsPage) {
      return OperationsPage(
        expenses: expenseList,
        incomes: incomeList,
      );
    } else if (page == EPageOnSelect.newsPage) {
      return NewsPage(
        callBack: () {
          setState(() {});
        },
      );
    } else {
      return const Expanded(
        child: Column(),
      );
    }
  }

  Widget getNews() {
    List<Widget> list = [];

    for (var news in newsList) {
      list.add(InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => FullNewsPage(
                      news: news,
                      callBack: () {
                        setState(() {});
                      },
                    )),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
              color: const Color(0xFFf7f3fb),
              borderRadius: BorderRadius.circular(4)),
          child: Row(children: [
            Container(
              height: 112,
              width: 112,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      topLeft: Radius.circular(4)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        news.image!,
                      ))),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            news.title!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Read more',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: Color(0xFFAA69DE),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  String getTotalExpenses() {
    double cost = 0;
    for (var expense in expenseList
        .where((element) => element.date!.month == DateTime.now().month)) {
      cost = cost + expense.cost!;
    }
    return cost.toStringAsFixed(0);
  }

  String getTotalIncomes() {
    double cost = 0;
    for (var income in incomeList
        .where((element) => element.date!.month == DateTime.now().month)) {
      cost = cost + income.cost!;
    }
    return cost.toStringAsFixed(0);
  }

  Future<void> addExpensesIncomesUserSP(List<ExpenseItem>? expensesList,
      List<IncomeItem>? incomeList, UserItem? user) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.clear();

    if (user != null) {
      prefs.setString('user', jsonEncode(user));
    }
    if (expensesList != null) {
      prefs.setString('expensesLists', jsonEncode(expensesList));
    }
    if (incomeList != null) {
      prefs.setString('incomeLists', jsonEncode(incomeList));
    }
  }

  void getExpensesIncomesUserSP() async {
    final prefs = await SharedPreferences.getInstance();
    final List<dynamic> jsonData2 =
        jsonDecode(prefs.getString('expensesLists') ?? '[]');
    final List<dynamic> jsonData3 =
        jsonDecode(prefs.getString('incomeLists') ?? '[]');
    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      user = UserItem.fromJson(userMap);
    }

    expenseList = jsonData2.map<ExpenseItem>((jsonList) {
      {
        return ExpenseItem.fromJson(jsonList);
      }
    }).toList();
    incomeList = jsonData3.map<IncomeItem>((jsonList) {
      {
        return IncomeItem.fromJson(jsonList);
      }
    }).toList();

    setState(() {});
  }
}
