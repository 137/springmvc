/**
 * Created by yangzhongmin on 16/3/30.
 */
import React, { Component } from 'react';
import { Modal, Button, message, Row, Col, Upload, Icon, Tooltip, Input } from 'antd';
import { getCtokenFromCookie, unEscape } from '../../../common/utils';
import { createForm } from 'rc-form';
import assign from 'object-assign';
import './TemplateConfig.less';
class TemplateConfig extends Component {
  constructor(props) {
    super(...arguments);
    this.state = {
      collapse: {
        customTpl: false,
        setLogo: false,
        setHelpTitle: false,
      }
    };
  }

  componentWillMount() {
    this.props.queryTemplateConfig();
  }

  onCancel(e) {
    if (e) e.preventDefault();
    window.location.reload();
  }

  onSubmit(e) {
    if (e) e.preventDefault();
    const confirm = Modal.confirm;
    confirm({
      title: '确定发布帮助中心配置吗?',
      content: '此操作会影响现有配置',
      onOk: () => {
        this.props.saveTemplateConfig({
          formData: this.props.templateConfigForm.toJS(),
          onSuccess: () => {
            const url = window.g_config.fchelpwebUrl + '/help.htm?tntInstId=' + this.props.tntInstId;
            Modal.success({
              title: '帮助中心后台配置发布成功',
              content: (<a href={url} target="_blank">{url}</a>),
            });
          }
        });
      },
      onCancel: () => {
      }
    });
  }

  changeLogo({ file }) {
    const { templateUrl } = this.props.templateConfigForm.toJS();
    if (file.status === 'done') {
      this.setState({ uploading: false });
      if (file.response.success) {
        if(templateUrl === 'simpleStyle') {
          this.props.updateSimpleLogo({
            simpleUrl: file.response.fileUrl,
          });
        } else if(templateUrl === 'searchStyle'){
          this.props.updateSearchLogo({
            searchUrl: file.response.fileUrl,
          });
        } else {
          this.props.updateCategoryLogo({
            categoryUrl: file.response.fileUrl,
          });
        }
      } else {
        if (file.response.message) {
          message.error(unEscape(file.response.message));
        } else if(file.response.exception_marking){
          message.error(file.response.exception_marking);
        } else if (file.response.buserviceErrorCode === 'USER_HAS_NOT_PERMISSION') {
          message.error('对不起,您没有权限进行此操作');
        } else {
          message.error('未知异常');
        }
      }
    }
  }

  chooseTemplate(templateUrl) {
    this.props.updateTemplate({
      templateUrl
    });
  }

  collegeNav(nav) {
    switch (nav) {
      case 'setLogo':
        this.setState({
          collapse: {
            setLogo: !this.state.collapse.setLogo,
            customTpl: this.state.collapse.customTpl,
            setHelpTitle: this.state.collapse.setHelpTitle,
          }
        });
        break;
      case 'customTpl':
        this.setState({
          collapse: {
            setLogo: this.state.collapse.setLogo,
            customTpl: !this.state.collapse.customTpl,
            setHelpTitle: this.state.collapse.setHelpTitle,
          }
        });
        break;
      case 'setHelpTitle':
        this.setState({
          collapse: {
            setLogo: this.state.collapse.setLogo,
            customTpl: this.state.collapse.customTpl,
            setHelpTitle: !this.state.collapse.setHelpTitle,
          }
        });
        break;
      default:
        break;
    }
  }

  handleTitleChange(e) {
    this.props.updateHelpTitle({
      helpTitle: e.target.value
    });
  }

  render() {
    const {categoryUrl, simpleUrl, searchUrl, templateUrl, helpTitle } = this.props.templateConfigForm.toJS();
    const helpHost = window.g_config.fchelpwebUrl;
    let logoUrl = '';
    if(templateUrl === 'simpleStyle') {
      logoUrl = simpleUrl;
    } else if(templateUrl === 'categoryStyle') {
      logoUrl = categoryUrl;
    } else {
      logoUrl = searchUrl;
    }
    const requestUrl = `${helpHost}/${templateUrl}.htm?tntInstId=${this.props.tntInstId}&logoUrl=${logoUrl}&helpTitle=${helpTitle}`;
    const uploadProp = {
      action: `/help/upload.json?templateUrl=${templateUrl}&ctoken=${encodeURIComponent(getCtokenFromCookie())}`,
      name: 'file',
      onChange: this.changeLogo.bind(this),
      showUploadList: false,
      multiple: false,
    };
    return (
      <Row className="common-container">
        <Col span="6" className="container-inner">
          <div className="tpl-title" onClick={this.collegeNav.bind(this,'customTpl')}>模板自定义</div>
          <div className={(this.state.collapse.customTpl ? 'collapse' : '') + ' left-tab'}>
            <div className="tpl-wrap">
              <ul>
                <li className={templateUrl === 'simpleStyle' ? 'item selected' : 'item'}
                    onClick={this.chooseTemplate.bind(this, 'simpleStyle')}>
                  <img src="https://os.alipayobjects.com/rmsportal/UlLTXCvuhxMgwjs.png"/>
                  <div className="bottom-bar">
                    列表模式的单页设计
                    <Icon type="check-circle"/>
                  </div>
                </li>
                <li className={templateUrl === 'categoryStyle' ? 'item selected' : 'item'}
                    onClick={this.chooseTemplate.bind(this, 'categoryStyle')}>
                  <img src="https://os.alipayobjects.com/rmsportal/oyjpwEOExSJNxsh.png"/>
                  <div className="bottom-bar">
                    强调类目的设计
                    <Icon type="check-circle"/>
                  </div>
                </li>
                <li className={templateUrl === 'searchStyle' ? 'item selected' : 'item'}
                    onClick={this.chooseTemplate.bind(this, 'searchStyle')}>
                  <img src="https://os.alipayobjects.com/rmsportal/XtkkQizaLnDnGJk.png"/>
                  <div className="bottom-bar">
                    强调搜索的设计
                    <Icon type="check-circle"/>
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <div className="logo-title" onClick={this.collegeNav.bind(this,'setLogo')}>背景图片设置</div>
          <div className={(this.state.collapse.setLogo ? 'collapse' : '') + ' left-tab'}>
            <div className="logo">
              <Upload {...uploadProp}>
                <Tooltip placement="rightBottom"
                  title = {templateUrl === 'searchStyle' ? '点击上传(建议宽高比例为5:1)' : '点击上传(建议宽高比例为20:1)' }
                >
                  <img className="logo-img" src={logoUrl}/>
                </Tooltip>
              </Upload>
            </div>
          </div>
          <div className="logo-title" onClick={this.collegeNav.bind(this,'setHelpTitle')}>文案配置</div>
          <div className={(this.state.collapse.setHelpTitle ? 'collapse' : '') + ' left-tab'}
               style={{borderBottom: '1px solid #E9E9E9'}}
          >
            <Input value={helpTitle} onChange={this.handleTitleChange.bind(this)}/>
          </div>
          <div className="container">
            <div className="btn-group">
              <Button className="ant-btn-primary" onClick={this.onSubmit.bind(this)}>发布</Button>
              <Button onClick={this.onCancel.bind(this)}>取消</Button>
            </div>
          </div>
        </Col>
        <Col span="18" className="help-iframe-wrap">
          <iframe src={ requestUrl } className="help-iframe">
          </iframe>
        </Col>
      </Row>);
  }
}
TemplateConfig.propTypes = {};
export default TemplateConfig;
