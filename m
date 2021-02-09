Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410E931468D
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 03:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhBICiF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 21:38:05 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52223 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229733AbhBIChm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 21:37:42 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id BBDFB5C01DE;
        Mon,  8 Feb 2021 21:36:34 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Mon, 08 Feb 2021 21:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=Imuik1TGE9YdIuXmmENtdnG1NGZ0AhG
        fwRsqBCCiPHg=; b=msUmLiiJyeh3xS3YzYg3EhX3fUjCTmir5PgppkgLdVZNDo4
        isMmSYOmg9CHTmWMkPLbZBBaT7vIRe4s+J1ePv0rJY1IdiUh/+E8H/s2AsZDioFG
        hWYxjOu5qrcHKd1mbXhPOCTfPjNxHzxfrz2U9D9bXZczMIosYfGVCpRx8ceEMkMO
        e0XGWPdRLCQ9Ql3ofw90EYLlfPhiA+EXJE1Rc0JljE1zWgfu44+kdPsES1pXu9Vj
        AW5zpb8gZyN6W0+KDdjCBPwBCJRCdlKoo1Z2otIUhjZ0fKtltpDwUPIgyltRiCdX
        hqUqsI9Jx3byS9Lcg7ntGqoO+Pab84ujLdStuuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Imuik1
        TGE9YdIuXmmENtdnG1NGZ0AhGfwRsqBCCiPHg=; b=tL+7XajZUzjlwcyuBGEuY4
        a6gwxG9Va3eNM7BKGhluZX3C1fZy1QIQDvuz7ZcfuWzfKQG7TM2FMHIzbBsjXIoM
        mE+B/dakS3lrOwszmsBU7Mvvd6h3Zw7B9QQuTmgOJAa7fuUdck6vPAHsiiHXXvvG
        ARv+0qmuWa7IesKLnf0Rx/ZZZXLvCZPViQKIC7p7hlNM14nQkki1FPo35onbl4V0
        0e90tsUqYGTxmMd59hao1c0ef9isbUVxy109UG5NrhXKJZW7xPYyi6s/NcS+c28e
        wF5uUTm66pHlS9qPU5Zc9CmQOdp2NFU54xBQ3+bQ/pEQ/X9nGenXgA3chU7UUn2A
        ==
X-ME-Sender: <xms:MfUhYBMdVpBGqBYwzD2ke1jPhib06xQJXSeC4KbAJBDRsJ01sYZjDw>
    <xme:MfUhYD-PQ2JnJA0_DZdI3nHn8dMaDpdiKyX5ut6XXBFVWk2uNhm2JdRSA3JMjSFuw
    XpI223VIUWwhBFUHdc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepgefgfeeujeffhedufeehleejleffjefhjedvtedtvdeftdeg
    ueevjeelleevgfefnecuffhomhgrihhnpehtqdgvshdqthdrhhhupdhgvghnvgigrdhssg
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:MfUhYATw6jBGGJ9W5WK5hsht-aXP2c3mk2Zpp5MfkcexuNBj4IaEng>
    <xmx:MfUhYNs1P-h_zAoJ7OMQ5KUdNXTDaVqHkLk8EvpJaLoes2TkgS2W9w>
    <xmx:MfUhYJd0dHmlZr_hCEbuFZXyVrzcME856IYFfraCEb2ulFYIdRM34Q>
    <xmx:MvUhYKrdClz1ydrTJa46y97VxjGueb3oPrcWKOWBLeA61r__oD8vAA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4EC2D130005D; Mon,  8 Feb 2021 21:36:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <d2df38f5-0894-44b3-a88c-fe9a7e595284@www.fastmail.com>
In-Reply-To: <76dbc72a-32fd-4de3-bc36-3eb0d0eebb44@www.fastmail.com>
References: <1612790085-14436-1-git-send-email-yangtiezhu@loongson.cn>
 <76dbc72a-32fd-4de3-bc36-3eb0d0eebb44@www.fastmail.com>
Date:   Tue, 09 Feb 2021 10:36:11 +0800
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



On Tue, Feb 9, 2021, at 12:32 AM, Jiaxun Yang wrote:
> 
> 
> On Mon, Feb 8, 2021, at 9:14 PM, Tiezhu Yang wrote:
> > According to MIPS EJTAG Specification [1], a Debug Breakpoint
> > exception occurs when an SDBBP instruction is executed, the
> > CP0_DEBUG bit DBp indicates that a Debug Breakpoint exception
> > occurred, just check bit DBp for SDBBP is more accurate.
> > 
> > [1] http://www.t-es-t.hu/download/mips/md00047f.pdf
> > 
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >  arch/mips/kernel/genex.S | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > index bcce32a..6336826 100644
> > --- a/arch/mips/kernel/genex.S
> > +++ b/arch/mips/kernel/genex.S
> > @@ -349,8 +349,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
> >  	MTC0	k0, CP0_DESAVE
> >  	mfc0	k0, CP0_DEBUG
> >  
> > -	sll	k0, k0, 30	# Check for SDBBP.
> > -	bgez	k0, ejtag_return
> > +	andi	k0, k0, 0x2	# Check for SDBBP.
> > +	beqz	k0, ejtag_return
> 
> You'd better define a marco for it to prevent further confusion.
> 
> Btw I'm curious about how do kernel receive EJTAG exception?
> In my understanding there are only two possible EJTAG exception vectors,
> 0xbfc00480 and DSEG one. Both of them are reachable by kernel.
^ not

> How do this piece of code work?
> 
> Thanks.
> 
> - Jiaxun
> 
> >  
> >  #ifdef CONFIG_SMP
> >  1:	PTR_LA	k0, ejtag_debug_buffer_spinlock
> > -- 
> > 2.1.0
> > 
> >
> 
> -- 
> - Jiaxun
>

-- 
- Jiaxun
