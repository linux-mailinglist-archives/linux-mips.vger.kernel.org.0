Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0E636BBC0
	for <lists+linux-mips@lfdr.de>; Tue, 27 Apr 2021 00:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhDZWk2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Apr 2021 18:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbhDZWk2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Apr 2021 18:40:28 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22163C061574;
        Mon, 26 Apr 2021 15:39:45 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso43025846oto.3;
        Mon, 26 Apr 2021 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e2srYZCezWerrvydsSZOThr9vW3FBvIYlx0HWy9kKVI=;
        b=kZLCwHWTPoCcIznJyyl8a3iAnUuAxn9tfyhdI58/vJAMgIn2vpqTrUBu47TY/hQQiR
         uO8AIaZfajAooZ2UPa2HYMgSzPac/4wNu15g55rd6AmgzoRYAqWQP0SN6ltG8tS7Gpwe
         cvPGEkrS1UMHNyhdZ+s044cm6zwkzta+5syQ6XEj2rELova0e++K5/jzAHe/VykL04CF
         /opVpyk75zqh1BIJF5FWsGs3U7NgrYgjM73UOXodkhPxMj3vLlVsxppmRuP4x5HwNxwX
         H4D8STjwwLUU5/ZhLRKwZuQaDG9FjrxYMTmHwD6NsHiy0dUrxEnjNfsH+JSYQyb4a+c0
         dbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=e2srYZCezWerrvydsSZOThr9vW3FBvIYlx0HWy9kKVI=;
        b=b1ZgFWvTGGPel0qQukmlstakGrtjAUD6Hjrg3CHBu9bZ6r+DBtU2j0s98JW85i/lBd
         KT1/UyoID79qNr0MYWUgVjKhC7V4kgNYmztSUfL8F/OX3ZFY6AvJnk39lEGp/F95ThP9
         TV6vX56BYIKirNSTP1y19mxe7Y26GaxZFLzXjtL4NdpQd0glRhTNaOn9Z7Ynaf1kAPXi
         Sm9ICJUGwPR/gdDQxHMBe/3WUTKjbgykfB8gvucdvI9TdOJTrodB6eQKayRx+a2HLKHA
         OAIpJq3Wke+NwJa/oQE4arbIBFV+EX96c7p7m/wiXk95yg65CeigcZ+dFc4DkNBG0Im+
         k0iA==
X-Gm-Message-State: AOAM5321Mb8aodOzdYLYeW29yXX68z4ILGc05ZpYBSLrFCh9ks030/Zm
        7p1G1Tb5mP/s/rzgu6JCyTRtnjujQq0=
X-Google-Smtp-Source: ABdhPJw9DQu6UlUVdcz2g1TBfNWipkC8oX5M3o9tQoOEORwU6A+PwH/pqnvpJVU+kZH5F1gVYOKZGg==
X-Received: by 2002:a9d:1d6a:: with SMTP id m97mr16357004otm.322.1619476784287;
        Mon, 26 Apr 2021 15:39:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v81sm3322047oie.13.2021.04.26.15.39.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 15:39:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 26 Apr 2021 15:39:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/9] ARM: PXA: Kill use of irq_create_strict_mappings()
Message-ID: <20210426223942.GA213931@roeck-us.net>
References: <20210406093557.1073423-1-maz@kernel.org>
 <20210406093557.1073423-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406093557.1073423-3-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 06, 2021 at 10:35:50AM +0100, Marc Zyngier wrote:
> irq_create_strict_mappings() is a poor way to allow the use of
> a linear IRQ domain as a legacy one. Let's be upfront about
> it and use a legacy domain when appropriate.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

When running the "mainstone" qemu emulation, this patch results
in many (32, actually) runtime warnings such as the following.

