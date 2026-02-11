import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Analytics",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              "Insights into your placement journey",
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 20),

            /// top stats
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                TopStat("5", "Total Applications", Colors.cyan),
                TopStat("1", "Offers Received", Colors.green),
                TopStat("20%", "Success Rate", Colors.orange),
                TopStat("4", "Active Pipeline", Colors.blue),
              ],
            ),

            const SizedBox(height: 25),

            /// DONUT CHART
            sectionCard(
              "Status Distribution",
              SizedBox(height: 250, child: buildPieChart()),
            ),

            const SizedBox(height: 20),

            /// BAR CHART
            sectionCard(
              "Package Distribution",
              SizedBox(height: 250, child: buildBarChart()),
            ),

            const SizedBox(height: 20),

            /// LINE CHART
            sectionCard(
              "Application Trend",
              SizedBox(height: 250, child: buildLineChart()),
            ),

            const SizedBox(height: 20),

            /// SUCCESS GAUGE
            sectionCard(
              "Success Rate",
              SizedBox(height: 220, child: buildGauge()),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------- PIE CHART ----------
  Widget buildPieChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: 3,
        centerSpaceRadius: 50,
        sections: [
          PieChartSectionData(value: 2, color: Colors.blue, title: "Wishlist"),
          PieChartSectionData(value: 1, color: Colors.orange, title: "Applied"),
          PieChartSectionData(value: 1, color: Colors.cyan, title: "Interview"),
          PieChartSectionData(value: 1, color: Colors.green, title: "Selected"),
        ],
      ),
    );
  }

  /// ---------- BAR CHART ----------
  Widget buildBarChart() {
    return BarChart(
      BarChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [BarChartRodData(toY: 1, color: Colors.purple, width: 20)],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [BarChartRodData(toY: 1, color: Colors.purple, width: 20)],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [BarChartRodData(toY: 2, color: Colors.purple, width: 20)],
          ),
        ],
      ),
    );
  }

  /// ---------- LINE CHART ----------
  Widget buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 4),
              FlSpot(1, 3),
              FlSpot(2, 2),
              FlSpot(3, 1),
            ],
            isCurved: true,
            color: Colors.cyan,
            barWidth: 3,
          ),
        ],
      ),
    );
  }

  /// ---------- GAUGE ----------
  Widget buildGauge() {
    return Center(
      child: SizedBox(
        width: 180,
        height: 180,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 180,
              height: 180,
              child: CircularProgressIndicator(
                value: 0.2,
                strokeWidth: 18,
                backgroundColor: Colors.white10,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "20%",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text("Conversion", style: TextStyle(color: Colors.white60)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ---------- CARD ----------
  static Widget sectionCard(String title, Widget child) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF0B1120),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }
}

class TopStat extends StatelessWidget {
  final String number;
  final String label;
  final Color color;

  const TopStat(this.number, this.label, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color(0xFF0B1120),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }
}
