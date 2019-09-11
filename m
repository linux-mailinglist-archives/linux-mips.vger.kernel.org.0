Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC540AFF5A
	for <lists+linux-mips@lfdr.de>; Wed, 11 Sep 2019 16:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbfIKO5g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Sep 2019 10:57:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727664AbfIKO5f (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Sep 2019 10:57:35 -0400
Received: from [172.20.7.147] (unknown [88.157.232.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B41D92075C;
        Wed, 11 Sep 2019 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568213855;
        bh=Gh/7DuU8FiSq8rs45zDGOHH3xiKvcuGbScoQIpm/Xeo=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=K8R58zx6IuxCk61Fab4q8lzEiDkIgosx90ioV/q3gepVnDLLr+ihYqorzEivU3cwo
         qvq/pjcGePJp9D6fAe/lh++ZyIWmRAy5Ih/9i+l0+w+4rhb7K3eB/Is6xTW7pDP1tJ
         rNFFkk1XUu6+vO6EwoDb/+i0PFJxxtZRboVALl2c=
Date:   Wed, 11 Sep 2019 15:57:29 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20190911160939.19f776535770d12ff51a2af7@suse.de>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org> <20190905152150.f7ff6ef70726085de63df828@suse.de> <20190905133251.GA3650@rapoport-lnx> <20190905154831.88b7853b47ba7db7bd7626bd@suse.de> <20190905154747.GB3650@rapoport-lnx> <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de> <20190906130223.GA17704@rapoport-lnx> <20190909182242.c1ef9717d14b20212ef75954@suse.de> <20190910113243.GA19207@rapoport-lnx> <20190911160939.19f776535770d12ff51a2af7@suse.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
From:   Mike Rapoport <rppt@kernel.org>
Message-ID: <6B6A736C-26FA-429C-92BA-42DDE2271514@kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On September 11, 2019 3:09:39 PM GMT+01:00, Thomas Bogendoerfer <tbogendoer=
fer@suse=2Ede> wrote:
>On Tue, 10 Sep 2019 12:32:44 +0100
>Mike Rapoport <rppt@kernel=2Eorg> wrote:
>
>> [=2E=2E]
>
>Patch below works on the same Origin=2E
>
>Does memblocks_present() deal better with the one reserved page per
>node
>than sparse_memory_present_with_active_regions() ? Or is there a better
>explanation ? My debug prints didn't make sense out of it=2E=2E=2E

To be honest, I'm really puzzled=2E
I'll take a closer look tomorrow=2E

Thanks for the debugging and fixing this :)

>Thomas=2E
>
>diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>index d50fafd7bf3a=2E=2Ee4b02b5f3487 100644
>--- a/arch/mips/Kconfig
>+++ b/arch/mips/Kconfig
>@@ -669,6 +669,7 @@ config SGI_IP22
> config SGI_IP27
> 	bool "SGI IP27 (Origin200/2000)"
> 	select ARCH_HAS_PHYS_TO_DMA
>+	select ARCH_SPARSEMEM_ENABLE
> 	select FW_ARC
> 	select FW_ARC64
> 	select BOOT_ELF64
>@@ -2633,18 +2634,9 @@ config ARCH_FLATMEM_ENABLE
> 	def_bool y
> 	depends on !NUMA && !CPU_LOONGSON2
>=20
>-config ARCH_DISCONTIGMEM_ENABLE
>-	bool
>-	default y if SGI_IP27
>-	help
>-	  Say Y to support efficient handling of discontiguous physical
>memory,
>-	  for architectures which are either NUMA (Non-Uniform Memory Access)
>-	  or have huge holes in the physical address space for other reasons=2E
>-	  See <file:Documentation/vm/numa=2Erst> for more=2E
>-
> config ARCH_SPARSEMEM_ENABLE
> 	bool
>-	select SPARSEMEM_STATIC
>+	select SPARSEMEM_STATIC if !SGI_IP27
>=20
> config NUMA
> 	bool "NUMA Support"
>diff --git a/arch/mips/sgi-ip27/ip27-memory=2Ec
>b/arch/mips/sgi-ip27/ip27-memory=2Ec
>index fb077a947575=2E=2E370f2ba14a89 100644
>--- a/arch/mips/sgi-ip27/ip27-memory=2Ec
>+++ b/arch/mips/sgi-ip27/ip27-memory=2Ec
>@@ -410,8 +410,6 @@ static void __init node_mem_init(cnodeid_t node)
>=20
> 	memblock_reserve(slot_firstpfn << PAGE_SHIFT,
> 			 ((slot_freepfn - slot_firstpfn) << PAGE_SHIFT));
>-
>-	sparse_memory_present_with_active_regions(node);
> }
>=20
> /*
>@@ -444,6 +442,7 @@ void __init prom_meminit(void)
> 		}
> 		__node_data[node] =3D &null_node;
> 	}
>+	memblocks_present();
> }
>=20
> void __init prom_free_prom_memory(void)


--=20
Sincerely yours,
Mike
