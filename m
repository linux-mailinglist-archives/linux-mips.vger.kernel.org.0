Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC4810C87A
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 13:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfK1MRM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 07:17:12 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:15783 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfK1MRM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 07:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574943430;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=j2Zi7z7PshzDcW95CJR/hmzUfkNJXaAcZIHrohG8tZM=;
        b=GoxDhbmI6D5113ctTCILcQ+dUylJMyAgX5mAfHdKkL/Tw62aoIHuGiUspDOS6nZyey
        CVFP4JXQmpj3+9ASfeUEKXAznrD4+/HjSr2IiXlHGc6cerzL7Tc4/gD0mas9BAAv9Bdk
        RETJHPjL3B7oOfXmJngRH0ucSb3ek+v/K3NfSldxHXcNEZTpUmRQUqTwX0dETGA9ZM/x
        Fn4PK/HzFFU2Fv65uq0Wr/DloFJar8aWNy6YLP/yp4rlmBdx3pQYxg/5FhvEKHIu7u44
        ncAPFDnoZ1SgXUXwz8s7sHgOGRkEophXbo+lx7CdlUhKuL17ejzoRqYzCBDIsWqHVKgR
        FHSg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43upSE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vASCGvJQg
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 13:16:57 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <96b53936-a288-91bc-a14b-a501c5231a03@arm.com>
Date:   Thu, 28 Nov 2019 13:16:57 +0100
Cc:     linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2966D06E-C754-4807-A48E-02D476EF1A24@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <703DC004-96E8-463D-8870-3CC410FE1C5E@goldelico.com> <3190d1a4-96c4-1843-3ae1-bae3a97af9fb@arm.com> <8D151C34-41A1-4DFE-92D6-D1B27AEC8730@goldelico.com> <3E2EEC19-F320-4320-9A85-67B4E615C74A@goldelico.com> <96b53936-a288-91bc-a14b-a501c5231a03@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.11.2019 um 13:05 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>=20
> Hi Nikolaus,
>=20
> On 27/11/2019 14:29, H. Nikolaus Schaller wrote:
>> Hi Vincenco,
>>=20
> [...]
>=20
>>>=20
>>> a) with 5.4 kernel
>>>=20
>=20
> Could you please report the hash of your top commit?

We have our own config and some compile fixes. But the base
commit is 219d54332a09

>=20
> [...]
>=20
>>=20
>> root@letux:~# ./gettime=20
>> r =3D -1 errno=3D1
>> tv.sec =3D 1
>> tv.usec =3D 1
>> rt =3D 1478193516 errno=3D1
>> t =3D 1478193516
>> root@letux:~#=20
>>=20
>=20
> On arm64 the output of your application is what follows:
>=20
> r =3D 0 errno=3D0
> tv.sec =3D 1574942449
> tv.usec =3D 348684
> rt =3D 1574942449 errno=3D0
> t =3D 1574942449
>=20
> Which seems what it is expected.

Indeed. Well, on all other arm architectures I can test (omap3/4/5, =
imx6, raspi)
it is correct. Only on mips jz4780 I see this.

>=20
> On a previous email you mentioned what follows:
>=20
> root@letux:~# cat /proc/cpuinfo
> system type             : JZ4780
> machine                 : img,ci20
> processor               : 0
> cpu model               : Ingenic JZRISC V4.15  FPU V0.0
> BogoMIPS                : 1196.85
> wait instruction        : yes
> microsecond timers      : no
> tlb_entries             : 32
> extra interrupt vector  : yes
> hardware watchpoint     : yes, count: 1, address/irw mask: [0x0fff]
> isa                     : mips1 mips2 mips32r1 mips32r2
> ASEs implemented        :
> shadow register sets    : 1
> kscratch registers      : 0
> package                 : 0
> core                    : 0
> VCED exceptions         : not available
> VCEI exceptions         : not available
>=20
> I am not familiar with JZ4780, which HW clock is it using? (R4K, GIC =
or NONE)?

Ah, good question. How do I find out? Checking defconfig did not show =
any
config with R4K or GIC. So it is likely NONE. CONFIG_RTC_DRV_JZ4740=3Dy =
if that
helps.

BR and thanks,
Nikolaus=
