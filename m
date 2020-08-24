Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92CBD250A70
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 23:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgHXVCP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 17:02:15 -0400
Received: from crapouillou.net ([89.234.176.41]:35916 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbgHXVCN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 17:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1598302930; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z3eh6MgJfv5Trn56d6MpAcV8dA3a4THzYLpI6NyJBOo=;
        b=h2bkzp4reLWbww/5KQ5D67CKbDQAe7+UofDsDZHh80sqleK2rWxRuD5qD0fqcsEF2P31V2
        Mq9lYdH3goJ8rF02OOYUyT2/0bsoHAFjqKIF1PHQ7evv9ztpaj/0xv94rhSVFfXzRGjF/U
        zeWzd/xLj5TdZs1O32y9LtquX3HUlrI=
Date:   Mon, 24 Aug 2020 23:02:00 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] MIPS: Add support for ZSTD-compressed kernels
To:     Nick Terrell <terrelln@fb.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        od@zcrc.me
Message-Id: <CF6LFQ.EXKNOXDIOE502@crapouillou.net>
In-Reply-To: <41742AA6-8BC0-46E5-8735-9B3D6E83FA2D@fb.com>
References: <20200821162948.146947-1-paul@crapouillou.net>
        <20200821162948.146947-2-paul@crapouillou.net>
        <41742AA6-8BC0-46E5-8735-9B3D6E83FA2D@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nick,

Le lun. 24 ao=FBt 2020 =E0 19:51, Nick Terrell <terrelln@fb.com> a =E9crit=20
:
>=20
>=20
>>  On Aug 21, 2020, at 9:29 AM, Paul Cercueil <paul@crapouillou.net>=20
>> wrote:
>>=20
>>  Add support for self-extracting kernels with a ZSTD compression.
>>=20
>>  Tested on a kernel for the GCW-Zero, it allows to reduce the size=20
>> of the
>>  kernel file from 4.1 MiB with gzip to 3.5 MiB with ZSTD, and boots=20
>> just
>>  as fast.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>  arch/mips/Kconfig                      |  1 +
>>  arch/mips/boot/compressed/Makefile     |  1 +
>>  arch/mips/boot/compressed/decompress.c |  4 ++++
>>  arch/mips/boot/compressed/string.c     | 16 ++++++++++++++++
>>  4 files changed, 22 insertions(+)
>>=20
>>  diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>  index c95fa3a2484c..b9d7c4249dc9 100644
>>  --- a/arch/mips/Kconfig
>>  +++ b/arch/mips/Kconfig
>>  @@ -1890,6 +1890,7 @@ config SYS_SUPPORTS_ZBOOT
>>  	select HAVE_KERNEL_LZMA
>>  	select HAVE_KERNEL_LZO
>>  	select HAVE_KERNEL_XZ
>>  +	select HAVE_KERNEL_ZSTD
>>=20
>>  config SYS_SUPPORTS_ZBOOT_UART16550
>>  	bool
>>  diff --git a/arch/mips/boot/compressed/Makefile=20
>> b/arch/mips/boot/compressed/Makefile
>>  index 6e56caef69f0..86ddc6fc16f4 100644
>>  --- a/arch/mips/boot/compressed/Makefile
>>  +++ b/arch/mips/boot/compressed/Makefile
>>  @@ -70,6 +70,7 @@ tool_$(CONFIG_KERNEL_LZ4)     =3D lz4
>>  tool_$(CONFIG_KERNEL_LZMA)    =3D lzma
>>  tool_$(CONFIG_KERNEL_LZO)     =3D lzo
>>  tool_$(CONFIG_KERNEL_XZ)      =3D xzkern
>>  +tool_$(CONFIG_KERNEL_ZSTD)    =3D zstd
>=20
> You can use zstd22 here. It will give you slightly better compression
> without any additional memory usage. Also, you should add
> -D__DISABLE_EXPORTS to the KBUILD_CFLAGS like x86 does [1].

Indeed, it's 0.01% smaller :)

What is __DISABLE_EXPORTS for?

-Paul

>=20
> [1]=20
> https://github.com/torvalds/linux/blob/master/arch/x86/boot/compressed/Ma=
kefile
>=20
> -Nick
>=20
>>  targets +=3D vmlinux.bin.z
>>  $(obj)/vmlinux.bin.z: $(obj)/vmlinux.bin FORCE
>>  diff --git a/arch/mips/boot/compressed/decompress.c=20
>> b/arch/mips/boot/compressed/decompress.c
>>  index 88f5d637b1c4..c61c641674e6 100644
>>  --- a/arch/mips/boot/compressed/decompress.c
>>  +++ b/arch/mips/boot/compressed/decompress.c
>>  @@ -72,6 +72,10 @@ void error(char *x)
>>  #include "../../../../lib/decompress_unxz.c"
>>  #endif
>>=20
>>  +#ifdef CONFIG_KERNEL_ZSTD
>>  +#include "../../../../lib/decompress_unzstd.c"
>>  +#endif
>>  +
>>  const unsigned long __stack_chk_guard =3D 0x000a0dff;
>>=20
>>  void __stack_chk_fail(void)
>>  diff --git a/arch/mips/boot/compressed/string.c=20
>> b/arch/mips/boot/compressed/string.c
>>  index 43beecc3587c..ab95722ec0c9 100644
>>  --- a/arch/mips/boot/compressed/string.c
>>  +++ b/arch/mips/boot/compressed/string.c
>>  @@ -27,3 +27,19 @@ void *memset(void *s, int c, size_t n)
>>  		ss[i] =3D c;
>>  	return s;
>>  }
>>  +
>>  +void *memmove(void *dest, const void *src, size_t n)
>>  +{
>>  +	unsigned int i;
>>  +	const char *s =3D src;
>>  +	char *d =3D dest;
>>  +
>>  +	if ((uintptr_t)dest < (uintptr_t)src) {
>>  +		for (i =3D 0; i < n; i++)
>>  +			d[i] =3D s[i];
>>  +	} else {
>>  +		for (i =3D n; i > 0; i--)
>>  +			d[i - 1] =3D s[i - 1];
>>  +	}
>>  +	return dest;
>>  +}
>>  --
>>  2.28.0
>>=20


