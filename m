Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5AC63E3C58
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 21:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhHHTFU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 8 Aug 2021 15:05:20 -0400
Received: from aposti.net ([89.234.176.197]:45774 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232260AbhHHTFT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 8 Aug 2021 15:05:19 -0400
Date:   Sun, 08 Aug 2021 21:04:52 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 8/8] drm/ingenic: Attach bridge chain to encoders
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Message-Id: <4OBJXQ.DA6PDYNSVNYV1@crapouillou.net>
In-Reply-To: <2AEC5953-FE54-4DD5-88B7-783C4D9E23B2@goldelico.com>
References: <20210808134526.119198-1-paul@crapouillou.net>
        <20210808134526.119198-9-paul@crapouillou.net>
        <2AEC5953-FE54-4DD5-88B7-783C4D9E23B2@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le dim., août 8 2021 at 20:57:09 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> all other patches apply cleanly but this one fails on top of 
> v5.14-rc4.
> What base are you using?
> BR and thanks,
> Nikolaus

The base is drm-misc (https://cgit.freedesktop.org/drm/drm-misc), 
branch drm-misc-next.

Cheers,
-Paul


>>  Am 08.08.2021 um 15:45 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Attach a top-level bridge to each encoder, which will be used for
>>  negociating the bus format and flags.
>> 
>>  All the bridges are now attached with 
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 92 
>> +++++++++++++++++------
>>  1 file changed, 70 insertions(+), 22 deletions(-)
>> 
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index 7ae48ead3ab6..09d5dd298078 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -21,6 +21,7 @@
>>  #include <drm/drm_atomic.h>
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_bridge.h>
>>  +#include <drm/drm_bridge_connector.h>
>>  #include <drm/drm_color_mgmt.h>
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_crtc_helper.h>
>>  @@ -107,6 +108,19 @@ struct ingenic_drm {
>>  	struct drm_private_obj private_obj;
>>  };
>> 
>>  +struct ingenic_drm_bridge {
>>  +	struct drm_encoder encoder;
>>  +	struct drm_bridge bridge, *next_bridge;
>>  +
>>  +	struct drm_bus_cfg bus_cfg;
>>  +};
>>  +
>>  +static inline struct ingenic_drm_bridge *
>>  +to_ingenic_drm_bridge(struct drm_encoder *encoder)
>>  +{
>>  +	return container_of(encoder, struct ingenic_drm_bridge, encoder);
>>  +}
>>  +
>>  static inline struct ingenic_drm_private_state *
>>  to_ingenic_drm_priv_state(struct drm_private_state *state)
>>  {
>>  @@ -679,11 +693,10 @@ static void 
>> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>  {
>>  	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
>>  	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>>  -	struct drm_connector *conn = conn_state->connector;
>>  -	struct drm_display_info *info = &conn->display_info;
>>  +	struct ingenic_drm_bridge *bridge = 
>> to_ingenic_drm_bridge(encoder);
>>  	unsigned int cfg, rgbcfg = 0;
>> 
>>  -	priv->panel_is_sharp = info->bus_flags & 
>> DRM_BUS_FLAG_SHARP_SIGNALS;
>>  +	priv->panel_is_sharp = bridge->bus_cfg.flags & 
>> DRM_BUS_FLAG_SHARP_SIGNALS;
>> 
>>  	if (priv->panel_is_sharp) {
>>  		cfg = JZ_LCD_CFG_MODE_SPECIAL_TFT_1 | JZ_LCD_CFG_REV_POLARITY;
>>  @@ -696,19 +709,19 @@ static void 
>> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>  		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>  		cfg |= JZ_LCD_CFG_VSYNC_ACTIVE_LOW;
>>  -	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
>>  +	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
>>  		cfg |= JZ_LCD_CFG_DE_ACTIVE_LOW;
>>  -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>>  +	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>>  		cfg |= JZ_LCD_CFG_PCLK_FALLING_EDGE;
>> 
>>  	if (!priv->panel_is_sharp) {
>>  -		if (conn->connector_type == DRM_MODE_CONNECTOR_TV) {
>>  +		if (conn_state->connector->connector_type == 
>> DRM_MODE_CONNECTOR_TV) {
>>  			if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>>  				cfg |= JZ_LCD_CFG_MODE_TV_OUT_I;
>>  			else
>>  				cfg |= JZ_LCD_CFG_MODE_TV_OUT_P;
>>  		} else {
>>  -			switch (*info->bus_formats) {
>>  +			switch (bridge->bus_cfg.format) {
>>  			case MEDIA_BUS_FMT_RGB565_1X16:
>>  				cfg |= JZ_LCD_CFG_MODE_GENERIC_16BIT;
>>  				break;
>>  @@ -734,20 +747,29 @@ static void 
>> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>  	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
>>  }
>> 
>>  -static int ingenic_drm_encoder_atomic_check(struct drm_encoder 
>> *encoder,
>>  -					    struct drm_crtc_state *crtc_state,
>>  -					    struct drm_connector_state *conn_state)
>>  +static int ingenic_drm_bridge_attach(struct drm_bridge *bridge,
>>  +				     enum drm_bridge_attach_flags flags)
>>  +{
>>  +	struct ingenic_drm_bridge *ib = 
>> to_ingenic_drm_bridge(bridge->encoder);
>>  +
>>  +	return drm_bridge_attach(bridge->encoder, ib->next_bridge,
>>  +				 &ib->bridge, flags);
>>  +}
>>  +
>>  +static int ingenic_drm_bridge_atomic_check(struct drm_bridge 
>> *bridge,
>>  +					   struct drm_bridge_state *bridge_state,
>>  +					   struct drm_crtc_state *crtc_state,
>>  +					   struct drm_connector_state *conn_state)
>>  {
>>  -	struct drm_display_info *info = 
>> &conn_state->connector->display_info;
>>  	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>>  +	struct ingenic_drm_bridge *ib = 
>> to_ingenic_drm_bridge(bridge->encoder);
>> 
>>  -	if (info->num_bus_formats != 1)
>>  -		return -EINVAL;
>>  +	ib->bus_cfg = bridge_state->output_bus_cfg;
>> 
>>  	if (conn_state->connector->connector_type == DRM_MODE_CONNECTOR_TV)
>>  		return 0;
>> 
>>  -	switch (*info->bus_formats) {
>>  +	switch (bridge_state->output_bus_cfg.format) {
>>  	case MEDIA_BUS_FMT_RGB888_3X8:
>>  	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
>>  		/*
>>  @@ -911,8 +933,16 @@ static const struct drm_crtc_helper_funcs 
>> ingenic_drm_crtc_helper_funcs = {
>>  };
>> 
>>  static const struct drm_encoder_helper_funcs 
>> ingenic_drm_encoder_helper_funcs = {
>>  -	.atomic_mode_set	= ingenic_drm_encoder_atomic_mode_set,
>>  -	.atomic_check		= ingenic_drm_encoder_atomic_check,
>>  +	.atomic_mode_set        = ingenic_drm_encoder_atomic_mode_set,
>>  +};
>>  +
>>  +static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
>>  +	.attach			= ingenic_drm_bridge_attach,
>>  +	.atomic_check		= ingenic_drm_bridge_atomic_check,
>>  +	.atomic_reset		= drm_atomic_helper_bridge_reset,
>>  +	.atomic_duplicate_state	= 
>> drm_atomic_helper_bridge_duplicate_state,
>>  +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
>>  +	.atomic_get_input_bus_fmts = 
>> drm_atomic_helper_bridge_propagate_bus_fmt,
>>  };
>> 
>>  static const struct drm_mode_config_funcs 
>> ingenic_drm_mode_config_funcs = {
>>  @@ -958,7 +988,9 @@ static int ingenic_drm_bind(struct device *dev, 
>> bool has_components)
>>  	struct drm_plane *primary;
>>  	struct drm_bridge *bridge;
>>  	struct drm_panel *panel;
>>  +	struct drm_connector *connector;
>>  	struct drm_encoder *encoder;
>>  +	struct ingenic_drm_bridge *ib;
>>  	struct drm_device *drm;
>>  	void __iomem *base;
>>  	long parent_rate;
>>  @@ -1146,20 +1178,36 @@ static int ingenic_drm_bind(struct device 
>> *dev, bool has_components)
>>  			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
>>  								 DRM_MODE_CONNECTOR_DPI);
>> 
>>  -		encoder = drmm_plain_encoder_alloc(drm, NULL, 
>> DRM_MODE_ENCODER_DPI, NULL);
>>  -		if (IS_ERR(encoder)) {
>>  -			ret = PTR_ERR(encoder);
>>  +		ib = drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
>>  +					NULL, DRM_MODE_ENCODER_DPI, NULL);
>>  +		if (IS_ERR(ib)) {
>>  +			ret = PTR_ERR(ib);
>>  			dev_err(dev, "Failed to init encoder: %d\n", ret);
>>  			return ret;
>>  		}
>> 
>>  -		encoder->possible_crtcs = 1;
>>  +		encoder = &ib->encoder;
>>  +		encoder->possible_crtcs = drm_crtc_mask(&priv->crtc);
>> 
>>  		drm_encoder_helper_add(encoder, 
>> &ingenic_drm_encoder_helper_funcs);
>> 
>>  -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>>  -		if (ret)
>>  +		ib->bridge.funcs = &ingenic_drm_bridge_funcs;
>>  +		ib->next_bridge = bridge;
>>  +
>>  +		ret = drm_bridge_attach(encoder, &ib->bridge, NULL,
>>  +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  +		if (ret) {
>>  +			dev_err(dev, "Unable to attach bridge\n");
>>  			return ret;
>>  +		}
>>  +
>>  +		connector = drm_bridge_connector_init(drm, encoder);
>>  +		if (IS_ERR(connector)) {
>>  +			dev_err(dev, "Unable to init connector\n");
>>  +			return PTR_ERR(connector);
>>  +		}
>>  +
>>  +		drm_connector_attach_encoder(connector, encoder);
>>  	}
>> 
>>  	drm_for_each_encoder(encoder, drm) {
>>  --
>>  2.30.2
>> 
> 


