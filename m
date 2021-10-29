Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C34243FB9B
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 13:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhJ2LpW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 07:45:22 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:49983 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231807AbhJ2LpS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 Oct 2021 07:45:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 322083201C46;
        Fri, 29 Oct 2021 07:42:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 29 Oct 2021 07:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=N
        VqXUrYgnE+kwGBxnhV/S6cNZ5xcARVh9kiIuk//MTM=; b=J1MtPY4OReI9jz8ni
        bbNzfCZU47VmYhWtoEtWxtHoKTwP9lUMJsNrEbww2PSObqDuTe1phwCMiRLAlNqn
        2BppTJ/WwokDXakulgMNH+Nkqs/JeTtzVVURiwk9WneOk2F3bXBNnirv7bG6Z41c
        5O5WvdHgrhL5it6r7RdAqf1KagRXk4u8ssQcpiQpEjle6mjg4hFrQguIHekQ02X4
        GOFaKv8i5gaGRSGR4KdVB2eTnr8dnEcDQfGyuES7FM8TAPwI6/++CW5giPUonEe0
        n4yW6sp3vlBH5rRM9EkNGuNEiXXBep4N66rxT1qt77Fu2voIEvw7CFbs2qQum+zL
        8zG0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=NVqXUrYgnE+kwGBxnhV/S6cNZ5xcARVh9kiIuk//M
        TM=; b=bAnxjsSspcnuI2RuT6qQKtz1GDoBqLfq1kDkFGZ/KlzyrasfAUzHsvctn
        znl/+rQ+kIKK2baCX1sKA1dxEj2wfE1Ed9lQBKXt4RWFW5+4TuzDt4gnJCl96XcA
        eeNVgmYwT2cO8Nu/QmNxIapTHcoqoVmfoAFOUHWp8jLFMUO6ura34CtPD19tFWxI
        eK9dGPwtzODwwiq1DH5g5s/HXCBKOgxhoKUJFH5gBS6Beq1rmQ0kTRM0BCmjQ1jp
        mTgZibQ1GFTDA1xucgRuP3rSaumZC97nyBGHnLjNeAEsOh2AV2n/2Yy9KiqNwdiI
        gHC6dO71vso7oMQqtbJigYFhTTRQQ==
X-ME-Sender: <xms:N957YcapSufw3HT0BNvaQecap6Y7xXqvdW7-crhgjcvl8H7t88Z_eg>
    <xme:N957YXZJ0A3TbaC_dzBvHD0NY_k0-Z44ITLI9JXxKyvNG-JOj2v3JHlL3AolAki5K
    oIpKqRxTriMHQnF8xw>
X-ME-Received: <xmr:N957YW-j1wcryXYoiVmVJU4E8l-DRJSCKA7gwa-Ed4ZM5kwy6CSGumSrNA54T7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
    jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:ON57YWq83UTsDrhqO6FmrPaMyLcZ6QrIloSUJShKWkxHLnCuwULSKA>
    <xmx:ON57YXo5rGNnKZzOXxPOTFsCODDxBFWojOZ4zwdeVKHrYrN7UfWi0A>
    <xmx:ON57YUSxVnXVdo0WuccDBVBv3GbW__xChOY7yj5Mgj9BRdqP9umt-g>
    <xmx:ON57YYnnWpU-eLHoVarTfVziX9vAT93ncy_ml-oz3k__X4O2A1K8uA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 07:42:47 -0400 (EDT)
