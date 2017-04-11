#! /bin/env sh

for file in $(ls); do
	if [ "${file}" != "${0}" ]; then 
		strfile ${file}
	fi
done

exit 0
