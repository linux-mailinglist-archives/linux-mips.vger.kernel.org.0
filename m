Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4205D4733CE
	for <lists+linux-mips@lfdr.de>; Mon, 13 Dec 2021 19:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235866AbhLMSSo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Dec 2021 13:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbhLMSSn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Dec 2021 13:18:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D93C061574;
        Mon, 13 Dec 2021 10:18:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B349AB81204;
        Mon, 13 Dec 2021 18:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6320CC34600;
        Mon, 13 Dec 2021 18:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639419520;
        bh=ufnnwRnurk1q2aqknJbOmUyt6HZgObDA6V99gZUmitk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ask3d39ghcNdqyGIEhsKFhKTMapNAeAkWyf6B/udDSGjpc+Fzs8HCapyWN4mQdxep
         0f2Ko4aJ0deBRauWRBpN0gCfXC0MTPfyVkPpT+NYSruSQPxIaiwuV4Rg4XRvbFkwPC
         QfMK/audKlttY7+4gS9HjLQzh9hdmry7oJXKV1V7T17f6clacIFkGpvOhDa3CHMod8
         KC9HKrz7xcZmpv6B/pVpby/z1ejGsSkfH8vgdg0ZZyqCs2MbTxlfNlpNWxnw/+dIZ5
         +FRzmy/b0WAM98m9n+Tl/AiS9M3L41pEiBMMgU38u5d7P6lWpDd5b5nbQQ+M1Uhe/B
         fhze/4nObBGEg==
Received: by mail-ed1-f46.google.com with SMTP id l25so55412952eda.11;
        Mon, 13 Dec 2021 10:18:40 -0800 (PST)
X-Gm-Message-State: AOAM5300321c1HtpcBkeKm/FUG6ypsKdLRcYg9MiNRXFXQI+QpJ4V4iM
        Ui1rli5bJS+GtLToUH4XNx/9/DOc4Iy5tzPryA==
X-Google-Smtp-Source: ABdhPJysuXioNIpSqHmW/pzNKP+ZVhyQo0RbJ+slIAGweWZQFETGldXVdl1VLvhYedG9n+9zYtmdoSXxX4NBU8tSGq0=
X-Received: by 2002:a05:6402:84f:: with SMTP id b15mr510356edz.342.1639419518740;
 Mon, 13 Dec 2021 10:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20211208155839.4084795-1-robh@kernel.org> <87fsqwn03o.fsf@mpe.ellerman.id.au>
