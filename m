Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992F644655D
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbhKEPDr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:03:47 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:59699 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233343AbhKEPDq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:03:46 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 674B55C00D7;
        Fri,  5 Nov 2021 11:01:06 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute5.internal (MEProxy); Fri, 05 Nov 2021 11:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=ehL1g
        zFbBjq4Q2vBSFeRR/LxySahDQvmoLp6hP4TUZg=; b=FsNXY3grYTVN75hP0mFRi
        i428F1279b+PKB0Tzi82/awVFnRB3yN9fWMVkykqVZgl3iqm5BnX9KeCshZHjswc
        3ktkB2VN8YyFUdT3oI5FsFrURelN+b1HWRGWpHZFvvRY1cyjVtxSxaMAc9VHpNBW
        ToLaeLDIRr2UyyEQTEJaGilp4uYILfzNkmpyv5PLMdaDgT2KoeKbkp769T3BaaQO
        DDIo8oUvZDzNr9jwSnsDUeAhPFN7jyjsxoxIOS5TjnaVVYaOTsz3LOSJb1kBFLZd
        xgUOFoNa5bhQji/aVad+kMjVsjw/UzOiGM19eeQsUbu8v3vmAP5gyapWAc/JHaq6
        w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=ehL1gzFbBjq4Q2vBSFeRR/LxySahDQvmoLp6hP4TU
        Zg=; b=O7NTr6m1xEeRu6MMzdDRUvZYbbA0knfcgHjHPGOdg6XmI8AQFQtxVdJ4m
        BPrMfS2xrgbIOCaBbe3I70+9YebWfw+nXjXI/kGIeeVVWgTiGy4Gxq3BMAJddANh
        qeidOphOTEYkvC93wwBcs8pHGrAjthSgEow0aDQhhpjkFGIoOFzfA5nCDPc8OUZ1
        9clS/QxZZAay+9KqAg+yLXypfVVY73aVeXx+hWwkjXCXScu6k1FaVacN3s1UHg9H
        a/uMzuNjePgtslKHq0yrasKdSuqPFNVogrHAmdJLI6xCdnPMLCJbN7jSc8nO3w9Z
        gopI/dTMJuOHrj2bJyfn/kNncvu5Q==
X-ME-Sender: <xms:MEeFYQ2he_W6wq7peS95G8cnYaK_-fbrzy3kUZjtICK2rcSFcwMGog>
    <xme:MEeFYbFcR55Z0v6ZdgG5aKpLNLg85J6LUz8m2qgDtXtdktBfgGYnTBowS6keYrKII
    WcadUzQVMe_1pA9v9c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeefteegkeevfeethffgudehgedvueduvdeifedvvdelhfef
    heekteefueektdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:MEeFYY7VNWo_ICzrBO9357diUg1dp3uyrmrvFXsTE5UFqA_qchsV6g>
    <xmx:MEeFYZ3tlN5uKMA7n1bW-KxdZFeTNYx19fP11MtLDYjfKHhumwcPJQ>
    <xmx:MEeFYTH-4wG6E4CGFESrUl4wLIQbVDVvF7hmPM_rre6hUv6yGI3ZYw>
    <xmx:MkeFYYRAJMJvRcBKfeATF-0lI1lTwGE8DIUwRXKhgaZBdJ9ZY6tZVw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 92491FA0AA6; Fri,  5 Nov 2021 11:01:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <fa79ed7c-2587-4829-a35d-f6fbb28046ab@www.fastmail.com>
In-Reply-To: <20211105135232.2128420-1-yunqiang.su@cipunited.com>
References: <20211105135232.2128420-1-yunqiang.su@cipunited.com>
Date:   Fri, 05 Nov 2021 15:00:43 +0000
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "YunQiang Su" <yunqiang.su@cipunited.com>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc:     "Paul Cercueil" <paul@crapouillou.net>, zhouyanjie@wanyeetech.com,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [RFC] MIPS: fix generic zboot support
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E5=9C=A82021=E5=B9=B411=E6=9C=885=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88 =E4=
=B8=8B=E5=8D=881:52=EF=BC=8CYunQiang Su=E5=86=99=E9=81=93=EF=BC=9A
> There are 2 problems here:
> 1. setting zload-y to 0xffffffff81000000 breaks booting on qemu -M bos=
ton.
>    Why it is set here? Any other platform needs this value?

Actually we have arch/mips/boot/compressed/calc_vmlinuz_load_addr.c to c=
alculate zload address.
It will append zloader after the vmlinux so I'm not sure why we have to =
specify a address here.
Especially for generic kernel.

> 2. vmlinux.gz.itb should be appended to all-$(CONFIG_MIPS_GENERIC) ins=
tead
>    of replacing. Otherwise, no vmlinuz will be built.

Ack.

Thanks.

- Jiaxun

> ---
>  arch/mips/generic/Platform | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
> index e1abc113b409..0c03623f3897 100644
> --- a/arch/mips/generic/Platform
> +++ b/arch/mips/generic/Platform
> @@ -13,8 +13,7 @@ cflags-$(CONFIG_MACH_INGENIC_SOC)	+=3D=20
> -I$(srctree)/arch/mips/include/asm/mach-ing
>  cflags-$(CONFIG_MIPS_GENERIC)	+=3D=20
> -I$(srctree)/arch/mips/include/asm/mach-generic
>=20
>  load-$(CONFIG_MIPS_GENERIC)	+=3D 0xffffffff80100000
> -zload-$(CONFIG_MIPS_GENERIC)	+=3D 0xffffffff81000000
> -all-$(CONFIG_MIPS_GENERIC)	:=3D vmlinux.gz.itb
> +all-$(CONFIG_MIPS_GENERIC)	+=3D vmlinux.gz.itb
>=20
>  its-y					:=3D vmlinux.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+=3D board-boston.its.S
> --=20
> 2.30.2

--=20
- Jiaxun
