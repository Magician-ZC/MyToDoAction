import router from '@ohos.router'
import { FoodInfo } from '../ui_model/FoodInfo'
@Entry
@Component
struct FoodDetail {
  private foodInfo = (router.getParams() as {foodInfo: FoodInfo}).foodInfo

  build() {
      Column() {
        PageTitle({ foodInfo:this.foodInfo })
        FoodImage({foodInfo:this.foodInfo})
        Content({foodInfo:this.foodInfo})
      }
      .height('100%')
      .backgroundColor(Color.Grey)
  }
}


@Component
struct PageTitle{
  foodInfo:FoodInfo
  build(){
    Row(){
      Image($r('app.media.ic_public_back'))
        .width(22)
        .height(22)
        .onClick(()=>{
          router.back()
        })
        .margin({right:10})

        Text(`${this.foodInfo.name}详情页`).fontSize(28).fontColor(Color.Green)
    }
    .width('100%')
    .margin({top:10})
    .padding({left:20})
    .justifyContent(FlexAlign.Start)

  }
}

@Component
struct FoodImage{
  foodInfo: FoodInfo
  build(){
    Column(){
      Image(this.foodInfo.img).objectFit(ImageFit.Contain)
        .width('80%')
    }
    .height(200)
  }
}

@Component
struct Content{
  foodInfo: FoodInfo
  build(){
    Column(){
      this.LineContent('#ffaaaa','热量',this.foodInfo.rl,'千卡')
      this.LineContent('#aaffaa','营养元素',this.foodInfo.yy,'克')
      this.LineContent('#aaaaff','脂肪',this.foodInfo.zf,'克')
    }
    .width('90%')
    .margin({top:20,bottom:20})
    .padding(20)
    .borderRadius(10)
    .backgroundColor(Color.White)
  }

  @Builder
  LineContent(color:ResourceColor,name:string,count:number,unit:string){
    Row(){
      Circle({width:6,height:6})
        .margin({right:12})
        .fill(color)
      Text(name).fontSize(22).fontColor(0x3E3E3E)
      Blank()
      Text(count+' '+unit).fontSize(22).fontColor(0x3E3E3E)
    }
    .width('100%')
    .margin(10)
    .padding({left:10,right:10})
  }

}