Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C29E447513
	for <lists+linux-mips@lfdr.de>; Sun,  7 Nov 2021 20:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236175AbhKGTEm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 7 Nov 2021 14:04:42 -0500
Received: from aposti.net ([89.234.176.197]:53388 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236174AbhKGTEl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Nov 2021 14:04:41 -0500
Date:   Sun, 07 Nov 2021 19:01:38 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI
 output
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
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>
Message-Id: <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
In-Reply-To: <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
        <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
        <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
        <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le dim., nov. 7 2021 at 14:41:18 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> sorry for the delay in getting back to this, but I was distracted by 
> more urgent topics.
> 
>>  Am 05.10.2021 um 22:22 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Hi Nikolaus,
>> 
>>  Le mar., oct. 5 2021 at 14:29:14 +0200, H. Nikolaus Schaller 
>> <hns@goldelico.com> a écrit :
>>>  From: Paul Boddie <paul@boddie.org.uk>
>>>  Add support for the LCD controller present on JZ4780 SoCs.
>>>  This SoC uses 8-byte descriptors which extend the current
>>>  4-byte descriptors used for other Ingenic SoCs.
>>>  Tested on MIPS Creator CI20 board.
>>>  Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>>>  Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  ---
>>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 85 
>>> +++++++++++++++++++++--
>>>  drivers/gpu/drm/ingenic/ingenic-drm.h     | 42 +++++++++++
>>>  2 files changed, 122 insertions(+), 5 deletions(-)
>>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>  index f73522bdacaa..e2df4b085905 100644
>>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>  @@ -6,6 +6,7 @@
> 
>>>  			case DRM_FORMAT_XRGB8888:
>>>  +				hwdesc->cpos |= JZ_LCD_CPOS_BPP_18_24;
>>>  +				break;
>>>  +			}
>>>  +			hwdesc->cpos |= JZ_LCD_CPOS_PREMULTIPLY_LCD |
>>>  +					    (JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1 <<
>>>  +					     JZ_LCD_CPOS_COEFFICIENT_OFFSET);
>> 
>>  Knowing that OSD mode doesn't really work with this patch, I doubt 
>> you need to configure per-plane alpha blending.
> 
> Well, we can not omit setting some CPOS_COEFFICIENT different from 0.
> 
> This would mean to multiply all values with 0, i.e. gives a black 
> screen.
> 
> So at least we have to apply JZ_LCD_CPOS_COEFFICIENT_1.
> JZ_LCD_CPOS_PREMULTIPLY_LCD is not relevant in the non-alpha case.

hwdesc->cpos = JZ_LCD_CPOS_COEFFICIENT_1 << 
JZ_LCD_CPOS_COEFFICIENT_OFFSET;

That's enough to get an image.

> But then, why not do it right from the beginning?

Because there's no way to test alpha blending without getting the 
overlay plane to work first.

>> 
>>>  +
>>>  +			hwdesc->dessize =
>>>  +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
>> 
>>  Same here.
>> 
>>>  +				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK <<
>>>  +					   JZ_LCD_DESSIZE_HEIGHT_OFFSET, height - 1) |
>>>  +				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK <<
>>>  +					   JZ_LCD_DESSIZE_WIDTH_OFFSET, width - 1);
>> 
>>  Better pre-shift your *_MASK macros (and use GENMASK() in them) and 
>> remove the *_OFFSET macros.
> 
> Ok, I see. Nice. Makes code and definitions much cleaner.
> Changed for v6.
> 
>> 
>>>  +		}
>>>  +
>>>  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>>>  			fourcc = newstate->fb->format->format;
>>>  @@ -694,6 +732,10 @@ static void 
>>> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>>>  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>>>  	}
>>>  +	/* set use of the 8-word descriptor and OSD foreground usage. */
>> 
>>  I think you can remove this comment - this code doesn't actually 
>> set OSD mode, but it does enable the use of the extended hardware 
>> descriptor format, and I think it is already self-explanatory.
> 
> Agreed and removed.
> 
>> 
>>>  +	if (priv->soc_info->use_extended_hwdesc)
>>>  +		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
>>>  +
>>>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>>>  		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>>>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>>  @@ -1010,6 +1052,7 @@ static int ingenic_drm_bind(struct device 
>>> *dev, bool has_components)
>>>  	struct drm_encoder *encoder;
>>>  	struct ingenic_drm_bridge *ib;
>>>  	struct drm_device *drm;
>>>  +	struct regmap_config regmap_config;
>>>  	void __iomem *base;
>>>  	long parent_rate;
>>>  	unsigned int i, clone_mask = 0;
>>>  @@ -1063,8 +1106,10 @@ static int ingenic_drm_bind(struct device 
>>> *dev, bool has_components)
>>>  		return PTR_ERR(base);
>>>  	}
>>>  +	regmap_config = ingenic_drm_regmap_config;
>>>  +	regmap_config.max_register = soc_info->max_reg;
>>>  	priv->map = devm_regmap_init_mmio(dev, base,
>>>  -					  &ingenic_drm_regmap_config);
>>>  +					  &regmap_config);
>> 
>>  I remember saying to split this change into its own patch :)
> 
> Yes, I remember as well, but it does not make sense to me.
> 
> A first patch would introduce regmap_config. This needs 
> soc_info->max_reg
> to be defined as a struct component.
> 
> This requires all soc_info to be updated for all SoC (w/o 
> jz4780_soc_info
> in this first patch because it has not been added yet) to a constant 
> (!)
> JZ_REG_LCD_SIZE1.
> 
> And the second patch would then add jz4780_soc_info and set its 
> max_reg to
> a different value.

