Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDC34DE711
	for <lists+linux-mips@lfdr.de>; Sat, 19 Mar 2022 09:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242497AbiCSI3Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Mar 2022 04:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbiCSI3Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Mar 2022 04:29:24 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE1FC48
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 01:28:03 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id i11so8169650plr.1
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mhkVe1JeFwkPrldbgt/DHkUP3qNpxWgxE9EwfQ7uHOQ=;
        b=cYFiS+S+PRRcjRbHAPnlA8ryqQbtc7oi4ytsdygYlpVUhKNDTRfY8jFpuato2e3ZVC
         /EMQVLo4GhSZY70bitVRV0mYtOjDy+Q+nIFy0029mbcdj1B6gpPOT1DAss2Y/3WQGEgY
         ixtZZcygL1p7QVEH92oXetb4C3aOasM3fae/bUy5g4ekXE54uumutHNIz0cUwbt3h913
         Z5NlxUiPUN4LbbRFUvncHUXMkqIMPxa8x9Of9FT7aXsV5KqHRbzZ4C7oIHurhttE2y7X
         T7XDPaiMPz/PYMG6/plA9iFyyobohU2KoGGdM4FJ01DrFOsVwCTt1PMSeF5lyxdvvoPZ
         DIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mhkVe1JeFwkPrldbgt/DHkUP3qNpxWgxE9EwfQ7uHOQ=;
        b=QwaQuIIZwXG70ELYLu1W0TNGxQmQw4glnrBjPA3IEAi18jcsQqMTaUpWz0Uvb8YWZd
         Z8KX9Q87U+nMOWNK9UbdjEBjrVpxdCWNLArBkV8xIOgHyZYNSqfx/OAwbnM2UIjq5qJB
         d62KGDom89PyJEgZOVxzUt1fQnjo8k/86XmNcqkEZhb8PqYnJrFxik/SBffXbwUrgQfq
         7EsAzxCPGrqRAE9pYe7dVnDrk609JRTLLs0kYCsXf5RFROWqNm8TOfngjNJbklid8G9x
         ho2H8i8tT0fs0Q/Uy9BXuOUMxYekAC42/o75jRI8QLuEwsZ8pHIG5evSor2fzgSLGUh2
         UCWQ==
X-Gm-Message-State: AOAM531VBZvwUOahh4carCFxLZgn6lO/CDXUJdOCkOAC+VWqXZIEZilT
        Nzc6ECfe4NMarDHeSWJT1TQSAH1ZgJifrirxVOU=
X-Google-Smtp-Source: ABdhPJygohprSani1vapS+Cou927wDKnAm/HGPizhygT8cms0Pst1A8TyyAam4ODJG/Uc/ktPrwyx5kJoLxZAglpubA=
X-Received: by 2002:a17:90a:ab17:b0:1b9:b61a:aadb with SMTP id
 m23-20020a17090aab1700b001b9b61aaadbmr15295757pjq.77.1647678483150; Sat, 19
 Mar 2022 01:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647671808.git.chenfeiyang@loongson.cn> <91781d982e1b89ab4fc7f1f378433eaa0e44b15a.1647671808.git.chenfeiyang@loongson.cn>
 <08a8983a-d6bd-a8d6-7996-59e1aa4c6590@loongson.cn>
In-Reply-To: <08a8983a-d6bd-a8d6-7996-59e1aa4c6590@loongson.cn>
From:   Feiyang Chen <chris.chenfeiyang@gmail.com>
Date:   Sat, 19 Mar 2022 16:27:48 +0800
Message-ID: <CACWXhKnyC8Qa2ipqkg7f0R6wL=-0Y0gFDCSK6NXpscbxgeqEFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: loongson64: Fix build error when CONFIG_NUMA is set
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 19 Mar 2022 at 16:03, Youling Tang <tangyouling@loongson.cn> wrote:
>
> Hi, Feiyang
> On 2022/3/19 =E4=B8=8B=E5=8D=883:11, Feiyang Chen wrote:
> > Modify __node_data to node_data to fix the build error when CONFIG_NUMA=
=3Dy:
> >
> > mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_=
init':
> > (.init.text+0x1714): undefined reference to `node_data'
> > mips64el-unknown-linux-gnu-ld: (.init.text+0x1730): undefined reference=
 to `node_data'
> 1. This issue was introduced by the patch "mm, memory_hotplug: make
> arch_alloc_nodedata independent on CONFIG_MEMORY_HOTPLUG". The patch
> has not yet been synced to the mips-next branch.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D9039a226f22047ba6b066128318d5be8ef794273
>
> 2. The build error should not modify mips but should modifythe
> include/linux/memory_hotplug.h file, which will use "NODE_DATA"
> instead of "node_data".

Hi, Youling,

The comment in include/linux/memory_hotplug.h says:

/*
* For supporting node-hotadd, we have to allocate a new pgdat.
*
* If an arch has generic style NODE_DATA(),
* node_data[nid] =3D kzalloc() works well. But it depends on the architectu=
re.
*
* In general, generic_alloc_nodedata() is used.
*
*/

I don't think it's a good idea to modify "node_data" to "NODE_DATA".

>
> 3. If "__node_data" is changed to "node_data" in mips, it will cause
> problems with the crash tool.

How about selecting HAVE_ARCH_NODEDATA_EXTENSION and overloading
functions as sgi-ip27 in Patch 2?

Thanks,
Feiyang

