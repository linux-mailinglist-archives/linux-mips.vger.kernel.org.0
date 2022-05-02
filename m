Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1394151704E
	for <lists+linux-mips@lfdr.de>; Mon,  2 May 2022 15:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385271AbiEBNcC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 May 2022 09:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385267AbiEBNcB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 May 2022 09:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3557512AD8
        for <linux-mips@vger.kernel.org>; Mon,  2 May 2022 06:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651498112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2zV+k9kqlgz67AfOxcNykb0h39cTNVnn0WXnNEGgjk4=;
        b=M/bOdoL2S3N0JICWRmvfdoNBvP4iNrDAP1wSgx/MeZZQL2CSowHRGcH3mF5Gt1s8xHPhCN
        SX7OFMMemNWaKzv/qjEmY3I630B0PmkjWeVJZ+08PF/1KgZ0hh5grd8LMv9v5B3qjzJc7d
        UaFePn/FknHIegcRpdvjKAe8qaTrvR4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-zmNoGPIFNWeuEJhonujwMA-1; Mon, 02 May 2022 09:28:31 -0400
X-MC-Unique: zmNoGPIFNWeuEJhonujwMA-1
Received: by mail-wr1-f69.google.com with SMTP id s14-20020adfa28e000000b0020ac7532f08so5299448wra.15
        for <linux-mips@vger.kernel.org>; Mon, 02 May 2022 06:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2zV+k9kqlgz67AfOxcNykb0h39cTNVnn0WXnNEGgjk4=;
        b=ImbVfwB+dfvAZ/7YNZ17rXx66FrLqfCKQ69agsshzr5aE+mX2J9ws5ZF6HOFjQiwTH
         B//KFwzKjiWO1p7gN0OJD3ucD3TiPkUfDABZKz28g/E+vy0RpeqMjvOejVIDm6z096H7
         Yq8/oj0Cw08Z8+cjVgSWgRCqrxnkyLDwa53b3eMh1tavUzrROMkZi84Sef5bZ6/VqMvl
         6TKTNPA2+crp5yQV/hbQRjGq1hHoMiXv12ZWa0yQ/+Ia+b8+Tj9Vva3bZ91IssySQaIo
         Eku6sCVl/CTjiXhCjC10zJ1ORr3cAIoX1sFv9fY14DitGFUDE3AMlpJMPBY33my4K5uC
         jkdA==
X-Gm-Message-State: AOAM5339yw9261JrOLSD5JukBboRSBWtF0jzlSR+GbL2cYYGxKgQNKV2
        PtQjoz/7kgQnTts1bLL4N+ikEASPfGLEpHBA/xAk0Yd40fHMS+MLTAvfGZqeiI7Exy6KEWGNHtY
        lsS6agdcBuYLmC8QYR0gn7A==
X-Received: by 2002:a05:600c:1c20:b0:394:25cb:1404 with SMTP id j32-20020a05600c1c2000b0039425cb1404mr12244404wms.52.1651498109824;
        Mon, 02 May 2022 06:28:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu2jM2LG+DX+dIVzq45o/V1TxQWIpFsCwnWfT+RmC19xyv+UYhuI/wi7PI/5TDnuN7eFlQ9w==
X-Received: by 2002:a05:600c:1c20:b0:394:25cb:1404 with SMTP id j32-20020a05600c1c2000b0039425cb1404mr12244330wms.52.1651498109516;
        Mon, 02 May 2022 06:28:29 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l3-20020adfa383000000b0020c5253d8bcsm6985850wrb.8.2022.05.02.06.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 06:28:29 -0700 (PDT)
Message-ID: <c0703a8c-3263-6dde-07e4-9f03680c6726@redhat.com>
Date:   Mon, 2 May 2022 15:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] drm/fb-helper: Rename preferred_bpp
 drm_fbdev_generic_setup() parameter
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Emma Anholt <emma@anholt.net>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Jerome Brunet <jbrunet@baylibre.com>,
        Marek Vasut <marex@denx.de>, Hao Fang <fanghao11@huawei.com>,
        linux-aspeed@lists.ozlabs.org,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
        Dave Airlie <airlied@redhat.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        virtualization@lists.linux-foundation.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alison Wang <alison.wang@nxp.com>, linux-mips@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-amlogic@lists.infradead.org,
        Mario Limonciello <mario.limonciello@amd.com>,
        Evan Quan <evan.quan@amd.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Yong Wu <yong.wu@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-sunxi@lists.linux.dev, amd-gfx@lists.freedesktop.org,
        Tomi Valkeinen <tomba@kernel.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-renesas-soc@vger.kernel.org,
        Solomon Chiu <solomon.chiu@amd.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        spice-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220502084830.285639-1-javierm@redhat.com>
 <20220502084830.285639-3-javierm@redhat.com>
 <Ym/BtOM3OlPoE+nr@pendragon.ideasonboard.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Ym/BtOM3OlPoE+nr@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Laurent,

On 5/2/22 13:34, Laurent Pinchart wrote:
> Hi Javier,
> 
> Thank you for the patch.
> 

Thanks a lot for your feedback.

[snip]

>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -2501,8 +2501,16 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>>  /**
>>   * drm_fbdev_generic_setup() - Setup generic fbdev emulation
>>   * @dev: DRM device
>> - * @preferred_bpp: Preferred bits per pixel for the device.
>> - *                 @dev->mode_config.preferred_depth is used if this is zero.
>> + * @options: options for the registered framebuffer.
>> + *
>> + * The @options parameter is a multi-field parameter that can contain
>> + * different options for the emulated framebuffer device registered.
>> + *
>> + * The options must be set using DRM_FB_SET_OPTION() and obtained using
>> + * DRM_FB_GET_OPTION(). The options field are the following:
>> + *
>> + * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
>> + *               @dev->mode_config.preferred_depth is used instead.
> 
> Do I assume correctly that a driver that would need to set multiple
> options would do something like
> 
> 	drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32) |
> 				DRM_FB_SET_OPTION(DRM_FB_FW, 1));
>

That's correct, yes.
 
> ? If so, I would rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() as it's
> computing the value of the option bitfield, it doesn't actually set it.
> Apart from that,
>

Right. I'll rename it.
 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