Correct, that's how it should be.

Note that you can do even better, set the .max_register field according 
to the memory resource you get from DTS. Have a look at the pinctrl 
driver which does exactly this.

> IMHO, such a separate first patch has no benefit independent from 
> adding
> jz4780 support, as far as I can see.
> 
> If your fear issues with bisectability:
> - code has been tested
> - if this fails, bisect will still point to this patch, where it is 
> easy to locate

It's not about bisectability. One functional change per patch, and 
patches should be as atomic as possible.

> So I leave it in v6 unsplitted.
> 
>> 
>>>  	if (IS_ERR(priv->map)) {
>>>  		dev_err(dev, "Failed to create regmap\n");
>>>  		return PTR_ERR(priv->map);
>>>  @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct device 
>>> *dev, bool has_components)
>>>  	/* Enable OSD if available */
>>>  	if (soc_info->has_osd)
>>>  -		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
>>>  +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
>> 
>>  This change is unrelated to this patch, and I'm not even sure it's 
>> a valid change. The driver shouldn't rely on previous register 
>> values.
> 
> I think I already commented that I think the driver should also not 
> reset
> previous register values to zero.

You did comment this, yes, but I don't agree. The driver *should* reset 
the registers to zero. It should *not* have to rely on whatever was 
configured before.

Even if I did agree, this is a functional change unrelated to JZ4780 
support, so it would have to be splitted to its own patch.