>
> Thanks,
> Youling.
> >
> > BTW, modify __node_distances and __node_cpumask to follow the same styl=
e.
> >
> > Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> > ---
> >   .../mips/include/asm/mach-loongson64/mmzone.h |  4 ++--
> >   .../include/asm/mach-loongson64/topology.h    |  8 +++----
> >   arch/mips/loongson64/numa.c                   | 22 +++++++++---------=
-
> >   3 files changed, 17 insertions(+), 17 deletions(-)
> >
> > diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips=
/include/asm/mach-loongson64/mmzone.h
> > index ebb1deaa77b9..14e2b860ad65 100644
> > --- a/arch/mips/include/asm/mach-loongson64/mmzone.h
> > +++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
> > @@ -14,9 +14,9 @@
> >   #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE=
_SHIFT)
> >   #define nid_to_addrbase(nid) ((unsigned long)(nid) << NODE_ADDRSPACE_=
SHIFT)
> >
> > -extern struct pglist_data *__node_data[];
> > +extern struct pglist_data *node_data[];
> >
> > -#define NODE_DATA(n)         (__node_data[n])
> > +#define NODE_DATA(n)         (node_data[n])
> >
> >   extern void setup_zero_pages(void);
> >   extern void __init prom_init_numa_memory(void);
> > diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mi=
ps/include/asm/mach-loongson64/topology.h
> > index 3414a1fd1783..dc71eaf9c819 100644
> > --- a/arch/mips/include/asm/mach-loongson64/topology.h
> > +++ b/arch/mips/include/asm/mach-loongson64/topology.h
> > @@ -6,17 +6,17 @@
> >
> >   #define cpu_to_node(cpu)    (cpu_logical_map(cpu) >> 2)
> >
> > -extern cpumask_t __node_cpumask[];
> > -#define cpumask_of_node(node)        (&__node_cpumask[node])
> > +extern cpumask_t node_cpumask[];
> > +#define cpumask_of_node(node)        (&node_cpumask[node])
> >
> >   struct pci_bus;
> >   extern int pcibus_to_node(struct pci_bus *);
> >
> >   #define cpumask_of_pcibus(bus)      (cpu_online_mask)
> >
> > -extern unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
> > +extern unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
> >
> > -#define node_distance(from, to)      (__node_distances[(from)][(to)])
> > +#define node_distance(from, to)      (node_distances[(from)][(to)])
> >
> >   #endif
> >
> > diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> > index e8e3e48c5333..9c1bf29c1aae 100644
> > --- a/arch/mips/loongson64/numa.c
> > +++ b/arch/mips/loongson64/numa.c
> > @@ -27,13 +27,13 @@
> >   #include <boot_param.h>
> >   #include <loongson.h>
> >
> > -unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
> > -EXPORT_SYMBOL(__node_distances);
> > -struct pglist_data *__node_data[MAX_NUMNODES];
> > -EXPORT_SYMBOL(__node_data);
> > +unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
> > +EXPORT_SYMBOL(node_distances);
> > +struct pglist_data *node_data[MAX_NUMNODES];
> > +EXPORT_SYMBOL(node_data);
> >
> > -cpumask_t __node_cpumask[MAX_NUMNODES];
> > -EXPORT_SYMBOL(__node_cpumask);
> > +cpumask_t node_cpumask[MAX_NUMNODES];
> > +EXPORT_SYMBOL(node_cpumask);
> >
> >   static void cpu_node_probe(void)
> >   {
> > @@ -71,11 +71,11 @@ static void __init init_topology_matrix(void)
> >
> >       for (row =3D 0; row < MAX_NUMNODES; row++)
> >               for (col =3D 0; col < MAX_NUMNODES; col++)
> > -                     __node_distances[row][col] =3D -1;
> > +                     node_distances[row][col] =3D -1;
> >
> >       for_each_online_node(row) {
> >               for_each_online_node(col) {
> > -                     __node_distances[row][col] =3D
> > +                     node_distances[row][col] =3D
> >                               compute_node_distance(row, col);
> >               }
> >       }
> > @@ -107,7 +107,7 @@ static void __init node_mem_init(unsigned int node)
> >       tnid =3D early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
> >       if (tnid !=3D node)
> >               pr_info("NODE_DATA(%d) on node %d\n", node, tnid);
> > -     __node_data[node] =3D nd;
> > +     node_data[node] =3D nd;
> >       NODE_DATA(node)->node_start_pfn =3D start_pfn;
> >       NODE_DATA(node)->node_spanned_pages =3D end_pfn - start_pfn;
> >
> > @@ -146,7 +146,7 @@ static __init void prom_meminit(void)
> >               if (node_online(node)) {
> >                       szmem(node);
> >                       node_mem_init(node);
> > -                     cpumask_clear(&__node_cpumask[node]);
> > +                     cpumask_clear(&node_cpumask[node]);
> >               }
> >       }
> >       max_low_pfn =3D PHYS_PFN(memblock_end_of_DRAM());
> > @@ -159,7 +159,7 @@ static __init void prom_meminit(void)
> >               if (loongson_sysconf.reserved_cpus_mask & (1<<cpu))
> >                       continue;
> >
> > -             cpumask_set_cpu(active_cpu, &__node_cpumask[node]);
> > +             cpumask_set_cpu(active_cpu, &node_cpumask[node]);
> >               pr_info("NUMA: set cpumask cpu %d on node %d\n", active_c=
pu, node);
> >
> >               active_cpu++;
>
