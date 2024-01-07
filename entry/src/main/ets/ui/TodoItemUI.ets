@Component
export default struct TodoItemUI{

  @State isOk : boolean = false

  value ? : string

  build(){
    Row({space:20}){
      if(this.isOk){
        //已经完成待办事项
        Image($r('app.media.ic_ok')).TodoItemUI_img()
      }else {
        //未完成待办事项
        Image($r('app.media.ic_default')).TodoItemUI_img()
      }
      Text(this.value)
        .fontSize(22)
        .decoration({type: this.isOk ? TextDecorationType.LineThrough : TextDecorationType.None})
        .opacity(this.isOk? 0.4 : 1)
    }
    .TodoItemUI_row()
    .onClick(()=>{
      this.isOk = !this.isOk
    })
  }
}

@Extend(Row) function TodoItemUI_row(){
  .width('90%')
  .height(50)
  .backgroundColor(Color.White)
  .borderRadius(25)
}

@Extend(Image) function TodoItemUI_img(){
  .width(30)
  .height(30)
  .objectFit(ImageFit.Contain)
  .margin(10)
}