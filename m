Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CB3E28FE
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2019 05:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392946AbfJXDoj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Oct 2019 23:44:39 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39411 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390576AbfJXDoj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Oct 2019 23:44:39 -0400
Received: by mail-pl1-f194.google.com with SMTP id s17so11138575plp.6
        for <linux-mips@vger.kernel.org>; Wed, 23 Oct 2019 20:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TV6Oet1CX78WIt82GeuaMtSkWT3+0AbM7qL1lnHZu+o=;
        b=rxmSuPoCR/liLfUt9uLKT4GZlRsmqu92uhm3viHmstzowSmJh7exNxprR+1T8+/0vf
         yVidUQrmJ85CGn1C8Y78yJqwvMOX1jj+4gEbxxhyHnIUJ4y4tqPBJtXb/tXStThvCF5U
         XFO5FoQyLZ85RdxW0krmY5heGMCFAUgHS3LiboaxLxlRkw20w9hy6PVnyWFotV6taRwU
         aUn2/xAqzR7jdNPzHwWjr5vr7m7S1EhiiIO29rZXOMrGsqiZoQJmMrU1v/XRmNXp+HOV
         maPvmQus4sp5F3Bl8uqKs4TTUNS92FnD14k7hJnzgstxO10B9/32MKJP7WHU3Fm965HE
         Fd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TV6Oet1CX78WIt82GeuaMtSkWT3+0AbM7qL1lnHZu+o=;
        b=OKA7ACjvDe4Cn398ft31MULMli45SBQmjqfbbs/8Ggm6IKoIZgj9sh45Mt1Ax0sypE
         Em52380ix1Gn0X2aXbSYp3tGoFLWQCAqTnOjRqEsdoOqh02AfIDM7YHtibkojNW85D4x
         ANM7Tc2GUUTam7w+3s7sjeSRFfQZAgrOsZpnWe0xh4FBIA4EUkB8uwvwbdLopk+RkrjB
         /RhBwEuLKFv8JyKGQgFWjPk3ZtLDrSpyLFVkktBRIATMgUNJk2YT5y/wqTEt1zGPwuHd
         jCFi9W+iYiiqvfIADY9tkPt+b6NZ3q51nQR2QoY9M3hrSq0wMdML3KR2YyOE55YXgo4h
         WvtA==
X-Gm-Message-State: APjAAAXcRJGWgqWKXUe0dAzwlDUFI/5ka1rrfsVThgaym109hqrYmQrd
        vH6EMXkq52e1MSKL9IqLlHJozpH5
X-Google-Smtp-Source: APXvYqy3CQzO8njKN019LXl6Li63yFDsNRAg0V77CcNB56cOVdVyGqwCvlEhd3JaYTSA3YfsvbhGxA==
X-Received: by 2002:a17:902:aa91:: with SMTP id d17mr13093975plr.69.1571888678172;
        Wed, 23 Oct 2019 20:44:38 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id z9sm4001528pgs.46.2019.10.23.20.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2019 20:44:37 -0700 (PDT)
Subject: Re: [PATCH v2] MIPS: bmips: mark exception vectors as char arrays
To:     Jonas Gorski <jonas.gorski@gmail.com>, linux-mips@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
References: <20191022191100.19373-1-jonas.gorski@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6ead3ba9-7e7c-b134-e9e4-4e3faca99f41@gmail.com>
Date:   Wed, 23 Oct 2019 20:44:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191022191100.19373-1-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/22/2019 12:11 PM, Jonas Gorski wrote:
> The vectors span more than one byte, so mark them as arrays.
> 
> Fixes the following build error when building when using GCC 8.3:
> 
> In file included from ./include/linux/string.h:19,
>                  from ./include/linux/bitmap.h:9,
>                  from ./include/linux/cpumask.h:12,
>                  from ./arch/mips/include/asm/processor.h:15,
>                  from ./arch/mips/include/asm/thread_info.h:16,
>                  from ./include/linux/thread_info.h:38,
>                  from ./include/asm-generic/preempt.h:5,
>                  from ./arch/mips/include/generated/asm/preempt.h:1,
>                  from ./include/linux/preempt.h:81,
>                  from ./include/linux/spinlock.h:51,
>                  from ./include/linux/mmzone.h:8,
>                  from ./include/linux/bootmem.h:8,
>                  from arch/mips/bcm63xx/prom.c:10:
> arch/mips/bcm63xx/prom.c: In function 'prom_init':
> ./arch/mips/include/asm/string.h:162:11: error: '__builtin_memcpy' forming offset [2, 32] is out of the bounds [0, 1] of object 'bmips_smp_movevec' with type 'char' [-Werror=array-bounds]
>    __ret = __builtin_memcpy((dst), (src), __len); \
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/mips/bcm63xx/prom.c:97:3: note: in expansion of macro 'memcpy'
>    memcpy((void *)0xa0000200, &bmips_smp_movevec, 0x20);
>    ^~~~~~
> In file included from arch/mips/bcm63xx/prom.c:14:
> ./arch/mips/include/asm/bmips.h:80:13: note: 'bmips_smp_movevec' declared here
>  extern char bmips_smp_movevec;
> 
> Fixes: 18a1eef92dcd ("MIPS: BMIPS: Introduce bmips.h")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
