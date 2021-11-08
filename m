Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1952449B70
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 19:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234944AbhKHSLd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Nov 2021 13:11:33 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41105 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234936AbhKHSLa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Nov 2021 13:11:30 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 5DE8B5C01A9;
        Mon,  8 Nov 2021 13:08:44 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute5.internal (MEProxy); Mon, 08 Nov 2021 13:08:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=cVK9r
        n0NXklEu8aUhPMPKLcgBsQr2U1/Wf7WRhNcyzg=; b=mSc7MJcaojZSDJML65ue1
        qc7zU6S6mx9joJOGyqGyLJlWrYLepqsn7kyvg/nUEQvqKVLR43hDTx3WIsR1aANL
        tEGeh8+oJDdhxKJgfLXYCg2lG5jFBEm0EQLZwgQ2nboAtYvIlFDB71hHgF5bZecV
        d0K0pTG3rWqT7LF72JrCyjvHECA6pKrWlVzlgZjg4hvBtgdNzKf670rbmtowQF5k
        h6XyfhiH2ePRv9kBOSX2dlfYTyWzLaXl61yyD2uyhykP0YMAjzH+zSXgjEcc9zUA
        EZUW5r7sX9d2IHu/wuQukYVyAn3n+t+AlEWuL3liNRTbT0otjwm6WDR8v1o2pVBe
        Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=cVK9rn0NXklEu8aUhPMPKLcgBsQr2U1/Wf7WRhNcy
        zg=; b=nf0ofWO8g1aSKj/MCTguNg2huyoj1IuTvos9SDX49Vw6b2gaT3JxbHbUy
        JUFR64GGG9IIasiIJ6D7y3b4Bg4/AXBcc+lPAK2+xquRxuFPTSP78Bjd65jGasYs
        dC8Mga9ict1VThcqrwP3cdXMpsTm2MQUYLUmVr2kaNdsN5Cq91Bts8f2wqZF/9AN
        uhK38u2UVwKrl0gygCN/Ca3BnjwlndreaHYewB8JNnyfcf4aqSDyoSlQa/4fcH1T
        WOfiU9+/cZ1ed0d1V7yutfNvgobTPdq6Gh8wXBXrQMoNbfw03qyhx8MS38PArJNn
        R/zHMeBuABPg0qyhJEBPOrCxc/2cA==
X-ME-Sender: <xms:q2eJYbfgNdrLas9wG-zURB5vLs88wSfifCTyL1YSkOvYwKoPAvKTIQ>
    <xme:q2eJYRM0f3MUWa7icObEBS46bFWEAhi9SjFOCQwx0Xg0GXadGmOWAUzFbLlLqJ0gf
    OcYpjMZujfI0dDhH00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddvgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
    feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:q2eJYUiW1uiaD8ObK8s7jZ1vcl87AqFEEAMVLT-yTqCdrkJiFfkA2g>
    <xmx:q2eJYc8Ypi1X99F2pkCX58jfsMpCRdvCpRevrJxZjG5c6IkbGt6zMg>
    <xmx:q2eJYXtOGkf_GcwTt_OTij0z4L0THHLDyqM_aDN7ZIx_JDteCkXlqg>
    <xmx:rGeJYQ6QtPqX-tcgsg55ZcNLgEkOXSh1rd-ZiCG1I7378IkW0-CZlg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 38B06FA0AA6; Mon,  8 Nov 2021 13:08:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <3318eca2-1e08-4465-b0d4-0860423e8542@www.fastmail.com>
In-Reply-To: <2JZ82R.JILSE46R0P2T1@crapouillou.net>
References: <20211105135232.2128420-1-yunqiang.su@cipunited.com>
 <2JZ82R.JILSE46R0P2T1@crapouillou.net>
Date:   Mon, 08 Nov 2021 18:08:21 +0000
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Paul Cercueil" <paul@crapouillou.net>,
        "YunQiang Su" <yunqiang.su@cipunited.com>
Cc:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        zhouyanjie@wanyeetech.com,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [RFC] MIPS: fix generic zboot support
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E5=9C=A82021=E5=B9=B411=E6=9C=888=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88 =E4=
=B8=8A=E5=8D=889:54=EF=BC=8CPaul Cercueil=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>
> Le ven., nov. 5 2021 at 09:52:32 -0400, YunQiang Su=20
> <yunqiang.su@cipunited.com> a =C3=A9crit :
>> There are 2 problems here:
>> 1. setting zload-y to 0xffffffff81000000 breaks booting on qemu -M=20
>> boston.
>>    Why it is set here? Any other platform needs this value?
>
> Is there another place where it should be set?
>
> With this patch applied, kernels won't boot anymore on Ingenic boards.
>
>> 2. vmlinux.gz.itb should be appended to all-$(CONFIG_MIPS_GENERIC)=20
>> instead
>>    of replacing. Otherwise, no vmlinuz will be built.
>
> I build vmlinuz all the time, and never needed this patch.

It's because we doesn't use itb on ingenic ;-)

Thanks
- Jiaxun

>
> Cheers,
> -Paul
>
>> ---
>>  arch/mips/generic/Platform | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
>> index e1abc113b409..0c03623f3897 100644
>> --- a/arch/mips/generic/Platform
>> +++ b/arch/mips/generic/Platform
>> @@ -13,8 +13,7 @@ cflags-$(CONFIG_MACH_INGENIC_SOC)	+=3D=20
>> -I$(srctree)/arch/mips/include/asm/mach-ing
>>  cflags-$(CONFIG_MIPS_GENERIC)	+=3D=20
>> -I$(srctree)/arch/mips/include/asm/mach-generic
>>=20
>>  load-$(CONFIG_MIPS_GENERIC)	+=3D 0xffffffff80100000
>> -zload-$(CONFIG_MIPS_GENERIC)	+=3D 0xffffffff81000000
>> -all-$(CONFIG_MIPS_GENERIC)	:=3D vmlinux.gz.itb
>> +all-$(CONFIG_MIPS_GENERIC)	+=3D vmlinux.gz.itb
>>=20
>>  its-y					:=3D vmlinux.its.S
>>  its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+=3D board-boston.its.S
>> --
>> 2.30.2
>>

--=20
- Jiaxun
