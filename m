Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824B73B4200
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 12:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhFYK5G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 06:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhFYK5G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 06:57:06 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC57AC061574;
        Fri, 25 Jun 2021 03:54:44 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id x16so7692516pfa.13;
        Fri, 25 Jun 2021 03:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=g8dcSDtay9ZKvmlnhiFrnVTkruRY03gDn6rtxWB9NOE=;
        b=c5d/tg6pvX80ksYf6fchGXQmYmFw2BW7VqLofWZyXtBkDrHIS+fFqN/We13KZKUIKh
         0Q7aySYd+YjXBg3fWiqk2uEq4HvbS/6X+K8rYcZrw5sNZuKKfHvFLnUv1kIBR7ExIQx4
         y/Fv3FSRKUDp7vczHmGaWgNuIoXbzqnEaXSJV14SJCR7iCfQIqxE5Yh+Nrg6GMFlDQa5
         LDNvVPgHrKhJZBF19p0N2YYA6KAe6R1QzVdiIig1MzSBoXF4t2HS2hfTMTozdY2cqSnR
         lU+6AzvjlTC+TV6tGP+qBPoiTovzQ1lXIK0nZo3Kz9SraGnLBSrJ9+An76n2tWT2c+nr
         FSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=g8dcSDtay9ZKvmlnhiFrnVTkruRY03gDn6rtxWB9NOE=;
        b=L59pc06q24VIgFtuMyxZJBHGbwqh1wKK0cj9az6nn2MsMFXLAi9QawJ5iwZbDSCHYY
         W48tFFcTnCZp4xAwVePi4M1M0SglsczgCEkPB/XOoYC+0Ue4/V++HRPc3VT5sgbKZIdl
         AUimSgg7ARwiHYKsitUDgArzPqvoJiWhDwlqAdW8bRwdVerZx6aEV0qmKnlLG5XLETEw
         nUg/K0QmNAgy8G/XGOEOFJSDbovGUHsXVU9A8b2dY2EYS2NXBJYzAaTPZ/vp7hByssdZ
         WX2/ahVh89aLPT4g1yHc1w8SBRcmSWGhvnzAWHt0DE2u+sNZkXhc/yKbxZULlooVyGU1
         2L9g==
X-Gm-Message-State: AOAM533yemP2udMZU5yCgS+4kcObVHTecW1vyoJM2DB51eAuVsqadHP5
        tv+Zmdqlt6hhn4Rs5UNruL5Z9RhdlGHi4Q==
X-Google-Smtp-Source: ABdhPJyRYzj47zCBKjv/ZWmWBn9GZFkeF6B32oYlDznife0XSof7JYMRa5W9VaBnjnK3/Rq3HetrxA==
X-Received: by 2002:a63:a54b:: with SMTP id r11mr9033382pgu.43.1624618484358;
        Fri, 25 Jun 2021 03:54:44 -0700 (PDT)
Received: from [192.168.69.111] ([171.6.245.6])
        by smtp.gmail.com with ESMTPSA id c3sm5387064pfl.42.2021.06.25.03.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 03:54:43 -0700 (PDT)
Subject: Re: [PATCH] MIPS: add support for buggy MT7621S core detection
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wei Li <liwei391@huawei.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Felix Fietkau <nbd@nbd.name>
References: <20210403061912.1012509-1-ilya.lipnitskiy@gmail.com>
 <alpine.DEB.2.21.2104060311490.65251@angie.orcam.me.uk>
 <CALCv0x0SwiOAWXk36vuFkspNSM16nS=wdMhm5ZNyOdFUia5zuw@mail.gmail.com>
 <alpine.DEB.2.21.2104071545330.65251@angie.orcam.me.uk>
 <CALCv0x0wQ9DJUVEPXCgbBFQHjqNCfSYLFkU0Md2zjJ4XfydhXg@mail.gmail.com>
