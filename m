Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFF1316517
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 12:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhBJLV7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 06:21:59 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41179 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231363AbhBJLTt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 06:19:49 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 9C9405C01A8;
        Wed, 10 Feb 2021 06:18:47 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Wed, 10 Feb 2021 06:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=WCNhaAAaBk9KdSN70j1Xv1565gVpc6V
        x6H+1sDQrl3g=; b=rAekFHw7nm66D/0P2kTycMJo52xReIKj2V0BF4vYDRVVf+G
        JY506sn0c5iZ9Q46VBTcsEeSBGUcFfdOScuww6lSsMDaI38QEMeVjQvglzt/uAnU
        FLmDbp9kFaZ4nbf4qp5wpN/svDFGGJk0NLdyRrr32GtbkTDYVHckYJi1zhy+6FMy
        CLCcZ2tlbP/GHqPqy/PK9A1DB9H086QiPbCue8JqgktXIWH+31jozMLAmVeZ4DEF
        et20cEX+lCRW+n92xgxC5Pm2lF2jsLUZuadz7CB/ZfclQn9ElPmqelHZH9MnQSu6
        RxrV8BZuUcLSAu7HuciPlWUL+aAzBXDpmaCTk2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WCNhaA
        AaBk9KdSN70j1Xv1565gVpc6Vx6H+1sDQrl3g=; b=d6jWdK3d1S/AswISiq/HLS
        nOIJeJwga1VgGPj+1PdoeKRkVywD0XtORFvycKb5G60Dm4dZw/JsiyEDUiIibgk3
        Ou7JRZj7/CoqXx+lQv14Qm9NWISpFBACRGcOyS/WCn4S4smgbGtD/o0XIzZwNwGB
        2/jMFX5kj70IvA5PaM43IGUfUu7cV0+hQrq6l55n9DI800zzQCtGXmolEc6dLHyy
        Ti8IzlqCz9HJzAEsZQQc/33YuJM12GnWaJgGWOtWVq893JIbHTMB3s0q9489UzxL
        REMak7rS0xtTb0HmHb75e//JneEQzkI5Kdu31I/+JvRsPGfsic23m5s5As2/dwNQ
        ==
X-ME-Sender: <xms:F8EjYMLe0_k8WnjZLDlKWiCtOfgvmtMVT5fKI-3APvZOrdjC-Dn5Tg>
    <xme:F8EjYMJAJpic9VUuasUL7djZIXzfrcQk0OmXuCSTDlV6btag3fwk-W6BeqATYX0dT
    YwPGSWYsTLLhG22i1I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepkeelheethfehffdttdelieevfeeiheeuudeifeeugeeuieel
    iedtueejheehhedunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:F8EjYMs2sAwSlo7H4I7PgWyhllXE8DqXv47i6am7-ubPnw21jM2KLg>
    <xmx:F8EjYJYiSYqZS2Ef48J9pSXLrkXtevbfYMi2I1TNpnTJDfQINtsG4A>
    <xmx:F8EjYDZCwsjPrWx6G4oUqWY6OXRwRXhTGYdpJ6utlJnqzEj7dYjTuw>
    <xmx:F8EjYH5_ifj_nRiRHZSC2Yym8MxYDxcmjMHZb4BICJAFQtiXvZGx1Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 61E70130005D; Wed, 10 Feb 2021 06:18:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <37a2d6c2-9a56-429e-addc-3e52dd49abc9@www.fastmail.com>
In-Reply-To: <20210209093224.7085-5-zhangqing@loongson.cn>
References: <20210209093224.7085-1-zhangqing@loongson.cn>
 <20210209093224.7085-5-zhangqing@loongson.cn>
Date:   Wed, 10 Feb 2021 19:18:25 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Qing Zhang" <zhangqing@loongson.cn>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Marc Zyngier" <maz@kernel.org>,
        "Huacai Chen" <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        "Xingxing Su" <suxingxing@loongson.cn>
Subject: Re: [PATCH 4/6] MIPS: Loongson64: Add 2K1000 early_printk_port
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Tue, Feb 9, 2021, at 5:32 PM, Qing Zhang wrote:
> Distinguish between 3A series CPU and 2K1000 CPU UART0.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Signed-off-by: Xingxing Su <suxingxing@loongson.cn>

Personally I don't like this kind of quirk.
Probably we should use earlycon as Arm later.

- Jiaxun

> ---
>  arch/mips/loongson64/init.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index 8bef1ebab72d..a8ad02d8d088 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -120,7 +120,10 @@ void __init prom_init(void)
>  #endif
>  
>  	/* Hardcode to CPU UART 0 */
> -	setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE + 0x1e0), 0, 1024);
> +	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R)
> +		setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE), 0, 1024);
> +	else
> +		setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE + 0x1e0), 0, 1024);
>  
>  	register_smp_ops(&loongson3_smp_ops);
>  	board_nmi_handler_setup = mips_nmi_setup;
> -- 
> 2.20.1
> 
>

-- 
- Jiaxun
