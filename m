Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1744E390D6A
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 02:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbhEZAlf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 May 2021 20:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhEZAle (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 May 2021 20:41:34 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9995C061574;
        Tue, 25 May 2021 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=tETNDjNyS9VWp0lmkXGYY/OSTeXZstfAPKUdqUv0Z6g=; b=cuho+FlC0QiW7LCkxQwvlW2LIn
        vdATixI4JJu6Nb5GPntqn1h36tTA2GAp4u6SqyHeh4v/U8os2HHd7AJ/qdpILv+k7W42QdTck2XWp
        1JNEx++xFzzmG/OqOkdDRyqor7KWVOXZlaDgM5qdCCy4aTs/dbpv9AHRjiYmlFO0D6i/OWquSxpkO
        qeUqZahCEgKwivrncyTcomGUWpOtgWIr5NwvudL22BrVdrI6GA11Ps039sQ6LcjvsUEDYGNXXWPzI
        H9DZWM9o05gvYQiMEMB6c1Ey3T+ysWCYP18tsz3oEA7nbelPsDblH6/nnLJHpyNVnqgdwRAHAsJsK
        6lhywPkA==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1llhaa-009Y5s-Ge; Wed, 26 May 2021 00:40:00 +0000
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK
 enabled
To:     Dmitry Osipenko <digetx@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
References: <20210523232556.15017-1-digetx@gmail.com>
 <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
 <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com>
 <f12b4622-6cea-ac65-2d94-f50a85c29215@canonical.com>
 <CAMuHMdW_G259Nwx1EEf38h0AcVH8yjmjqp9Mh-vQ4LJJMzD8Dg@mail.gmail.com>
 <2e5bb7c2-62d9-b1f7-7f35-2b379d3692d5@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3661fdba-ad32-5d16-7714-1ebc58caf435@infradead.org>
Date:   Tue, 25 May 2021 17:39:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <2e5bb7c2-62d9-b1f7-7f35-2b379d3692d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/25/21 2:29 PM, Dmitry Osipenko wrote:
> 25.05.2021 15:19, Geert Uytterhoeven пишет:
> ...
>>>> There 3 possible solutions:
>>>>
>>>> 1. Factor out COMMON_CLK from HAVE_LEGACY_CLK, if this is possible
>>>> 2. Build stubs universally, maybe using weak functions.
>>>
>>> I vote for this one - global stubs.
>>
>> Yep.
>>
>>> Or for a new one:
>>> 4. Disable COMPILE_TEST for specific platforms (mentioned in commit
>>> msg). Eventually could be like:
>>> config RALINK
>>>         depends !COMPILE_TEST || (COMPILE_TEST && COMMON_CLK)
>>
>> That's a neat idea!
>>
>> Of course there's a fifth option:
>>
>> 5. Convert legacy platforms to COMMON_CLK.
>>
>> Which is already happening for ARM EP93XX.
> 
> I'll try to take a closer look at alternative options, thank you for
> yours input.

Hi,

If you are messing around with HAVE_LEGACY_CLK and COMMON_CLK
and don't mind, please have a look at this report from
'kernel test robot':
  https://lore.kernel.org/lkml/202103162301.oomY9NwI-lkp@intel.com/


Maybe this one is more MIPS-specific. I dunno.
I tried to come up with a patch for it and failed.

I will be happy to built-test any patches that you come up with.

Maybe I have just looked at this too long...

thanks.
-- 
~Randy

