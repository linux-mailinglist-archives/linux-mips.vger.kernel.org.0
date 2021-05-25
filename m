Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6406A390B78
	for <lists+linux-mips@lfdr.de>; Tue, 25 May 2021 23:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhEYVbM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 May 2021 17:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhEYVbM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 May 2021 17:31:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065FCC061756;
        Tue, 25 May 2021 14:29:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q1so5801255lfo.3;
        Tue, 25 May 2021 14:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yn3fl1fZB0VOpwc1b4wth7TBINMg9VY7zs7B0HHCpNE=;
        b=Jr5XAZqP7SiSwza7IIsoYX/ZNbF3/7pLq+iT9XGpywM350Tooz+97LFyTDYZyrVxeW
         1jouhV3u7LOyQxPDg/C3ufISP5D350ZyxfTOdmR+1FCrq+s4QhJs0to/xosjEiOCGHXP
         tq4Ffi3dktnrbiA3M8DmJxdnQjigeZpYhDotuJLK0a6CiMF7jwhJy55icNy4sqraUxeX
         K73kL+XWPWn4++6qjdsflr0pmcu8obWS8TEK2QaJYElV/vyj+buNgD3YSkrB7FiG0NL7
         g7BOpaZ+Yo63i+6VeA6qMNRnLRQpXS6YA6xc8pbf8yR3sE33sqOViQoyUXdZHC3zeu0t
         9eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yn3fl1fZB0VOpwc1b4wth7TBINMg9VY7zs7B0HHCpNE=;
        b=sMpcXCrUcB7skBm71oeYfsqKKD8V5pluRBqlzdgNGyODgEj/so15p62rmhEjGBvEER
         sNSvJjizqXbgwTSTsBtb550rhJdF3l3rncCjjVt3kqzfWZWqRaeIfFCgGOdMLdtCYo9e
         rIsz9x1XnuHMfOKjcmYz3P4OoHAIH+onOpc5LBf2g4yg2jmuL751GJY1w6+IiMSwU3lC
         n/oHs6zhotVyP6T/LjoUozl49TyASoVXO9F10Rj9m63krQzz9niswMwjwwXouEStzHDq
         Vl7+0QlQT2IM3UTUcsgwWdVg18dieN4/H6BiZJgsKBPL/tK8aSrsWn878LkBcU1aNSkx
         QKOQ==
X-Gm-Message-State: AOAM532JOaUwJ2eiEoiShRoKq67tvyeYZl760WTYafw5Iko7pUpSlNmd
        lSfcA/HB004J/drc4vQ/TaH829wo8xc=
X-Google-Smtp-Source: ABdhPJyz9+7HTvrltQyjbzWHNILgCza4grBtexvZEuKDFSl3fCl0S1elsmUVsZdsNhR9dOu/iicCOQ==
X-Received: by 2002:ac2:5f48:: with SMTP id 8mr14819793lfz.340.1621978179080;
        Tue, 25 May 2021 14:29:39 -0700 (PDT)
Received: from [192.168.2.145] (46-138-180-236.dynamic.spd-mgts.ru. [46.138.180.236])
        by smtp.googlemail.com with ESMTPSA id x12sm2221450ljc.70.2021.05.25.14.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 14:29:38 -0700 (PDT)
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK
 enabled
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2e5bb7c2-62d9-b1f7-7f35-2b379d3692d5@gmail.com>
Date:   Wed, 26 May 2021 00:29:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW_G259Nwx1EEf38h0AcVH8yjmjqp9Mh-vQ4LJJMzD8Dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

25.05.2021 15:19, Geert Uytterhoeven пишет:
...
>>> There 3 possible solutions:
>>>
>>> 1. Factor out COMMON_CLK from HAVE_LEGACY_CLK, if this is possible
>>> 2. Build stubs universally, maybe using weak functions.
>>
>> I vote for this one - global stubs.
> 
> Yep.
> 
>> Or for a new one:
>> 4. Disable COMPILE_TEST for specific platforms (mentioned in commit
>> msg). Eventually could be like:
>> config RALINK
>>         depends !COMPILE_TEST || (COMPILE_TEST && COMMON_CLK)
> 
> That's a neat idea!
> 
> Of course there's a fifth option:
> 
> 5. Convert legacy platforms to COMMON_CLK.
> 
> Which is already happening for ARM EP93XX.

I'll try to take a closer look at alternative options, thank you for
yours input.
