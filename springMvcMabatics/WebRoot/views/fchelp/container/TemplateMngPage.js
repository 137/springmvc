/**
 * Created by yangzhongmin on 16/3/30.
 */
import { createActionContainer } from '@alipay/roof';
import React, { Component } from 'react';
import * as templateMngActions from '../action/templateMng';
import TemplateConfig from '../component/TemplateConfig/TemplateConfig';

class TemplateMngPage extends Component {
  render() {
    return (<div>
      <TemplateConfig tntInstId={this.props.tntInstId} {...this.props.templateMngActions} templateConfigForm={this.props.templateConfigForm} />
    </div>);
  }
}

export default createActionContainer({
  templateConfigForm: 'templateConfigForm',
  tntInstId: 'tntInstId',
}, {
  templateMngActions,
})(TemplateMngPage);

