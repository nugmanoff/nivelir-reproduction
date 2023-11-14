Возник такой кейс, где нужно найти последний контроллер определенного типа (или ключа) из стэка и показать его, либо если не найден такой то запушить его

## Сценарий 1: 

Предыдущий экран является тем, который нам нужно показать (Parent):

```
Root - Parent - Child
```

поэтому вместо того, чтобы сразу пушить мы сначала пытаемся найти его (Parent) и сделать его visible, получая такой стэк:

```
Root - Child
```

## Cценарий 2:

Предыдущий экран **не** является тем, который нам нужно показать (Parent):

```
Root - Child
```

Поэтому мы просто пушим его на стэк получая:

```
Root - Child - Parent
```

Пытаюсь сделать

```swift
navigator.navigate(from: stack) { route in
                route
                    .last(.container(key: screen.key))
                    .makeVisible()
                    .fallback(
                        to: route.push(screen)
                    )
            }
```

т.е. нахожу последний контейнер по ключу и пытаюся сделать его видимым (makeVisible) если нет, то пушу его

но почему-то он не находит такой контроллер в стэке, хотя ключ передаю, ключ соответствует

в чем может быть причина? 

есть подозрения на то, что в целом вызываю поиск с неправильного роута (сейчас from: stack)