From:   Strontium <strntydog@gmail.com>
Message-ID: <0099b98c-3774-c5c0-7b1b-1f9e61e0574f@gmail.com>
Date:   Fri, 25 Jun 2021 17:54:39 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CALCv0x0wQ9DJUVEPXCgbBFQHjqNCfSYLFkU0Md2zjJ4XfydhXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/4/21 1:49 am, Ilya Lipnitskiy wrote:
> On Wed, Apr 7, 2021 at 6:49 AM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>> On Mon, 5 Apr 2021, Ilya Lipnitskiy wrote:
>>
>>> Thanks for the comments. Including asm/bugs.h in asm/mips-cps.h led to
>>> some circular dependencies when I tried it, but I will try again based
>>> on your feedback - indeed it would be much cleaner to have this logic
>>> in mips_cps_numcores. The only wrinkle is that mips_cps_numcores may
>>> return a different value on MT7621 after the cores have started due to
>>> CPULAUNCH flags changing, but nobody calls mips_cps_numcores later
>>> anyway, so it's a moot point today. I will clean up the change and
>>> resend.
>>  Hmm, I don't know this system, but by the look of the code it queries
>> launch[2], which I gather refers to the VPE #0 of an inexistent core #1,
>> so why would the structure change given that there is no corresponding
>> silicon?
> The structure would change only on the dual-core flavor of MT7621, the
> single-core would always report 1 core, but on the dual-core, if
> somebody were to call mips_cps_numcores after the second core had
> already started, mips_cps_numcores would return 1 instead of 2. I
> think it may be feasible to fix it by checking other flags, but there
> is no use case for that today, so I'd rather keep this hacky logic to
> a minimum.
>
> Ilya
>
>
Actually,  I am currently struggling with a side effect of this approach
in the original OpenWrt version of this method, although i think this
version will suffer from the same effect. 

When you kexec the kernel from a previously running kernel, it only
detects a single core.  I am about to disable it entirely, as i really
need to be able to run kexec on a MT7621 platform.

I have instrumented the code with some debug to prove it is the case:

Boot from u-boot:

[    0.000000] nclusters = 1
[    0.000000] VPE topology
[    0.000000] cl = 0
[    0.000000] {
[    0.000000] ncores = 2
[    0.000000] cpulaunch.pc = 000000ff
[    0.000000] cpulaunch.gp = 0000ff00
[    0.000000] cpulaunch.sp = 0000ffff
[    0.000000] cpulaunch.a0 = 08000800
[    0.000000] cpulaunch.flags = 00000020
[    0.000000] plat_cpu_core_present(0) = true
[    0.000000] core_vpes = 2
[    0.000000] 2
[    0.000000] cpulaunch.pc = 000000ff
[    0.000000] cpulaunch.gp = 0000ff00
[    0.000000] cpulaunch.sp = 0000ffff
[    0.000000] cpulaunch.a0 = 08000800
[    0.000000] cpulaunch.flags = 00000020
[    0.000000] plat_cpu_core_present(1) = true
[    0.000000] core_vpes = 2
[    0.000000] ,2} total 4

Boot from kexec:

[    0.000000] nclusters = 1
[    0.000000] VPE topology
[    0.000000] cl = 0
[    0.000000] {
[    0.000000] ncores = 2
[    0.000000] cpulaunch.pc = 00000000
[    0.000000] cpulaunch.gp = 00000000
[    0.000000] cpulaunch.sp = 00000000
[    0.000000] cpulaunch.a0 = 00000000
[    0.000000] cpulaunch.flags = 00000000
[    0.000000] plat_cpu_core_present(0) = true
[    0.000000] core_vpes = 2
[    0.000000] 2
[    0.000000] cpulaunch.pc = 00000000
[    0.000000] cpulaunch.gp = 00000000
[    0.000000] cpulaunch.sp = 00000000
[    0.000000] cpulaunch.a0 = 00000000
[    0.000000] cpulaunch.flags = 00000000} total 2

Steven

