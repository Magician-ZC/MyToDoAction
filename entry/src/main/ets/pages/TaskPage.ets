let MyID = 'zc.com.id.test'

@Observed
class Task{
  static id: number = 1
  name: string = `目标${Task.id++}`
  finished:boolean = false
}

@Styles
function card(){
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius:6,color:'#1F000000',offsetX:2,offsetY:4})
}

class StateInfo{
  totalTask: number = 0
  finishTask: number = 0
}

@Entry
@Component
struct TaskPage {
  @Provide stateInfo : StateInfo = new StateInfo()

  build() {
    Column({space:10}){
      TaskStatistics()
      TaskList()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}
@Component
struct TaskStatistics{
  @Consume stateInfo: StateInfo
  build(){
    Row(){
      Text('待完成目标项')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Orange)

      Row(){
        Progress({
          value:this.stateInfo.finishTask,
          total:this.stateInfo.totalTask,
          type:ProgressType.Capsule
        })
          .width(100)
          .backgroundColor(Color.Orange)
          .color(Color.Green)
          .margin({right:16})

        Row(){
          Text(this.stateInfo.finishTask.toString())
            .fontSize(24)
            .fontColor(Color.Green)
          Text(' / '+this.stateInfo.totalTask.toString())
            .fontSize(24)
            .fontColor(Color.Orange)

        }
      }
    }
    .card()
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({top:20,bottom:10})
  }
}

@Component
struct TaskList{
  @Consume stateInfo: StateInfo
  @State tasks: Task[] = []
 // @State selectAll: boolean = false

  handleTaskChange(){
    this.stateInfo.totalTask = this.tasks.length
    this.stateInfo.finishTask = this.tasks.filter(item => item.finished).length
  }

  build(){
    Column(){
      Button('定下你的目标')
        .width('90%')
        .margin({bottom:10})
        .onClick(()=>{
          this.tasks.push(new Task())
          this.handleTaskChange()
        })
        .backgroundColor(Color.Orange)

      List({space:10}){
        ForEach(this.tasks,(item:Task,index)=>{
          ListItem(){
            TaskItem({item:item,onTaskChange:this.handleTaskChange.bind(this)})
          }
          .swipeAction({end:this.DeleteItemAction(index)})
        })
      }
      .width('100%')
      .height('60%')
      .alignListItem(ListItemAlign.Center)

      if(this.tasks.length>0){
        Row(){
          Row(){
            Text('全选')
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
            CheckboxGroup()
              .id(MyID)
          }
          .backgroundColor(Color.Gray)
          .borderRadius(25)
          .width(80)
          .height(40)
          .justifyContent(FlexAlign.Center)

          Button('删除')
            .backgroundColor(Color.Red)
            .onClick(()=>{
              this.tasks.map((value:Task,index:number)=>{
                if(value.finished){
                  this.deleteData(index)
                }
              })
              this.handleTaskChange()
            })
        }
        .width('90%')
        .justifyContent(FlexAlign.SpaceAround)
        .backgroundColor('#fffa9898')
        .borderRadius(25)
      }
    }
  }

  deleteData(index:number){

  }

  @Builder
  DeleteItemAction(index: number){
    Button(){
      Image($r('app.media.storage'))
        .fillColor(Color.White)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(()=>{
      this.tasks.splice(index,1)
      this.handleTaskChange()
    })
  }
}

@Component
struct TaskItem{
  @ObjectLink item: Task
  onTaskChange: ()=> void
  build(){
    Row(){
      if(this.item.finished){
        TextInput({text:this.item.name,placeholder:'请输入你的目标哦'})
          .width(200)
          .fontColor(Color.Gray)
          .opacity(0.3)
      }else{
        TextInput({text:this.item.name,placeholder:'请输入你的目标哦'})
          .width(200)
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold)
      }
      Checkbox()
        .id(MyID)
        .select(this.item.finished)
        .onChange((value)=>{
          this.item.finished = value
          this.onTaskChange()
        })
    }
    .card()
    .justifyContent(FlexAlign.SpaceBetween)
  }
}