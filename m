Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07F931398E
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 17:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbhBHQea (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 11:34:30 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:50263 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234472AbhBHQeB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 11:34:01 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 66E82C57;
        Mon,  8 Feb 2021 11:33:12 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Mon, 08 Feb 2021 11:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=n7mEeE03QkrJQx6plBZg3N2RUe67uZA
        xAJrUkBEULTE=; b=pCNIuO2eYLdPoPWTwWLqMJgnevbmVKkyEM66knJsEtvY8yo
        mzN7Eg7o4Y4J1Dmo4yV6APz3Y3aWfBi636O9yNQwcTCUuqzITKw4ZwkqDYAeya2Q
        5dD/ERlASH5j4U+vPRFOKNmMMTWx/lSTcV98OItT4E7gkIiRVEUWKt0Eft8dE40N
        XDM6wJf7eNf8ZWT7a+MG6R6ej0cUHRxCKGncK2LE/F0vFutG1Xp8jZGob0bLpRrv
        VfVXfUEq4I9VoZYc96hJO4ymZQOiefc0Llt95Hvci1xbXss1U6jD/L0Yh9h1gRJ1
        LW9Q486nl40w4oOgXz/JDhFWALqM/jWzPswKEVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=n7mEeE
        03QkrJQx6plBZg3N2RUe67uZAxAJrUkBEULTE=; b=uUsLqvgTgtqYnqGzTWQa1c
        mJbLoV0B/2DtJrMeq2y5/fKXVYr14PCjUkqe+5+hj4Nev3VcV3i1K5QkJ7+DO/Ui
        e8jyL1dxs3C4khUDROC7oNJEU0BCf8zWRLBO+PD64kuPg+rMZ2TvW8j+1JOxu5zg
        qsv4guk2crBginhG0+ApeZk1AXxUGbjNHjgqHws3zf960M49fu/4NBtAqNiiv/nT
        gsGE+jK7IjqIUtbd8SdH4HNhq1qGhZXKYJh+xMa4YpYSlmE7pIfv89HLQQ2CafQ6
        iyxZsaSstPk9+LhETxAzLMYEfR0Ft5ssHF2xdKqsT13k8vdBOCSrwAFyTYoPFHVw
        ==
X-ME-Sender: <xms:xmchYM6Y6HjUHbTRuzTDnwaIytR43ueI86rQO8fGl_yvpbBuh5LSOw>
    <xme:xmchYN4_MD5j0izwse942nndYBmA0q1FxFMTDs1zhZWTGATccAzKp8w8hzSYy7CV8
    epqZwwN6GMLhPlS2Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepgefgfeeujeffhedufeehleejleffjefhjedvtedtvdeftdeg
    ueevjeelleevgfefnecuffhomhgrihhnpehtqdgvshdqthdrhhhupdhgvghnvgigrdhssg
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:xmchYLf99C_TEcgfTEzCZojSBzlx-hdQw93nuXpD1M2pFl8vuoD12w>
    <xmx:xmchYBLd2WJgwxUOKBB5HgwIjqAqZkpkpDAfGG5GRfeGfknI24GGDQ>
    <xmx:xmchYAIRPXhWze1m0d9YKmD0YY2wk7twxoVbvlklbCFOeiCZFXmCtw>
    <xmx:yGchYHV8hN3JiArM_sTApbXmIWuefBc9TwTu695A05zqoT3u5_hV_Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E01B5130005D; Mon,  8 Feb 2021 11:33:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <76dbc72a-32fd-4de3-bc36-3eb0d0eebb44@www.fastmail.com>
In-Reply-To: <1612790085-14436-1-git-send-email-yangtiezhu@loongson.cn>
References: <1612790085-14436-1-git-send-email-yangtiezhu@loongson.cn>
Date:   Tue, 09 Feb 2021 00:32:49 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Tiezhu Yang" <yangtiezhu@loongson.cn>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, "Xuefeng Li" <lixuefeng@loongson.cn>
Subject: =?UTF-8?Q?Re:_[PATCH]_MIPS:_Make_check_condition_for_SDBBP_consistent_wi?=
 =?UTF-8?Q?th_EJTAG_spec?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Mon, Feb 8, 2021, at 9:14 PM, Tiezhu Yang wrote:
> According to MIPS EJTAG Specification [1], a Debug Breakpoint
> exception occurs when an SDBBP instruction is executed, the
> CP0_DEBUG bit DBp indicates that a Debug Breakpoint exception
> occurred, just check bit DBp for SDBBP is more accurate.
> 
> [1] http://www.t-es-t.hu/download/mips/md00047f.pdf
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/kernel/genex.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index bcce32a..6336826 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -349,8 +349,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
>  	MTC0	k0, CP0_DESAVE
>  	mfc0	k0, CP0_DEBUG
>  
> -	sll	k0, k0, 30	# Check for SDBBP.
> -	bgez	k0, ejtag_return
> +	andi	k0, k0, 0x2	# Check for SDBBP.
> +	beqz	k0, ejtag_return

You'd better define a marco for it to prevent further confusion.

Btw I'm curious about how do kernel receive EJTAG exception?
In my understanding there are only two possible EJTAG exception vectors,
0xbfc00480 and DSEG one. Both of them are reachable by kernel.
How do this piece of code work?

Thanks.

- Jiaxun

>  
>  #ifdef CONFIG_SMP
>  1:	PTR_LA	k0, ejtag_debug_buffer_spinlock
> -- 
> 2.1.0
> 
>

-- 
- Jiaxun
