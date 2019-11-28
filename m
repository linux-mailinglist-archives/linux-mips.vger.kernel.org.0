Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76FA610CBEF
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 16:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfK1PmB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 10:42:01 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:22521 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfK1PmB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 10:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574955719;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iVqmKcIKqDE7cc12xioiaKzKybAZ4gt7X6g2RMAjUy8=;
        b=FAsNHKakm8VMmxeUzuBVh2OQw4rP0U2GKuVlZc7e9EsttRK9oDE9HwnABk47iKU0EW
        +wancA/BBkLUmVdjgPedZKPRGzWEE5Jgri0jVhv8xpwxpDXwss1WvrUX/WBS8SuNAXTG
        FARyRfoh0ROVbG/p3MaGTm4L2wHahjlkDzeZyemBxSv6j6O+hrg/7amFqj8WtMqchLwP
        vjy9OaQwk6z+oiL64861RpoZld0okcSL8t3abrGL5hBiFvDlRJ2AolgIquuzj0ffByeo
        bgYmLQowPvgsOqpJbqw3oLvN4C80frGv4blOGBoh4h1FiO+zlxLalXcJ8Fa2k91f+uPB
        GJ5Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43upSE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vASFfwKor
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 16:41:58 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191128150721.GA20142@alpha.franken.de>
Date:   Thu, 28 Nov 2019 16:41:57 +0100
Cc:     Maarten ter Huurne <maarten@treewalker.org>,
        mips-creator-ci20-dev@googlegroups.com,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4F75970F-81DA-4727-8ADC-17CF6D77829B@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com> <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com> <4807842.gtHLO0kk0V@hyperion> <01D75E67-EC2E-4C74-B9BB-752773C481A9@goldelico.com> <20191128150721.GA20142@alpha.franken.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.11.2019 um 16:07 schrieb Thomas Bogendoerfer =
<tsbogend@alpha.franken.de>:
>=20
> On Thu, Nov 28, 2019 at 02:48:46PM +0100, H. Nikolaus Schaller wrote:
>>=20
>> What still does not fit into the picture is the errno =3D 1 i.e. =
EPERM.
>> Maybe I have to study the libc code that tries to read the ELF =
symbols
>> you have mentioned. It may fail for unknown reasons.
>=20
> to understand vdso you might look at arch/mips/vdso and lib/vdso
> kernel sources.

Yes that is what I know, but I do not know how glibc can return an EPERM
through VDSO.

>=20
> And if I understand it correctly you neither have a working high =
resolution
> timer usable bei do_hres() in lib/vdso/gettimeofday.c or a working
> gettimeofday_fallback(), which is enabled via =
CONFIG_MIPS_CLOCK_VSYSCALL
> and needs either CSRC_R4K or CLKSRC_MIPS_GIC.

Well, on kernel v4.19 or using v5.4 with Jessie, gettimeofday() works.

So this may only be part of the reason it starts to fail with commit
24640f233b466051ad3a5d2786d2951e43026c9d.

MIPS_CLOCK_VSYSCALL is neither defined nor undefined in the defconfig.
And removed if I manually add it to my defconfig.
And yes, it depends on either CSRC_R4K || CLKSRC_MIPS_GIC by =
arch/mips/Kconfig.

Maybe this was just forgotten to properly handle for the ci20_defconfig
or jz4780?

What does CSRC_R4K resp. CLKSRC_MIPS_GIC ecactly mean? Does the jz4780 =
have this
feature?

BR and thanks,
Nikolaus

