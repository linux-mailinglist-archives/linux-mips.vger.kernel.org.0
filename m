Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA477447CF1
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 10:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237026AbhKHJkd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 8 Nov 2021 04:40:33 -0500
Received: from aposti.net ([89.234.176.197]:37608 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237086AbhKHJka (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Nov 2021 04:40:30 -0500
Date:   Mon, 08 Nov 2021 09:37:29 +0000
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
Message-Id: <HQY82R.69JHJIC64HDO1@crapouillou.net>
In-Reply-To: <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
        <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
        <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
        <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
        <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
        <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le dim., nov. 7 2021 at 21:25:38 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> 
>>  Am 07.11.2021 um 20:01 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Hi Nikolaus,
>> 
>>  Le dim., nov. 7 2021 at 14:41:18 +0100, H. Nikolaus Schaller 
>> <hns@goldelico.com> a écrit :
>>>  Hi Paul,
>>>  sorry for the delay in getting back to this, but I was distracted 
>>> by more urgent topics.
>>>>  Am 05.10.2021 um 22:22 schrieb Paul Cercueil 
>>>> <paul@crapouillou.net>:
>>>>  Hi Nikolaus,
>>>>  Le mar., oct. 5 2021 at 14:29:14 +0200, H. Nikolaus Schaller 
>>>> <hns@goldelico.com> a écrit :
>>>>>  From: Paul Boddie <paul@boddie.org.uk>
>>>>>  Add support for the LCD controller present on JZ4780 SoCs.
>>>>>  This SoC uses 8-byte descriptors which extend the current
>>>>>  4-byte descriptors used for other Ingenic SoCs.
>>>>>  Tested on MIPS Creator CI20 board.
>>>>>  Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>>>>>  Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>>  ---
>>>>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 85 
>>>>> +++++++++++++++++++++--
>>>>>  drivers/gpu/drm/ingenic/ingenic-drm.h     | 42 +++++++++++
>>>>>  2 files changed, 122 insertions(+), 5 deletions(-)
>>>>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>>>>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>  index f73522bdacaa..e2df4b085905 100644
>>>>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>  @@ -6,6 +6,7 @@
>>>>>  			case DRM_FORMAT_XRGB8888:
>>>>>  +				hwdesc->cpos |= JZ_LCD_CPOS_BPP_18_24;
>>>>>  +				break;
>>>>>  +			}
>>>>>  +			hwdesc->cpos |= JZ_LCD_CPOS_PREMULTIPLY_LCD |
>>>>>  +					    (JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1 <<
>>>>>  +					     JZ_LCD_CPOS_COEFFICIENT_OFFSET);
>>>>  Knowing that OSD mode doesn't really work with this patch, I 
>>>> doubt you need to configure per-plane alpha blending.
>>>  Well, we can not omit setting some CPOS_COEFFICIENT different from 
>>> 0.
>>>  This would mean to multiply all values with 0, i.e. gives a black 
>>> screen.
>>>  So at least we have to apply JZ_LCD_CPOS_COEFFICIENT_1.
>>>  JZ_LCD_CPOS_PREMULTIPLY_LCD is not relevant in the non-alpha case.
>> 
>>  hwdesc->cpos = JZ_LCD_CPOS_COEFFICIENT_1 << 
>> JZ_LCD_CPOS_COEFFICIENT_OFFSET;
> 
> Exactly what I wrote and did test.
> 
>> 
>>  That's enough to get an image.
> 
> Fine that we can agree on that.
> 
>> 
>>>  But then, why not do it right from the beginning?
>> 
>>  Because there's no way to test alpha blending without getting the 
>> overlay plane to work first.
>> 
>>>>  	}
>>>>  +	regmap_config = ingenic_drm_regmap_config;
>>>>  +	regmap_config.max_register = soc_info->max_reg;
>>>>  	priv->map = devm_regmap_init_mmio(dev, base,
>>>>  -					  &ingenic_drm_regmap_config);
>>>>  +					  &regmap_config);
>>>>  I remember saying to split this change into its own patch :)
>>>  Yes, I remember as well, but it does not make sense to me.
>>>  A first patch would introduce regmap_config. This needs 
>>> soc_info->max_reg
>>>  to be defined as a struct component.
>>>  This requires all soc_info to be updated for all SoC (w/o 
>>> jz4780_soc_info
>>>  in this first patch because it has not been added yet) to a 
>>> constant (!)
>>>  JZ_REG_LCD_SIZE1.
>>>  And the second patch would then add jz4780_soc_info and set its 
>>> max_reg to
>>>  a different value.
>> 
>>  Correct, that's how it should be.
> 
> Well, if you prefer separating things that are deeply related into 
> two commits...
> 
>> 
>>  Note that you can do even better, set the .max_register field 
>> according to the memory resource you get from DTS. Have a look at 
>> the pinctrl driver which does exactly this.
> 
> That is an interesting idea. Although I don't see where
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/pinctrl-ingenic.c#L4171
> 
> does make use of the memory resource from DTS. It just reads two 
> values from the ingenic_chip_info instead of one I do read from 
> soc_info.

It overrides the .max_register from a static regmap_config instance. 
You can do the same, calculating the .max_register from the memory 
resource you get from DT. I'm sure you guys can figure it out.

