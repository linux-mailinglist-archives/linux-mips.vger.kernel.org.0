Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8D23337C2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 09:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhCJIrl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 03:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbhCJIrb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Mar 2021 03:47:31 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F31C06174A;
        Wed, 10 Mar 2021 00:47:30 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id i26so12902281ljn.1;
        Wed, 10 Mar 2021 00:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+jsTsufBiEisrFFsWGc8X3m+ZxKmo5dTR7TQzVkg2wQ=;
        b=SPL7QAdBvSPO7zWVAjxxUXTDmT5wKXz9boskBhLCyZ5X5sQxRvNUGjCera7ubugQwp
         e3Kea9bJz9HLkKR9kKBuz0WluO6N/iR14VqNlmnBOfR3iOd/XdZ5r1fGazIhRtX1SroJ
         ouGAhvJ8D5hQrxLcDf71ZddEAIrJk0/13IXLspCmKCiBtWmLwdQJlSNGOfY5BhXbAwjW
         DmtH4ewmLG48UIz7ik+uG2Lq1R9vgD8L/43Mrtva7YbpAZXq/+BaqFF8ZLMdqrm968wq
         flVJU+aQNlt7sM9SFsuK81lNNnvZ/7W8vKs2/WsZn0H57kixULO+PDMjQvjSvaqoJJ0o
         RwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+jsTsufBiEisrFFsWGc8X3m+ZxKmo5dTR7TQzVkg2wQ=;
        b=HZXn73uFbU0xdragiJif2rDQXoZKYoozvZBZL9rXp3AEUvJcJ16K6xGzwNYvDB+DVP
         zZMhBRH57dkQ7OKEdqLG5r4OQ0wkgTB7cdbqwigP36SDtWmT030KTrDWITB5yKJkUSqF
         6R2u3GE42OUEwgFADVg0NZGqHSY+4FX/q5ZkkRRy1p2oneRbsRIgqCklJxXWnwxdAm1U
         bkb5c4oOHqdzvPKX9GB7oGONZmtpO4YcULMIUPE5t0CyyMx+gXKFmC4J0l1WG8YmRG4C
         aZ/LjOt0Ko3xzE2XUEQ2JeOBL0w0QKDhrFMjz5iL94YtlK4coZyvBdOoaB/zhqRX9lAA
         BvyA==
X-Gm-Message-State: AOAM532We1S/6aC9rYjloPoLsT0p9P8WR5Q4UAoPea1FsN2SB7mA0k+z
        n2lpOv7mAX4VqCzx6LOiRcb1WzkJuFTy9A==
X-Google-Smtp-Source: ABdhPJwt/N/9XnVHmkTzT1KxX54nwWqxfMlKCL09AhMm3IBOebCQXGoT/UMTJFIRJCvDkHoQ89sUEg==
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr1215810ljn.440.1615366049495;
        Wed, 10 Mar 2021 00:47:29 -0800 (PST)
Received: from [192.168.1.100] ([178.176.74.161])
        by smtp.gmail.com with ESMTPSA id r16sm2688490lfr.223.2021.03.10.00.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 00:47:29 -0800 (PST)
Subject: Re: [PATCH v3 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
To:     zhangqing <zhangqing@loongson.cn>, Marc Zyngier <maz@kernel.org>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangming01@loongson.cn
References: <20210306023633.9579-1-zhangqing@loongson.cn>
 <20210306023633.9579-6-zhangqing@loongson.cn> <87wnugy9oe.wl-maz@kernel.org>
 <5c5b2593-b07c-cd20-cd08-1d6542471260@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <16010cff-0fcb-ade6-1e0c-1a4dbb5a7b2f@gmail.com>
Date:   Wed, 10 Mar 2021 11:47:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5c5b2593-b07c-cd20-cd08-1d6542471260@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 10.03.2021 5:26, zhangqing wrote:

[...]
>> +    if (of_device_is_compatible(node, "loongson,liointc-2.0")) {
>> +        base = liointc_get_reg_byname(node, "main");
>> +        if (!base) {
>> +            err = -ENODEV;
>> +            goto out_free_priv;
>> +        }
>> +        for (i = 0; i < LIOINTC_NUM_CORES; i++) {
>> +            priv->core_isr[i] =
>> +                liointc_get_reg_byname(node, core_reg_names[i]);
>> Please write assignments on a single line.
> 
> In addition, write assignments on a single line
> 
>                   for (i = 0; i <LIOINTC_NUM_CORES; i++)
>                           priv->core_isr[i] = liointc_get_reg_byname(node, 
> core_reg_names[i]);
> 
>      It is 92 characters, more than 80 characters...

    The new line length limit is 100 chars. :-)

[...]

MBR, Sergei
