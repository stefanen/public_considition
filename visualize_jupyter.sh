
SOLUTION_FILE='static_files/static_solution.json'

cat << EOF
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

fig, ax = plt.subplots()
ax.scatter([0,0,300,300],[0,0,150,150])

EOF

#cat $SOLUTION_FILE | tail -n 1 | jq -c '[ .[] | select( (.z1==0) and .weightClass==2) ]' | jq -c '.[] | "\(.x1),\(.y1),\(.x5),\(.y5)" '  | sed -e 's/"//g' | awk -F, '{print "ax.add_patch(Rectangle(("$1","$2"), "$3-$1","$4-$2",linestyle=\"dotted\",color=\"red\",fill=None))"}'

#cat $SOLUTION_FILE | tail -n 1 | jq -c '[ .[] | select( (.z1==0) and .weightClass!=2) ]' | jq -c '.[] | "\(.x1),\(.y1),\(.x5),\(.y5)" '  | sed -e 's/"//g' | awk -F, '{print "ax.add_patch(Rectangle(("$1","$2"), "$3-$1","$4-$2",linestyle=\"dotted\",color=\"blue\",fill=None))"}'


cat $SOLUTION_FILE | tail -n 1 | jq -c '[ .[] | select( .orderClass==4) ]' | jq -c '.[] | "\(.x1),\(.y1),\(.x5),\(.y5)" '  | sed -e 's/"//g' | awk -F, '{print "ax.add_patch(Rectangle(("$1","$2"), "$3-$1","$4-$2",linestyle=\"dotted\",color=\"red\",fill=None))"}'

cat $SOLUTION_FILE | tail -n 1 | jq -c '[ .[] | select( .orderClass==0) ]' | jq -c '.[] | "\(.x1),\(.y1),\(.x5),\(.y5)" '  | sed -e 's/"//g' | awk -F, '{print "ax.add_patch(Rectangle(("$1","$2"), "$3-$1","$4-$2",linestyle=\"dotted\",color=\"blue\",fill=None))"}'


echo "plt.show()"