In-Reply-To: <87fsqwn03o.fsf@mpe.ellerman.id.au>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 13 Dec 2021 12:18:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLpq7fx0pyQiJFa0P5C3JXijiVe_fr84x9RML1aDJ7vDQ@mail.gmail.com>
Message-ID: <CAL_JsqLpq7fx0pyQiJFa0P5C3JXijiVe_fr84x9RML1aDJ7vDQ@mail.gmail.com>
Subject: Re: [PATCH v2] of/fdt: Rework early_init_dt_scan_memory() to call directly
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 13, 2021 at 6:47 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Rob Herring <robh@kernel.org> writes:
> > Use of the of_scan_flat_dt() function predates libfdt and is discouraged
> > as libfdt provides a nicer set of APIs. Rework
> > early_init_dt_scan_memory() to be called directly and use libfdt.
> ...
> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > index 6e1a106f02eb..63762a3b75e8 100644
> > --- a/arch/powerpc/kernel/prom.c
> > +++ b/arch/powerpc/kernel/prom.c
> > @@ -532,19 +532,19 @@ static int  __init early_init_drmem_lmb(struct drmem_lmb *lmb,
> >  }
> >  #endif /* CONFIG_PPC_PSERIES */
> >
> > -static int __init early_init_dt_scan_memory_ppc(unsigned long node,
> > -                                             const char *uname,
> > -                                             int depth, void *data)
> > +static int __init early_init_dt_scan_memory_ppc(void)
> >  {
> >  #ifdef CONFIG_PPC_PSERIES
> > -     if (depth == 1 &&
> > -         strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
> > +     const void *fdt = initial_boot_params;
> > +     int node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
> > +
> > +     if (node > 0) {
> >               walk_drmem_lmbs_early(node, NULL, early_init_drmem_lmb);
> >               return 0;
> >       }
> >  #endif
> >
> > -     return early_init_dt_scan_memory(node, uname, depth, data);
> > +     return early_init_dt_scan_memory();
> >  }
> >
> >  /*
> > @@ -749,7 +749,7 @@ void __init early_init_devtree(void *params)
> >
> >       /* Scan memory nodes and rebuild MEMBLOCKs */
> >       early_init_dt_scan_root();
> > -     of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
> > +     early_init_dt_scan_memory_ppc();
> >
> >       parse_early_param();
> >
> > @@ -858,7 +858,7 @@ void __init early_get_first_memblock_info(void *params, phys_addr_t *size)
> >        */
> >       add_mem_to_memblock = 0;
> >       early_init_dt_scan_root();
> > -     of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
> > +     early_init_dt_scan_memory_ppc();
> >       add_mem_to_memblock = 1;
> >
> >       if (size)
>
>
> This blows up one of my machines with:
>
>   [    0.000000][    T0] printk: bootconsole [udbg0] enabled
>    -> early_setup(), dt_ptr: 0x1ec90000
>   [    0.000000][    T0] ------------[ cut here ]------------
>   [    0.000000][    T0] kernel BUG at arch/powerpc/mm/book3s64/hash_utils.c:2117!
>   [    0.000000][    T0] Oops: Exception in kernel mode, sig: 5 [#1]
>   [    0.000000][    T0] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA
>   [    0.000000][    T0] Modules linked in:
>   [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.16.0-rc4-00073-g81291383ffde-dirty #69
>   [    0.000000][    T0] NIP:  c0000000000924d8 LR: c000000002009764 CTR: c0000000000924d0
>   [    0.000000][    T0] REGS: c000000002833bc0 TRAP: 0700   Not tainted  (5.16.0-rc4-00073-g81291383ffde-dirty)
>   [    0.000000][    T0] MSR:  8000000000021003 <SF,ME,RI,LE>  CR: 24000244  XER: 20000001
>   [    0.000000][    T0] CFAR: 0000000000000730 IRQMASK: 1
>   [    0.000000][    T0] GPR00: c000000002009764 c000000002833e60 c000000002834100 ffffffffffffffff
>   [    0.000000][    T0] GPR04: 0000000000000000 c000000002080866 0000000000000000 0000000000000000
>   [    0.000000][    T0] GPR08: c000000002080864 0000000000000001 c0000000028d4100 c000000000ffe598
>   [    0.000000][    T0] GPR12: c0000000000924d0 c000000002082200 0000000000000000 0000000000000000
>   [    0.000000][    T0] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   [    0.000000][    T0] GPR20: 0000000000000001 0000000010004604 0000000000000000 0000000010004bfc
>   [    0.000000][    T0] GPR24: 0000000000000000 c000000000000000 0000000002970000 c00000000008a480
>   [    0.000000][    T0] GPR28: c0000000028e19f8 c00000001ec90000 c000000002865af8 000000001ec90000
>   [    0.000000][    T0] NIP [c0000000000924d8] hash__setup_initial_memory_limit+0x18/0x110
>   [    0.000000][    T0] LR [c000000002009764] early_init_devtree+0x13c/0x4ec
>   [    0.000000][    T0] Call Trace:
>   [    0.000000][    T0] [c000000002833e60] [c0000000020096fc] early_init_devtree+0xd4/0x4ec (unreliable)
>   [    0.000000][    T0] [c000000002833f10] [c00000000200b008] early_setup+0xc8/0x22c
>   [    0.000000][    T0] [c000000002833f90] [000000000000d368] 0xd368
>   [    0.000000][    T0] Instruction dump:
>   [    0.000000][    T0] 4bffff0c eaa10028 4bffff44 60000000 60000000 60420000 3c4c027a 38421c40
>   [    0.000000][    T0] 7c0802a6 4bfe2e5d 3123ffff 7d291910 <0b090000> 3d220003 392919f8 e9290000
>   [    0.000000][    T0] random: get_random_bytes called from oops_exit+0x54/0xa0 with crng_init=0
>   [    0.000000][    T0] ---[ end trace 0000000000000000 ]---
>
>
> It's complaining about memstart_addr being 0, which implies
> early_init_dt_add_memory_arch() was never called.

The only thing I see is now there is an assumption that 'memory' nodes
are off the root node only. Before they could be anywhere. If that's
the issue, then we need something like this (untested and WS
corrupted):

index a835c458f50a..97d7607625ec 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1083,16 +1083,13 @@ int __init early_init_dt_scan_memory(void)
        int node;
        const void *fdt = initial_boot_params;

-       fdt_for_each_subnode(node, fdt, 0) {
-               const char *type = of_get_flat_dt_prop(node,
"device_type", NULL);
+       for (node = fdt_node_offset_by_prop_value(fdt, -1,
"device_type", "memory", 6);
+            node != -FDT_ERR_NOTFOUND;
+            node = fdt_node_offset_by_prop_value(fdt, node,
"device_type", "memory", 6)) {
                const __be32 *reg, *endp;
                int l;
                bool hotpluggable;

-               /* We are scanning "memory" nodes only */
-               if (type == NULL || strcmp(type, "memory") != 0)
-                       continue;
-
                reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
                if (reg == NULL)
                        reg = of_get_flat_dt_prop(node, "reg", &l);

Rob
