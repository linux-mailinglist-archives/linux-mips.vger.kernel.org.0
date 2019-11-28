Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA0010CBF1
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 16:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfK1PmK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 10:42:10 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:16821 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfK1PmK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 10:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574955728;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=nIftciHtdIZW58XYe32SJEVSKmd/d/4nuYbsUj5SOW4=;
        b=aT4eqKsQjooGlWu4T6PVkQr6dH6MsdWCkVplXu52Fd+oY9e69v2hFeHKensb0S/k43
        OqJnrNoFPIGt5zq9FvfhX73aYzP4VLLaR9+ZxOBHJ9ZI6eXXa7IHy+F6RD+aqH0wUl/4
        C8ZabKa5q/l+0sT+USRNWFZW8//w+gNXoUrcE+8JvPXDjfqKRQHuBtgUWMnjvVpyG6Rn
        EcGHz0FAXHChegSR4LbQ68hZ/mx7RG7rnWc8MSOF6eJju3O5BkAIzEcJrmwU2cqxcW/E
        jn/LaMPyNHU1+3+GDIJKtSGU4wZBV+24kJm+Hu21Jn8RYR2/V3bjliQL8QITkY0hfXoD
        GzSQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43upSE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vASFg1Kot
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 16:42:01 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <64ee0c3e-9a54-f86a-daf5-32d54454b8ad@arm.com>
Date:   Thu, 28 Nov 2019 16:42:01 +0100
Cc:     Maarten ter Huurne <maarten@treewalker.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3B85F0EB-DEB4-478B-8745-B44C991D82F4@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com> <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com> <4807842.gtHLO0kk0V@hyperion> <01D75E67-EC2E-4C74-B9BB-752773C481A9@goldelico.com> <64ee0c3e-9a54-f86a-daf5-32d54454b8ad@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.11.2019 um 15:01 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>=20
>>>=20
>>=20
>> What still does not fit into the picture is the errno =3D 1 i.e. =
EPERM.
>> Maybe I have to study the libc code that tries to read the ELF =
symbols
>> you have mentioned. It may fail for unknown reasons.
>>=20
>=20
> This is what I was going to suggest next. It might be that something =
is not
> working there.
>=20
> Let us know your findings.

Well, my findings are that the gettimeofday() function in glibc-2.24 =
(used by
Debian Stretch) is simple:

> #include <errno.h>
> #include <sys/time.h>
>=20
> #undef __gettimeofday
>=20
> #ifdef HAVE_GETTIMEOFDAY_VSYSCALL
> # define HAVE_VSYSCALL
> #endif
> #include <sysdep-vdso.h>
>=20
> /* Get the current time of day and timezone information,
>    putting it into *tv and *tz.  If tz is null, *tz is not filled.
>    Returns 0 on success, -1 on errors.  */
> int
> __gettimeofday (struct timeval *tv, struct timezone *tz)
> {
>   return INLINE_VSYSCALL (gettimeofday, 2, tv, tz);
> }
> libc_hidden_def (__gettimeofday)
> weak_alias (__gettimeofday, gettimeofday)
> libc_hidden_weak (gettimeofday)
>=20

but the macro INLINE_VSYSCALL is not immediately understandable.

So I have no idea how to patch the kernel to check why that
sets errno. And patching libc is beyond my range of experience.

It is only clear that your kernel patch did break it for MIPS
(at least for CI20) but for obvious reasons not for ARM.

BTW: kernel v5.4 works with Debian Jessie, i.e. glibc-2.19.
Maybe it triggers a fallback.

BR and thanks,
Nikolaus


