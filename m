Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E77BB4DE81F
	for <lists+linux-mips@lfdr.de>; Sat, 19 Mar 2022 14:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiCSNOY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Mar 2022 09:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238169AbiCSNOX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Mar 2022 09:14:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1036420
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 06:13:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C8FAA60C99
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 13:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2A3C340EC
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647695581;
        bh=TSL8mFrCIKbWBED2QtIpAtspXtEQERjL0phu3Yd6EGs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=m/49TZPnq0ltbdDA/Dn6yef63Hni+392nNuTqBgSBrN5F+YMmgslvoXRvniFijnCn
         7aw6FdMfYWATS5zG4JKkzbub5u7TBq+KUq9z77eSNjOKrsMPoNKbUyh3zFQh+m8Jok
         D5UOs9IqJ4eUrLpyKVIjztYntgS4tdMaVgUXtWGdqbA/CkEbCo4t8RJV/I1V0yuB5i
         c4mlZmBcxOqEWUESLna+3WANxtNpcp+7MwiGK/Q+/WHnJpN3G4sdceljpgyIWuiRDf
         t7oG+E9Tsq2svpOFzN5/sWGkaKuADI8Q/Pb3KrQ2fcWGGHqm/K9idpJMiA8b9JQwfH
         kERS3u4RIX2dg==
Received: by mail-vs1-f53.google.com with SMTP id h126so5367192vsc.13
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 06:13:01 -0700 (PDT)
X-Gm-Message-State: AOAM533rojAFcPxbiVeOo/WdU6nOmRV+0FumzPAiua5OB1x4V5QD+W5l
        v0MZLKF65mQ4cMwaqaVji9dEiwanbRadT03BM8k=
X-Google-Smtp-Source: ABdhPJxZT1beGUPjBEamUuJ5STww+KOMqZms0tNbF0A9sPnaX/dt1eItptGW2Cv1oyCgnSoaThu8JdvZsMC40wq4ErE=
X-Received: by 2002:a67:d986:0:b0:324:e553:808a with SMTP id
 u6-20020a67d986000000b00324e553808amr2092932vsj.67.1647695580069; Sat, 19 Mar
 2022 06:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <78559205988aa1c0b42ee6ac20bb0fec3200f978.1647682458.git.chenfeiyang@loongson.cn>
In-Reply-To: <78559205988aa1c0b42ee6ac20bb0fec3200f978.1647682458.git.chenfeiyang@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Sat, 19 Mar 2022 21:12:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7bJbi42DKycsDOgRzAOqoi2vhTYswruKX78PK2x1=QfA@mail.gmail.com>
Message-ID: <CAAhV-H7bJbi42DKycsDOgRzAOqoi2vhTYswruKX78PK2x1=QfA@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Fix build error for loongson64 and sgi-ip27
To:     Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Feiyang Chen <chenfeiyang@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Youling Tang <tangyouling@loongson.cn>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Looks good to me.

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Sat, Mar 19, 2022 at 5:40 PM Feiyang Chen
<chris.chenfeiyang@gmail.com> wrote:
>
> Select HAVE_ARCH_NODEDATA_EXTENSION for loongson64 to fix build error
> when CONFIG_NUMA=y:
>
> mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_init':
> (.init.text+0x1714): undefined reference to `node_data'
> mips64el-unknown-linux-gnu-ld: (.init.text+0x1730): undefined reference to `node_data'
>
> Also, select HAVE_ARCH_NODEDATA_EXTENSION for sgi-ip27 to fix build error:
>
> mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_init':
> page_alloc.c:(.init.text+0x1ba8): undefined reference to `node_data'
> mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1bcc): undefined reference to `node_data'
> mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1be4): undefined reference to `node_data'
> mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1bf4): undefined reference to `node_data'
>
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> ---
>  arch/mips/Kconfig                |  5 +++++
>  arch/mips/loongson64/numa.c      | 10 ++++++++++
>  arch/mips/sgi-ip27/ip27-memory.c | 10 ++++++++++
>  3 files changed, 25 insertions(+)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 0dae5f1e61cc..de3b32a507d2 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -513,6 +513,7 @@ config MACH_LOONGSON64
>         select USE_OF
>         select BUILTIN_DTB
>         select PCI_HOST_GENERIC
> +       select HAVE_ARCH_NODEDATA_EXTENSION if NUMA
>         help
>           This enables the support of Loongson-2/3 family of machines.
>
> @@ -709,6 +710,7 @@ config SGI_IP27
>         select WAR_R10000_LLSC
>         select MIPS_L1_CACHE_SHIFT_7
>         select NUMA
> +       select HAVE_ARCH_NODEDATA_EXTENSION
>         help
>           This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
>           workstations.  To compile a Linux kernel that runs on these, say Y
> @@ -2708,6 +2710,9 @@ config NUMA
>  config SYS_SUPPORTS_NUMA
>         bool
>
> +config HAVE_ARCH_NODEDATA_EXTENSION
> +       bool
> +
>  config RELOCATABLE
>         bool "Relocatable kernel"
>         depends on SYS_SUPPORTS_RELOCATABLE
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index e8e3e48c5333..69a533148efd 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -197,3 +197,13 @@ void __init prom_init_numa_memory(void)
>         prom_meminit();
>  }
>  EXPORT_SYMBOL(prom_init_numa_memory);
> +
> +pg_data_t * __init arch_alloc_nodedata(int nid)
> +{
> +       return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
> +}
> +
> +void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
> +{
> +       __node_data[nid] = pgdat;
> +}
> diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> index adc2faeecf7c..f79c48393716 100644
> --- a/arch/mips/sgi-ip27/ip27-memory.c
> +++ b/arch/mips/sgi-ip27/ip27-memory.c
> @@ -422,3 +422,13 @@ void __init mem_init(void)
>         memblock_free_all();
>         setup_zero_pages();     /* This comes from node 0 */
>  }
> +
> +pg_data_t * __init arch_alloc_nodedata(int nid)
> +{
> +       return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
> +}
> +
> +void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
> +{
> +       __node_data[nid] = (struct node_data *)pgdat;
> +}
> --
> 2.27.0
>
