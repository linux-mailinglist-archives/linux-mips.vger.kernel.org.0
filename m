Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BDF333C54
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 13:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhCJMNX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 07:13:23 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:50239 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231339AbhCJMNJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 07:13:09 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 25A098E1;
        Wed, 10 Mar 2021 07:13:08 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Wed, 10 Mar 2021 07:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=ijAbqYPOv5BRiKvYRMQbr7RBv+UeeJI
        Q7ot4ItIBe+c=; b=QdDauYsoEyxwYdO3edZi4fetEaovatcZqLywu0PUYGK0PAW
        B0NUvEz8GsuGTrbwWptgIfrWME3amjeyCVPbg7Fk16t4D9zKLdBODQy/gFyOa6hX
        VSQ2lFHP2DdHI/PM+KyVZf+u034xs4vKhsZdkhQyfTwKX3iQYzhnK2Jx6cKA1OxN
        W2Ut7PkY4d6jcAVX0NQvPmKAqH7KTfWj//3tB7xnOB0jiPAk3mfmkSniGUQUQ6Hx
        acCzQM+erZIKqKfSjMqktBUzUtVsmTmhGWmCov8/QdN3WuvAwctx0YhXgORCgg/T
        F3CT9UwF6eJr6Dkb7wenJJrLnxX9gC8UkmNStqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ijAbqY
        POv5BRiKvYRMQbr7RBv+UeeJIQ7ot4ItIBe+c=; b=wsSt/Yvtmw8nVY7tt7iYRx
        YQG2elnTjcD0NxysFyHk98Ll1Z5UIC5SA33L9EEMeBblvTyBfPkc3pI0/XKZ37B1
        9PkT/5fqVcMX690kswAZxeEunUUngW0PnzsT15ajd3jAXDMkuT+f6xgeDOGVEhQ2
        DpA0ct3uvxJHmNlJ2Xc5brt7NMBihFdqIEYwMgeUOqBDNgOF9aETenA6rtPE+g8S
        iCwRteYrlhe2fIu+uLPVcantnKydgslKql8oQJV2Q1jBksQlPDTIn4YB1vwWXhBX
        6DWPyNkaPVF5INBpfEtkqrKyv5eCEXfAMS48LoEtnnfzv5mWZbqHBpt/+OK/5p3Q
        ==
X-ME-Sender: <xms:0bdIYPOpDxlJP6PD4JRcGatHXLFja8awedBEKEBhq6ffIO78cEKpyA>
    <xme:0bdIYJ_KVWxX53LYiJESxsY1XIbTjozfYNL2Qw9eXMRPVHx0uSTKSl1CihyZQrBCr
    toAL_fMT3sOxGbHSbs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeehveejueektdefffeikeejfffguedujedtleetgfefjefh
    heelueejtdfhudetudenucffohhmrghinhepughotghplhgrhigvrhdrnhgvthenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:0bdIYOR3htgbPiO5Afc9cKY2vcvYG8UKHMZTKnIO62_5Ta3yKzFU0Q>
    <xmx:0bdIYDtQC4Sbw3c2uMgNvc3XB14iZTAdpu_6wH7X4uX8MP6A42TRBQ>
    <xmx:0bdIYHfvjb8IG_-yMbH_nRzX9OLmNZeUrPByH6QdftJH3AoCl7vrmA>
    <xmx:07dIYJs6048MUTZaCvstsAb48WYI4TA0qMG6AawNpuqYfG9tFL3-XQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id AC267130005D; Wed, 10 Mar 2021 07:13:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <49ddbef4-3d2a-4adb-8fd0-37bba0530c4c@www.fastmail.com>
In-Reply-To: <2484af69-13d1-09ff-3785-6c89cac4ffbd@rempel-privat.de>
References: <20210310075639.20372-1-zhangqing@loongson.cn>
 <20210310075639.20372-3-zhangqing@loongson.cn>
 <2484af69-13d1-09ff-3785-6c89cac4ffbd@rempel-privat.de>
Date:   Wed, 10 Mar 2021 20:12:43 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Oleksij Rempel" <linux@rempel-privat.de>,
        "Qing Zhang" <zhangqing@loongson.cn>,
        "Huacai Chen" <chenhuacai@kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Marc Zyngier" <maz@kernel.org>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        "Ming Wang" <wangming01@loongson.cn>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_2/7]_MIPS:_Loongson64:_Distinguish_firmware_depe?=
 =?UTF-8?Q?ndencies_DTB/LEFI?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, Mar 10, 2021, at 6:57 PM, Oleksij Rempel wrote:
> Hi,
> 
> Am 10.03.21 um 08:56 schrieb Qing Zhang:
> > Add DTB boot support, only support Loongson-2K1000 processor
> > for now, determine whether to use the built-in DTB or the DTB
> > from the firmware by checking the range of CKSEG0 and XKPHYS.
> > loongson_fw_interface will be used in the future.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> > Tested-by: Ming Wang <wangming01@loongson.cn>
> > ---
> >
> > v3-v4: Standard submission of information
> >        Fix error handling
> >
> >  .../include/asm/mach-loongson64/boot_param.h     |  6 ++++++
> >  arch/mips/include/asm/mach-loongson64/loongson.h |  3 ++-
> >  arch/mips/loongson64/env.c                       | 13 ++++++++++++-
> >  arch/mips/loongson64/init.c                      | 16 ++++++++++++++--
> >  4 files changed, 34 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> > index 4592841b6b0c..43737401dc06 100644
> > --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> > +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> > @@ -198,7 +198,13 @@ enum loongson_bridge_type {
> >  	VIRTUAL = 3
> >  };
> >
> > +enum loongson_fw_interface {
> > +	LOONGSON_LEFI,
> > +	LOONGSON_DTB,
> > +};
> > +
> >  struct loongson_system_configuration {
> > +	enum loongson_fw_interface fw_interface;
> >  	u32 nr_cpus;
> >  	u32 nr_nodes;
> >  	int cores_per_node;
> > diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
> > index ac1c20e172a2..3f885fa26ba6 100644
> > --- a/arch/mips/include/asm/mach-loongson64/loongson.h
> > +++ b/arch/mips/include/asm/mach-loongson64/loongson.h
> > @@ -23,7 +23,8 @@ extern u32 memsize, highmemsize;
> >  extern const struct plat_smp_ops loongson3_smp_ops;
> >
> >  /* loongson-specific command line, env and memory initialization */
> > -extern void __init prom_init_env(void);
> > +extern void __init prom_dtb_init_env(void);
> > +extern void __init prom_lefi_init_env(void);
> >  extern void __init szmem(unsigned int node);
> >  extern void *loongson_fdt_blob;
> >
> > diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> > index 51a5d050a94c..e7d3a06175e3 100644
> > --- a/arch/mips/loongson64/env.c
> > +++ b/arch/mips/loongson64/env.c
> > @@ -43,7 +43,18 @@ const char *get_system_type(void)
> >  	return "Generic Loongson64 System";
> >  }
> >
> > -void __init prom_init_env(void)
> > +
> > +void __init prom_dtb_init_env(void)
> > +{
> > +	if ((fw_arg2 < CKSEG0 || fw_arg2 > CKSEG1)
> > +		&& (fw_arg2 < XKPHYS || fw_arg2 > XKSEG))
> > +
> > +		loongson_fdt_blob = __dtb_loongson64_2core_2k1000_begin;
> > +	else
> > +		loongson_fdt_blob = (void *)fw_arg2;
> > +}
> > +
> > +void __init prom_lefi_init_env(void)
> >  {
> >  	struct boot_params *boot_p;
> >  	struct loongson_params *loongson_p;
> > diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> > index cfa788bca871..ed280b73bf89 100644
> > --- a/arch/mips/loongson64/init.c
> > +++ b/arch/mips/loongson64/init.c
> > @@ -52,6 +52,10 @@ void __init szmem(unsigned int node)
> >  	static unsigned long num_physpages;
> >  	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
> >
> > +	/* Otherwise come from DTB */
> > +	if (loongson_sysconf.fw_interface != LOONGSON_LEFI)
> > +		return;
> > +
> >  	/* Parse memory information and activate */
> >  	for (i = 0; i < loongson_memmap->nr_map; i++) {
> >  		node_id = loongson_memmap->map[i].node_id;
> > @@ -94,12 +98,20 @@ static void __init prom_init_memory(void)
> >  void __init prom_init(void)
> >  {
> >  	fw_init_cmdline();
> > -	prom_init_env();
> > +
> > +	if (fw_arg2 == 0 || (fdt_magic(fw_arg2) == FDT_MAGIC)) {
> > +		loongson_sysconf.fw_interface = LOONGSON_DTB;
> > +		prom_dtb_init_env();
> > +	} else {
> > +		loongson_sysconf.fw_interface = LOONGSON_LEFI;
> > +		prom_lefi_init_env();
> > +	}
> 
> Is it possible to make it compatible with MIPS UHI boot protocol? So 
> boot loaders will be able to
> handle Loongson kernel images as any other MIPS kernel images?

Hmm, as Loongson did many stuff in non-generic manner it's almost impossible :-(
Also their are many devices shipped with current boot protocol.


> 
> This protocol is described here on page 15, "3. Boot protocols"
> https://docplayer.net/62444141-Unified-hosting-interface-md01069-reference-manual.html
> 
> According to this protocol, you should have:
> fw_arg0 = -2
> fw_arg1 = Virtual (kseg0) address of Device Tree Blob
> 
> This would made LS a first grade resident for many boot loaders and 
> save a lot of needles headaches.

Loongson is stepping away from MIPS and it seems like they're going to use EDK-II for their Loongarch.
TBH I've checked Loongson's PMON code and realized it can't be ported to other projects easily.

Tons of unregonized assembly code.


Thanks.

- Jiaxun

> 
> --
> Regards,
> Oleksij
>

-- 
- Jiaxun
