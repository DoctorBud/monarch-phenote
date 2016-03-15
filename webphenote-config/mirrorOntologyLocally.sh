# See: https://github.com/owlcollab/owltools/wiki/Import-Chain-Mirroring

export CACHEDIR=`pwd`/cached-models
export CATALOG=./catalog.xml
export OWLTOOLS_JAR="/opt/owltools/OWLTools-Runner/bin/owltools-runner-all.jar"
export OWLTOOLS="java -Xms3000m -Xmx5500m -DentityExpansionLimit=4086000 -Djava.awt.headless=true -jar ${OWLTOOLS_JAR}"

export ROOT=http://purl.obolibrary.org/obo/upheno/monarch.owl
# export ROOT=http://purl.obolibrary.org/obo/so.owl

mkdir -p $CACHEDIR

$OWLTOOLS \
	$ROOT \
	--slurp-import-closure \
	-d $CACHEDIR \
	-c $CATALOG \
	> $CACHEDIR/mirror.log

echo ""
echo ""
cat $CACHEDIR/mirror.log