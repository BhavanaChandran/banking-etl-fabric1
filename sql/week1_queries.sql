select type, sum(amount) from testdata group by type;
select type, avg(amount) from testdata group by type;
Select * from testdata where isfraud = 1;
Select type,count(*) from testdata where amount > 10000 group by type;
Select type,count(*) from testdata where newbalancedest = 0 group by type;
