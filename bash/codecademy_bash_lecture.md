# Codecademy Bash Lecture
## Shebang
텍스트 파일이 excutable로 실행될 때 셔뱅에 명시된 인터프리터에 파일의 경로를 인자로 넘김.

ex) #!/bin/sh로 시작하는 파일이 path/to/script에 있을 때 `/bin/sh path/to/script`가 실행된다.

## Tips
자주 쓰이는 스크립트를 ~/bin 디렉토리에 저장하라.

`chmod +x script.sh`로 excutable하게 만들기.

터미널 켜질 때 자동으로 실행되는 파일

리눅스: `~/.bashrc`, 맥OS: `~/.bash_profile`

`PATH=~/bin:$PATH`를 위 파일에 넣으면 ~/bin 안 스크립트의 파일 이름으로 언제든 실행 가능하다

## Variable
변수를 선언 & 대입할 때는 `variable=value`. = 양쪽에 띄어쓰기 없다.

변수 참조할 때는 $를 prefix로

## if문
```bash
if [ $index -lt 5 ]
then
  echo $index
else
  echo 5
fi
```

## 비교연산자
수 비교: `-eq`, `-ne`, `-le`, `-lt`, `-ge`, `-gt`, `-z`(is_null)

문자열 비교: `==`, `!=`

문자열을 비교할 때는 변수를 double quote로 감싸자. null이나 공백이 포함된 문자열로부터 오는 에러를 예방한다.

ex) `if [ "$foo" == "$bar" ]` # 변수 foo와 bar를 비교

## 루프
### for
```bash
for word in $paragraph # word는 여기서 선언되는거라 $ prefix 없음
do
  echo $word
done
```

### while, until
while은 조건이 참일 동안, until은 거짓일 동안
```bash
while [ $index -lt 5 ]
do
  echo $index
  index=$((index + 1)) # 산술 연산은 $(())로 감쌈. 그 안에서 $ prefix 없음
done

until [ $index -ge 5 ]
do
  echo $index
  index=$((index + 1))
done
```

## Input
### stdin 받기
```bash
read variable
echo $variable
```

### argument 받기
$1, $2, ...

$0는 스크립트 이름

"$@"을 통해 여러 개 인자를 받을 수 있음
```bash
for var in "$@"
do
  echo $var
done
```

### 외부 file 접근하기
```bash
files=/some/directory/*
for file in $files
do
  echo $file # file path를 출력
done
```

## Alias
in .bashrc or .bash_profile
```bash
alias some_script='./some_script.sh'
alias script_with_input='./script_with_input.sh "input"'
```


## Example
source 디렉토리의 파일을 credentailinfo.md 빼고 build 디렉토리에 복사하는 스크립트

```bash
#!/bin/bash
echo "Moving files from source to build except for credential files."
firstline=$(head -n 1 ./source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo $version

echo "Continue? (1 for yes, 0 for no)"
read versioncontinue
if [ "$versioncontinue" == "1" ]
then
  echo "OK"
  files=./source/*
  for file in $files
  do
    if [ "$file" == "./source/secretinfo.md" ]
    then
      echo "$file is not copied."
    else
      cp $file ./build
      echo "$file is copied to ./build"
    fi
  done
  ls 
else
  echo "Please come back when you are ready"
fi
```
