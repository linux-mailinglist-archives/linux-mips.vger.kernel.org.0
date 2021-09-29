Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5E041C6AE
	for <lists+linux-mips@lfdr.de>; Wed, 29 Sep 2021 16:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244873AbhI2Oce convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 29 Sep 2021 10:32:34 -0400
Received: from aposti.net ([89.234.176.197]:43458 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245167AbhI2Oce (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Sep 2021 10:32:34 -0400
Date:   Wed, 29 Sep 2021 15:30:31 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 02/10] drm/ingenic: Add support for JZ4780 and HDMI
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
Message-Id: <VM970R.TLCBMNA67DOI2@crapouillou.net>
In-Reply-To: <17BF1D7A-2057-448B-9FD2-907DE0EFD281@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
        <68cca888be1894ce45f1a93cfabeb5aa1f88c20a.1632761067.git.hns@goldelico.com>
        <OA150R.JLKJBJP8V7FJ2@crapouillou.net>
        <1E10A04A-4A78-4B47-B0FB-1E8C99456DA1@goldelico.com>
        <17BF1D7A-2057-448B-9FD2-907DE0EFD281@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le mar., sept. 28 2021 at 14:06:03 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> 
>>  Am 28.09.2021 um 12:21 schrieb H. Nikolaus Schaller 
>> <hns@goldelico.com>:
>> 
>>>>  @@ -1492,10 +1555,16 @@ static int ingenic_drm_init(void)
>>>>  {
>>>>  	int err;
>>>>  +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
>>>>  +		err = platform_driver_register(ingenic_dw_hdmi_driver_ptr);
>>>>  +		if (err)
>>>>  +			return err;
>>>>  +	}
>>> 
>>>  I don't see why you need to register the ingenic-dw-hdmi driver 
>>> here. Just register it in the ingenic-dw-hdmi driver.
>> 
>>  Ok, I never though about this (as the code was not from me). We 
>> apparently just followed the IPU code pattern (learning by example).
>> 
>>  It indeed looks not necessary and would also avoid the 
>> ingenic_dw_hdmi_driver_ptr dependency.
>> 
>>  But: what is ingenic_ipu_driver_ptr then good for?
>> 

It's done this way because ingenic-drm-drv.c and ingenic-ipu.c are both 
compiled within the same module ingenic-drm.

I'm not sure this is still required, maybe ingenic-ipu.c can be its own 
module now.

>> 
>>  If we can get rid of this as well, we can drop patch 1/10 
>> ("drm/ingenic: Fix drm_init error path if IPU was registered") 
>> completely.
> 
> A quick test shows that it *is* required. At least if I configure 
> everything as modules.
> But like you I can't explain why.

Well, a quick test here shows that it is not required, at least when 
configuring with everything built-in.

-Paul

> Well, just a very rough idea (may be wrong): the bridge chain is not 
> like an i2c bus and
> clients are not automatically loaded/probed if linked in the device 
> tree. Therefore the
> consumer (ingenic_drm_drv) must register the "clients" like IPU and 
> HDMI.
> 
> BR,
> Nikolaus
> 


