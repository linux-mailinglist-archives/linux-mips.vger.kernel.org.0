Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57F32249EB
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jul 2020 10:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgGRIkI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Jul 2020 04:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbgGRIkH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 18 Jul 2020 04:40:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C75C0619D4
        for <linux-mips@vger.kernel.org>; Sat, 18 Jul 2020 01:40:06 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r19so15197276ljn.12
        for <linux-mips@vger.kernel.org>; Sat, 18 Jul 2020 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=grHudVuxTrujFcMeBbNEzFtggMnTeKfPICDDWvNm5qQ=;
        b=JxoOm75VPiSO3PvPhBOYKhjkYBPSzOkEGNvBKzzVHYb9Rjpd/2lw8isqYnFTqXaE21
         C+3CgK+K5piqQQKYelN5pmjLyYxqfc5aAi0ULmEU0tzBzcQGldVFhG63xZeEbru+b2c5
         7kXb1Htwvi29RZbiOF+DtZw68CeC9tM32rQ4yyzttv9Gfu0We7eglDXlTwOoWSHj7iaG
         uFdKHbZ4suTw2Kj1YExnw/5V9FAso4O5mejSjADC/gVT0AAkQZ+Rc2Jyl0rPZXgwLOzm
         A8yMggODuGPwRx4MTTd/izM2d1i01Iv5Xdj7Z4nCrMtmW+0gIqCPyKiutLZojfM6ClVd
         Ui0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=grHudVuxTrujFcMeBbNEzFtggMnTeKfPICDDWvNm5qQ=;
        b=WwP1A82JSkb27WFfzx3tpldCxkzUcTreF3le2TqwFAh1JJO1M5HQ/xAm5unizvBXde
         wtxRUL5LpRZAJwNiM2PXjNxG6qxtYzzNkOCX4aPCH5WfLF0frQEuuazdrNoZuITRhr3L
         ZQHH6E41CVMBg933TvhKalECMRh7z9PAbfi2n1jubUwMXMaW8nTFo2UF8MGm0sksi/0X
         774HIQDBwKOqvV+1Awtv8kU+SVC0KhUexOAnS0AEkquKk6mFbxZPMxHXW5I8ob2JsAUG
         dTeT38V3QvGvGn49Dq+c8igtQHngaxCcwnP3urtZT7Y4ToiOG5uBl4sZMz8BFz25TrEZ
         LVOw==
X-Gm-Message-State: AOAM5330bwrZdk5VGUfewQ7V+NJ2rloLP8WLJU82lFTlGl7ycnw1Oj7v
        ZROS2SdDm6sFW2sT3H/SKLMR+A==
X-Google-Smtp-Source: ABdhPJywOSyHHy2bJZqi1NPJYnFaaf9Tq+T0dfJMvzvTJxykDZd2Oa2LCdCG8Yl4tfAw3QfOH7Ll9w==
X-Received: by 2002:a05:651c:217:: with SMTP id y23mr6450848ljn.447.1595061604957;
        Sat, 18 Jul 2020 01:40:04 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42e3:6011:c93:75dd:e99a:5259? ([2a00:1fa0:42e3:6011:c93:75dd:e99a:5259])
        by smtp.gmail.com with ESMTPSA id e9sm2083043ljn.61.2020.07.18.01.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2020 01:40:04 -0700 (PDT)
Subject: Re: [PATCH v7 3/5] MIPS: Ingenic: Let the Kconfig of platform enable
 the clocksource driver.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, daniel.lezcano@linaro.org,
        tsbogend@alpha.franken.de, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, paul@crapouillou.net
References: <20200717165947.56158-1-zhouyanjie@wanyeetech.com>
 <20200717165947.56158-4-zhouyanjie@wanyeetech.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4903f4ba-6ecb-5c38-aa5a-4f20bd473124@cogentembedded.com>
Date:   Sat, 18 Jul 2020 11:39:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717165947.56158-4-zhouyanjie@wanyeetech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 17.07.2020 19:59, 周琰杰 (Zhou Yanjie) wrote:

> The previous clocksource patch in this series ([2/3]) has remove

   Removed.

> "default MACH_INGENIC" and make option silent, so we need to

   Made?

> enable the corresponding driver in the platform's Kconfig.
> 
> Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>      v7:
>      New patch.
> 
>   arch/mips/jz4740/Kconfig | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
> index 6c065dcaeff8..5ad60998702e 100644
> --- a/arch/mips/jz4740/Kconfig
> +++ b/arch/mips/jz4740/Kconfig
> @@ -36,27 +36,34 @@ endchoice
>   config MACH_JZ4740
>   	bool
>   	select SYS_HAS_CPU_MIPS32_R1
> +    select INGENIC_TIMER

    Please use tab instead of spaces here an below.

[...]

MBR, Sergei
