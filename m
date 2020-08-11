Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4FE241B1C
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 14:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbgHKMnX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 08:43:23 -0400
Received: from crapouillou.net ([89.234.176.41]:34682 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726829AbgHKMnX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 08:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1597149800; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UoMzuNHLpMyb1+tD82j6gU5EX07Smv4Upec9Fe1sZFs=;
        b=yiJaFQqUyuBXx4xoZbPe55o0lB0pePTCFmKY5H8WBawqqfcwfgk7kE1wH6XSjY2KfIjC+D
        HVs1UVB/8Bie3A5PGbLy0zURsBndkRRmarKO34mDOQBEmNQveYXG5ZV/zgyffEDhyJNGNw
        gAUcBrx+zz9pItOBKhriZV+b/X8Bbgs=
Date:   Tue, 11 Aug 2020 14:43:10 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/13] MIPS: generic: Call the machine's .get_system_type
 callback if provided
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Message-Id: <YNGWEQ.XFIJE749QSY11@crapouillou.net>
In-Reply-To: <20200803170124.231110-7-paul@crapouillou.net>
References: <20200803170124.231110-1-paul@crapouillou.net>
        <20200803170124.231110-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le lun. 3 ao=FBt 2020 =E0 19:01, Paul Cercueil <paul@crapouillou.net> a=20
=E9crit :
> Call the machine's .get_system_type callback in the global
> get_system_type() function, if it was provided by the mips_machine
> implementation.
>=20
> The get_system_type() function had to be moved within init.c to be=20
> able
> to use the static variable "mach". Therefore the proc.c, now empty,=20
> has
> been removed.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/generic/Makefile |  1 -
>  arch/mips/generic/init.c   | 19 +++++++++++++++++++
>  arch/mips/generic/proc.c   | 25 -------------------------
>  3 files changed, 19 insertions(+), 26 deletions(-)
>  delete mode 100644 arch/mips/generic/proc.c
>=20
> diff --git a/arch/mips/generic/Makefile b/arch/mips/generic/Makefile
> index 2384a6b09e4c..f49aeede93c2 100644
> --- a/arch/mips/generic/Makefile
> +++ b/arch/mips/generic/Makefile
> @@ -6,7 +6,6 @@
>=20
>  obj-y +=3D init.o
>  obj-y +=3D irq.o
> -obj-y +=3D proc.o
>=20
>  obj-$(CONFIG_YAMON_DT_SHIM)		+=3D yamon-dt.o
>  obj-$(CONFIG_LEGACY_BOARD_SEAD3)	+=3D board-sead3.o
> diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
> index 805d0135a9f4..7d82b436939e 100644
> --- a/arch/mips/generic/init.c
> +++ b/arch/mips/generic/init.c
> @@ -207,3 +207,22 @@ void __init arch_init_irq(void)
>  void __init prom_free_prom_memory(void)
>  {
>  }
> +
> +const char *get_system_type(void)
> +{
> +	const char *str;
> +	int err;
> +
> +	if (mach && mach->get_system_type)
> +		return mach->get_system_type(of_root);

The 'mach' variable is __initconst, so there's a section violation=20
right here. I'll send a V2.

-Paul

> +
> +	err =3D of_property_read_string(of_root, "model", &str);
> +	if (!err)
> +		return str;
> +
> +	err =3D of_property_read_string_index(of_root, "compatible", 0, &str);
> +	if (!err)
> +		return str;
> +
> +	return "Unknown";
> +}
> diff --git a/arch/mips/generic/proc.c b/arch/mips/generic/proc.c
> deleted file mode 100644
> index 4c992809cc3f..000000000000
> --- a/arch/mips/generic/proc.c
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * Copyright (C) 2016 Imagination Technologies
> - * Author: Paul Burton <paul.burton@mips.com>
> - */
> -
> -#include <linux/of.h>
> -
> -#include <asm/bootinfo.h>
> -
> -const char *get_system_type(void)
> -{
> -	const char *str;
> -	int err;
> -
> -	err =3D of_property_read_string(of_root, "model", &str);
> -	if (!err)
> -		return str;
> -
> -	err =3D of_property_read_string_index(of_root, "compatible", 0, &str);
> -	if (!err)
> -		return str;
> -
> -	return "Unknown";
> -}
> --
> 2.27.0
>=20


