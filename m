Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E2930A0C4
	for <lists+linux-mips@lfdr.de>; Mon,  1 Feb 2021 05:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbhBAEEe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 Jan 2021 23:04:34 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35843 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229842AbhBAEEc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 31 Jan 2021 23:04:32 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 20817580608;
        Sun, 31 Jan 2021 23:03:26 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Sun, 31 Jan 2021 23:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=NP922+DrKH5LsrMYixnQVE+OBJnLRS4
        kBZPDiSGvveA=; b=Ees2pNM45VhNhsZveiICda0y9Tfw4mlEADARwdl6qF8HS8X
        oS8/rB+Jm0T3uHVYyl9w0PrilgIYtImWP7xnaccT8106sHNUu1cEQjc0xVae9/lI
        JdCLQd7H3Sfs2K5ebSwNlOsKAINv4kC4O/6TQEZr5lfUuZTayyYgInR8ySQtEpzE
        ky5DEm8rBagOCm68pIx23cc9xxmvV9KifK//dzWC/uCXSzJhcUprvh50LuTlLpeU
        N1EBwLqXQulMpfybhri5HAz2SjTVBwc2HEsw2xIakzMPLzBLPg7F1soZjrqW55qQ
        MVJUETzmZ7JzYLVvZZlPfZg7Y+idcYkTDBio8tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NP922+
        DrKH5LsrMYixnQVE+OBJnLRS4kBZPDiSGvveA=; b=aTvLn6jg3ILOpF8hsCcHaH
        vhtcHmaOy9qB6lcq8LQtkUfhtM+UjtyvKi3xsaBvFdBlZvIg2sg1qvmaBzZ8IhJJ
        7OzhfgqQxXerL34zO2sEYX80rpWwKeaL7XfgkuFiAnQCdDwT07CrMkxAZ7qfZgPU
        OLBi5vYxDEHo95BfF+4iApfCiksyEefMQrlkzg8mn/MhygXbbHIn/IVME5gq7kUx
        wV+IwhJOzGvaPW0yeAlq7XT/JZ4IRjl3ka0+kWddxPeQpAkPKn9yGyKEARL3e/2O
        zRYfI0VQkLLQNGJpDgXiAGP/b4XSEQErVI60sv+nxdQB2dXKPVR2QXpcVDEUNpWA
        ==
X-ME-Sender: <xms:i30XYO4t-tqk6D25hf1Z1PwWGIKeZGEOzq0H75CCbyHL-e6O23ceYA>
    <xme:i30XYH5-JwWmVvnBXd-0LFiE6-WzXlqIW-1OB22BGjm3S1rNUKuF_Xug7WpnMJq9i
    D3DpAkygVpg-tDvs68>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnheptefhkefggeeiheetvdefkedugfevhfdtvdektdelffdukeff
    tdfhheegueejgfeunecuffhomhgrihhnpehmtghouhhnthdrshgsnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:i30XYNdn_oTnknI936e0DTuP_Vab-Ai6TLfVt3X9JJHGcMtBvkTFoA>
    <xmx:i30XYLLMtKKHWTfsqCE0rZA5nuL5lVRx1jftbaLzuyRMHNT7K1vF0A>
    <xmx:i30XYCLYPgMSD_-92fy-jEjOd8uCxJ0UBW7KjPATdmcEsyzWLHqoMw>
    <xmx:jX0XYK_qJkl81DrpIe6GiugfAqtmg8vJBXdIs1Pxxwi9bd1si4a4qw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BFDA7130005D; Sun, 31 Jan 2021 23:03:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <83e49b6e-9c9d-407e-8ac1-f3fad63df915@www.fastmail.com>
In-Reply-To: <d9548ffc-9d91-baf6-107a-af1b174db29b@loongson.cn>
References: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
 <b1a5eae4-2032-4ace-aa48-a21893e47528@www.fastmail.com>
 <d9548ffc-9d91-baf6-107a-af1b174db29b@loongson.cn>
Date:   Mon, 01 Feb 2021 12:03:02 +0800
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



On Mon, Feb 1, 2021, at 9:12 AM, Jinyang He wrote:
> On 01/31/2021 06:38 PM, Jiaxun Yang wrote:
> 
> >
> > On Sun, Jan 31, 2021, at 4:14 PM, Jinyang He wrote:
> >> CONFIG_64BIT is confusing. N32 also pass parameters by a0~a7.
> > Do we have NEW kernel build?
> > CONFIG_64BIT assumed N64 as kernel ABI.
> >
> >
> > -Jiaxun
> Hi, Jiaxun,
> 
> Thank you for your reply, and now I know. Before that, I saw the macro
> from arch/mips/include/asm/regdef.h and thought it needed to be modified
> here. But that seems have no sence.
> Please ignore this patch.

I guess that's for uapi consideration.

Thanks.


- Jiaxun



> 
> Thanks,
> Jinyang
> 
> >> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> >> ---
> >>   arch/mips/kernel/mcount.S | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
> >> index cff52b2..808257a 100644
> >> --- a/arch/mips/kernel/mcount.S
> >> +++ b/arch/mips/kernel/mcount.S
> >> @@ -27,7 +27,7 @@
> >>   	PTR_S	a1, PT_R5(sp)
> >>   	PTR_S	a2, PT_R6(sp)
> >>   	PTR_S	a3, PT_R7(sp)
> >> -#ifdef CONFIG_64BIT
> >> +#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
> >>   	PTR_S	a4, PT_R8(sp)
> >>   	PTR_S	a5, PT_R9(sp)
> >>   	PTR_S	a6, PT_R10(sp)
> >> @@ -42,7 +42,7 @@
> >>   	PTR_L	a1, PT_R5(sp)
> >>   	PTR_L	a2, PT_R6(sp)
> >>   	PTR_L	a3, PT_R7(sp)
> >> -#ifdef CONFIG_64BIT
> >> +#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
> >>   	PTR_L	a4, PT_R8(sp)
> >>   	PTR_L	a5, PT_R9(sp)
> >>   	PTR_L	a6, PT_R10(sp)
> >> -- 
> >> 2.1.0
> >>
> >>
> 
>

-- 
- Jiaxun
