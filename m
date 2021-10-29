Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BDB44045B
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 22:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhJ2UuX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 29 Oct 2021 16:50:23 -0400
Received: from aposti.net ([89.234.176.197]:48552 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231401AbhJ2UuN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 Oct 2021 16:50:13 -0400
Date:   Fri, 29 Oct 2021 21:47:32 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RESEND PATCH v3 6/6] drm/ingenic: Attach bridge chain to
 encoders
To:     Christophe Branchereau <cbranchereau@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Message-Id: <83BR1R.9ZTLAX4CQC6H@crapouillou.net>
In-Reply-To: <CAFsFa87SJqyZ=VgbNe=obv+jHNdVQQe0NN4R8w_V_HCitP4Nbg@mail.gmail.com>
References: <20211026181240.213806-1-paul@crapouillou.net>
        <20211026181240.213806-7-paul@crapouillou.net>
        <CAFsFa87SJqyZ=VgbNe=obv+jHNdVQQe0NN4R8w_V_HCitP4Nbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Series applied, thanks!

Cheers,
-Paul


Le ven., oct. 29 2021 at 18:55:50 +0200, Christophe Branchereau 
<cbranchereau@gmail.com> a écrit :
> Reviewed-by: Christophe Branchereau <cbranchereau@gmail.com>
> 
> On Tue, Oct 26, 2021 at 8:13 PM Paul Cercueil <paul@crapouillou.net> 
> wrote:
>> 
>>  Attach a top-level bridge to each encoder, which will be used for
>>  negociating the bus format and flags.
>> 
>>  All the bridges are now attached with 
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 92 
>> +++++++++++++++++------
>>   1 file changed, 70 insertions(+), 22 deletions(-)
>> 
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index a5e2880e07a1..a05a9fa6e115 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -21,6 +21,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_bridge.h>
>>  +#include <drm/drm_bridge_connector.h>
>>   #include <drm/drm_color_mgmt.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_crtc_helper.h>
>>  @@ -108,6 +109,19 @@ struct ingenic_drm {
>>          struct drm_private_obj private_obj;
>>   };
>> 
>>  +struct ingenic_drm_bridge {
>>  +       struct drm_encoder encoder;
>>  +       struct drm_bridge bridge, *next_bridge;
>>  +
>>  +       struct drm_bus_cfg bus_cfg;
>>  +};
>>  +
>>  +static inline struct ingenic_drm_bridge *
>>  +to_ingenic_drm_bridge(struct drm_encoder *encoder)
>>  +{
>>  +       return container_of(encoder, struct ingenic_drm_bridge, 
>> encoder);
>>  +}
>>  +
>>   static inline struct ingenic_drm_private_state *
>>   to_ingenic_drm_priv_state(struct drm_private_state *state)
>>   {
>>  @@ -668,11 +682,10 @@ static void 
>> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>   {
>>          struct ingenic_drm *priv = 
>> drm_device_get_priv(encoder->dev);
>>          struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>>  -       struct drm_connector *conn = conn_state->connector;
>>  -       struct drm_display_info *info = &conn->display_info;
>>  +       struct ingenic_drm_bridge *bridge = 
>> to_ingenic_drm_bridge(encoder);
>>          unsigned int cfg, rgbcfg = 0;
>> 
>>  -       priv->panel_is_sharp = info->bus_flags & 
>> DRM_BUS_FLAG_SHARP_SIGNALS;
>>  +       priv->panel_is_sharp = bridge->bus_cfg.flags & 
>> DRM_BUS_FLAG_SHARP_SIGNALS;
>> 
>>          if (priv->panel_is_sharp) {
>>                  cfg = JZ_LCD_CFG_MODE_SPECIAL_TFT_1 | 
>> JZ_LCD_CFG_REV_POLARITY;
>>  @@ -685,19 +698,19 @@ static void 
>> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>                  cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>>          if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>                  cfg |= JZ_LCD_CFG_VSYNC_ACTIVE_LOW;
>>  -       if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
>>  +       if (bridge->bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
>>                  cfg |= JZ_LCD_CFG_DE_ACTIVE_LOW;
>>  -       if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>>  +       if (bridge->bus_cfg.flags & 
>> DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>>                  cfg |= JZ_LCD_CFG_PCLK_FALLING_EDGE;
>> 
>>          if (!priv->panel_is_sharp) {
>>  -               if (conn->connector_type == DRM_MODE_CONNECTOR_TV) {
>>  +               if (conn_state->connector->connector_type == 
>> DRM_MODE_CONNECTOR_TV) {
>>                          if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>>                                  cfg |= JZ_LCD_CFG_MODE_TV_OUT_I;
>>                          else
>>                                  cfg |= JZ_LCD_CFG_MODE_TV_OUT_P;
>>                  } else {
>>  -                       switch (*info->bus_formats) {
>>  +                       switch (bridge->bus_cfg.format) {
>>                          case MEDIA_BUS_FMT_RGB565_1X16:
>>                                  cfg |= 
>> JZ_LCD_CFG_MODE_GENERIC_16BIT;
>>                                  break;
>>  @@ -723,20 +736,29 @@ static void 
>> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>          regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
>>   }
>> 
>>  -static int ingenic_drm_encoder_atomic_check(struct drm_encoder 
>> *encoder,
>>  -                                           struct drm_crtc_state 
>> *crtc_state,
>>  -                                           struct 
>> drm_connector_state *conn_state)
>>  +static int ingenic_drm_bridge_attach(struct drm_bridge *bridge,
>>  +                                    enum drm_bridge_attach_flags 
>> flags)
>>  +{
>>  +       struct ingenic_drm_bridge *ib = 
>> to_ingenic_drm_bridge(bridge->encoder);
>>  +
>>  +       return drm_bridge_attach(bridge->encoder, ib->next_bridge,
>>  +                                &ib->bridge, flags);
>>  +}
>>  +
>>  +static int ingenic_drm_bridge_atomic_check(struct drm_bridge 
>> *bridge,
>>  +                                          struct drm_bridge_state 
>> *bridge_state,
>>  +                                          struct drm_crtc_state 
>> *crtc_state,
>>  +                                          struct 
>> drm_connector_state *conn_state)
>>   {
>>  -       struct drm_display_info *info = 
>> &conn_state->connector->display_info;
>>          struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>>  +       struct ingenic_drm_bridge *ib = 
>> to_ingenic_drm_bridge(bridge->encoder);
>> 
>>  -       if (info->num_bus_formats != 1)
>>  -               return -EINVAL;
>>  +       ib->bus_cfg = bridge_state->output_bus_cfg;
>> 
>>          if (conn_state->connector->connector_type == 
>> DRM_MODE_CONNECTOR_TV)
>>                  return 0;
>> 
>>  -       switch (*info->bus_formats) {
>>  +       switch (bridge_state->output_bus_cfg.format) {
>>          case MEDIA_BUS_FMT_RGB888_3X8:
>>          case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
>>                  /*
>>  @@ -900,8 +922,16 @@ static const struct drm_crtc_helper_funcs 
>> ingenic_drm_crtc_helper_funcs = {
>>   };
>> 
>>   static const struct drm_encoder_helper_funcs 
>> ingenic_drm_encoder_helper_funcs = {
>>  -       .atomic_mode_set        = 
>> ingenic_drm_encoder_atomic_mode_set,
>>  -       .atomic_check           = ingenic_drm_encoder_atomic_check,
>>  +       .atomic_mode_set        = 
>> ingenic_drm_encoder_atomic_mode_set,
>>  +};
>>  +
>>  +static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
>>  +       .attach                 = ingenic_drm_bridge_attach,
>>  +       .atomic_check           = ingenic_drm_bridge_atomic_check,
>>  +       .atomic_reset           = drm_atomic_helper_bridge_reset,
>>  +       .atomic_duplicate_state = 
>> drm_atomic_helper_bridge_duplicate_state,
>>  +       .atomic_destroy_state   = 
>> drm_atomic_helper_bridge_destroy_state,
>>  +       .atomic_get_input_bus_fmts = 
>> drm_atomic_helper_bridge_propagate_bus_fmt,
>>   };
>> 
>>   static const struct drm_mode_config_funcs 
>> ingenic_drm_mode_config_funcs = {
>>  @@ -976,7 +1006,9 @@ static int ingenic_drm_bind(struct device 
>> *dev, bool has_components)
>>          struct drm_plane *primary;
>>          struct drm_bridge *bridge;
>>          struct drm_panel *panel;
>>  +       struct drm_connector *connector;
>>          struct drm_encoder *encoder;
>>  +       struct ingenic_drm_bridge *ib;
>>          struct drm_device *drm;
>>          void __iomem *base;
>>          long parent_rate;
>>  @@ -1154,20 +1186,36 @@ static int ingenic_drm_bind(struct device 
>> *dev, bool has_components)
>>                          bridge = 
>> devm_drm_panel_bridge_add_typed(dev, panel,
>>                                                                   
>> DRM_MODE_CONNECTOR_DPI);
>> 
>>  -               encoder = drmm_plain_encoder_alloc(drm, NULL, 
>> DRM_MODE_ENCODER_DPI, NULL);
>>  -               if (IS_ERR(encoder)) {
>>  -                       ret = PTR_ERR(encoder);
>>  +               ib = drmm_encoder_alloc(drm, struct 
>> ingenic_drm_bridge, encoder,
>>  +                                       NULL, DRM_MODE_ENCODER_DPI, 
>> NULL);
>>  +               if (IS_ERR(ib)) {
>>  +                       ret = PTR_ERR(ib);
>>                          dev_err(dev, "Failed to init encoder: 
>> %d\n", ret);
>>                          return ret;
>>                  }
>> 
>>  -               encoder->possible_crtcs = 1;
>>  +               encoder = &ib->encoder;
>>  +               encoder->possible_crtcs = 
>> drm_crtc_mask(&priv->crtc);
>> 
>>                  drm_encoder_helper_add(encoder, 
>> &ingenic_drm_encoder_helper_funcs);
>> 
>>  -               ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>>  -               if (ret)
>>  +               ib->bridge.funcs = &ingenic_drm_bridge_funcs;
>>  +               ib->next_bridge = bridge;
>>  +
>>  +               ret = drm_bridge_attach(encoder, &ib->bridge, NULL,
>>  +                                       
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  +               if (ret) {
>>  +                       dev_err(dev, "Unable to attach bridge\n");
>>                          return ret;
>>  +               }
>>  +
>>  +               connector = drm_bridge_connector_init(drm, encoder);
>>  +               if (IS_ERR(connector)) {
>>  +                       dev_err(dev, "Unable to init connector\n");
>>  +                       return PTR_ERR(connector);
>>  +               }
>>  +
>>  +               drm_connector_attach_encoder(connector, encoder);
>>          }
>> 
>>          drm_for_each_encoder(encoder, drm) {
>>  --
>>  2.33.0
>> 


