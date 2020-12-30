Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6AE2E75DD
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 04:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgL3Dqs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 22:46:48 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:47153 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726214AbgL3Dqs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 22:46:48 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 3C0CD98B;
        Tue, 29 Dec 2020 22:45:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 29 Dec 2020 22:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=H
        BNJAq+tsBj88yciaUpvTE8FaHVwT5JdQMmhYZaI2Ok=; b=j8c6PVuygYI+MSs58
        D9i9i+UgQCRAiEJpnRiWVR5+n0Wi/GF0LycUUZceI5INJm7foDfK4p+JdCz8rtlv
        T5QG3WPeO2Ap0OZ3GpfXB8oLq/UUp0QzL5fuU0hiD+yPY5slE+bzkWAuthskxa+0
        FZfxemk4SmWGr6s3MGnKacLQ4K7weVJKgDBYOPMxkGjwV3Rp2mTE6J7SIXzZYKLj
        9NqzK+6QJpVOx0+8c3QiGkpo9zC4C4nVcVuD9I5LR9CpTYFql66qKUf0ooYT2wo+
        6PINyBCmJ/UN+YR1skddLE9H0OwvrhXhbd8SxlUezdo2/vn8+IniEV2YvvPVi85O
        5DVUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=HBNJAq+tsBj88yciaUpvTE8FaHVwT5JdQMmhYZaI2
        Ok=; b=YkdlIY/oMHlztjDca8654GiMH3/0819EjQkZwfpJBHizuh/HVASlMovHg
        Le206PpsXPng9v38GX1bwvfjxO3KVWqeOoJcCvhcPivzf4xFFQ3qapGfa4dWNVrM
        HcZYZBGWaVE+hahUJm5dfLwCDPISa2I6hiWLfxwt/cwErhKhQheQfUnn+f57iQFe
        wBHGXclhJf7gGPFi+BFQVmTjoS/r6tgGeJhbfdHn2NYbeTc8bfXm3PQpYlJ2oTsj
        9JAc1fgQoM4NV7ZtIw+8OS2iVMo49GvHG3eMLKiYMmqBKNy3J2ED6vZeCIjzfD/S
        WfYdbsogzJPK436eR/3Rwl0XAJ1Hw==
X-ME-Sender: <xms:5PfrX8oDSolNPN6_gxMcIlz2CQc6Dwc49u2t4kxXsbjer8QGHHlsOA>
    <xme:5PfrXyo1GealQDKQxOnD-FNRrAaeWu_GhOyj6F4LunHvK_p1PTt6zz_qVbhWhdERP
    ttUzzr81AIRk5_nHdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvvddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejueekkedvveduvdevieduveefteelveeihfejteetffejheej
    jeetffevtedtieenucffohhmrghinhephhgvrggurdhssgenucfkphepgeehrdeffedrhe
    dtrddvheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:5PfrXxO3lwQBBOOjscrYv7a3ij02MKR7ZDdE-7tphR0B-0BDI7oMWg>
    <xmx:5PfrXz5xe8fPEU_Bv4utsbI7EHTtSGbzZs1j4Dig4BpYihG2pOt2GQ>
    <xmx:5PfrX76vuDzpbOIptK-aYCAeNS6aeOzyDor17oHTbd5w6jw-DDcwTQ>
    <xmx:5ffrX4iDTz2L8C_X6pkanBe-AeSX_hpAJsmnERhbCgockaLx9tBegqfasKk>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 258801080057;
        Tue, 29 Dec 2020 22:45:38 -0500 (EST)
Subject: Re: [PATCH v2] MIPS: zboot: head.S clean up
To:     linux-mips@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
References: <20201230030819.4510-1-jiaxun.yang@flygoat.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <056b674a-ebbd-ca69-2715-425cc282c505@flygoat.com>
Date:   Wed, 30 Dec 2020 11:45:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201230030819.4510-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2020/12/30 ÉÏÎç11:08, Jiaxun Yang Ð´µÀ:
> .cprestore is removed as we don't expect Position Independent
> zboot ELF.
>
> .noreorder is also removed and rest instructions are massaged
> to improve readability.
>
> t9 register is used for indirect jump as MIPS ABI requirement.
>
> start label is removed as it already defined in LEAF.
>
> Reported-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> --
> v2: Remove start label (paul)
> ---
>   arch/mips/boot/compressed/head.S | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
> index 409cb483a9ff..977218c90bc8 100644
> --- a/arch/mips/boot/compressed/head.S
> +++ b/arch/mips/boot/compressed/head.S
> @@ -15,8 +15,6 @@
>   #include <asm/asm.h>
>   #include <asm/regdef.h>
>   
> -	.set noreorder
> -	.cprestore
>   	LEAF(start)
>   start:

Oops, it's still here, sorry for the noise.

Thanks

- Jiaxun

>   	/* Save boot rom start args */
> @@ -35,21 +33,20 @@ start:
>   	PTR_LA	a0, (.heap)	     /* heap address */
>   	PTR_LA	sp, (.stack + 8192)  /* stack address */
>   
> -	PTR_LA	ra, 2f
> -	PTR_LA	k0, decompress_kernel
> -	jr	k0
> -	 nop
> +	PTR_LA	t9, decompress_kernel
> +	jalr	t9
> +
>   2:
>   	move	a0, s0
>   	move	a1, s1
>   	move	a2, s2
>   	move	a3, s3
> -	PTR_LI	k0, KERNEL_ENTRY
> -	jr	k0
> -	 nop
> +	PTR_LI	t9, KERNEL_ENTRY
> +	jalr	t9
> +
>   3:
>   	b	3b
> -	 nop
> +
>   	END(start)
>   
>   	.comm .heap,BOOT_HEAP_SIZE,4

