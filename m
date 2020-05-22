Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176E61DEC5D
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 17:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbgEVPpB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 11:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730375AbgEVPpA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 May 2020 11:45:00 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4AEAC08C5C0
        for <linux-mips@vger.kernel.org>; Fri, 22 May 2020 08:44:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h17so10588414wrc.8
        for <linux-mips@vger.kernel.org>; Fri, 22 May 2020 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f8Z+hxs1X/S2M8k2cqePawSWLAhOwu4fpNACrp7ZjZc=;
        b=zNgoSJA3+FdcMg8X+KX3OfOeSA4paEreX+zUg2FjL7Ho+6FDp1qcfYTCq4oPme7Iwu
         TXn2q4lEJ1+Li5urdXDjy2KySJF0ekNd5/3OPcZCesI+WSu6NQlRqIitb9iYSVyXuLTM
         rBE9SnsnmnHawwCdzB+YGT5JWMnZvMcxD5gluIZqzQf2j4qS34+P9cyVYJLFAqX2kcZB
         66YKrqpiQiIdDI3wYTtTUmI7mOldidCF2gehSYJqeg0IRScXW8uB83tmB5JEetagln19
         Bj94QsWdFxEGGb7mnrxgKIJE0TTsT0Z3JboIWeUHIDSZGCzteAquP4d4X+Xvqg6mE8XK
         8mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f8Z+hxs1X/S2M8k2cqePawSWLAhOwu4fpNACrp7ZjZc=;
        b=bAnspIzaifDjDhNnJaDaLFqaWqA/Brda+bqCnIdXalrnRgkGpP42xPSC0XBc48XUeT
         bq9EzHZ+B6wwE9lozridVOyRV2knakVOXs4ZtMcwZbNWRbB9ZnadMpr+i244otL1xIIO
         cxVRKKLwLXd9gM+TQiyUAcReuoukwNJ0MGb44G4s3ljd/ovGd0FMxiX3NCVePY7RQlNe
         Uu5/RzgEWtVUxBXiGU6GX6HV0N7UahFL1Hqy3+pAYbCLL7uADK8nPPVoHoQHHEsA91+V
         ufZIs7OeEL+UOAufUnlB4f1kmyCskp7aj3AkuC8I3BmbYWOLvOGOHEyDtVEVPWwW4x5H
         RA4g==
X-Gm-Message-State: AOAM533Fe9F7YWRBnpjjyxK3YYxP7N+0doACdgRLFUf8QOzMm68n+hzA
        O751+DNQbsQTcnHFElf5x7/s+A==
X-Google-Smtp-Source: ABdhPJzUj4jfq6gavH91iYN31THYLzeIvwole2JFPhFx7X2JfwqWxZ7loWGwMLM/oL84y/F1CdI/Sg==
X-Received: by 2002:a05:6000:14b:: with SMTP id r11mr4187102wrx.124.1590162297341;
        Fri, 22 May 2020 08:44:57 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id e5sm9609409wro.3.2020.05.22.08.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:44:56 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] clocksource: Fix MIPS GIC and DW APB Timer for
 Baikal-T1 SoC support
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200521204818.25436-1-Sergey.Semin@baikalelectronics.ru>
 <211ab91d-6085-3073-1cbc-2300abade1b7@linaro.org>
 <20200522154105.6gkutlgi2hxqjjzc@mobilestation>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <0bbed067-f588-ef3e-a98a-c4b291810e4f@linaro.org>
Date:   Fri, 22 May 2020 17:44:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522154105.6gkutlgi2hxqjjzc@mobilestation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/05/2020 17:41, Serge Semin wrote:
> On Fri, May 22, 2020 at 05:28:42PM +0200, Daniel Lezcano wrote:
>> On 21/05/2020 22:48, Serge Semin wrote:
>>> As for all Baikal-T1 SoC related patchsets, which need this, we replaced
>>> the DW APB Timer legacy plain text-based dt-binding file with DT schema.
>>> Similarly the MIPS GIC bindings file is also converted to DT schema seeing
>>> it also defines the MIPS GIC Timer binding.
>>>
>>> Aside from MIPS-specific r4k timer Baikal-T1 chip also provides a
>>> functionality of two another timers: embedded into the MIPS GIC timer and
>>> three external DW timers available over APB bus. But we can't use them
>>> before the corresponding drivers are properly fixed. First of all DW APB
>>> Timer shouldn't be bound to a single CPU, since as being accessible over
>>> APB they are external with respect to all possible CPUs. Secondly there
>>> might be more than just two DW APB Timers in the system (Baikal-T1 has
>>> three of them), so permit the driver to use one of them as a clocksource
>>> and the rest - for clockevents. Thirdly it's possible to use MIPS GIC
>>> timer as a clocksource so register it in the corresponding subsystem
>>> (the patch has been found in the Paul Burton MIPS repo so I left the
>>> original Signed-off-by attribute). Finally in the same way as r4k timer
>>> the MIPS GIC timer should be used with care when CPUFREQ config is enabled
>>> since in case of CM2 the timer counting depends on the CPU reference clock
>>> frequency while the clocksource subsystem currently doesn't support the
>>> timers with non-stable clock.
>>>
>>> This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
>>> base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
>>> tag: v5.7-rc4
>>
>> Applied patch 1,2,4,5,6,7,8
>>
>> Thanks!
> 
> Great! Thanks. Am I right to expect the series in: git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
> at the branch timers/core?

The series first goes to:

https://git.linaro.org/people/daniel.lezcano/linux.git/log/?h=timers/drivers/next

, then I send the PR to Thomas, who send in turn a PR at the merge
windows to Linus for the entire tip tree.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
