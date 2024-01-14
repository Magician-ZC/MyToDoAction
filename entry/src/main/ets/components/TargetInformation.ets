@Component
export default struct TargetInformation{

  @Builder
  targetItem(){
    Row(){
      Image($r('app.media.fig4'))
        .width('96')
        .height('96')
        .objectFit(ImageFit.Fill)
        .borderRadius(18)
      Column(){
        Text("第一季度运营目标")
          .fontSize('18fp')
          .fontWeight(700)
        Text("实现用户用户量与活跃度提升")
          .opacity(0.4)
          .fontSize('15')
          .margin({top:'12'})
      }
      .alignItems(HorizontalAlign.Start)
      .margin({left:15})
    }
  }

  @Builder
  targetProgress(){
    Row(){
      Column(){
        Text('整体进度')
          .fontSize(16)
          .fontColor(Color.Black)
          .fontWeight(600)
        Text('更新时间：2023/12/20 23:29:01')
          .opacity(0.4)
          .fontSize('12')
          .fontWeight(600)
      }
      .alignItems(HorizontalAlign.Start)

      Stack(){
        Row(){
          Text('0')
            .fontSize('14')
            .fontWeight(400)
            .fontColor('#007dff')
          Text('/1')
            .fontSize(14)
            .fontWeight(500)
        }
        Progress({
          value:1,
          total:100,
          type:ProgressType.Ring
        })
          .color('#007dff')
          .style({
            strokeWidth:6
          })
          .width('48')
          .height('48')
      }
    }
    .margin({top: 10})
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build(){
    Column(){

      this.targetItem()
      this.targetProgress()
    }
    .backgroundColor('#ffffff')
    .borderRadius(14)
    .padding(15)
  }
}