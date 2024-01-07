
import AppUtil from '../util/APPUtil'

export class AppData {

  private tasks: Array<string> = AppUtil.DATAS

  provideData(){
    return this.tasks
  }
}

export default new AppData()