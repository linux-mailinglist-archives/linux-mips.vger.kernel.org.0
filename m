Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4283932E
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2019 19:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbfFGR1z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jun 2019 13:27:55 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37031 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730354AbfFGR1y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Jun 2019 13:27:54 -0400
Received: by mail-pg1-f195.google.com with SMTP id 20so1511518pgr.4
        for <linux-mips@vger.kernel.org>; Fri, 07 Jun 2019 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t1Jr1FCmqS1Mr/m/1RE5nSsz37n3OPkP1+HhQvMxbRI=;
        b=OYe//x5getkN5h7mdMutJxAAxtun8wSlPprc7g/qPr8D8/W/jchciN9Vx9y+yjRNRY
         gHIKHlgL/am/LTLWbN2MfkIYmKh/G+3/CaqkZBcKrzn/60cAzWUk5RHgWxb6phBjgZeu
         GPNtgk6gQTXd1B+uCr+QYIszkXqNNR1tROQPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=t1Jr1FCmqS1Mr/m/1RE5nSsz37n3OPkP1+HhQvMxbRI=;
        b=D9cWeSozx5EwfhypnrQ3E0fBJVi8tunvOKhr2Dk3WaCW+5tC4kRRvgot/EjuOxVUZc
         mVz53R08JPm4mi6Zd7oMJ9iB3b9C1ouWJLWveX3XoHyVO1dUGVodxQ1GbSm2deP854e9
         NNIC/oZkhWjs0s+YbUrmj/JGoxF7MTfEjzZW2dSgtlaMHsn6BYRiJ4ISbIRT4/MvMaEf
         57tlIJBEwx4X5QNM9X5UiEsCYuirPHRW7koyI21ATcbUq4cNNlrF4JV0w+KKDF73j4C7
         GboHZWgtI2O3UmKK4cwvZjKNDuAWnkUsjRSFj4m1gV40j/2kaGMB+7A25EE2iKDwgYoy
         ZhSg==
X-Gm-Message-State: APjAAAVfevxR/JpcR8Rokmb2uOT0+BE0cGgyBH5hA8Qvmw5dbMg77Sz9
        pNWfmSlv5/00G/RRLmSC803Fke9TqN/p/gI/MXQPcWqHKxNC++QrpespU2yes5oceRY4t9whS5i
        Jl7IDrkQzrsaSk5G57npgDH2Y4o8d1iLIzmz+Ox3h8IudurJcjHm5SiAEnHoX4eP1XSNcm/Qd8q
        TQ6p3HT+0=
X-Google-Smtp-Source: APXvYqxeHzLi1zmOxr3PT2Kls/qCPd3AD6Ar6QNUA/LHCl9PcM/PTlWIB7Vg0clB1Mgy7O+/BG+Cyg==
X-Received: by 2002:a63:f957:: with SMTP id q23mr4023924pgk.326.1559928473364;
        Fri, 07 Jun 2019 10:27:53 -0700 (PDT)