Message-ID: <6a9207ac-bbd5-e2a1-1d38-9a4ffe6bbeb1@flygoat.com>
Date:   Fri, 29 Oct 2021 12:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] mips: cm: Convert to bitfield API to fix out-of-bounds
 access
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Markos Chandras <markos.chandras@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <0471c545117c5fa05bd9c73005cda9b74608a61e.1635501373.git.geert+renesas@glider.be>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <0471c545117c5fa05bd9c73005cda9b74608a61e.1635501373.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2021/10/29 10:58, Geert Uytterhoeven 写道:
> mips_cm_error_report() extracts the cause and other cause from the error
> register using shifts.  This works fine for the former, as it is stored
> in the top bits, and the shift will thus remove all non-related bits.
> However, the latter is stored in the bottom bits, hence thus needs masking
> to get rid of non-related bits.  Without such masking, using it as an
> index into the cm2_causes[] array will lead to an out-of-bounds access,
> probably causing a crash.
>
> Fix this by using FIELD_GET() instead.  Bite the bullet and convert all
> MIPS CM handling to the bitfield API, to improve readability and safety.
>
> Fixes: 3885c2b463f6a236 ("MIPS: CM: Add support for reporting CM cache errors")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Compile-tested only, but assembler output before/after compared.
> ---
>   arch/mips/include/asm/mips-cm.h | 12 ++++++------
>   arch/mips/kernel/mips-cm.c      | 21 ++++++++++-----------
>   2 files changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
> index aeae2effa123d7e2..23c67c0871b17c91 100644
> --- a/arch/mips/include/asm/mips-cm.h
> +++ b/arch/mips/include/asm/mips-cm.h
> @@ -11,6 +11,7 @@
>   #ifndef __MIPS_ASM_MIPS_CM_H__
>   #define __MIPS_ASM_MIPS_CM_H__
>   
> +#include <linux/bitfield.h>
>   #include <linux/bitops.h>
>   #include <linux/errno.h>
>   
> @@ -153,8 +154,8 @@ GCR_ACCESSOR_RO(32, 0x030, rev)
>   #define CM_GCR_REV_MINOR			GENMASK(7, 0)
>   
>   #define CM_ENCODE_REV(major, minor) \
> -		(((major) << __ffs(CM_GCR_REV_MAJOR)) | \
> -		 ((minor) << __ffs(CM_GCR_REV_MINOR)))
> +		(FIELD_PREP(CM_GCR_REV_MAJOR, major) | \
> +		 FIELD_PREP(CM_GCR_REV_MINOR, minor))
>   
>   #define CM_REV_CM2				CM_ENCODE_REV(6, 0)
>   #define CM_REV_CM2_5				CM_ENCODE_REV(7, 0)
> @@ -362,10 +363,10 @@ static inline int mips_cm_revision(void)
>   static inline unsigned int mips_cm_max_vp_width(void)
>   {
>   	extern int smp_num_siblings;
> -	uint32_t cfg;
>   
>   	if (mips_cm_revision() >= CM_REV_CM3)
> -		return read_gcr_sys_config2() & CM_GCR_SYS_CONFIG2_MAXVPW;
> +		return FIELD_GET(CM_GCR_SYS_CONFIG2_MAXVPW,
> +				 read_gcr_sys_config2());
>   
>   	if (mips_cm_present()) {
>   		/*
> @@ -373,8 +374,7 @@ static inline unsigned int mips_cm_max_vp_width(void)
>   		 * number of VP(E)s, and if that ever changes then this will
>   		 * need revisiting.
>   		 */
> -		cfg = read_gcr_cl_config() & CM_GCR_Cx_CONFIG_PVPE;
> -		return (cfg >> __ffs(CM_GCR_Cx_CONFIG_PVPE)) + 1;
> +		return FIELD_GET(CM_GCR_Cx_CONFIG_PVPE, read_gcr_cl_config()) + 1;
>   	}
>   
>   	if (IS_ENABLED(CONFIG_SMP))
> diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
> index 90f1c3df1f0e495e..b4f7d950c84680d3 100644
> --- a/arch/mips/kernel/mips-cm.c
> +++ b/arch/mips/kernel/mips-cm.c
> @@ -221,8 +221,7 @@ static void mips_cm_probe_l2sync(void)
>   	phys_addr_t addr;
>   
>   	/* L2-only sync was introduced with CM major revision 6 */
> -	major_rev = (read_gcr_rev() & CM_GCR_REV_MAJOR) >>
> -		__ffs(CM_GCR_REV_MAJOR);
> +	major_rev = FIELD_GET(CM_GCR_REV_MAJOR, read_gcr_rev());
>   	if (major_rev < 6)
>   		return;
>   
> @@ -306,13 +305,13 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
>   	preempt_disable();
>   
>   	if (cm_rev >= CM_REV_CM3) {
> -		val = core << __ffs(CM3_GCR_Cx_OTHER_CORE);
> -		val |= vp << __ffs(CM3_GCR_Cx_OTHER_VP);
> +		val = FIELD_PREP(CM3_GCR_Cx_OTHER_CORE, core) |
> +		      FIELD_PREP(CM3_GCR_Cx_OTHER_VP, vp);
>   
>   		if (cm_rev >= CM_REV_CM3_5) {
>   			val |= CM_GCR_Cx_OTHER_CLUSTER_EN;
> -			val |= cluster << __ffs(CM_GCR_Cx_OTHER_CLUSTER);
> -			val |= block << __ffs(CM_GCR_Cx_OTHER_BLOCK);
> +			val |= FIELD_PREP(CM_GCR_Cx_OTHER_CLUSTER, cluster);
> +			val |= FIELD_PREP(CM_GCR_Cx_OTHER_BLOCK, block);
>   		} else {
>   			WARN_ON(cluster != 0);
>   			WARN_ON(block != CM_GCR_Cx_OTHER_BLOCK_LOCAL);
> @@ -342,7 +341,7 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
>   		spin_lock_irqsave(&per_cpu(cm_core_lock, curr_core),
>   				  per_cpu(cm_core_lock_flags, curr_core));
>   
> -		val = core << __ffs(CM_GCR_Cx_OTHER_CORENUM);
> +		val = FIELD_PREP(CM_GCR_Cx_OTHER_CORENUM, core);
>   	}
>   
>   	write_gcr_cl_other(val);
> @@ -386,8 +385,8 @@ void mips_cm_error_report(void)
>   	cm_other = read_gcr_error_mult();
>   
>   	if (revision < CM_REV_CM3) { /* CM2 */
> -		cause = cm_error >> __ffs(CM_GCR_ERROR_CAUSE_ERRTYPE);
> -		ocause = cm_other >> __ffs(CM_GCR_ERROR_MULT_ERR2ND);
> +		cause = FIELD_GET(CM_GCR_ERROR_CAUSE_ERRTYPE, cm_error);
> +		ocause = FIELD_GET(CM_GCR_ERROR_MULT_ERR2ND, cm_other);
>   
>   		if (!cause)
>   			return;
> @@ -445,8 +444,8 @@ void mips_cm_error_report(void)
>   		ulong core_id_bits, vp_id_bits, cmd_bits, cmd_group_bits;
>   		ulong cm3_cca_bits, mcp_bits, cm3_tr_bits, sched_bit;
>   
> -		cause = cm_error >> __ffs64(CM3_GCR_ERROR_CAUSE_ERRTYPE);
> -		ocause = cm_other >> __ffs(CM_GCR_ERROR_MULT_ERR2ND);
> +		cause = FIELD_GET(CM3_GCR_ERROR_CAUSE_ERRTYPE, cm_error);
> +		ocause = FIELD_GET(CM_GCR_ERROR_MULT_ERR2ND, cm_other);
>   
>   		if (!cause)
>   			return;
