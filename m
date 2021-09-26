Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554F94185A4
	for <lists+linux-mips@lfdr.de>; Sun, 26 Sep 2021 04:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhIZCbH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Sep 2021 22:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhIZCbH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Sep 2021 22:31:07 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BCAC061570;
        Sat, 25 Sep 2021 19:29:31 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id n6so713468qvp.7;
        Sat, 25 Sep 2021 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=z5gGvq+sPOjmijgnv6IGTU1y1xAUZzPxE4ydSPm89wI=;
        b=pWBDa67oP7+Zy1rAO7VzVsBBkg1FKBtEoWbcCcS5eaCnYctI8wz/YkUZNmaPGcMsjj
         DGoOVRk3ASHmeJ+9PQ3YFBdyyrkeZXp/9dx/4T+AhM6zRNPFD0xZR0TdZ5nwXUJSsifF
         RCtyyWy5lnSi6YkukxMC3wtKGEnukGxzXZMCjXqDno0jTEhzclPEr1wPL0Gm0Ix4gMpL
         Bmiw9AvtxmHBGU/Idb68fG+scRIAbE2OcVxiBPzhkYZ6WTn1riMR2LX3t29EhKIIT7P6
         t9RXDlTpGSXRLxOnXQHL+3ukpjWYp43zaBtGOVkJVaxlur8tsooV79+bx/Npg/jR9Q9A
         JmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z5gGvq+sPOjmijgnv6IGTU1y1xAUZzPxE4ydSPm89wI=;
        b=EvqOrSOb6SOK5cUMLNHQ2UN28MVEXmTCA7py2JXgKQpAeaVhzyt7jgep5K3VzHPral
         Dc1C4JnKhCHEPAZGZzLwRIbFROaPt7Ykcm8Qc3y8L8zuR2LXpQllMA8qgim1jaxkXkoS
         Eq8pvIDoIY8tshvP98YQJ3VKKJvieUMgthFxz1QbVPoZCas22RJjwdFlQGPnLpDz+p61
         iL4fDOCi0VXxjzOnyxUnjpKjYE+SVHpu/oEwuuigiLtWeymrtVD0OSiawxmOambhp68Y
         7gf5W8xvr6z4bPxSvNBtidu4N68fBkn39H+gQ2hH9KsSHEKMavLK1RM6MvmmMdSuG+Q3
         8B6g==
X-Gm-Message-State: AOAM530JvoDq6U/i4/0xXeILJrV2Q0wQyL2pviQ/dHZStLQCSPJ5qXN7
        3ACar/FJV2EtAj8zfz9+DgY=
X-Google-Smtp-Source: ABdhPJxcoD8U53lPCZUuFspLmbAByJce7sL+OLlDav50SvLTbxaH67h0m83LTJ3BlSjuic65Plaacw==
X-Received: by 2002:a05:6214:490:: with SMTP id ay16mr17939059qvb.25.1632623370567;
        Sat, 25 Sep 2021 19:29:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:a90f:da5:ff6e:aa3e? ([2600:1700:dfe0:49f0:a90f:da5:ff6e:aa3e])
        by smtp.gmail.com with ESMTPSA id l1sm8398038qti.94.2021.09.25.19.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Sep 2021 19:29:30 -0700 (PDT)
Message-ID: <70fc7450-17e2-6ffd-01b7-297f93386cc6@gmail.com>
Date:   Sat, 25 Sep 2021 19:29:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 02/11] genirq: Export irq_to_desc() again to modules
Content-Language: en-US
To:     Thomas Gleixner <tglx@linutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Russell King <linux@armlinux.org.uk>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
 <20210924170546.805663-3-f.fainelli@gmail.com> <87wnn4cqwd.ffs@tglx>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <87wnn4cqwd.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 9/25/2021 2:00 PM, Thomas Gleixner wrote:
> On Fri, Sep 24 2021 at 10:05, Florian Fainelli wrote:
>> In order to build drivers/irqchip/irq-bcm7038-l1.c as a module (for use
>> in GKI), we need to export_to_desc() which is used in this snippet of
>> code:
>>
>> 	irqd_set_single_target(irq_desc_get_irq_data(irq_to_desc(virq)));
>>
>> This effectively reverts 64a1b95bb9fe ("genirq: Restrict export of
>> irq_to_desc()").
> 
> No. I'm not reexporting this. We've spent quite some time to prevent all
> kind of drivers for fiddle with irq descriptors and I'm not going
> to reopen that can of worms.
> 
> irq_get_irq_data() is exported and provides you what you need.

That is exactly what I was looking for and somehow missed it during my 
search the other day, thanks!
-- 
Florian
