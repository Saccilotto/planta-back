import { Module } from '@nestjs/common';
import { ControlPanelController } from './control-panel.controller';
import { ControlPanelService } from './control-panel.service';

@Module({
  controllers: [ControlPanelController],
  providers: [ControlPanelService]
})
export class ControlPanelModule {}
