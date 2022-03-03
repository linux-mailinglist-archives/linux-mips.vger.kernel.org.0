Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFCC04CBCF8
	for <lists+linux-mips@lfdr.de>; Thu,  3 Mar 2022 12:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbiCCLnf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Mar 2022 06:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbiCCLmw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Mar 2022 06:42:52 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E63DE0A00
        for <linux-mips@vger.kernel.org>; Thu,  3 Mar 2022 03:42:06 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 7-20020a05600c228700b00385fd860f49so2223181wmf.0
        for <linux-mips@vger.kernel.org>; Thu, 03 Mar 2022 03:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=aEzdf5gv463ifntB9pNMOV327BmGIyfUeZ0T79eAJYk=;
        b=yh4D97eHpgQbIZJ7v3fH+nPKsvPCjuGSzH0fOyqhmw0TgNUiISZeEhdKf+4q3rNnlO
         Q6JUCunbFyHajq9HQXb0Y3woTfTKtyb5qdihZ21O1GpAAuWxmCxB/5w2ZpSeG5gtuPP8
         Z0o0Ci7JmQDS1bqdNazn2o/sLkei914vqOwdDiRu7j4wk0KXgUxJ90rZ+q0IoM/5v2tj
         Ujyqvr40OtJtviIdqVbMK5icVXk/W8hoJxyRBX3RhquSpk7nT34qgKcJPA/RssgGV4h/
         pWeqqnmq2Km/69Z3VM216Fnb4TH2Uq/1dRcWOXwHC9JMcftk8JTF+39STCT8qjWIO2vq
         YkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=aEzdf5gv463ifntB9pNMOV327BmGIyfUeZ0T79eAJYk=;
        b=CIlhZgqKDvR7SWye3Xi33eNPDgY58gHPd8CO8Z02GFjvXPd6vJut49GjFBW1Dt8buE
         ez0+AnVcGdNGXpIV4Vsh6X0wqkXs28iWtda/BQu8Z16/dd7xJPa7g0HcpxVJ5GOhBF5q
         UAqGF1obCP3XXgmfJBWz4UB2DA+CrOWpJNVNOxjLOBVZujdc+fERcl0G6ysR1oo8gh39
         tFucbHCjU942eMjtObBNUuH4n7T+DWD8lRgnG0NbbAWDNtadYta4b2YilRnVtAQhIZS0
         hrzEvNdqYvROQG4ZskxLOuMMHkSCQLiXf0cH+GcyfHmDTYgSM7UCx8Ix1IIvACTIh7kT
         WVDA==
X-Gm-Message-State: AOAM531eY3/B8M296DebEwKSrDOc0NAJgKowkCop2cN3+t/KuEl5wYVQ
        zLVgKuYjguQS+hsM5wG/2kFRzg==
X-Google-Smtp-Source: ABdhPJxuLSfrteB07/catc9lrU2vXHl0mnaFQNCPKznmN533qNu6Mre9gfLwbdzc15O0dXE/yLskCQ==
X-Received: by 2002:a1c:a186:0:b0:385:31c:4b2d with SMTP id k128-20020a1ca186000000b00385031c4b2dmr3368236wme.7.1646307724409;
        Thu, 03 Mar 2022 03:42:04 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:37d4:6d61:9015:27a5? ([2001:861:44c0:66c0:37d4:6d61:9015:27a5])
        by smtp.gmail.com with ESMTPSA id j7-20020adff547000000b001e3241df64bsm1715867wrp.112.2022.03.03.03.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 03:42:03 -0800 (PST)
Message-ID: <d75cd860-2a4c-6f81-b5d0-dc75f37b7150@baylibre.com>
Date:   Thu, 3 Mar 2022 12:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
 <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
 <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
 <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
 <75CBD357-577A-402D-9E3B-DBE82A84BC43@goldelico.com>
 <4cb08b5d-c1ec-f2b4-a107-63a771146ec0@baylibre.com>
 <598F3A49-9CE2-4C59-95D4-CDA888A3B3BF@goldelico.com>
 <3625b23b-9718-640a-1aac-0b30773a26ab@baylibre.com>
 <E95145AB-DEFC-419D-B926-B0BAF0985D09@goldelico.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <E95145AB-DEFC-419D-B926-B0BAF0985D09@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/03/2022 11:40, H. Nikolaus Schaller wrote:
> Hi Neil,
> 
>> Am 03.03.2022 um 09:35 schrieb Neil Armstrong <narmstrong@baylibre.com>:
>>
>> Hi,
>>
>> On 02/03/2022 23:24, H. Nikolaus Schaller wrote:
>>> Hi Neil,
>>>> Am 02.03.2022 um 15:34 schrieb Neil Armstrong <narmstrong@baylibre.com>:
>>>>
>>>> Hi,
>>>>
>>>>> (cross-checked: RGB mode still works if I force hdmi->sink_is_hdmi = false)
>>>>
>>>> I don't understand what's wrong, can you try to make the logic select MEDIA_BUS_FMT_YUV8_1X24 instead of DRM_COLOR_FORMAT_YCBCR422 ?
>>> I have forced hdmi->sink_is_hdmi = false and replaced
>>>   	/* Default 8bit RGB fallback */
>>> -	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>>> +	output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>>> And then screen remains black. MEDIA_BUS_FMT_RGB888_1X24 works.
>>> (MEDIA_BUS_FMT_VUY8_1X24 doesn't work either).
>>> So this indicates that YUV conversion is not working properly. Maybe missing some special
>>> setup.
>>> What I have to test if it works on a different monitor.
> 
> Same effect on a Xiaomi monitor (user manual just telling HDMI1,4 compatible), an
> older Acer video projector and a Sharp TV set.
> 
> The Xiaomi monitor does not say "No signal" but shows a black screen. The others
> do not even report any HDMI signals. All work well with MEDIA_BUS_FMT_RGB888_1X24.
> 
> This means the transcoding to YUV does not work properly on the jz4780 SoC setup.
> 
> So it looks as if we have to disable it (at least unless someone finds a fix).
> 
>>> Not that this specific panel
>>> (a 7 inch waveshare touch with HDMIinput) is buggy and reports YUV capabilities
>>> but does not handle them...
>>> On the other hand this panel works on RasPi and OMAP5 (where I admit I do not know in
>>> which mode).
>>
>> Pretty sure they don't support YUV HDMI output.
>>
>> If you can try on a certified HDMI devices like a TV, it would here figuring out where comes the issue.
> 
> I am not sure if the Sharp TV is fully certified but would assume...
> 
>>
>>>> If your CSC is broken, we'll need to disable it on your platform.
>>> Indeed.
>>> So it seems as if we need a mechanism to overwrite dw_hdmi_bridge_atomic_get_output_bus_fmts()
>>> in our ingenic-dw-hdmi platform specialization [1] to always return MEDIA_BUS_FMT_RGB888_1X24.
>>> Or alternatively set sink_is_hdmi = false there (unfortunately there is no direct access to
>>> struct dw_hdmi in a specialization drivers).
>>> Is this already possible or how can it be done?
>>
>> It's not handled yet, but we may add the logic to handle the lack of CSC config bit and
>> add a glue config bit to override this like we already did for CEC.
>>
>> I wrote an initial support to disable CSC (only compile-tested), could you try on your platform with setting disable_csc = 1 in your dw-hdmi glue code ?
> 
> This works!
> 
> So how can we get that merged? IMHO your proposal should be before we add ingenic-dw-hdmi.
> If you have a version with proper commit message I can add it to the beginning of my
> seried and include it in a v17. Or if you get yours merged to drm-misc/drm-misc-next I
> can build on top.

You can add it in your v17 patchset with my authorship and my Signed-off-by tag + yours.

As commit message something like :
====================
drm/bridge: dw-hdmi: handle unusable or non-configured CSC module

The dw-hdmi integrates an optional Color Space Conversion feature used
to handle color-space conversions.

On some platforms, the CSC isn't built-in or non-functional.

This adds the necessary code to disable the CSC functionality
and limit the bus format negotiation to force using the same
input bus format as the output bus format.
====================

Thanks,
Neil

> 
> BR and thanks,
> Nikolaus
> 