[    0.528272] ------------[ cut here ]------------
[    0.528285] WARNING: CPU: 0 PID: 1 at kernel/irq/irqdomain.c:550 irq_domain_associate+0x194/0x1f0
[    0.528315] error: virq335 is not allocated
[    0.528325] Modules linked in:
[    0.528351] CPU: 0 PID: 1 Comm: swapper Tainted: G        W         5.12.0-rc8-next-20210423 #1
[    0.528372] Hardware name: Intel HCDDBBVA0 Development Platform (aka Mainstone)
[    0.528387] Backtrace:
[    0.528406] [<c06bd188>] (dump_backtrace) from [<c06bd468>] (show_stack+0x20/0x24)
[    0.528441]  r7:00000226 r6:c00796e8 r5:00000009 r4:c088d2a0
[    0.528454] [<c06bd448>] (show_stack) from [<c06c11dc>] (dump_stack+0x28/0x30)
[    0.528479] [<c06c11b4>] (dump_stack) from [<c002a2b8>] (__warn+0xe8/0x110)
[    0.528507]  r5:00000009 r4:c0872698
[    0.528520] [<c002a1d0>] (__warn) from [<c06bdbc0>] (warn_slowpath_fmt+0xa0/0xe0)
[    0.528551]  r7:c00796e8 r6:00000226 r5:c0872698 r4:c0872700
[    0.528564] [<c06bdb24>] (warn_slowpath_fmt) from [<c00796e8>] (irq_domain_associate+0x194/0x1f0)
[    0.528597]  r8:00000130 r7:0000014f r6:0000001f r5:00000000 r4:c11bd780
[    0.528610] [<c0079554>] (irq_domain_associate) from [<c00797a4>] (irq_domain_associate_many+0x60/0xa4)
[    0.528642]  r8:00000130 r7:c11bd780 r6:fffffed0 r5:00000150 r4:00000150
[    0.528655] [<c0079744>] (irq_domain_associate_many) from [<c0079e5c>] (irq_domain_create_legacy+0x5c/0x68)
[    0.528687]  r8:00000130 r7:00000130 r6:00000020 r5:00000000 r4:c11bd780
[    0.528699] [<c0079e00>] (irq_domain_create_legacy) from [<c0079e9c>] (irq_domain_add_legacy+0x34/0x3c)
[    0.528730]  r7:c09b1370 r6:c09b1360 r5:c11bd3a0 r4:00000000
[    0.528743] [<c0079e68>] (irq_domain_add_legacy) from [<c0024f28>] (cplds_probe+0x170/0x1ac)
[    0.528768] [<c0024db8>] (cplds_probe) from [<c0432cec>] (platform_probe+0x50/0xb0)
[    0.528800]  r8:c09d2c94 r7:c0aa4f88 r6:c09d2c94 r5:c09b1370 r4:00000000
[    0.528814] [<c0432c9c>] (platform_probe) from [<c042fc70>] (really_probe+0x100/0x4d4)
[    0.528844]  r7:c0aa4f88 r6:00000000 r5:00000000 r4:c09b1370
[    0.528858] [<c042fb70>] (really_probe) from [<c04300cc>] (driver_probe_device+0x88/0x20c)
[    0.528892]  r10:c0974830 r9:c0a70000 r8:c093b224 r7:c0a31de8 r6:c09d2c94 r5:c09d2c94
[    0.528907]  r4:c09b1370
[    0.528919] [<c0430044>] (driver_probe_device) from [<c04306cc>] (device_driver_attach+0x68/0x70)
[    0.528953]  r9:c0a70000 r8:c093b224 r7:c0a31de8 r6:c09d2c94 r5:00000000 r4:c09b1370
[    0.528969] [<c0430664>] (device_driver_attach) from [<c0430794>] (__driver_attach+0xc0/0x164)
[    0.528997]  r7:c0a31de8 r6:c09b1370 r5:c09d2c94 r4:00000000
[    0.529009] [<c04306d4>] (__driver_attach) from [<c042d8d0>] (bus_for_each_dev+0x84/0xcc)
[    0.529039]  r7:c0a31de8 r6:c04306d4 r5:c09d2c94 r4:00000000
[    0.529052] [<c042d84c>] (bus_for_each_dev) from [<c042f494>] (driver_attach+0x28/0x30)
[    0.529082]  r6:00000000 r5:c11bd200 r4:c09d2c94
[    0.529095] [<c042f46c>] (driver_attach) from [<c042edac>] (bus_add_driver+0x168/0x210)
[    0.529122] [<c042ec44>] (bus_add_driver) from [<c0431304>] (driver_register+0x88/0x120)
[    0.529152]  r7:c0a5c7e0 r6:00000000 r5:ffffe000 r4:c09d2c94
[    0.529165] [<c043127c>] (driver_register) from [<c04329a0>] (__platform_driver_register+0x2c/0x34)
[    0.529191]  r5:ffffe000 r4:c094ba64
[    0.529204] [<c0432974>] (__platform_driver_register) from [<c094ba84>] (cplds_driver_init+0x20/0x28)
[    0.529230] [<c094ba64>] (cplds_driver_init) from [<c000a2a8>] (do_one_initcall+0x60/0x27c)
[    0.529255] [<c000a248>] (do_one_initcall) from [<c093f244>] (kernel_init_freeable+0x158/0x1e4)
[    0.529284]  r7:c0974850 r6:00000007 r5:c0c0f720 r4:c09a02fc
[    0.529297] [<c093f0ec>] (kernel_init_freeable) from [<c06c5274>] (kernel_init+0x18/0x110)
[    0.529328]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c06c525c
[    0.529343]  r4:00000000
[    0.529354] [<c06c525c>] (kernel_init) from [<c0008348>] (ret_from_fork+0x14/0x2c)
[    0.529387] Exception stack(0xc0bdffb0 to 0xc0bdfff8)
[    0.529467] ffa0:                                     00000000 00000000 00000000 00000000
[    0.529587] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.529684] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    0.529726]  r5:c06c525c r4:00000000
[    0.529752] ---[ end trace d199929d2b87e077 ]---

