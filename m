Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1C2388FC5
	for <lists+linux-mips@lfdr.de>; Wed, 19 May 2021 16:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346907AbhESOGB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 May 2021 10:06:01 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:44671 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240179AbhESOGA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 May 2021 10:06:00 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 705911AF5;
        Wed, 19 May 2021 10:04:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 19 May 2021 10:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=A
        X1KyNTr3f6ACIFrlzPJ/39X6FbXJDzADF33t6t89Y0=; b=SxapN2vNZH7Iurzl/
        TNXOE3oW+hwphm+73bhGB+lMRLDKRvS1Odip8IX2awCHjw8pBJZ+Y6HsblLoQ2rT
        7on1lhdeVcqGud5pZU8t0SVtCM49v3KW+rFgJOEmsK/mvh8rmilgyVj78xNr2Daz
        V+YL9y3ml5++rKHmA1aXlIVrRZe8dmJa8B7IFVHtGUIy0fwXFSQg6Ujd1wQuqEOz
        KW9xT5CLok9MImr2RBnY+faIVZRPWw96pSCzFD0MMTOqx/zlgSDtDje1LxW4ziH9
        gUAjxx1AgPT2wFw1N3cUHeTegnS6oifz2mfGRDjbp33LFmwB9XosoXOGJO59txAT
        I0WGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=AX1KyNTr3f6ACIFrlzPJ/39X6FbXJDzADF33t6t89
        Y0=; b=mDFcChx21o7hBaZmALBQYqjrHnjsdszJ6hpZWFXM9j+m0uIz2FfRY+sM3
        W3rTppczTSovJcDs+e2+DdD73yv0Ed1pgrmfPR+SN+MY3/nFAc/ocOsFY8gr3rHL
        J2xiwqnyEXMOfp+VqiB53kCBBUkqO8znArm9Euu0fzBAKBC2DiT8dvKNCzxLHm73
        fsqtU9/fyzvrm1Cjt/uOmxKt10EfkbWv46NxJgfmPOFZwD9ZVWx8hwnCNPRwBa1V
        qR3dM0CDh+UEjbrowJCJShJU+pvQbKHOw0o12oqZX9p9SLUh7A5JXSba1HOnbDq0
        p7rM6LxgIQeXWGu9+4bu50KBl/58w==
X-ME-Sender: <xms:9xqlYI1RJ-w1_d4o7ZAYvALsEQzBsjkLODOEQDgAJLvqw99xmDLIcA>
    <xme:9xqlYDGD9Jvl8gvhzDTbuaNZd5X0NdUOy6HXPqSzpDStU-_xf5EO5u04qEG5383aL
    XoB8AaKnspDAlgnGEM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepheettdefjedtudeuud
    evgfejheefieeltdettdduheejkeekleefgeekueegtdeinecuffhomhgrihhnpehinhhs
    ihguvghlihhnuhiguggvvhdrnhgvthenucfkphepfeelrddugeegrdeghedrvdelnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhn
    rdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:9xqlYA46hnsV4D0enYURe7U63lT0XxjTApFN3IBE2RtXJlIPKrru6Q>
    <xmx:9xqlYB24Gh48Y_I4naYzhSB5dDpI_iE3-TMA2PqQktSNh19qk-EErQ>
    <xmx:9xqlYLE2yu93isqBbDg5GSqk6PbnvwoXdpwAJyDSgMsrQHg-Ct1pig>
    <xmx:-BqlYBPKUzSWLvGXfrYd_ZQCu1Fvc63nV_3FoaDumytSMmsZ4NBgbw>
Received: from [192.168.143.245] (unknown [39.144.45.29])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Wed, 19 May 2021 10:04:37 -0400 (EDT)
Subject: Re: [PATCH] arch/mips/kernel/asm-offsets.c: Make local functions
 static
To:     zhaoxiao <zhaoxiao@uniontech.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
References: <20210519062804.30047-1-zhaoxiao@uniontech.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <8223a6cd-ff3b-d105-0a95-30d5a4d1194e@flygoat.com>
Date:   Wed, 19 May 2021 22:04:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519062804.30047-1-zhaoxiao@uniontech.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/5/19 14:28, zhaoxiao Ð´µÀ:
> Fixes the following W=1 kernel build warning(s):
> arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
>   void output_ptreg_defines(void)
>        ^~~~~~~~~~~~~~~~~~~~
> arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
>   void output_task_defines(void)
>        ^~~~~~~~~~~~~~~~~~~
> arch/mips/kernel/asm-offsets.c:93:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
>   void output_thread_info_defines(void)
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/mips/kernel/asm-offsets.c:109:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
>   void output_thread_defines(void)
>        ^~~~~~~~~~~~~~~~~~~~~
> arch/mips/kernel/asm-offsets.c:137:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
>   void output_thread_fpu_defines(void)
>        ^~~~~~~~~~~~~~~~~~~~~~~~~
> arch/mips/kernel/asm-offsets.c:180:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
>   void output_mm_defines(void)
>        ^~~~~~~~~~~~~~~~~
> arch/mips/kernel/asm-offsets.c:241:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
>   void output_sc_defines(void)
>        ^~~~~~~~~~~~~~~~~
> arch/mips/kernel/asm-offsets.c:254:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
>   void output_signal_defined(void)
>        ^~~~~~~~~~~~~~~~~~~~~
> arch/mips/kernel/asm-offsets.c:347:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
>   void output_kvm_defines(void)

