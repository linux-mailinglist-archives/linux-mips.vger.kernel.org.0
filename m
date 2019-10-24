Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F80E29B6
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2019 07:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408386AbfJXFCT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Oct 2019 01:02:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45578 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbfJXFCS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Oct 2019 01:02:18 -0400
Received: by mail-pf1-f195.google.com with SMTP id x28so866219pfi.12
        for <linux-mips@vger.kernel.org>; Wed, 23 Oct 2019 22:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=BXB78VbXFQjZx1szpcJAaPeZw2U1/hPLE/mI9jvNq3E=;
        b=TELiurpkxmBpMVVt6MZsnyrlb0/eZzRltL5f59OW0P9liEXuiqRjrarBB3nskVW666
         0cc5kWf+83DGvJOK3+QIsYYBeBYGPHz8Ja46SsoQmiAdHyRiKzM4sakwRYdkxELLD7pm
         WeS1g4NtyN6fqNWnm2G5hogJ5fAKQ8s/UxlAT3EoKwAHAiiyMk+cn0Cui7DlzB5IRvFz
         5jL6jlCSDqW1+YtHM6kdlbIFZK8ZSFDAJQYV+DzpRO0uScFLDLgun59VaXjChS3WfTq9
         ArCvtTHIlF3KAuhtDp1wKoVgyr21czbkqnFRt77YY6z+Tj4tY5OTmT3eInXZ6f4Ekn/8
         KOJg==
X-Gm-Message-State: APjAAAUlWB2JlJb9dz1Om/7fgIfqhX3R8pisnyYvyNe52INyZWk/0bcm
        moXGV5zoUXLILQ2QKJLGapk=
X-Google-Smtp-Source: APXvYqw35bjXGFvuQmM2GfB6iyvWEw4IZUXiDrsgh78YK+gF6yen+esg3jmL0jalyMnkq1Er8UgqXA==
X-Received: by 2002:a63:7051:: with SMTP id a17mr1248672pgn.121.1571893337651;
        Wed, 23 Oct 2019 22:02:17 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:5cfa:8da3:1021:be72])
        by smtp.gmail.com with ESMTPSA id s11sm804721pjp.26.2019.10.23.22.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 22:02:17 -0700 (PDT)
Message-ID: <5db13059.1c69fb81.8b85a.373d@mx.google.com>
Date:   Wed, 23 Oct 2019 22:02:16 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Jonas Gorski <jonas.gorski@gmail.com>
CC:     linux-mips@vger.kernel.org
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: bmips: mark exception vectors as char arrays
References:  <20191022191100.19373-1-jonas.gorski@gmail.com>
In-Reply-To:  <20191022191100.19373-1-jonas.gorski@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Jonas Gorski wrote:
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

Applied to mips-fixes.

> commit e4f5cb1a9b27
> https://git.kernel.org/mips/c/e4f5cb1a9b27
> 
> Fixes: 18a1eef92dcd ("MIPS: BMIPS: Introduce bmips.h")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