Bisect log attached.

Guenter

---
# bad: [e3d35712f85ac84fb06234848f6c043ab418cf8b] Add linux-next specific files for 20210423
# good: [bf05bf16c76bb44ab5156223e1e58e26dfe30a88] Linux 5.12-rc8
git bisect start 'HEAD' 'v5.12-rc8'
# good: [d4b5d9d94679a18bfa4ccdafd19876d58777911e] Merge remote-tracking branch 'crypto/master'
git bisect good d4b5d9d94679a18bfa4ccdafd19876d58777911e
# good: [27628e42fe59a698e66b671bf1e1f01f6a3fe765] Merge remote-tracking branch 'tip/auto-latest'
git bisect good 27628e42fe59a698e66b671bf1e1f01f6a3fe765
# bad: [bc6c3ae4f662fc719d0bf144f150f72cab8912d4] Merge remote-tracking branch 'vfio/next'
git bisect bad bc6c3ae4f662fc719d0bf144f150f72cab8912d4
# bad: [5ff5b00609c64a043ccd5bc92273c132b33f7f9a] Merge remote-tracking branch 'driver-core/driver-core-next'
git bisect bad 5ff5b00609c64a043ccd5bc92273c132b33f7f9a
# bad: [c878be9c883153797d5749620e58f180cc429e88] Merge remote-tracking branch 'kvm/next'
git bisect bad c878be9c883153797d5749620e58f180cc429e88
# good: [52acd22faa1af8a0514ccd075a6978ac97986425] KVM: Boost vCPU candidate in user mode which is delivering interrupt
git bisect good 52acd22faa1af8a0514ccd075a6978ac97986425
# good: [988aab640a6c46ab9552e65c2c3a8d577a4e30f3] rcu: Make rcu_gp_cleanup() be noinline for tracing
git bisect good 988aab640a6c46ab9552e65c2c3a8d577a4e30f3
# bad: [6603c2d8bd6cc7fa591fd3b4232bf25b65a0ea8f] Merge remote-tracking branch 'ftrace/for-next'
git bisect bad 6603c2d8bd6cc7fa591fd3b4232bf25b65a0ea8f
# good: [c658797f1a70561205a224be0c8be64977ed64e8] tracing: Add method for recording "func_repeats" events
git bisect good c658797f1a70561205a224be0c8be64977ed64e8
# good: [46135d6f878ab00261d4a2082d620bfb41019aab] irqchip/gic-v4.1: Disable vSGI upon (GIC CPUIF < v4.1) detection
git bisect good 46135d6f878ab00261d4a2082d620bfb41019aab
# bad: [05d7bf817019890e4d049e0b851940c596adbd9b] dt-bindings: interrupt-controller: Add IDT 79RC3243x Interrupt Controller
git bisect bad 05d7bf817019890e4d049e0b851940c596adbd9b
# bad: [1a0b05e435544cd53cd3936bdab425d88784b71a] irqdomain: Get rid of irq_create_strict_mappings()
git bisect bad 1a0b05e435544cd53cd3936bdab425d88784b71a
# bad: [5f8b938bd790cff6542c7fe3c1495c71f89fef1b] irqchip/jcore-aic: Kill use of irq_create_strict_mappings()
git bisect bad 5f8b938bd790cff6542c7fe3c1495c71f89fef1b
# bad: [b68761da01114a64b9c521975c3bca6d10eeb950] ARM: PXA: Kill use of irq_create_strict_mappings()
git bisect bad b68761da01114a64b9c521975c3bca6d10eeb950
# first bad commit: [b68761da01114a64b9c521975c3bca6d10eeb950] ARM: PXA: Kill use of irq_create_strict_mappings()
