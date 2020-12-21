#!/bin/bash
RES=$(curl -s -w '\n' http://localhost:3000/pow/0/0)

if [ "$RES" == '{"operator":"pow","error":"Zero to non positive power","arguments":[0,0],"result":null}' ]; then  
echo "POW/0/0 test passed"
else
echo "POW/0/0 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/pow/10/2)

if [ "$RES" == '{"operator":"pow","error":null,"arguments":[10,2],"result":100}' ]; then  
echo "POW/10/2 test passed"
else
echo "POW/10/2 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/pow/2/3.5)

if [ "$RES" == '<h1>404: File Not Found!</h1>' ]; then  
echo "POW/2/3.5 test passed"
else
echo "POW/2/3.5 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/sqrt/-2)

if [ "$RES" == '{"operator":"sqrt","error":"Sqrt from negative number","arguments":[-2],"result":null}' ]; then  
echo "SQRT/-2 test passed"
else
echo "SQRT/-2 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/sqrt/25)

if [ "$RES" == '{"operator":"sqrt","error":null,"arguments":[25],"result":5}' ]; then  
echo "SQRT/25 test passed"
else
echo "SQRT/25 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/sqrt/14)

if [ "$RES" == '{"operator":"sqrt","error":null,"arguments":[14],"result":3.7416575}' ]; then  
echo "SQRT/14 test passed"
else
echo "SQRT/14 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/div/10.2/2.5)

if [ "$RES" == '{"operator":"div","error":null,"arguments":[10.2,2.5],"result":4.08}' ]; then  
echo "DIV/10.2/2.5 test passed"
else
echo "DIV/10.2/2.5 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/div/10.2/0)

if [ "$RES" == '{"operator":"div","error":"Division by zero","arguments":[10.2,0],"result":null}' ]; then  
echo "DIV/10.2/0 test passed"
else
echo "DIV/10.2/0 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/mul/10.2/2.5)

if [ "$RES" == '{"operator":"mul","error":null,"arguments":[10.2,2.5],"result":25.5}' ]; then  
echo "MUL/10.2/2.5 test passed"
else
echo "MUL/10.2/2.5 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/sub/10.2/2.5)

if [ "$RES" == '{"operator":"sub","error":null,"arguments":[10.2,2.5],"result":7.7}' ]; then  
echo "SUB/10.2/2.5 test passed"
else
echo "SUB/10.2/2.5 test failed"
fi

RES=$(curl -s -w '\n' http://localhost:3000/add/10.2/2.5)

if [ "$RES" == '{"operator":"add","error":null,"arguments":[10.2,2.5],"result":12.7}' ]; then  
echo "ADD/10.2/2.5 test passed"
else
echo "ADD/10.2/2.5 test failed"
fi