The same... they're supposed to be used by asm-offset generator.
If you don't understand how it works there is an article[1] in Chinese.

You may try __used attribute to bypass these warning.

Thanks.

[1]: https://insidelinuxdev.net/article/a030fi.html

- Jiaxun
>
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
> ---
>   arch/mips/kernel/asm-offsets.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.c
> index 5735b2cd6f2a..2dc1ecb12c00 100644
> --- a/arch/mips/kernel/asm-offsets.c
> +++ b/arch/mips/kernel/asm-offsets.c
> @@ -23,7 +23,7 @@
>   
>   #include <linux/kvm_host.h>
>   
> -void output_ptreg_defines(void)
> +static void output_ptreg_defines(void)
>   {
>   	COMMENT("MIPS pt_regs offsets.");
>   	OFFSET(PT_R0, pt_regs, regs[0]);
> @@ -75,7 +75,7 @@ void output_ptreg_defines(void)
>   	BLANK();
>   }
>   
> -void output_task_defines(void)
> +static void output_task_defines(void)
>   {
>   	COMMENT("MIPS task_struct offsets.");
>   	OFFSET(TASK_STATE, task_struct, state);
> @@ -90,7 +90,7 @@ void output_task_defines(void)
>   	BLANK();
>   }
>   
> -void output_thread_info_defines(void)
> +static void output_thread_info_defines(void)
>   {
>   	COMMENT("MIPS thread_info offsets.");
>   	OFFSET(TI_TASK, thread_info, task);
> @@ -106,7 +106,7 @@ void output_thread_info_defines(void)
>   	BLANK();
>   }
>   
> -void output_thread_defines(void)
> +static void output_thread_defines(void)
>   {
>   	COMMENT("MIPS specific thread_struct offsets.");
>   	OFFSET(THREAD_REG16, task_struct, thread.reg16);
> @@ -134,7 +134,7 @@ void output_thread_defines(void)
>   }
>   
>   #ifdef CONFIG_MIPS_FP_SUPPORT
> -void output_thread_fpu_defines(void)
> +static void output_thread_fpu_defines(void)
>   {
>   	OFFSET(THREAD_FPU, task_struct, thread.fpu);
>   
> @@ -177,7 +177,7 @@ void output_thread_fpu_defines(void)
>   }
>   #endif
>   
> -void output_mm_defines(void)
> +static void output_mm_defines(void)
>   {
>   	COMMENT("Size of struct page");
>   	DEFINE(STRUCT_PAGE_SIZE, sizeof(struct page));
> @@ -216,7 +216,7 @@ void output_mm_defines(void)
>   }
>   
>   #ifdef CONFIG_32BIT
> -void output_sc_defines(void)
> +static void output_sc_defines(void)
>   {
>   	COMMENT("Linux sigcontext offsets.");
>   	OFFSET(SC_REGS, sigcontext, sc_regs);
> @@ -238,7 +238,7 @@ void output_sc_defines(void)
>   #endif
>   
>   #ifdef CONFIG_64BIT
> -void output_sc_defines(void)
> +static void output_sc_defines(void)
>   {
>   	COMMENT("Linux sigcontext offsets.");
>   	OFFSET(SC_REGS, sigcontext, sc_regs);
> @@ -251,7 +251,7 @@ void output_sc_defines(void)
>   }
>   #endif
>   
> -void output_signal_defined(void)
> +static void output_signal_defined(void)
>   {
>   	COMMENT("Linux signal numbers.");
>   	DEFINE(_SIGHUP, SIGHUP);
> @@ -344,7 +344,7 @@ void output_pm_defines(void)
>   #endif
>   
>   #ifdef CONFIG_MIPS_FP_SUPPORT
> -void output_kvm_defines(void)
> +static void output_kvm_defines(void)
>   {
>   	COMMENT(" KVM/MIPS Specific offsets. ");
>   

