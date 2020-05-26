Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10311E26A2
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 18:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgEZQP5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 12:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbgEZQP4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 12:15:56 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC87FC03E96D;
        Tue, 26 May 2020 09:15:56 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id cx22so40207pjb.1;
        Tue, 26 May 2020 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=YqEvDdm+2FRvK2g2dpbk2MAAMjjDOpk7CCKnCxddFow=;
        b=Qew9FHZ/T8F9VE7WbLHFYxT7UZdYTNQA1StkBFBnUWe/aEao547r51+4K9HjuOWMDJ
         uyCLXXgnU8/K41YEQ0ozdihpsj8AG+vvYL/V7Isreq6H38Ebx0wAo252XIElvjDe8k77
         kxbElRRST9MgTd7WifEdoXPi5GDuKDUrUdFBiw5StcJpTK65HhtsBwK4u2aTjRrQCPQu
         5krB6Lh07i9ke7UbGhRu0tp7XruxzEso6VrHBgQ1ycIK+iv7suEyn3gSrlWnT4ITaris
         qXvkTrtVdO/4QyM1KFDX0D59dX7sZN2GZu+xXrHaPksNflayJr0eKacetY5b4L1ho7W/
         OlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YqEvDdm+2FRvK2g2dpbk2MAAMjjDOpk7CCKnCxddFow=;
        b=dqD5MgiwRWqHaInCeaWY1TCnc/DfR0tR3TfRgDpkn/waT1GJB3E9ZSEJ4Yj5HF+ICD
         tugPdeBooCYBJA55n0XTsfyg/5ReiHaPbuIXh52tqTxZcJPsWn9rR1gdrBTav5dgCq8s
         5TNaG74wt5lTHBroHJKOXKXw8r14cJEA7e0psccECHgRWCAEvPc7cC5zMHrQq2hi4oz3
         ekAnUVIdZ8XjB4HJ8hTYPK481SelIlWP2vwZJHbDZdkD2Bd0MYi9B17l5u1vr8CZ7x8J
         jCD0KeCfX89psVe44dYbmeWPvP6QzBrYWux5YFadSQJBMweEiNAos4QVS4HJSOu9FRx4
         CxjA==
X-Gm-Message-State: AOAM532nl/1uwg9rGCabz5iBh8s6P0vaVDx2qgD8wf65Eq7DnVwY3CY8
        nh4oTCg2SalhEFiqXKBGLXW8x7m5
X-Google-Smtp-Source: ABdhPJwMfbhWKQlvyzpNKVQ/t1vHhePAK9yYVH82BhLbp+pJptxgzrRKgEUNfCwhaHG2qRmc9lWuBw==
X-Received: by 2002:a17:90a:4149:: with SMTP id m9mr11944pjg.200.1590509755882;
        Tue, 26 May 2020 09:15:55 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u1sm33375pfu.151.2020.05.26.09.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 09:15:55 -0700 (PDT)
Subject: Re: [PATCH] MIPS: BCM63xx: fix 6328 boot selection bit
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200526110324.1324754-1-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <862863b2-d73e-0c48-6503-c912c60c1b94@gmail.com>
Date:   Tue, 26 May 2020 09:15:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200526110324.1324754-1-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 5/26/2020 4:03 AM, Álvaro Fernández Rojas wrote:
> MISC_STRAP_BUS_BOOT_SEL_SHIFT is 18 according to Broadcom's GPL source code.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

This is correct:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Fixes: e5766aea5b9b ("MIPS: BCM63XX: Add basic BCM6328 support")

> ---
>  arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
> index bc3444cd4ef2..9ceb5e72889f 100644
> --- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
> +++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
> @@ -1367,8 +1367,8 @@
>  #define MISC_STRAPBUS_6328_REG		0x240
>  #define STRAPBUS_6328_FCVO_SHIFT	7
>  #define STRAPBUS_6328_FCVO_MASK		(0x1f << STRAPBUS_6328_FCVO_SHIFT)
> -#define STRAPBUS_6328_BOOT_SEL_SERIAL	(1 << 28)
> -#define STRAPBUS_6328_BOOT_SEL_NAND	(0 << 28)
> +#define STRAPBUS_6328_BOOT_SEL_SERIAL	(1 << 18)
> +#define STRAPBUS_6328_BOOT_SEL_NAND	(0 << 18)
>  
>  /*************************************************************************
>   * _REG relative to RSET_PCIE
> 

-- 
Florian