Received: from [10.67.49.123] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g9sm2318681pgs.78.2019.06.07.10.27.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:27:52 -0700 (PDT)
Subject: Re: [PATCH] irqchip/bcm7038-l1: Fix build on ARM/ARM64
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>
Cc:     Kevin Cernekee <cernekee@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>
References: <20190530231658.23273-1-f.fainelli@gmail.com>
From:   Florian Fainelli <florian.fainelli@broadcom.com>
Openpgp: preference=signencrypt
Autocrypt: addr=florian.fainelli@broadcom.com; prefer-encrypt=mutual; keydata=
 mQENBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAG0MEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPokB
 xAQQAQgArgUCXJvPrRcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFrZXktdXNh
 Z2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2RpbmdAcGdw
 LmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29tLmNvbQUb
 AwAAAAMWAgEFHgEAAAAEFQgJCgAKCRCBMbXEKbxmoE4DB/9JySDRt/ArjeOHOwGA2sLR1DV6
 Mv6RuStiefNvJ14BRfMkt9EV/dBp9CsI+slwj9/ZlBotQXlAoGr4uivZvcnQ9dWDjTExXsRJ
 WcBwUlSUPYJc/kPWFnTxF8JFBNMIQSZSR2dBrDqRP0UWYJ5XaiTbVRpd8nka9BQu4QB8d/Bx
 VcEJEth3JF42LSF9DPZlyKUTHOj4l1iZ/Gy3AiP9jxN50qol9OT37adOJXGEbix8zxoCAn2W
 +grt1ickvUo95hYDxE6TSj4b8+b0N/XT5j3ds1wDd/B5ZzL9fgBjNCRzp8McBLM5tXIeTYu9
 mJ1F5OW89WvDTwUXtT19P1r+qRqKuQENBFPAG8EBCACsa+9aKnvtPjGAnO1mn1hHKUBxVML2
 C3HQaDp5iT8Q8A0ab1OS4akj75P8iXYfZOMVA0Lt65taiFtiPT7pOZ/yc/5WbKhsPE9dwysr
 vHjHL2gP4q5vZV/RJduwzx8v9KrMZsVZlKbvcvUvgZmjG9gjPSLssTFhJfa7lhUtowFof0fA
 q3Zy+vsy5OtEe1xs5kiahdPb2DZSegXW7DFg15GFlj+VG9WSRjSUOKk+4PCDdKl8cy0LJs+r
 W4CzBB2ARsfNGwRfAJHU4Xeki4a3gje1ISEf+TVxqqLQGWqNsZQ6SS7jjELaB/VlTbrsUEGR
 1XfIn/sqeskSeQwJiFLeQgj3ABEBAAGJAkEEGAECASsFAlPAG8IFGwwAAADAXSAEGQEIAAYF
 AlPAG8EACgkQk2AGqJgvD1UNFQgAlpN5/qGxQARKeUYOkL7KYvZFl3MAnH2VeNTiGFoVzKHO
 e7LIwmp3eZ6GYvGyoNG8cOKrIPvXDYGdzzfwxVnDSnAE92dv+H05yanSUv/2HBIZa/LhrPmV
 hXKgD27XhQjOHRg0a7qOvSKx38skBsderAnBZazfLw9OukSnrxXqW/5pe3mBHTeUkQC8hHUD
 Cngkn95nnLXaBAhKnRfzFqX1iGENYRH3Zgtis7ZvodzZLfWUC6nN8LDyWZmw/U9HPUaYX8qY
 MP0n039vwh6GFZCqsFCMyOfYrZeS83vkecAwcoVh8dlHdke0rnZk/VytXtMe1u2uc9dUOr68
 7hA+Z0L5IQAKCRCBMbXEKbxmoLoHCACXeRGHuijOmOkbyOk7x6fkIG1OXcb46kokr2ptDLN0
 Ky4nQrWp7XBk9ls/9j5W2apKCcTEHONK2312uMUEryWI9BlqWnawyVL1LtyxLLpwwsXVq5m5
 sBkSqma2ldqBu2BHXZg6jntF5vzcXkqG3DCJZ2hOldFPH+czRwe2OOsiY42E/w7NUyaN6b8H
 rw1j77+q3QXldOw/bON361EusWHdbhcRwu3WWFiY2ZslH+Xr69VtYAoMC1xtDxIvZ96ps9ZX
 pUPJUqHJr8QSrTG1/zioQH7j/4iMJ07MMPeQNkmj4kGQOdTcsFfDhYLDdCE5dj5WeE6fYRxE
 Q3up0ArDSP1L
Message-ID: <9fbd7dc0-d45b-3a33-9011-284fa867ca9b@broadcom.com>
Date:   Fri, 7 Jun 2019 10:27:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530231658.23273-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/30/19 4:16 PM, Florian Fainelli wrote:
> The driver uses cpu_logical_map[] which is defined under
> arch/{arm,arm64}/include/asm/smp_plat.h.
> 
> Fixes: 5f7f0317ed28 ("IRQCHIP: Add new driver for BCM7038-style level 1 interrupt controllers")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Please discard this patch, we won't need it with:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=8866/1
and:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a02a532c2a6c79a898cd6c430fe3ad011d9aece3

> ---
>  drivers/irqchip/irq-bcm7038-l1.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
> index 0acebac1920b..970857a32508 100644
> --- a/drivers/irqchip/irq-bcm7038-l1.c
> +++ b/drivers/irqchip/irq-bcm7038-l1.c
> @@ -30,6 +30,9 @@
>  #include <linux/types.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqchip/chained_irq.h>
> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> +#include <asm/smp_plat.h>
> +#endif
>  
>  #define IRQS_PER_WORD		32
>  #define REG_BYTES_PER_IRQ_WORD	(sizeof(u32) * 4)
> 


-- 
Florian
