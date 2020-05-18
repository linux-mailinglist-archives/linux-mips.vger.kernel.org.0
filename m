Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740EB1D7A86
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 15:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgERN7W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 09:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgERN7V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 09:59:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6394FC061A0C
        for <linux-mips@vger.kernel.org>; Mon, 18 May 2020 06:59:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l11so12077551wru.0
        for <linux-mips@vger.kernel.org>; Mon, 18 May 2020 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qp3KMqm4FQRyseSw00gSsB5YgPJWvTQnwqqnC4fzNYk=;
        b=QjxhrtzgoF4UOeAXmKcLvcQXo3nn09VjgwT3pzwmtMt4UHCM4eXIyEKiKQGvfl5PYd
         5ar6mXkoazv5YLYLkuuFoqM7DPXWgD7ewwKfXdzkrxtG05ZLxLdzDKiUxTAigwZxaN6W
         DCxDQ7qCjJMugmdWYRpb/+ZQU15iI+b20wQTP/582ApRzoBNgp7xJgDuueFczjwl/B5S
         +lXXf0JtBQxyRcf4B9w6JvcBfeyoANEdWihQWeYg83qiDyAGSY6akppZPl435dwpHUTG
         qP5b7zXt1QKCU8HTi0cCR6OrHAFRhKpCb+eBTnR9gr0ARNNFX8JuN7Q9bLHW3k/YYzNF
         XcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qp3KMqm4FQRyseSw00gSsB5YgPJWvTQnwqqnC4fzNYk=;
        b=UcwvPT9G5nYkgY0mOYKHAArRAm8FDYimvBCwpfLDvUg5sDK1GCKR4NgjpXkDRyM5fx
         85gqYvJu1lxVr1H0W6vwNvUNooSdPmol6usIkHFTRdpTRNx19b76EO3/opiJU732Ss2k
         k+179qwXl+jv8HJBzPT4A6gYEhIpFPoEWN4uLxYYjoMyWhnpnxWd2Ufp9WWNt2mxKylh
         /dNx1m8okTAHZU0cpzzNh+FKYIqw9Fx7ai6M/kfh6rS2lVubmY6PG75N2FKNrJKyOI9a
         3L5E8kkIkTdUBK49bdTgjZ8NkSXJsCe0R8529CdExRGdIo2X1FaPz61ta0QmsRp9R76S
         DvgQ==
X-Gm-Message-State: AOAM531OKwCrJyFjSYH1DY6MKNn7ZFILh2kSNjNxV/7/bvyaOV7BE+Yh
        WoRfEsVxuC/Z2WLpd69VwpFeMw==
X-Google-Smtp-Source: ABdhPJy7x6BVz0Xb+O2uc1Xy1BGI6onEzzHz8JHpWyLqk248mRHXNwXCml8Ac0UNNl6/MtBOQHjuxg==
X-Received: by 2002:adf:e80e:: with SMTP id o14mr17715940wrm.307.1589810358929;
        Mon, 18 May 2020 06:59:18 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8? ([2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8])
        by smtp.googlemail.com with ESMTPSA id 5sm17082716wmd.19.2020.05.18.06.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 06:59:18 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] clocksource: mips-gic-timer: Set limitations on
 clocksource/sched-clocks usage
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-8-Sergey.Semin@baikalelectronics.ru>
 <20200515171004.GA760381@linaro.org>
 <20200516121647.g6jua35kkihmw5r6@mobilestation>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <4c723219-62f8-be6a-47ea-a586859d832d@linaro.org>
Date:   Mon, 18 May 2020 15:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200516121647.g6jua35kkihmw5r6@mobilestation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/05/2020 14:16, Serge Semin wrote:
> Hello Daniel,
> 
> Thanks for your comment. My response is below.
> 
> On Fri, May 15, 2020 at 07:10:04PM +0200, Daniel Lezcano wrote:
>> On Thu, May 07, 2020 at 12:41:07AM +0300, Serge Semin wrote:
>>> Currently neither clocksource nor scheduler clock kernel framework
>>> support the clocks with variable frequency. Needless to say how many
>>> problems may cause the sudden base clocks frequency change. In a
>>> simplest case the system time will either slow down or speed up.
>>> Since on CM2.5 and earlier MIPS GIC timer is synchronously clocked
>>> with CPU we must set some limitations on using it for these frameworks
>>> if CPU frequency may change. First of all it's not safe to have the
>>> MIPS GIC used for scheduler timings. So we shouldn't proceed with
>>> the clocks registration in the sched-subsystem. Secondly we must
>>> significantly decrease the MIPS GIC clocksource rating. This will let
>>> the system to use it only as a last resort.
>>>
>>> Note CM3.x-based systems may also experience the problems with MIPS GIC
>>> if the CPU-frequency change is activated for the whole CPU cluster
>>> instead of using the individual CPC core clocks divider.
>>
>> May be there is no alternative but the code looks a bit hacksih. Isn't possible
>> to do something with the sched_mark_unstable?
>>
>> Or just not use the timer at all ?
> 
> Not using the timer might be better, but not that good alternative either
> especially in our case due to very slow external timer. Me and Thomas
> Bogendoerfer discussed the similar commit I've provided to the csrc-r4k driver
> available on MIPS:
> https://lkml.org/lkml/2020/5/11/576
> 
> To cut it short, you are right. The solution with using clocksource_mark_unstable()
> is better alternative spied up in x86 tsc implementation. I'll use a similar
> approach here and submit the updated patch in v3.
> 
> Could you please proceed with the rest of the series review? I'd like to send
> the next version with as many comments taken into account as possible. The
> patchset has been submitted a while ago, but except Rob noone have had any
> comments.(

For me other patches are ok.

I can apply patches 1, 2, 4, 5, 6

Will remain patches 3 et 7


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
