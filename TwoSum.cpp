class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int, int> map;
        for (int i = 0; i < nums.size(); i++) {
            map[nums[i]] = i;
        }
        for (int j = 0; j < nums.size(); j++)
        {
            if (map.count(target - nums[j]) && map[target - nums[j]] != j)
                return {j, map[target - nums[j]]};
        }
        return {};
    }
};