> If you see it I'd prefer to leave this patch to you (as it is not 
> jz4780 related except that jz4780 needs it to be in place) and then I 
> can simply make use of it for adding jz4780+hdmi.
> 
>> 
>>>  IMHO, such a separate first patch has no benefit independent from 
>>> adding
>>>  jz4780 support, as far as I can see.
>>>  If your fear issues with bisectability:
>>>  - code has been tested
>>>  - if this fails, bisect will still point to this patch, where it 
>>> is easy to locate
>> 
>>  It's not about bisectability. One functional change per patch, and 
>> patches should be as atomic as possible.
> 
> Well, it was atomic: "add jz4780+hdmi functionality" or not. Now we 
> separate into "preparation for adding jz4780" and "really adding". 
> Yes, you can split atoms into quarks...

And that's how it should be done. Lots of small atomic patches are much 
easier to review than a few big patches.

> BTW: without adding jz4780_soc_info there is not even a functional 
> change. Just the constant is made dependent on the .compatible entry. 
> And since it is initialized to the same constant value in all cases, 
> it is still a constant. A very very clever compiler could find out 
> that regmap_config.max_register = soc_info->max_reg is a NOOP and 
> produce the same code as before by avoiding the copy operation of 
> regmap_config = ingenic_drm_regmap_config.
> 
>> 
>>>  So I leave it in v6 unsplitted.
>>>>>  	if (IS_ERR(priv->map)) {
>>>>>  		dev_err(dev, "Failed to create regmap\n");
>>>>>  		return PTR_ERR(priv->map);
>>>>>  @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct device 
>>>>> *dev, bool has_components)
>>>>>  	/* Enable OSD if available */
>>>>>  	if (soc_info->has_osd)
>>>>>  -		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
>>>>>  +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, 
>>>>> JZ_LCD_OSDC_OSDEN);
>>>>  This change is unrelated to this patch, and I'm not even sure 
>>>> it's a valid change. The driver shouldn't rely on previous 
>>>> register values.
>>>  I think I already commented that I think the driver should also 
>>> not reset
>>>  previous register values to zero.
>> 
>>  You did comment this, yes, but I don't agree. The driver *should* 
>> reset the registers to zero. It should *not* have to rely on 
>> whatever was configured before.
>> 
>>  Even if I did agree, this is a functional change unrelated to 
>> JZ4780 support, so it would have to be splitted to its own patch.
> 
> Well it is in preparation of setting more bits that are only 
> available for the jz4780.
> 
> But it will be splitted into its own patch for other reasons - if we 
> ever make osd working...
> 
>> 
>>>  If I counted correctly this register has 18 bits which seem to 
>>> include
>>>  some interrupt masks (which could be initialized somewhere else) 
>>> and we
>>>  write a constant 0x1.
>>>  Of course most other bits are clearly OSD related (alpha blending),
>>>  i.e. they can have any value (incl. 0) if OSD is disabled. But 
>>> here we
>>>  enable it. I think there may be missing some setting for the other 
>>> bits.
>>>  So are you sure, that we can unconditionally reset *all* bits
>>>  except JZ_LCD_OSDC_OSDEN for the jz4780?
>>>  Well I have no experience with OSD being enabled at all. I.e. I 
>>> have no
>>>  test scenario.
>>>  So we can leave it out in v6.
> 
> So we agree as here well.
> 
>>>>> 
>>>>>  +	}
>>>>  As I said in your v4... You don't need to add this here. The 
>>>> ingenic-dw-hdmi.c should take care of registering its driver.
>>>  Well, I can not identify any difference in code structure to the 
>>> IPU code.
>>>  The Makefile (after our patch) looks like:
>>>  obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
>>>  ingenic-drm-y = ingenic-drm-drv.o
>>>  ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
>>>  ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) += ingenic-dw-hdmi.o
>>>  which means that ingenic-dw-hdmi.o is also compiled into 
>>> ingenic-drm,
>>>  like ingenic-drm-drv.o and ingenic-ipu.o - if CONFIGured. If not, 
>>> there
>>>  are these IS_ENABLED() tests to guard against compiler errors.
>>>  Is there any technical reason to request a driver structure and 
>>> registration
>>>  different from IPU here?
>> 
>>  There is no reason to have ingenic-dw-hdmi built into the 
>> ingenic-drm module. It should be a separate module.
>> 
>>>  Why not having ingenic-ipu.c taking care of registering its driver 
>>> as well?
>> 
>>  IIRC ingenic-ipu.c was built into the ingenic-drm at the beginning 
>> because of circular dependencies between the IPU and main DRM 
>> driver. I think ingenic-ipu.c could be its own module now. That's 
>> something I will test soon.
> 
> Ok, that was the piece of information I was missing. I always thought 
> that the way IPU is integrated is the best one and there is some 
> special requirement. And it shows how we should do it.
> 
> So I'll wait until I see your proposal for IPU.

Don't need to wait for me - just create a standard platform_driver 
module for the HDMI code. Since it won't touch the ingenic-drm-drv.c 
file, if I later patch the IPU code to be its own module, it won't 
conflict.

Cheers,
-Paul

>> 
>>>  As soon as this is clarified, I can post a v6.
>>>  Hm. I am not familiar with how ingenic_drm_crtc_atomic_check()
>>>  would be notified about planes. Which configuration parameters
>>>  should be checked for?
>> 
>>  You know that the &ingenic_drm->f0 plane cannot be used (right 
>> now), so in ingenic_drm_plane_atomic_check() just:
>> 
>>  if (plane == &priv->f0 && crtc)
>>    return -EINVAL;
> 
> Ok, that is simple to add. Prepared for v6.
> 
> So v6 is to be postponed by the patch for setting up 
> regmap_config.max_register and the separation of the IPU driver so 
> that it does not interfere.
> 
> BR and thanks for all comments,
> Nikolaus
> 


