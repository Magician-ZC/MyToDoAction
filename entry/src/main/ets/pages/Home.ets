import { FoodInfo } from '../ui_model/FoodInfo'
import router from '@ohos.router'
@Entry
@Component
struct Home {
  @State cTabIndex : number = 0

  build() {
    Tabs(){
      TabContent(){
        Foods()
      }
      .tabBar(this.bar('首页',$r('app.media.home_selected'),$r('app.media.home_normal'),0))

      TabContent(){
        Text('此功能开发中...')
          .fontSize(20)
          .fontColor(Color.Black)
      }
      .tabBar(this.bar('我的',$r('app.media.mine_selected'),$r('app.media.mine_normal'),1))
    }
    .barPosition(BarPosition.End)
    .onChange((index)=>{
      this.cTabIndex = index
    })
  }

  @Builder
  bar(name: string,selectIcon: Resource,normalIcon: Resource,index: number){
    Flex({
      direction: FlexDirection.Column,
      alignItems:ItemAlign.Center,
      justifyContent:FlexAlign.Center
    }){
      Image(this.cTabIndex == index?selectIcon:normalIcon)
        .width(26)
        .height(26)

      Text(name)
        .fontColor(this.cTabIndex === index? Color.Blue:Color.Black)
        .fontWeight(this.cTabIndex === index? FontWeight.Bold:FontWeight.Normal)
        .fontSize(this.cTabIndex === index? 16:12)
    }
  }
}

@Component
struct  Foods{
  @State cIndex : number = 0

  private categories: Array<{id:number,name:string}> = [
    {id:1,name:'蔬菜'},
    {id:2,name:'水果'},
    {id:3,name:'坚果'},
    {id:4,name:'海鲜'}
  ]

  private foods : Array<FoodInfo> = [
    {
      id:0,
      name:'西红柿',
      kk:15,
      category:1,
      img:$r('app.media.tomato'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:1,
      name:'核桃',
      kk:16,
      category:3,
      img:$r('app.media.walnut'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:2,
      name:'黄瓜',
      kk:16,
      category:1,
      img:$r('app.media.cucumber'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:3,
      name:'蓝莓',
      kk:57,
      category:2,
      img:$r('app.media.blueberry'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:4,
      name:'螃蟹',
      kk:97,
      category:4,
      img:$r('app.media.crab'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:5,
      name:'冰淇淋',
      kk:150,
      category:5,
      img:$r('app.media.icecream'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:6,
      name:'洋葱',
      kk:40,
      category:1,
      img:$r('app.media.onion'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:7,
      name:'蘑菇',
      kk:20,
      category:1,
      img:$r('app.media.mushroom'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:8,
      name:'猕猴桃',
      kk:61,
      category:2,
      img:$r('app.media.kiwi'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:9,
      name:'火龙果',
      kk:55,
      category:2,
      img:$r('app.media.pitaya'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:10,
      name:'草莓',
      kk:32,
      category:2,
      img:$r('app.media.strawberry'),
      rl:0,
      yy:0,
      zf:0
    },
    {
      id:11,
      name:'牛油果',
      kk:171,
      category:2,
      img:$r('app.media.avocado'),
      rl:0,
      yy:0,
      zf:0
    }
  ]

  build(){

    Tabs(){
      TabContent(){
        Grid(){
          ForEach(this.foods,(item,index)=>{
            GridItem(){
              FoodItem({ food: item })
            }
          })
        }
        .columnsTemplate('1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
      }
      .tabBar(this.bar('全部',0))

      ForEach(this.categories,(item,index)=>{
        TabContent(){
          Grid(){
            ForEach(this.foods.filter(food => food.category === this.cIndex),(item,index)=>{
              GridItem(){
                FoodItem({ food: item })
              }
            })
          }
          .columnsTemplate('1fr 1fr')
          .rowsGap(10)
          .columnsGap(10)
        }
        .tabBar(this.bar(item.name,item.id))
      })
    }
    .width('90%')
    .onChange((index)=>{
      this.cIndex = index
    })
  }

  @Builder
  bar(name: string,index: number){
    Flex({
      direction: FlexDirection.Column,
      alignItems:ItemAlign.Center,
      justifyContent:FlexAlign.Center
    }){
      Text(name)
        .fontSize(this.cIndex == index ? 24 : 14)
        .fontColor(this.cIndex == index ?Color.Green:Color.Black)
        .margin(2)
    }
  }
}

@Component
struct FoodItem{
  private food: FoodInfo
  build(){
    Column(){
      Image(this.food.img)
        .width('100%')
        .height(152)
        .backgroundColor('#ff5c9fe2')
        .objectFit(ImageFit.Contain)
      Row(){
        Text(this.food.name)
          .fontSize(16)
          .fontColor(0x3E3E3E)
        Blank()
        Text(this.food.kk + ' 千卡')
          .fontSize(16)
          .fontColor(0x3E3E3E)
      }
      .width('100%')
      .height(32)
      .backgroundColor('#ff13e9be')
      .padding({
        left:12,
        right:12
      })
    }
    .clip(new Rect({width:'100%',height:'100%',radius:6}))
    .onClick(()=>{
      router.pushUrl({
        url:'pages/FoodDetail',
        params:{
          foodInfo:this.food
        }
      })
    })
  }
}