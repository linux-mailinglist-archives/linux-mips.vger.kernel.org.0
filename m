Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6EFD4B5CBC
	for <lists+linux-mips@lfdr.de>; Mon, 14 Feb 2022 22:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbiBNV0H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Feb 2022 16:26:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbiBNV0G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Feb 2022 16:26:06 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B9C2A701;
        Mon, 14 Feb 2022 13:25:58 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so20889853ooi.2;
        Mon, 14 Feb 2022 13:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5/DaZmV9acYDCTgPotmTjkv5wdpuSuU2XjrOsJthBBQ=;
        b=nWQxV8bwhbOD3UF50A117xCVxj+SdTH8j0ePhfp/vJCb8IjI9vBWg6cxXRzKNHYnA2
         cWK3cz+qshBj6PDjeKoogB7Z176jQ/iWDg9drN0TMGnqsZjErTE8Y0fhjM2HuB0hTZ7k
         WvoWhgELlUECaUOdFHVDVUNSFL9XTETtsx/yiLVvgbMzOxc99n7KNkG87N5dS1e59o/P
         tG7l3iVWZoA37J/EBljjE3AvYVBP4USRavxZz22fUyPo1Fyt++TsRu3eGtHrwG5tEj67
         0nlOi1QUyysEhYHzoj7rdRxXZjvOaS5yt/bFcOiBA9oNZ6VC7M2mvOTMw8FnY9P287O5
         iONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5/DaZmV9acYDCTgPotmTjkv5wdpuSuU2XjrOsJthBBQ=;
        b=K0udV4jb+lxh1GRzYjWqNFY4apGO1MqsjTaIJbpiPq9VTLgkOLJAk3og+91QB4+WKr
         4uXzm5DShXpMAmp12Cp3hhnG9Cl4A5Le4cwxgXVPoJEYSzKJTpMzxh2vVCrTmVXCm/kE
         AI1+hleOzdAqOjcBxCbYfu6VYtECNwoH4kWj5ClhGlAHKYLYd49EFrPo9MDzWM8oPJR2
         CKam1oQ0p+w0eNwOQ7984nlSUO1xsv0KQKnzCPsGmiXZitvffckATBua5aWJtYElzvfS
         IzYjwIJiemRdvYlQ/Q+TZaPz7P2PcBCa2Oia0N9rSGP72GeZaTEJiBJAW79Ic0h60/oS
         WaTQ==
X-Gm-Message-State: AOAM532scMYpKdi8TLEXh1k5XPTH4goK9mRfzz9xLhFpT4mZ8zlWSBu+
        Glp2wMIChwCjUGESU7Ujz9r7iLHrdjY=
X-Google-Smtp-Source: ABdhPJwoikppkKPhBbf43zKKC+nQQi8QmN17ON2BtIKBG/X7Qj3NKBvQo5nyXCW7kCKLxOljb9sS1Q==
X-Received: by 2002:a17:90a:8c8b:: with SMTP id b11mr16258736pjo.197.1644865217384;
        Mon, 14 Feb 2022 11:00:17 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net. [83.50.68.71])
        by smtp.gmail.com with ESMTPSA id d8sm3507592pjr.29.2022.02.14.11.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 11:00:17 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
Message-ID: <5324be35-5c49-31c1-3f9a-267a5dae8c84@amsat.org>
Date:   Mon, 14 Feb 2022 20:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH mips-fixes] MIPS: smp: fill in sibling and core maps
 earlier
Content-Language: en-US
To:     Alexander Lobakin <alobakin@pm.me>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220212221347.442070-1-alobakin@pm.me>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220212221347.442070-1-alobakin@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/2/22 23:21, Alexander Lobakin wrote:
> After enabling CONFIG_SCHED_CORE (landed during 5.14 cycle),
> 2-core 2-thread-per-core interAptiv (CPS-driven) started emitting
> the following:
> 
> [    0.025698] CPU1 revision is: 0001a120 (MIPS interAptiv (multi))
> [    0.048183] ------------[ cut here ]------------
> [    0.048187] WARNING: CPU: 1 PID: 0 at kernel/sched/core.c:6025 sched_core_cpu_starting+0x198/0x240
> [    0.048220] Modules linked in:
> [    0.048233] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc3+ #35 b7b319f24073fd9a3c2aa7ad15fb7993eec0b26f
> [    0.048247] Stack : 817f0000 00000004 327804c8 810eb050 00000000 00000004 00000000 c314fdd1
> [    0.048278]         830cbd64 819c0000 81800000 817f0000 83070bf4 00000001 830cbd08 00000000
> [    0.048307]         00000000 00000000 815fcbc4 00000000 00000000 00000000 00000000 00000000
> [    0.048334]         00000000 00000000 00000000 00000000 817f0000 00000000 00000000 817f6f34
> [    0.048361]         817f0000 818a3c00 817f0000 00000004 00000000 00000000 4dc33260 0018c933
> [    0.048389]         ...
> [    0.048396] Call Trace:
> [    0.048399] [<8105a7bc>] show_stack+0x3c/0x140
> [    0.048424] [<8131c2a0>] dump_stack_lvl+0x60/0x80
> [    0.048440] [<8108b5c0>] __warn+0xc0/0xf4
> [    0.048454] [<8108b658>] warn_slowpath_fmt+0x64/0x10c
> [    0.048467] [<810bd418>] sched_core_cpu_starting+0x198/0x240
> [    0.048483] [<810c6514>] sched_cpu_starting+0x14/0x80
> [    0.048497] [<8108c0f8>] cpuhp_invoke_callback_range+0x78/0x140
> [    0.048510] [<8108d914>] notify_cpu_starting+0x94/0x140
> [    0.048523] [<8106593c>] start_secondary+0xbc/0x280
> [    0.048539]
> [    0.048543] ---[ end trace 0000000000000000 ]---
> [    0.048636] Synchronize counters for CPU 1: done.
> 
> ...for each but CPU 0/boot.
> Basic debug printks right before the mentioned line say:
> 
> [    0.048170] CPU: 1, smt_mask:
> 
> So smt_mask, which is sibling mask obviously, is empty when entering
> the function.
> This is critical, as sched_core_cpu_starting() calculates
> core-scheduling parameters only once per CPU start, and it's crucial
> to have all the parameters filled in at that moment (at least it
> uses cpu_smt_mask() which in fact is `&cpu_sibling_map[cpu]` on
> MIPS).
> 
> A bit of debugging led me to that set_cpu_sibling_map() performing
> the actual map calculation, was being invocated after
> notify_cpu_start(), and exactly the latter function starts CPU HP
> callback round (sched_core_cpu_starting() is basically a CPU HP
> callback).
> While the flow is same on ARM64 (maps after the notifier, although
> before calling set_cpu_online()), x86 started calculating sibling
> maps earlier than starting the CPU HP callbacks in Linux 4.14 (see
> [0] for the reference). Neither me nor my brief tests couldn't find
> any potential caveats in calculating the maps right after performing
> delay calibration, but the WARN splat is now gone.
> The very same debug prints now yield exactly what I expected from
> them:
> 
> [    0.048433] CPU: 1, smt_mask: 0-1
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=76ce7cfe35ef

Isn't it worth Cc'ing stable@vger.kernel.org here?

> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> ---
>   arch/mips/kernel/smp.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

