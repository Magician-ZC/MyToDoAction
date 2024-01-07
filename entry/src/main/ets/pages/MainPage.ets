import router from '@ohos.router'
import TodoItemUI from '../ui/TodoItemUI'
import AppData from '../ui_model/AppData'
import AppUtil from '../util/APPUtil'

let usernameInfo  = router.getParams()['userInfo']

@Entry
@Component
struct MainPage {

  private tasksData : string[] = []


  aboutToAppear(){
    this.tasksData = AppData.provideData()
  }

  build() {
    Row() {
      Column({space:20}) {
        Text(`欢迎${usernameInfo}登录进来操作！`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)

        ForEach(this.tasksData,(item)=>{
          TodoItemUI({value:item})
        },item => JSON.stringify(item ))
      }
      .width('100%')


    }
    .height('100%')
    .backgroundColor(AppUtil.BCK_COL)
    .onClick(()=>{
      router.back()
    })
  }
}