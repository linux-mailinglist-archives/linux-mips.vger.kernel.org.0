Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5227910B14D
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 15:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfK0O33 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Nov 2019 09:29:29 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:16143 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfK0O33 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Nov 2019 09:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574864964;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Fnfmdr+XeKUAhK0GcGLKO6F0UlZsg7t8t+TktSAorLo=;
        b=n3UvKhlHbEVkuARqbPOZYJNFzwPJmMg8Lxpt1SlMb+PqHKHlyNRyN3xv1hyMuKfkQe
        E8em8mjFfuw1M8O2xpu2lI4/CXl7FYftzV9DJPVZiqma8I1xCLIq/al0FI56dDY+77MW
        yiyP7s9VPaMbG7lGfS5fLb2TUyVxlS3YtY0P7yYMOjRGih68vl7aqyXJFUxLvcczyYKE
        zymhZ74M8oXYjvvFcc5HGoso0Hw16TGrtqklil5UXRMlfeJaA4BMGrYsiqJ8G1l/orTh
        eCFc8bep/WNa76q/vgtkZJQxa7c5yD1+fOiBsekzq6WNJjc/RipqdWA/JLfQ/7FKTzo1
        9IpA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMjw47pbCs="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vARETCE10
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 27 Nov 2019 15:29:12 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <8D151C34-41A1-4DFE-92D6-D1B27AEC8730@goldelico.com>
Date:   Wed, 27 Nov 2019 15:29:12 +0100
Cc:     linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3E2EEC19-F320-4320-9A85-67B4E615C74A@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <703DC004-96E8-463D-8870-3CC410FE1C5E@goldelico.com> <3190d1a4-96c4-1843-3ae1-bae3a97af9fb@arm.com> <8D151C34-41A1-4DFE-92D6-D1B27AEC8730@goldelico.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Vincenco,

> Am 27.11.2019 um 14:53 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Vincenzo,
>=20
>> Am 26.11.2019 um 11:52 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>>=20
>> I do not have a CI20 hence I can't do the test myself: could you =
please write a
>> small application that invokes gettimeofday() as per above and report =
the
>> behavior (I am even interested in the value returned). If we can =
reproduce the
>> problem in a smaller environment it is easier to debug and get to the =
solution.
>>=20
>> [1] =
http://users.isc.org/~each/doxygen/bind9/isc_2unix_2time_8c-source.html
>>=20
>> Let me know.
>=20
> I have done this and it seems as if tv_usec reports something that is =
beyond 1e6 us
> or remains unchanged by the syscall. tv_sec seems to be set correctly. =
And,
> gettimeofday() reports -1.
>=20
> hwclock isn't set on 45.4 kernel because I have no ethernet connection =
due to the bug.
>=20
> BR,
> Nikolaus
>=20
>=20
> Here is the log
>=20
> a) with 5.4 kernel
>=20
> root@letux:~# cat gettime.c=20
> #include <stdio.h>
> #include <time.h>
> #include <sys/time.h>
>=20
> int main(void)
> {
> struct timeval tv;
> int r =3D gettimeofday(&tv, NULL);
> time_t t;
> int rt =3D time(&t);
>=20
> printf("r =3D %d\n", r);
> printf("tv.sec =3D %ld\n", tv.tv_sec);
> printf("tv.usec =3D %d\n", tv.tv_usec);
> printf("rt =3D %d\n", rt);
> printf("t =3D %ld\n", t);
> }

I realized that this does not allow to distinguish between
uninitialized struct timeval tv and return values. And it
would be nice to print errno. So I have used a new version:

#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <errno.h>

int main(void)
{
	struct timeval tv =3D { 1, 1 };
	int r;
	time_t t;
	int rt;

	r =3D gettimeofday(&tv, NULL);
	printf("r =3D %d errno=3D%d\n", r, errno);
	printf("tv.sec =3D %ld\n", tv.tv_sec);
	printf("tv.usec =3D %d\n", tv.tv_usec);

	rt =3D time(&t);
	printf("rt =3D %d errno=3D%d\n", rt, errno);
	printf("t =3D %ld\n", t);
}

> root@letux:~# make gettime
> cc     gettime.c   -o gettime
> root@letux:~# ./gettime=20
> r =3D -1
> tv.sec =3D 1431857456
> tv.usec =3D 2012065500
> rt =3D 1478206565
> t =3D 1478206565

root@letux:~# ./gettime=20
r =3D -1 errno=3D1
tv.sec =3D 1
tv.usec =3D 1
rt =3D 1478193516 errno=3D1
t =3D 1478193516
root@letux:~#=20

which means that there is an -EPERM and &tv is not touched.
Well, I did run this as root.

So it may be a completely different reason than changing the
VDSO structure.

> b) same system booted with 4.19 kernel:
>=20
> root@letux:~# ./gettime=20
> r =3D 0
> tv.sec =3D 1574862135
> tv.usec =3D 27974
> rt =3D 1574862135
> t =3D 1574862135

root@letux:~# ./gettime=20
r =3D 0 errno=3D0
tv.sec =3D 1574863040
tv.usec =3D 874858
rt =3D 1574863040 errno=3D0
t =3D 1574863040
root@letux:~#


> root@letux:~# uname -a
> Linux letux 4.19.86-letux-l400+ #1450 PREEMPT Sun Nov 24 17:17:19 CET =
2019 mips GNU/Linux

Please let me know what I should try next.

BR and thanks,
Nikolaus

