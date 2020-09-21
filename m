Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770E02723EA
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 14:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgIUMb5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 08:31:57 -0400
Received: from crapouillou.net ([89.234.176.41]:40514 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgIUMb5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 08:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1600691514; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dmsovdavl+v+npWI2/c9KMIlMFOID1ZBOy1p+zfZfU8=;
        b=pqd/2tVnEur9z5HVgw5B/Jmerbp254ATslMJC8a/Fw1NVcKmK+hHHweYG47jCU9Fg7JQbl
        56U5s4TJsFAci6SxwTeRV2dYTTNUkjgRwixexm7ifDFSObLhF+HXCaEcbEHBopbcWp6rXj
        Zi1wNKEH1SjgyQupLW3DVscE/Eb7/h0=
Date:   Mon, 21 Sep 2020 14:31:41 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] MIPS: X1000E: Add X1000E system type.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     paulburton@kernel.org, tsbogend@alpha.franken.de,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        jiaxun.yang@flygoat.com, rppt@kernel.org,
        Sergey.Semin@baikalelectronics.ru,
        Alexey.Malahov@baikalelectronics.ru, akpm@linux-foundation.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <TGD0HQ.UUVW551D0QG01@crapouillou.net>
In-Reply-To: <20200919124437.89576-2-zhouyanjie@wanyeetech.com>
References: <20200919124437.89576-1-zhouyanjie@wanyeetech.com>
        <20200919124437.89576-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le sam. 19 sept. 2020 =C3=A0 20:44, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanji=
e)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add X1000 system type for cat /proc/cpuinfo to give out X1000E.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

For the 2 patches:
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  arch/mips/generic/board-ingenic.c | 3 +++
>  arch/mips/include/asm/bootinfo.h  | 1 +
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/arch/mips/generic/board-ingenic.c=20
> b/arch/mips/generic/board-ingenic.c
> index 0d7de8f9713d..c634ee35a6cd 100644
> --- a/arch/mips/generic/board-ingenic.c
> +++ b/arch/mips/generic/board-ingenic.c
> @@ -23,6 +23,8 @@ static __init char=20
> *ingenic_get_system_type(unsigned long machtype)
>  	switch (machtype) {
>  	case MACH_INGENIC_X1830:
>  		return "X1830";
> +	case MACH_INGENIC_X1000E:
> +		return "X1000E";
>  	case MACH_INGENIC_X1000:
>  		return "X1000";
>  	case MACH_INGENIC_JZ4780:
> @@ -58,6 +60,7 @@ static const struct of_device_id ingenic_of_match[]=20
> __initconst =3D {
>  	{ .compatible =3D "ingenic,jz4770", .data =3D (void=20
> *)MACH_INGENIC_JZ4770 },
>  	{ .compatible =3D "ingenic,jz4780", .data =3D (void=20
> *)MACH_INGENIC_JZ4780 },
>  	{ .compatible =3D "ingenic,x1000", .data =3D (void *)MACH_INGENIC_X1000=
=20
> },
> +	{ .compatible =3D "ingenic,x1000e", .data =3D (void=20
> *)MACH_INGENIC_X1000E },
>  	{ .compatible =3D "ingenic,x1830", .data =3D (void *)MACH_INGENIC_X1830=
=20
> },
>  	{}
>  };
> diff --git a/arch/mips/include/asm/bootinfo.h=20
> b/arch/mips/include/asm/bootinfo.h
> index 147c9327ce04..b6fdfbec1f07 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -79,6 +79,7 @@ enum ingenic_machine_type {
>  	MACH_INGENIC_JZ4775,
>  	MACH_INGENIC_JZ4780,
>  	MACH_INGENIC_X1000,
> +	MACH_INGENIC_X1000E,
>  	MACH_INGENIC_X1830,
>  	MACH_INGENIC_X2000,
>  };
> --
> 2.11.0
>=20


