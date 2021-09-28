Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A42341AC7F
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 11:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240029AbhI1KA4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 28 Sep 2021 06:00:56 -0400
Received: from aposti.net ([89.234.176.197]:54750 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239815AbhI1KAw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Sep 2021 06:00:52 -0400
Date:   Tue, 28 Sep 2021 10:58:58 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 10/10] drm/ingenic: add some jz4780 specific features
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Message-Id: <AE250R.2UXAKOURL8O52@crapouillou.net>
In-Reply-To: <8cbfba68ce45e10106eb322d622cb7ac64c0e4d4.1632761068.git.hns@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
        <8cbfba68ce45e10106eb322d622cb7ac64c0e4d4.1632761068.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le lun., sept. 27 2021 at 18:44:28 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> From: Paul Boddie <paul@boddie.org.uk>
> 
> The jz4780 has some features which need initialization
> according to the vendor kernel.
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 39 
> +++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index e2df4b085905..605549b316b5 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -66,6 +66,10 @@ struct jz_soc_info {
>  	bool needs_dev_clk;
>  	bool has_osd;
>  	bool map_noncoherent;
> +	bool has_alpha;
> +	bool has_pcfg;
> +	bool has_recover;
> +	bool has_rgbc;
>  	bool use_extended_hwdesc;
>  	unsigned int max_width, max_height;
>  	const u32 *formats_f0, *formats_f1;
> @@ -732,6 +736,9 @@ static void 
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>  	}
> 
> +	if (priv->soc_info->has_recover)
> +		cfg |= JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN;

Did you actually test this? I know that in theory it sounds like 
something we'd want, but unless there is a proven use for it, it's 
better to keep it disabled.

> +
>  	/* set use of the 8-word descriptor and OSD foreground usage. */
>  	if (priv->soc_info->use_extended_hwdesc)
>  		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
> @@ -1321,6 +1328,25 @@ static int ingenic_drm_bind(struct device 
> *dev, bool has_components)
>  	if (soc_info->has_osd)
>  		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
> 
> +	if (soc_info->has_alpha)
> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_ALPHAEN);

I remember you saying that OSD mode was not yet working on the JZ4780. 
So I can't see how you could have tested this.

> +
> +	/* Magic values from the vendor kernel for the priority thresholds. 
> */
> +	if (soc_info->has_pcfg)
> +		regmap_write(priv->map, JZ_REG_LCD_PCFG,
> +			     JZ_LCD_PCFG_PRI_MODE |
> +			     JZ_LCD_PCFG_HP_BST_16 |
> +			     (511 << JZ_LCD_PCFG_THRESHOLD2_OFFSET) |
> +			     (400 << JZ_LCD_PCFG_THRESHOLD1_OFFSET) |
> +			     (256 << JZ_LCD_PCFG_THRESHOLD0_OFFSET));

Unless you add a big comment that explains what these values do and why 
we do want them, I don't want magic values in here. The fact that the 
kernel vendor sets this doesn't mean it's needed and/or wanted.

> +
> +	/* RGB output control may be superfluous. */
> +	if (soc_info->has_rgbc)
> +		regmap_write(priv->map, JZ_REG_LCD_RGBC,
> +			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
> +			     JZ_LCD_RGBC_ODD_RGB |
> +			     JZ_LCD_RGBC_EVEN_RGB);

ingenic-drm only supports RGB output right now, so I guess the 
RGB_FORMAT_ENABLE bit needs to be set in patch [2/10], otherwise patch 
[2/10] cannot state that it adds support for the JZ4780, if it doesn't 
actually work.

The other two bits can be dropped, they are already set in 
ingenic_drm_encoder_atomic_mode_set().

> +
>  	mutex_init(&priv->clk_mutex);
>  	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
> 
> @@ -1484,6 +1510,9 @@ static const struct jz_soc_info jz4740_soc_info 
> = {
>  	.needs_dev_clk = true,
>  	.has_osd = false,
>  	.map_noncoherent = false,
> +	.has_pcfg = false,
> +	.has_recover = false,
> +	.has_rgbc = false,
>  	.max_width = 800,
>  	.max_height = 600,
>  	.formats_f1 = jz4740_formats,
> @@ -1496,6 +1525,9 @@ static const struct jz_soc_info 
> jz4725b_soc_info = {
>  	.needs_dev_clk = false,
>  	.has_osd = true,
>  	.map_noncoherent = false,
> +	.has_pcfg = false,
> +	.has_recover = false,
> +	.has_rgbc = false,

This is wrong, the JZ4725B and JZ4770 SoCs both have the RGBC register 
and the RECOVER bit.

Cheers,
-Paul

>  	.max_width = 800,
>  	.max_height = 600,
>  	.formats_f1 = jz4725b_formats_f1,
> @@ -1509,6 +1541,9 @@ static const struct jz_soc_info jz4770_soc_info 
> = {
>  	.needs_dev_clk = false,
>  	.has_osd = true,
>  	.map_noncoherent = true,
> +	.has_pcfg = false,
> +	.has_recover = false,
> +	.has_rgbc = false,
>  	.max_width = 1280,
>  	.max_height = 720,
>  	.formats_f1 = jz4770_formats_f1,
> @@ -1521,6 +1556,10 @@ static const struct jz_soc_info 
> jz4770_soc_info = {
>  static const struct jz_soc_info jz4780_soc_info = {
>  	.needs_dev_clk = true,
>  	.has_osd = true,
> +	.has_alpha = true,
> +	.has_pcfg = true,
> +	.has_recover = true,
> +	.has_rgbc = true,
>  	.use_extended_hwdesc = true,
>  	.max_width = 4096,
>  	.max_height = 2048,
> --
> 2.31.1
> 


