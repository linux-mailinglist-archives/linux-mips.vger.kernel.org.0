Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B66110D77E
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 15:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfK2Oww (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 09:52:52 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:10655 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfK2Owv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 09:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575039166;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=o6PLBpFcvA6/3iSigPBPF7OgSgCT09xUz1+oH4ffcqg=;
        b=RwQSYvu1PqyKGVAYUNSKqPUBH5aZa0tIVTKr39557PiQns/sa08/SIvEKfSoH72GGS
        AEAc9y6w9CnGpWB70qr6je09PuZ+TKRrv6GhBgRc8vEqt4CwlRYAguP39F64+v7hla9a
        JKMmbcp0EmAo4T0geW3vYoaSamLnDFdJvkmD3bV1m5swlFGtMYBXBK/c0Ntxej3gnvhU
        AIUM+djn1Nu+obNAWOGA0oA5oRNsOMaHbSEuw9EhKeCB12cQnRYEEve5hy2FpTi9Izx9
        1BTRt6B9qIbadk+Ld0ibJ76id8XZcCJondQf298xswDGq7qws7iZM/F3dVrJ/qLns0XP
        lmew==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vgwDeoHw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 45.0.2 DYNA|AUTH)
        with ESMTPSA id y07703vATEqjTL8
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 29 Nov 2019 15:52:45 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] mips: Fix gettimeofday() in the vdso library
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191129143658.12224-1-vincenzo.frascino@arm.com>
Date:   Fri, 29 Nov 2019 15:52:45 +0100
Cc:     Paul Burton <paulburton@kernel.org>,
        mips-creator-ci20-dev@googlegroups.com,
        letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <307717BD-3233-4313-BAA8-7431F4C78773@goldelico.com>
References: <20191129143658.12224-1-vincenzo.frascino@arm.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 29.11.2019 um 15:36 schrieb Vincenzo Frascino =
<vincenzo.frascino@arm.com>:
>=20
> The libc provides a discovery mechanism for vDSO library and its
> symbols. When a symbol is not exposed by the vDSOs the libc falls back
> on the system calls.
>=20
> With the introduction of the unified vDSO library on mips this =
behavior
> is not honored anymore by the kernel in the case of gettimeofday().
>=20
> The issue has been noticed and reported due to a dhclient failure on =
the
> CI20 board:
>=20
> root@letux:~# dhclient
> ../../../../lib/isc/unix/time.c:200: Operation not permitted
> root@letux:~#
>=20
> Restore the original behavior fixing gettimeofday() in the vDSO =
library.
>=20
> Cc: Paul Burton <paulburton@kernel.org>
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Testes-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 with JZ4780
^^^ funny typo... -> Tested-by:
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
> arch/mips/include/asm/vdso/gettimeofday.h | 13 -------------
> arch/mips/vdso/vgettimeofday.c            | 20 ++++++++++++++++++++
> 2 files changed, 20 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/vdso/gettimeofday.h =
b/arch/mips/include/asm/vdso/gettimeofday.h
> index b08825531e9f..0ae9b4cbc153 100644
> --- a/arch/mips/include/asm/vdso/gettimeofday.h
> +++ b/arch/mips/include/asm/vdso/gettimeofday.h
> @@ -26,8 +26,6 @@
>=20
> #define __VDSO_USE_SYSCALL		ULLONG_MAX
>=20
> -#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
> -
> static __always_inline long gettimeofday_fallback(
> 				struct __kernel_old_timeval *_tv,
> 				struct timezone *_tz)
> @@ -48,17 +46,6 @@ static __always_inline long gettimeofday_fallback(
> 	return error ? -ret : ret;
> }
>=20
> -#else
> -
> -static __always_inline long gettimeofday_fallback(
> -				struct __kernel_old_timeval *_tv,
> -				struct timezone *_tz)
> -{
> -	return -1;
> -}
> -
> -#endif
> -
> static __always_inline long clock_gettime_fallback(
> 					clockid_t _clkid,
> 					struct __kernel_timespec *_ts)
> diff --git a/arch/mips/vdso/vgettimeofday.c =
b/arch/mips/vdso/vgettimeofday.c
> index 6ebdc37c89fc..6b83b6376a4b 100644
> --- a/arch/mips/vdso/vgettimeofday.c
> +++ b/arch/mips/vdso/vgettimeofday.c
> @@ -17,12 +17,22 @@ int __vdso_clock_gettime(clockid_t clock,
> 	return __cvdso_clock_gettime32(clock, ts);
> }
>=20
> +#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
> +
> +/*
> + * This is behind the ifdef so that we don't provide the symbol when =
there's no
> + * possibility of there being a usable clocksource, because there's =
nothing we
> + * can do without it. When libc fails the symbol lookup it should =
fall back on
> + * the standard syscall path.
> + */
> int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
> 			struct timezone *tz)
> {
> 	return __cvdso_gettimeofday(tv, tz);
> }
>=20
> +#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
> +
> int __vdso_clock_getres(clockid_t clock_id,
> 			struct old_timespec32 *res)
> {
> @@ -43,12 +53,22 @@ int __vdso_clock_gettime(clockid_t clock,
> 	return __cvdso_clock_gettime(clock, ts);
> }
>=20
> +#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
> +
> +/*
> + * This is behind the ifdef so that we don't provide the symbol when =
there's no
> + * possibility of there being a usable clocksource, because there's =
nothing we
> + * can do without it. When libc fails the symbol lookup it should =
fall back on
> + * the standard syscall path.
> + */
> int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
> 			struct timezone *tz)
> {
> 	return __cvdso_gettimeofday(tv, tz);
> }
>=20
> +#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
> +
> int __vdso_clock_getres(clockid_t clock_id,
> 			struct __kernel_timespec *res)
> {
> --=20
> 2.24.0
>=20

