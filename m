Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0346324941
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 04:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbhBYDKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 22:10:54 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:51353 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236990AbhBYDKv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Feb 2021 22:10:51 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 21E49871;
        Wed, 24 Feb 2021 22:10:04 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Wed, 24 Feb 2021 22:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm1; bh=b9MLn
        QeWZM3iFL8vshIAM7UnQzdMiPWckfdA7QRQCnI=; b=Blm+WmHH6+L5a2V1V32fT
        w2BSgdxoj3ShgcVNocMPDTgqqwJDOg/jtSE0nNk4FEoqMx+7xSHwMAPEKMJLxneg
        S8W/5ffdA8+I3RfnxcnHZR0bNFQV8fkpxrwwYxx651wEi2TNqSThUe/sYWRPlyMP
        erUdsP2hIzl7RB9dzbyEP3vFTNhBkEZO06JR4iqaqqap/zn+mYKvAFxAt9Dgza0d
        4EY0LsOnufEp5SGJSSl5JIg2kTPbCpf/tMszMy+3AOTBBKrsP0HhpG7CG7KbDQaA
        nITy6TX7ZJOlPCxopgIbogTHC43M1rT5YRx65kVoomEM0p/cgT1c2ztAVlVMZfJE
        Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=b9MLnQeWZM3iFL8vshIAM7UnQzdMiPWckfdA7QRQC
        nI=; b=DAQSGR4Ej3Hi+oDOVhNFOoBcDhj5Ocf1WbNAk0d2WUQN1iUF0IKMao9TV
        pObbKiNQIoYJCYenOMFgIIPxBHfeaAkdE0s7ep0I01DmjquMexSAHTUejT6nNfWc
        0CY3ncJJo6I6nlOqmj50tYvGQyUI+PSV2cVZR/MbM/ZnVOTG0E6wtBa6buxXClE/
        x2HZXli1Br0fKU0RNfsDaLkP2gOG3oNrlT+yQfuoU9TL6jpzGGDodqmf0JTfxCXh
        lroeHd/JzDTbJn+e8+1rBVAtvn7Shs2nvDMvn72bdrD3jP5RoVZqdrnQzKpHKUqr
        iecmykf8pvdsL04wXc/sBxh6fMKmA==
X-ME-Sender: <xms:ChU3YDMgBFnV00Gpc9BVzohG4o-7hA7lJ7WyOO9oi-KQKI7SUryGZQ>
    <xme:ChU3YN-jqczTz9hM5Uyprd_RK4itxsJKYmdUbK6E6AqH6RftLelalKcsQscXKRf3f
    HFJdnHD7S6mnr-FrWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeefteegkeevfeethffgudehgedvueduvdeifedvvdelhfef
    heekteefueektdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:ChU3YCR4afhTSPmkGEbV2EsUq3_rU320U8jHXNgQXXjHGepB1hHERw>
    <xmx:ChU3YHvr68RJlHxyX6tlPwvwrOsf4YMJeUzkuk4vzDv8QlkckFsjaA>
    <xmx:ChU3YLeJq8kzwGgmFZ-Jn9uyi5VBl0L9uSs3wnp5FbfmLAwn8Q6ZNg>
    <xmx:CxU3YC6urz0kPM5MNrQJwqqwPwAglUN_vTz5CyjvyAHlhSN3TA0oXQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7866C130005D; Wed, 24 Feb 2021 22:10:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <9f1b8ad3-77cc-468c-8f95-28af52616756@www.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2102250344270.1900@angie.orcam.me.uk>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com>
 <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com>
 <db8c2df9-9487-8bfd-e205-3f88854dfa12@flygoat.com>
 <alpine.DEB.2.21.2102250344270.1900@angie.orcam.me.uk>
Date:   Thu, 25 Feb 2021 11:09:39 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     "Jim Wilson" <jimw@sifive.com>,
        "GCC Development" <gcc@gcc.gnu.org>, syq@debian.org,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "Matthew Fortune" <mfortune@gmail.com>,
        Binutils <binutils@sourceware.org>
Subject: Re: HELP: MIPS PC Relative Addressing
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Thu, Feb 25, 2021, at 10:57 AM, Maciej W. Rozycki wrote:
> On Thu, 25 Feb 2021, Jiaxun Yang wrote:
>=20
> > > There is a far easier way to do this, which is to just emit an ass=
embler
> > > macro, and let the assembler generate the labels and relocs.=C2=A0=
 This is what
> > > the RISC-V GCC port does by default.=C2=A0 This prevents some opti=
mizations like
> > > scheduling the two instructions, but enables some other optimizati=
ons like
> > > loop unrolling.=C2=A0 So it is a tossup.=C2=A0 Sometimes we get be=
tter code with the
> > > assembler macro, and sometimes we get better code by emitting the =
auipc and
> > > addi separately.
> >=20
> > Thanks all,
> >=20
> > I'll take this approach first, add "lla, dlla" pseudo-instructions t=
o
> > assembler and seeking optimization
> > in future.
>=20
>  The DLA and LA macros are supposed to do that already, no need to inv=
ent=20
> new names.

Hmm, how could we tell if the symbol is local?
Global symbols still needs to be load from GOT.
I saw RISC-V dealt that by =E2=80=9Clla=E2=80=9D pesudo-op which indicat=
e the symbol is local.

>=20
>  They may not have been implemented for R6, but I'm not sure.  There w=
as=20
> some resistance against macros at one point as the new generation came=
 to=20
> work on the MIPS assembler and consequently inconsistencies resulted i=
n=20
> the language that may not have b"en removed to date.
>=20
>  In any case you need to use `-mno-explicit-relocs' with GCC then so a=
s=20
> not to break the compiler's semantics or assumptions.
>=20
> > Btw I found we don't have any document for MIPS pseudo-instructions.=
 RISC-V
> > put them in ISA manual
> > but it is not the case for MIPS. Is it possible to have one in binut=
ils?
>=20
>  There are MIPS assembly language books available; I'm fairly sure Dom=
inic=20
> Sweetman's "See MIPS Run" has a chapter (I don't have the book at hand=
). =20
> I don't think GNU binutils documentation is supposed to describe the=20=

> assembly dialects supported, except maybe for GNU extensions (pseudo-o=
ps).

Yeah I saw See MIPS Run, but it's not a mandatory specification.
Without a specification we may have different implementation across tool=
chains and trouble users.

Thanks.

- Jiaxun

>=20
>   Maciej
>

--=20
- Jiaxun
