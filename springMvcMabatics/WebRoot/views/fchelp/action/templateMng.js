/**
 * Created by yangzhongmin on 16/3/30.
 */

import ajax from '@alipay/ajax';
import assign from 'object-assign';

//查询配置
export function queryTemplateConfig(payload = { }, { setState, getState }) {
  ajax({
    url: '/help/queryHelpConfig.json',
    success: ({success, data}) => {
      if(success) {
        const {templateUrl, simpleUrl, searchUrl, categoryUrl, helpTitle } = data;
        if(templateUrl) {
          setState({
            templateConfigForm: getState().templateConfigForm.merge({
              templateUrl, helpTitle: (helpTitle ? helpTitle : '')
            }),
          });
        }
        if(searchUrl) {
          setState({
            templateConfigForm: getState().templateConfigForm.merge({
              searchUrl
            }),
          });
        }
        if(simpleUrl) {
          setState({
            templateConfigForm: getState().templateConfigForm.merge({
              simpleUrl
            }),
          });
        }
        if(categoryUrl) {
          setState({
            templateConfigForm: getState().templateConfigForm.merge({
              categoryUrl
            }),
          });
        }
    }
    }
  });
}

//保存配置
export function saveTemplateConfig(payload = { }, { setState, getState }) {
  const { onSuccess, formData } = payload;
  const { templateUrl, simpleUrl, searchUrl, categoryUrl, helpTitle } = formData;
  ajax({
    url: '/help/saveHelpConfig.json',
    data: { templateUrl, simpleUrl, searchUrl, categoryUrl, helpTitle },
    success: ({success}) => {
      if(success) {
        onSuccess();
      }
    }
  });
}

// 更新模板
export function updateTemplate(payload = {}, { setState, getState }) {
  const { templateUrl } = payload;
  setState({
    templateConfigForm: getState().templateConfigForm.merge({
      templateUrl
    }),
  });
}

export function updateSimpleLogo(payload = {}, { setState, getState }) {
  const { simpleUrl } = payload;
  setState({
    templateConfigForm: getState().templateConfigForm.merge({
      simpleUrl
    }),
  });
}

export function updateSearchLogo(payload = {}, { setState, getState }) {
  const { searchUrl } = payload;
  setState({
    templateConfigForm: getState().templateConfigForm.merge({
      searchUrl
    }),
  });
}

export function updateCategoryLogo(payload = {}, { setState, getState }) {
  const { categoryUrl } = payload;
  setState({
    templateConfigForm: getState().templateConfigForm.merge({
      categoryUrl
    }),
  });
}

export function updateHelpTitle(payload = {}, { setState, getState }) {
  const { helpTitle } = payload;
  setState({
    templateConfigForm: getState().templateConfigForm.merge({
      helpTitle
    }),
  });
}

