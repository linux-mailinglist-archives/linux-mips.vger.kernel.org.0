Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00DA035F356
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 14:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbhDNMSE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Apr 2021 08:18:04 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48677 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231849AbhDNMSD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Apr 2021 08:18:03 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 10A6A5C019A;
        Wed, 14 Apr 2021 08:17:42 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Wed, 14 Apr 2021 08:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=Ss1GKS6i3LrHc66hcrihc6wkJR56nSZ
        Wv1oaboPv68A=; b=ENvQBfpsOmtjAQoSxPOxKhMjpNpEgHhJbbPCYbYhZKl0Z6F
        tlzSp0kHVoGoLk7Gyy/P1ALOAL47Ws6AGfLINMgcMTw/bNMW5ty2CxFtq1XsBT0L
        5Utc37boQ7RSSNnN9ovAfGV64N4b0uvOYzePLFT+s8LIbz4fk+HqrvPDLPsZUT9h
        oklrbXcysfEynmLaLoBwTo+51+An9k6E+Pdmd1e7BsDy6sWOMvE2TvB3BJLEdVYi
        57/em/TdvjVAmWpi0q35IeEL0Y3tYmXejlb2pPY8SJPmogNV6jYNWVXnEBjGbxqo
        inXnye78BfzknXllNokN/EP0w0FPuCdA++xj9zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ss1GKS
        6i3LrHc66hcrihc6wkJR56nSZWv1oaboPv68A=; b=QgUh3mrnwK8n0pOB6cIay4
        x5SXl3qADIcpM+0hjclSWp0x4pNWEydRzCDxVC3dUCfWkzWypdZ9JpoM65F3liB8
        Ogkyk5Ie4n7IID6U8iMpjNI9TsLkhTWl+t7YqqwLED6dQIyD4My18McjuGkiXHiV
        3JinDPBwONfnY4p55LA9uKMoKnmIZO1D0ZjhS959G2YxlOKLFW/ivYElyRhY6dsh
        YvUrvUT8IIdDcVIcoKSALG22O3u0PlH0M3YGocf5/e3lNjJuO0ePjn6yaOS0KDx9
        8aNFwrdxwnA5TPBRFlPb7CyfrVXlnb75DsPudO5VAMLASiddD1j9IeSrAF4sXMPw
        ==
X-ME-Sender: <xms:ZN12YAGBSNqKyFNmNLDSmTGbIAJdr2N6DE3XDDGb3H5vE4_Lw0yPGQ>
    <xme:ZN12YJXvpyclK8-T-_F94hvFH6nHEaW0Zf9qcseg92ZiATAWSLKWCNrjc1WAx7gXm
    r34S-gGykZg2U3iSuo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeluddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekleehtefhhefftddtleeiveefieehueduieefueegueei
    leeitdeujeehheehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:ZN12YKI4fc6UJiDzvioXjyOtT8xgU9mrQy_QTz2qC5yNChN7drWxag>
    <xmx:ZN12YCEVbmI9sbdjnAR1L1SnHUTpJ4156oJ31SAo4Qo_d709o9QbKQ>
    <xmx:ZN12YGVpiiTdkaxr9nuVO7yyRvn9dhiUsvIyAoAabDRhCIysLuIIgw>
    <xmx:Zt12YDhesWDTOEFOh2uXVtoj3ZvLP3i2BlZaIG7J_nniVryACDku3g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 344D91300062; Wed, 14 Apr 2021 08:17:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <3947384b-37dd-436a-8cda-2391e49a94d2@www.fastmail.com>
In-Reply-To: <20210414012622.23610-1-zhangqing@loongson.cn>
References: <20210414012622.23610-1-zhangqing@loongson.cn>
Date:   Wed, 14 Apr 2021 20:17:20 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Qing Zhang" <zhangqing@loongson.cn>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Huacai Chen" <chenhuacai@kernel.org>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Add Loongson-2K1000 reset support
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, Apr 14, 2021, at 9:26 AM, Qing Zhang wrote:
> Add power management register operations to support reboot and poweroff.
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>

No that's not what we intended to do.
Please add a devicetree node for pm block.

Thanks



> ---
>  .../include/asm/mach-loongson64/loongson.h    |  8 ++++++
>  arch/mips/loongson64/reset.c                  | 28 ++++++++++++++++---
>  2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h 
> b/arch/mips/include/asm/mach-loongson64/loongson.h
> index f7c3ab6d724e..9d254a7b438a 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson.h
> @@ -263,4 +263,12 @@ extern u64 loongson_freqctrl[MAX_PACKAGES];
>  #define LOONGSON_PCIMAP_WIN(WIN, ADDR)	\
>  	((((ADDR)>>26) & LOONGSON_PCIMAP_PCIMAP_LO0) << ((WIN)*6))
>  
> +/* Loongson-2K1000 Power management related registers */
> +#define	PM1_STS         0x0C /* Power Management1 Status Register */
> +#define	PM1_CNT         0x14 /* Power Management 1 Control Register */
> +#define	RST_CNT         0x30 /* Reset Control Register */
> +#define	SLP_TYP		GENMASK(12, 10) /* Sleep Enable */
> +#define	SLP_EN          BIT(13) /* Soft Off */
> +#define	ACPI_OFF        0x7000
> +
>  #endif /* __ASM_MACH_LOONGSON64_LOONGSON_H */
> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> index 3bb8a1ed9348..b4348bf50538 100644
> --- a/arch/mips/loongson64/reset.c
> +++ b/arch/mips/loongson64/reset.c
> @@ -18,9 +18,16 @@
>  static void loongson_restart(char *command)
>  {
>  
> -	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
> +	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
> +		unsigned long base;
>  
> -	fw_restart();
> +		base = CKSEG1ADDR(LOONGSON_REG_BASE) + ACPI_OFF;
> +		writel(1, (void *)(base + RST_CNT));
> +	} else {
> +		void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
> +
> +		fw_restart();
> +	}
>  	while (1) {
>  		if (cpu_wait)
>  			cpu_wait();
> @@ -29,9 +36,22 @@ static void loongson_restart(char *command)
>  
>  static void loongson_poweroff(void)
>  {
> -	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
>  
> -	fw_poweroff();
> +	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
> +		unsigned long base;
> +		unsigned int acpi_ctrl;
> +
> +		base = CKSEG1ADDR(LOONGSON_REG_BASE) + ACPI_OFF;
> +		acpi_ctrl = readl((void *)(base + PM1_STS));
> +		acpi_ctrl &= 0xffffffff;
> +		writel(acpi_ctrl, (void *)(base + PM1_STS));
> +		acpi_ctrl = SLP_EN | SLP_TYP;
> +		writel(acpi_ctrl, (void *)(base + PM1_CNT));
> +	} else {
> +		void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
> +
> +		fw_poweroff();
> +	}
>  	while (1) {
>  		if (cpu_wait)
>  			cpu_wait();
> -- 
> 2.31.0
> 
> 


-- 
- Jiaxun