> If I counted correctly this register has 18 bits which seem to include
> some interrupt masks (which could be initialized somewhere else) and 
> we
> write a constant 0x1.
> 
> Of course most other bits are clearly OSD related (alpha blending),
> i.e. they can have any value (incl. 0) if OSD is disabled. But here we
> enable it. I think there may be missing some setting for the other 
> bits.
> 
> So are you sure, that we can unconditionally reset *all* bits
> except JZ_LCD_OSDC_OSDEN for the jz4780?
> 
> Well I have no experience with OSD being enabled at all. I.e. I have 
> no
> test scenario.
> 
> So we can leave it out in v6.
> 
>> 
>>>  	mutex_init(&priv->clk_mutex);
>>>  	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
>>>  @@ -1444,6 +1489,7 @@ static const struct jz_soc_info 
>>> jz4740_soc_info = {
>>>  	.formats_f1 = jz4740_formats,
>>>  	.num_formats_f1 = ARRAY_SIZE(jz4740_formats),
>>>  	/* JZ4740 has only one plane */
>>>  +	.max_reg = JZ_REG_LCD_SIZE1,
>>>  };
>>>  static const struct jz_soc_info jz4725b_soc_info = {
>>>  @@ -1456,6 +1502,7 @@ static const struct jz_soc_info 
>>> jz4725b_soc_info = {
>>>  	.num_formats_f1 = ARRAY_SIZE(jz4725b_formats_f1),
>>>  	.formats_f0 = jz4725b_formats_f0,
>>>  	.num_formats_f0 = ARRAY_SIZE(jz4725b_formats_f0),
>>>  +	.max_reg = JZ_REG_LCD_SIZE1,
>>>  };
>>>  static const struct jz_soc_info jz4770_soc_info = {
>>>  @@ -1468,12 +1515,28 @@ static const struct jz_soc_info 
>>> jz4770_soc_info = {
>>>  	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
>>>  	.formats_f0 = jz4770_formats_f0,
>>>  	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
>>>  +	.max_reg = JZ_REG_LCD_SIZE1,
>>>  +};
>>>  +
>>>  +static const struct jz_soc_info jz4780_soc_info = {
>>>  +	.needs_dev_clk = true,
>>>  +	.has_osd = true,
>>>  +	.use_extended_hwdesc = true,
>>>  +	.max_width = 4096,
>>>  +	.max_height = 2048,
>>>  +	/* REVISIT: do we support formats different from jz4770? */
>> 
>>  From a quick look at the PMs, it doesn't seem so.
> 
> Fine. I'll remove the comment in v6.
> 
>> 
>>>  +	.formats_f1 = jz4770_formats_f1,
>>>  +	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
>>>  +	.formats_f0 = jz4770_formats_f0,
>>>  +	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
>>>  +	.max_reg = JZ_REG_LCD_PCFG,
>>>  };
>>>  static const struct of_device_id ingenic_drm_of_match[] = {
>>>  	{ .compatible = "ingenic,jz4740-lcd", .data = &jz4740_soc_info },
>>>  	{ .compatible = "ingenic,jz4725b-lcd", .data = &jz4725b_soc_info 
>>> },
>>>  	{ .compatible = "ingenic,jz4770-lcd", .data = &jz4770_soc_info },
>>>  +	{ .compatible = "ingenic,jz4780-lcd", .data = &jz4780_soc_info },
>>>  	{ /* sentinel */ },
>>>  };
>>>  MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
>>>  @@ -1492,10 +1555,16 @@ static int ingenic_drm_init(void)
>>>  {
>>>  	int err;
>>>  +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
>>>  +		err = platform_driver_register(ingenic_dw_hdmi_driver_ptr);
>>>  +		if (err)
>>>  +			return err;
>>>  +	}
>> 
>>  As I said in your v4... You don't need to add this here. The 
>> ingenic-dw-hdmi.c should take care of registering its driver.
> 
> Well, I can not identify any difference in code structure to the IPU 
> code.
> 
> The Makefile (after our patch) looks like:
> 
> obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
> ingenic-drm-y = ingenic-drm-drv.o
> ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
> ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) += ingenic-dw-hdmi.o
> 
> which means that ingenic-dw-hdmi.o is also compiled into ingenic-drm,
> like ingenic-drm-drv.o and ingenic-ipu.o - if CONFIGured. If not, 
> there
> are these IS_ENABLED() tests to guard against compiler errors.
> 
> Is there any technical reason to request a driver structure and 
> registration
> different from IPU here?

There is no reason to have ingenic-dw-hdmi built into the ingenic-drm 
module. It should be a separate module.

> Why not having ingenic-ipu.c taking care of registering its driver as 
> well?

IIRC ingenic-ipu.c was built into the ingenic-drm at the beginning 
because of circular dependencies between the IPU and main DRM driver. I 
think ingenic-ipu.c could be its own module now. That's something I 
will test soon.

> As soon as this is clarified, I can post a v6.
> 
>> 
>>  As for the overall change... I am a bit annoyed that this only 
>> supports the F1 plane at the screen's resolution. Anything else (F1 
>> plane at specific coordinates, F0 plane alone, or F0+F1) does not 
>> work.
> 
> Yes, having two planes working would be interesting.
> 
>>  I think at least the F1 plane's position should be easy to do (just 
>> setting the cpos field in the hwdesc).
>> 
>>  It is OK to leave the rest for later (I'm not asking you to do all 
>> that). However it would be a good idea to add a check in 
>> ingenic_drm_crtc_atomic_check(), which would return -EINVAL if 
>> anything else than the working configuration is attempted.
> 
> Hm. I am not familiar with how ingenic_drm_crtc_atomic_check()
> would be notified about planes. Which configuration parameters
> should be checked for?

You know that the &ingenic_drm->f0 plane cannot be used (right now), so 
in ingenic_drm_plane_atomic_check() just:

if (plane == &priv->f0 && crtc)
    return -EINVAL;

Cheers,
-Paul

> 
>> 
>>  Cheers,
>>  -Paul
> 
> BR and thanks,
> Nikolaus
> 


