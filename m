Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4EC1B978F
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 08:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgD0GmT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 02:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbgD0GmT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 02:42:19 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C938C061A0F;
        Sun, 26 Apr 2020 23:42:19 -0700 (PDT)
Received: from flygoat-x1e (unknown [IPv6:240e:390:491:f2b0::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 87CD220497;
        Mon, 27 Apr 2020 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587969739; bh=N7ZUcCWVc0dV9V1wU96trh4dgtO3ZeLTlP6o++IdGOY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gTGIkUg2l3iEJgc4a03ynBptX1ag9ERyKq0/9zZOYZDTX5Yz4aDA+YKZ3gKYZnUCS
         uiiJZBU2cmJRvfq/e6kit5+MG/qxXbEibteqeaD1TFVJIZBHwHCYbMws96jttI1B1I
         Khcmf6QkubRJkFmwdKUPwm6H3bmhv3Aqr0z1OsgXplOBWq74h9pc56hcnwp9tdsNwb
         2ZwYlvOoo/SV36aqZsL1vvgnhGFPWgAnbH19jhdHB7pym4bAutejcsNXPUe9U6M12i
         vOA4ZOfSfxD1YBkDaWkiQtYZPiGRi7RKKHvt9vsgUVI1uNMOmyO2k01Z1Ens4+zv5t
         RLZkLw2SGpjCA==
Date:   Mon, 27 Apr 2020 14:42:03 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v4 0/3] Add basic support for LS7A bridge chip
Message-ID: <20200427144203.114d4e2d@flygoat-x1e>
In-Reply-To: <a6df2442-bb44-5002-09ab-56ad6e7dd528@loongson.cn>
References: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
        <8afa3df1-9c9f-aa90-e630-2b77f24fe41f@loongson.cn>
        <20200427125732.3212ced3@flygoat-x1e>
        <a6df2442-bb44-5002-09ab-56ad6e7dd528@loongson.cn>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 27 Apr 2020 13:42:06 +0800
Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> On 04/27/2020 12:57 PM, Jiaxun Yang wrote:
> > On Mon, 27 Apr 2020 09:31:54 +0800
> > Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >  
> >> On 04/03/2020 05:29 PM, Tiezhu Yang wrote:  
> >>> The LS7A bridge chip has been released for several years since the
> >>> second half of 2017, but it is not supported by the Linux mainline
> >>> kernel while it only works well with the Loongson internal kernel
> >>> version. When I update the latest version of Linux mainline kernel
> >>> on the Loongson 3A3000 CPU and LS7A bridge chip system, the boot
> >>> process failed and I feel depressed.
> >>>
> >>> The LS7A bridge chip is used a lot with 3A3000 or 3A4000 CPU in
> >>> the most Loongson desktop and sever products, it is important to
> >>> support LS7A bridge chip by the Linux mainline kernel.
> >>>
> >>> This patch series adds the basic support for the LS7A bridge chip,
> >>> the patch about vendor ID and SATA has been merged into the
> >>> mainline tree, the next work is to refactor the code about the
> >>> interrupt controller, and then power management and some other
> >>> controller device drivers.
> >>>
> >>> By the way, if you want the boot process is successful (just for
> >>> test) on the Loongson 3A3000 CPU and LS7A bridge chip system,
> >>> you should not only apply these patches, but also need the support
> >>> for SATA and interrupt controller in the v1 patch series.
> >>>
> >>> This patch series is based on mips-next.
> >>>
> >>> If you have any questions and suggestions, please let me know.
> >>>
> >>> Thanks,
> >>>
> >>> Tiezhu Yang
> >>>
> >>> v2:
> >>>     - The split patch series about Loongson vendor ID and SATA
> >>> controller has been merged into the linux-block.git by Jens Axboe
> >>> [1].
> >>>
> >>>     - Think about using hierarchy IRQ domain in the patch of
> >>> interrupt controller, and this maybe depend on the patch series by
> >>> Jiaxun ("Modernize Loongson64 Machine"), so the patch about
> >>> interrupt is not included in this v2 patch series.
> >>>
> >>> v3:
> >>>     - The split patch series about Loongson vendor ID and SATA
> >>> controller has been merged into the mainline tree [2]
> >>>
> >>>     - Modify the macro definition and add comment to make it easy
> >>> to read
> >>>
> >>>     - Move ls7a1000_pci_class_quirk() to fixup-loongson3.c
> >>>
> >>>     - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014
> >>>
> >>> v4:
> >>>     - Use LS7A instead of Loongson 7A1000 in the description
> >>>     - Use LS7A or ls7a instead of LS7A1000 or ls7a1000 in the code
> >>>
> >>> [1]
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9acb9fe18d86
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e49bd683e00b
> >>> [2]
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e49bd683e00b
> >>>
> >>> Tiezhu Yang (3):
> >>>     MIPS: Loongson: Get host bridge information
> >>>     MIPS: Loongson: Add DMA support for LS7A
> >>>     MIPS: Loongson: Add PCI support for LS7A
> >>>
> >>>    arch/mips/include/asm/mach-loongson64/boot_param.h | 20 +++++++
> >>>    arch/mips/loongson64/dma.c                         |  9 ++--
> >>>    arch/mips/loongson64/env.c                         | 22
> >>> ++++++++ arch/mips/loongson64/init.c                        | 17
> >>> ++++++ arch/mips/pci/fixup-loongson3.c                    | 12
> >>> +++++ arch/mips/pci/ops-loongson3.c                      | 63
> >>> ++++++++++++++++++++-- 6 files changed, 136 insertions(+), 7
> >>> deletions(-)  
> >> Hi Thomas,
> >>
> >> Could you please apply the following two patches to mips-next?
> >>
> >> [v4,1/3] MIPS: Loongson: Get host bridge information
> >> https://lore.kernel.org/patchwork/patch/1220009/
> >>
> >> [v4,2/3] MIPS: Loongson: Add DMA support for LS7A
> >> https://lore.kernel.org/patchwork/patch/1220010/  
> > Sorry but I really don't like the DMA patch, hard coding a config
> > register in platform code is not necessarily a good idea, it
> > create painful hell for adding new platform support.
> >
> > I'm trying very hard to let all devices go through DeviceTree.
> >
> > I'd suggest you to limit DMA capability on LS7A PCH instead of doing
> > the hack.  
> 
> Hi Jiaxun,
> 
> Thanks for your suggestion, let me rethink how to properly support
> DMA.
> 
> Do you think the following patch could be applied first?
> 
> [v4,1/3] MIPS: Loongson: Get host bridge information
> https://lore.kernel.org/patchwork/patch/1220009/

Looks reasonable.

Thanks.

> 
> Thanks,
> Tiezhu Yang
> 
> >
> > Or if you think the function is necessary, you can create a
> > DeviceTree node called "loongson,ls7a-syscon", and do whatever you
> > like in init_calls by parsing this node.
> >
> > Also that will also block my upcoming LS2K support patches.
> > You can check my tree here[1].
> >
> > Thanks.
> >
> > [1]: https://github.com/FlyGoat/linux/commits/next-testing-2k
> >  
> >> Thanks,
> >> Tiezhu Yang
> >>  
> > --
> > Jiaxun Yang  
> 
--
Jiaxun Yang

