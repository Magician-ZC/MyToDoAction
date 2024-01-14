import router from '@ohos.router'
import AppUtil from '../util/APPUtil'
@Entry
@Component
struct Index {
  @State message: string = '待办事项APP'

  build() {
    Row() {
      Column({space:20}) {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)

        Button("点击进入待办事项的操作中心...")
          .onClick(()=>{
            router.pushUrl({
              url:'pages/MainPage',
              params: {
                userInfo:'zc'
              }
            })
          })

        Button("点击进入健康管理的操作中心...")
          .onClick(()=>{
            router.pushUrl({
              url:'pages/Home'
            })
          })

        Button("点击进入任务的操作中心...")
          .onClick(()=>{
            router.pushUrl({
              url:'pages/TargetPage'
            })
          })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(AppUtil.BCK_COL)
  }
}