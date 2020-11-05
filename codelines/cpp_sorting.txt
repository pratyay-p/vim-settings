struct Sorting
{
    int n,a[MX];
    void acceptN()
    {
        cin >> n;
    }
    void acceptarray()
    {
        for(int i=0;i<n;i++)
            cin >> a[i];
    }
    bool comp(int x,int y)
    {
        return x < y;
    }
    void Merge(int low, int high, int mid)
    {
    	int i, j, k, temp[high-low+1];
    	i = low;
    	k = 0;
    	j = mid + 1;
    	while (i <= mid && j <= high)
    	{
    		if(comp(a[i],a[j]))
    			temp[k++] = a[i++];
    		else
    			temp[k++] = a[j++];
    	}
    	while (i <= mid)
    		temp[k++] = a[i++];
    	while (j <= high)
    		temp[k++] = a[j++];
    	for (i = low; i <= high; i++)
    		a[i] = temp[i-low];
    }
    void MSrt(int low, int high)
    {
    	int mid;
    	if (low < high)
    	{
    		mid=(low+high)/2;
    		MSrt(low, mid);
    		MSrt(mid+1, high);
    		Merge(low, high, mid);
    	}
    }
    void MergeSort()
    {
        MSrt(0,n-1);
    }
    int Partition(int low, int high)
    {
    	int pivot=high, index=low, i;
    	for(i=low; i < high; i++)
    	{
    		if(a[i] < a[pivot])
    		{
    			swap(a[i], a[index]);
    			index++;
    		}
    	}
	    swap(a[pivot], a[index]);
    	return index;
    }
    int RandomPivotPartition(int low, int high)
    {
    	int pvt, n, temp;
    	n = rand();
    	pvt = low + n%(high-low+1);
    	swap(a[high],a[pvt]);
    	return Partition(low, high);
    }
    void QS(int low, int high)
    {
    	int pindex;
    	if(low < high)
    	{
    		pindex = RandomPivotPartition(low, high);
    		QS(low, pindex-1);
    		QS(pindex+1, high);
    	}
    }
    void QuickSort()
    {
        QS(0,n-1);
    }
};
