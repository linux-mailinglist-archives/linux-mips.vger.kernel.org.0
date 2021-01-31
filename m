Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFC9309C87
	for <lists+linux-mips@lfdr.de>; Sun, 31 Jan 2021 15:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhAaOE6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 Jan 2021 09:04:58 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60717 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229786AbhAaKjZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 31 Jan 2021 05:39:25 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 122F8580B2A;
        Sun, 31 Jan 2021 05:38:25 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Sun, 31 Jan 2021 05:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=7otgqLxKMQkk0CVmmkdFrMm2cf/Ti6/
        Ps6yWtPkznNM=; b=PwotKS36u1S1qfn6SiaYTFLPAMqyCTS4X6eVZ70IUoTbqe5
        yoJWlDcrhA6U4GYRD3ovW5V/jR3fmJBo6sCKWYWlUzfjNSHHuwpff371bd0DXENu
        dy6EDqVHAvUyyF336OCeicsLq0Yt43o1pkF3r2XGxeXcihq4Ezph/8BePToVr9rL
        /ggroIkMHUyavMdMXwFxzz9vc6BWc3GfqgVjuxMpqwVV8/OVmToYxp05urRQAqPA
        ZRblVxOaLpWrFJQwu/+PzO03lCP0vwEgYLSFq/23afZ0ydFjzBsx8CwqeIF41Okp
        KJo29EBeGq8Fz8HHgk5cSsH1Vp6Q9QNsagL7aJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7otgqL
        xKMQkk0CVmmkdFrMm2cf/Ti6/Ps6yWtPkznNM=; b=Du5Hg1bVkm4Ygbuk/znFjP
        WSBL8TmLujWjst3kqoJHIsWFDh93QXW2EzG0w4xUPmt30X82yGmj47U/1lD1U6Uu
        EgSsk4abzrHALv1/jiu39BARZMht2yYDV/XtIeMsQnB+IHLWrrNZUU8TZWTPS3v0
        cUkLV2hVm8TNE9y3PF+1qrKGJ4kkOFfnFck2J7VFnJg4gTOpN6k1p7909UCX88pn
        LtigotaDoNZ93XbtAKMqj+fliyiO53uHCoK6v6fv8qlDeRja8bgdK0bbtT//L1jW
        08MysRYDp6qKBKU5gDYJRsiev8LMht4VHiAV6Yf/GqKoXlL9FX39Qvv5Ncp2zmjg
        ==
X-ME-Sender: <xms:n4gWYNeYSRW-gbRQhdRX5omvfM8Iqe58yXh5L84QCWN2tLnQZwOIOw>
    <xme:n4gWYLNZ0c9CcBRfvyOgFNjH6V5NWWUApA08lnXJT-QHpQgqVVlZ39myPOXUANy7I
    MBWAY6u9cctFFwq8KE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeigddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnheptefhkefggeeiheetvdefkedugfevhfdtvdektdelffdukeff
    tdfhheegueejgfeunecuffhomhgrihhnpehmtghouhhnthdrshgsnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:n4gWYGhbHnWlodPU4xEnjBwawrntM6qcIhUYYm1Nb7KwoD_Xt1ccFA>
    <xmx:n4gWYG_Hz9wMsZ854-TPcZ_gNDH4Y_gpAWx8yVx5qO1KfkW4VnY4aA>
    <xmx:n4gWYJtoPQp_zV3T49Uf7mI7wfoBJtWDeq-NR0msjnXOE69VXtWThA>
    <xmx:oIgWYNjhuoetkxfuxpMAHAvW-6uzDJArHEjzAI0ZPxA97LwKdBriTg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 47D38130005D; Sun, 31 Jan 2021 05:38:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <b1a5eae4-2032-4ace-aa48-a21893e47528@www.fastmail.com>
In-Reply-To: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
References: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
Date:   Sun, 31 Jan 2021 18:38:01 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Jinyang He" <hejinyang@loongson.cn>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Steven Rostedt" <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>
Cc:     "Wu Zhangjin" <wuzhangjin@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        "Huacai Chen" <chenhuacai@kernel.org>,
        "Tiezhu Yang" <yangtiezhu@loongson.cn>
Subject: Re: [PATCH 1/3] MIPS: ftrace: Fix N32 save registers
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Sun, Jan 31, 2021, at 4:14 PM, Jinyang He wrote:
> CONFIG_64BIT is confusing. N32 also pass parameters by a0~a7.

Do we have NEW kernel build?
CONFIG_64BIT assumed N64 as kernel ABI.


-Jiaxun

> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/kernel/mcount.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
> index cff52b2..808257a 100644
> --- a/arch/mips/kernel/mcount.S
> +++ b/arch/mips/kernel/mcount.S
> @@ -27,7 +27,7 @@
>  	PTR_S	a1, PT_R5(sp)
>  	PTR_S	a2, PT_R6(sp)
>  	PTR_S	a3, PT_R7(sp)
> -#ifdef CONFIG_64BIT
> +#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
>  	PTR_S	a4, PT_R8(sp)
>  	PTR_S	a5, PT_R9(sp)
>  	PTR_S	a6, PT_R10(sp)
> @@ -42,7 +42,7 @@
>  	PTR_L	a1, PT_R5(sp)
>  	PTR_L	a2, PT_R6(sp)
>  	PTR_L	a3, PT_R7(sp)
> -#ifdef CONFIG_64BIT
> +#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
>  	PTR_L	a4, PT_R8(sp)
>  	PTR_L	a5, PT_R9(sp)
>  	PTR_L	a6, PT_R10(sp)
> -- 
> 2.1.0
> 
>

-- 
- Jiaxun
