Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826C63AEBFD
	for <lists+linux-mips@lfdr.de>; Mon, 21 Jun 2021 17:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhFUPIV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Jun 2021 11:08:21 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:36473 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhFUPIS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Jun 2021 11:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624287598;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=GorU75a42cG62zePkI+isfjr8RFT6sW96ZFZWuKg/GQ=;
    b=qwdcMksJimuxzTjKq2dGQcWr9BW49aJDmdWTIhJOpxF4eJAVSjXinyJG57xqebtL2T
    hZttDwREEeerDf8Nn57FKkqJ5AMOzJOOKkVwbKPdFovdfpBcBzlwMHPgIVtgRVe7dDOA
    d4YMOvelOWZwh8x75IcCSUc6MhVtb3jOvPmTe8ARD5qvKn4hkq8vaMiK6BrwidNeI8Mp
    iXdJGOrqZa/mWuFNi3X2hgBR5BYsfYsHFdZfdansWprzJTu31mIWvfMFgDhFXkFbmi5l
    YUHdhxicx1+/WcMeYvLD2COGoIFO7wxRQhMqHEe9Z6WaUQqoU4xW84Je2Ndcr3ur64+5
    oxJw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrswDOiOmY="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.27.3 DYNA|AUTH)
    with ESMTPSA id 90215ex5LExwGtl
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 21 Jun 2021 16:59:58 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] MIPS: tools: fix build on macOS
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <z_0h2JVlIGgyiySXEyOmFhJ5_rl_EmuXR7beRMunMZRivpcO0H7LqsGa6ePHdSTkF521jUnXMM9TZb5N9mM4fduiHAxpshUkCBd7Owo43tM=@protonmail.com>
Date:   Mon, 21 Jun 2021 16:59:58 +0200
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C87F67C-B1EE-4881-BADB-7AAE3EE96F65@goldelico.com>
References: <z_0h2JVlIGgyiySXEyOmFhJ5_rl_EmuXR7beRMunMZRivpcO0H7LqsGa6ePHdSTkF521jUnXMM9TZb5N9mM4fduiHAxpshUkCBd7Owo43tM=@protonmail.com>
To:     Ryan Burns <rtburns@protonmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Ryan,
what happened to that patch? I haven't found a discussion or that it was =
merged.

I have used it and it seems solve a cross-compilation issue (have to =
cross-chek if it is still the case with 5.13-rc7).

Maybe the maintainers did not become aware of?

BR and thanks,
Nikolaus Schaller

=
https://patchwork.kernel.org/project/linux-mips/patch/z_0h2JVlIGgyiySXEyOm=
FhJ5_rl_EmuXR7beRMunMZRivpcO0H7LqsGa6ePHdSTkF521jUnXMM9TZb5N9mM4fduiHAxpsh=
UkCBd7Owo43tM=3D@protonmail.com/


> Am 14.02.2021 um 06:01 schrieb Ryan Burns <rtburns@protonmail.com>:
>=20
> macOS does not have byteswap.h, but we can use Apple's =
libkern/OSByteOrder.h instead.
>=20
> This issue is encountered during cross-compilation from macOS to MIPS =
in nixpkgs.
> You can view a log of the build failure here:
> https://hydra.nixos.org/build/136015790/nixlog/1
>   =20
> Signed-off-by: Ryan Burns <rtburns@protonmail.com>
> ---
> arch/mips/boot/tools/relocs.h      | 11 +++++++++--
> arch/mips/boot/tools/relocs_main.c |  1 -
> arch/mips/tools/elf-entry.c        | 11 +++++++++--
> 3 files changed, 18 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/mips/boot/tools/relocs.h =
b/arch/mips/boot/tools/relocs.h
> index 607ff0103064..5de9bb7a7e09 100644
> --- a/arch/mips/boot/tools/relocs.h
> +++ b/arch/mips/boot/tools/relocs.h
> @@ -11,9 +11,16 @@
> #include <errno.h>
> #include <unistd.h>
> #include <elf.h>
> -#include <byteswap.h>
> #define USE_BSD
> -#include <endian.h>
> +#if defined(__APPLE__)
> +# include <libkern/OSByteOrder.h>
> +# define bswap_16 OSSwapInt16
> +# define bswap_32 OSSwapInt32
> +# define bswap_64 OSSwapInt64
> +#else
> +# include <byteswap.h>
> +# include <endian.h>
> +#endif
> #include <regex.h>
>=20
> void die(char *fmt, ...);
> diff --git a/arch/mips/boot/tools/relocs_main.c =
b/arch/mips/boot/tools/relocs_main.c
> index e2453a564b11..4ef51d1e6d0d 100644
> --- a/arch/mips/boot/tools/relocs_main.c
> +++ b/arch/mips/boot/tools/relocs_main.c
> @@ -6,7 +6,6 @@
> #include <stdlib.h>
> #include <string.h>
> #include <errno.h>
> -#include <endian.h>
> #include <elf.h>
>=20
> #include "relocs.h"
> diff --git a/arch/mips/tools/elf-entry.c b/arch/mips/tools/elf-entry.c
> index dbd14ff05b4c..5d2e2ab4b3b0 100644
> --- a/arch/mips/tools/elf-entry.c
> +++ b/arch/mips/tools/elf-entry.c
> @@ -1,7 +1,14 @@
> // SPDX-License-Identifier: GPL-2.0
> -#include <byteswap.h>
> +#if defined(__APPLE__)
> +# include <libkern/OSByteOrder.h>
> +# define bswap_16 OSSwapInt16
> +# define bswap_32 OSSwapInt32
> +# define bswap_64 OSSwapInt64
> +#else
> +# include <byteswap.h>
> +# include <endian.h>
> +#endif
> #include <elf.h>
> -#include <endian.h>
> #include <inttypes.h>
> #include <stdint.h>
> #include <stdio.h>

