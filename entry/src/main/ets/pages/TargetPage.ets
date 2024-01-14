import CommonConstant from '../common/constant/CommonConstant'
import TargetInformation from '../components/TargetInformation'
@Entry
@Component
struct TargetPage {

  @Builder
  titleBar(){
    Text($r('app.string.title'))
      .height($r('app.float.title_height'))
      .fontSize($r('app.float.title_font_size'))
      .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
      .width(CommonConstant.TITLE_WIDTH)
      .textAlign(TextAlign.Start)
      .margin({
        top:12,
        bottom:12
      })
  }


  build(){
    Column(){
      this.titleBar()

      TargetInformation()

      Column(){

      }
      .border({width:1})
      .width(CommonConstant.FULL_WIDTH)
      .height(CommonConstant.FULL_HEIGHT)
    }
    .height('100%')
    .width('100%')
    .padding({
      left:'12vp',
      right:'12vp'
    })
    .backgroundColor('#F1F3F5')
  }
}