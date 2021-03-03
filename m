Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B31932BD86
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhCCQKk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235157AbhCCBbW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Mar 2021 20:31:22 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B4DC06178A;
        Tue,  2 Mar 2021 17:30:23 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id l2so15159056pgb.1;
        Tue, 02 Mar 2021 17:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tcyXD5bqraOivjhSWIuG8/tSthWh4JQw0noF/nq/VZU=;
        b=qif1UjOVYiytrAGrLxjvgXn+Q9x1QfxcerA+sKJFA6Iv+Jo0JLdyfv+YPJayNjD2t0
         zVpy98aiIrV1rcbaFLo7pZp3and60nkgmLY2AB+a+Tlx8jgm5tnaZ2ODQr5e/jd0Jy7S
         1mb2dRYH7KbUCB+Z4HClrs66Gq8urlRzyneVihSvBgZjdASd1lVXSGNBxC1lNEVyeNIi
         bS1JnlIw+UtOXf6KA3dvX99F+bYQnlEqoH6zZbGh6H/dqyl3KhmXLqAWzDV6IfSKEVWs
         IwZ2eEZbB2h2tuqyaj6wNBn71UjSDNz1Z41Qa6Snw0P8eFgYTAsAaErcNa4e/TLzIflb
         Pjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tcyXD5bqraOivjhSWIuG8/tSthWh4JQw0noF/nq/VZU=;
        b=qOPV4pimBrGzYo02zOFR9e5YzL5mOYspNLTJ/oO8u6SuVJS2t6tBHm4Rmvu2xfxqj5
         3dx9uDUNMFvF7rShysZN1KBxrJb2lKcWCjhV1az8aATfnqeHSfdTknURP/ExgAd+GFfu
         qK0KQNAemWwr2U23DVlmohxEdQr9YaAb7QGCZE9i4ptBHVguqCerRU1kxnCrBddwUnDA
         TrEgrnUN89lmQY/JSssOttl+oQIxPOAFMerXp+E1ekbaY7RdsvPiGhwq6mt+EXdQxCu6
         sLYYbUYeaRcHZAy99jH2FH8Sj4KlVkp0zFFsQuOPFEuVGRWbgKFgO1FhOfJcvdOwHaZP
         lJZA==
X-Gm-Message-State: AOAM5307UwNp24/NjqGutc7NsHulUq3OFGyTJfnc7m1BoHCaIJ1xJTmM
        xV2MwGyYLCywiROLuq7s+s7CzTZYVYI=
X-Google-Smtp-Source: ABdhPJw0dK1tEuEfbjaSunSvqFqt4kd0GSrxfrvr1MgGqdhcWUnD73Q+zczDmWrP1hDlxjrwy3l/YA==
X-Received: by 2002:a65:6289:: with SMTP id f9mr20039480pgv.373.1614735022318;
        Tue, 02 Mar 2021 17:30:22 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h186sm21737969pgc.38.2021.03.02.17.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 17:30:21 -0800 (PST)
Subject: Re: [PATCH] MIPS: BMIPS: Reserve exception base to prevent corruption
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, rppt@kernel.org,
        fancer.lancer@gmail.com, guro@fb.com, akpm@linux-foundation.org,
        paul@crapouillou.net,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20210301092241.i7dxo7zbg3ar55d6@mobilestation>
 <20210302041940.3663823-1-f.fainelli@gmail.com>
 <20210302235411.GA3897@alpha.franken.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4e3640d4-7fc2-96dc-de00-599b3ac80757@gmail.com>
Date:   Tue, 2 Mar 2021 17:30:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302235411.GA3897@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 3/2/2021 3:54 PM, Thomas Bogendoerfer wrote:
> On Mon, Mar 01, 2021 at 08:19:38PM -0800, Florian Fainelli wrote:
>> BMIPS is one of the few platforms that do change the exception base.
>> After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
>> with kernel_end") we started seeing BMIPS boards fail to boot with the
>> built-in FDT being corrupted.
>>
>> Before the cited commit, early allocations would be in the [kernel_end,
>> RAM_END] range, but after commit they would be within [RAM_START +
>> PAGE_SIZE, RAM_END].
>>
>> The custom exception base handler that is installed by
>> bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
>> memory region allocated by unflatten_and_copy_device_tree() thus
>> corrupting the FDT used by the kernel.
>>
>> To fix this, we need to perform an early reservation of the custom
>> exception that is going to be installed and this needs to happen at
>> plat_mem_setup() time to ensure that unflatten_and_copy_device_tree()
>> finds a space that is suitable, away from reserved memory.
>>
>> Huge thanks to Serget for analysing and proposing a solution to this
>> issue.
>>
>> Fixes: Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
>> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>> Thomas,
>>
>> This is intended as a stop-gap solution for 5.12-rc1 and to be picked up
>> by the stable team for 5.11. We should find a safer way to avoid these
>> problems for 5.13 maybe.
> 
> let's try to make it in one ago. Hwo about reserving vector space in
> cpu_probe, if it's known there and leave the rest to trap_init() ?
> 
> Below patch got a quick test on IP22 (real hardware) and malta (qemu).
> Not sure, if I got all BMIPS parts correct, so please check/test.

Works for me here:

Tested-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!

> BTW. do we really need to EXPORT_SYMBOL ebase ?

It seems like MIPS KVM support can be built as a module which is why
ebase was exported to modules with
878edf014e29de38c49153aba20273fbc9ae31af ("MIPS: KVM: Restore host EBase
from ebase variable")?
-- 
Florian
