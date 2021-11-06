Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419AF446C3A
	for <lists+linux-mips@lfdr.de>; Sat,  6 Nov 2021 04:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbhKFDel (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 23:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbhKFDek (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 23:34:40 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE06C061570;
        Fri,  5 Nov 2021 20:32:00 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id v4so8985202qtw.8;
        Fri, 05 Nov 2021 20:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wkpgNQuq4JsLqknJBD1B1v5Yol1MQM6zbdbDiYMGGZA=;
        b=hgiPx5F0EFZhG5rjZ38Nd1W+yIUCv1chlfqMG+oENzRnzhW5lvM23QQxKZLSb0jfhL
         RJS8/dk1GhsvUFTefVNzQJUoeAeYi1AUywgxHs7hRPC+A/F8zaYRsWHJ0mLPPLwbmOXT
         oh/PZBrk5rFNWeGOmsgOe448gVjFiiE4zoN9eZQezGAyM9PjboVbe5pgfkoXmeaQY/0L
         MS+dmUvs4ITUa4VzronPRiTuIiXjd1VrcRCUKjmuxRXozsmUhwq8PnTHvRy3zMg4BjYa
         C5Hopd2Xg4d+cpeQzZTCnJOw1nH0cY+OZa2EJvNrnJgdnO6bDx1/nZ/d5/Cy3c9Ojrls
         BtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wkpgNQuq4JsLqknJBD1B1v5Yol1MQM6zbdbDiYMGGZA=;
        b=5+HCPh+UB6Ojy5NwefPWxuiOr9+ttwfek0CXcBqnlQcdMFJimLy5PLGQkIAovA4Mnn
         T6DtlKfVMcoTNJStX0fPflUgL1XzX/PN83Dl+JhgwMyKR5qOrnwDJKLv1TKOHgzuexfm
         YR1pUorleyMvZRkIo/wQnXi5x5qOs+XM9tVMOQMN5olIj4mvPhywID2cuy+eXVJeWUrw
         Oz9X1/Pv+62Fed2jHyCRNUJu+tiFU88S3jccxFV4ERjXHIf8T8cBTpW5Vh3bTJcWb6Ij
         dv/QI2/W6raP3SSD3RB2IMoS34bQKbhNx+sNiSiw7GgeptqW60UAnv/CI3nBDdbKfHSh
         4XQA==
X-Gm-Message-State: AOAM530k5S9xN9DGIivU82wWydinnpVUB3LUaKGmBZigtRgbmkcmNuvg
        78XYcPexd/vrSOTbEejiOJs=
X-Google-Smtp-Source: ABdhPJzYtlqC8qs6hPByPJoSOKCrc2c8ne+KrGz3g6UBY3vAaiZ7Vlqv1sVsjMQENfDUuxGe53AkDQ==
X-Received: by 2002:a05:622a:1209:: with SMTP id y9mr68014388qtx.13.1636169519359;
        Fri, 05 Nov 2021 20:31:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:a892:6224:ce6d:2f10? ([2600:1700:dfe0:49f0:a892:6224:ce6d:2f10])
        by smtp.gmail.com with ESMTPSA id bs33sm6407894qkb.130.2021.11.05.20.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 20:31:58 -0700 (PDT)
Message-ID: <249707d6-660f-99ce-b7d3-c48dc7209bbe@gmail.com>
Date:   Fri, 5 Nov 2021 20:31:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] mips: BCM63XX: select CPU_SUPPORTS_32BIT_KERNEL
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Maxime Bizon <mbizon@freebox.fr>,
        Ralf Baechle <ralf@linux-mips.org>
References: <20211106025823.32437-1-rdunlap@infradead.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211106025823.32437-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/5/2021 7:58 PM, Randy Dunlap wrote:
> 
> Several header files need info on CONFIG_32BIT or CONFIG_64BIT,
> but kconfig symbol BCM63XX does not provide that info. This leads
> to many build errors, e.g.:
> 
>     arch/mips/include/asm/page.h:196:13: error: use of undeclared identifier 'CAC_BASE'
>             return x - PAGE_OFFSET + PHYS_OFFSET;
>     arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>     #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
>     arch/mips/include/asm/io.h:134:28: error: use of undeclared identifier 'CAC_BASE'
>             return (void *)(address + PAGE_OFFSET - PHYS_OFFSET);
>     arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>     #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
> 
> arch/mips/include/asm/uaccess.h:82:10: error: use of undeclared identifier '__UA_LIMIT'
>             return (__UA_LIMIT & (addr | (addr + size) | __ua_size(size))) == 0;
> 
> 
> Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs.")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-mips@vger.kernel.org
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Maxime Bizon <mbizon@freebox.fr>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
> Note: I did see a bunch of build errors like this one:
> ../arch/mips/kernel/r4k_fpu.S:217: Error: opcode not supported on this processor: mips1 (mips1) `ldc1 $f24,192($4)'
> but I'm hoping/guessing that this is due to not having a proper compiler
> for the BCM63xx target.
> 
>   arch/mips/Kconfig |    1 +
>   1 file changed, 1 insertion(+)
> 
> --- linux-next-20211105.orig/arch/mips/Kconfig
> +++ linux-next-20211105/arch/mips/Kconfig
> @@ -329,6 +329,7 @@ config BCM63XX
>   	select SYNC_R4K
>   	select DMA_NONCOHERENT
>   	select IRQ_MIPS_CPU
> +	select CPU_SUPPORTS_32BIT_KERNEL

That's one option, the other could be to add:

         select SYS_HAS_CPU_BMIPS32_3300
         select SYS_HAS_CPU_BMIPS4350
         select SYS_HAS_CPU_BMIPS4380

Which would ensure that CPU_SUPPORTS_32BIT_KERNEL is selected AFAICT. 
Can you try that? What config file did you use to produce that build 
error BTW?
-- 
Florian
