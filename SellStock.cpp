class Solution {
public:
    int maxProfit(vector<int>& prices) {
    int minp = prices[0];
    int maxp = 0;

        for (int price : prices) {
            minp = min(minp, price);
            maxp = max(maxp, price - minp);
        }
        return maxp;
};
};
