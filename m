Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A608D250A7E
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 23:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgHXVGM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 17:06:12 -0400
Received: from crapouillou.net ([89.234.176.41]:39080 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbgHXVGM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 17:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1598303169; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bTOCZ5ep9UPKIO43bcq8yzYvle9hfDUlUxvCVGbgI48=;
        b=P7uDeVjiJ1bf/KE6pQgeKnhvZvC75+r+RFz4vUwR2Q1kvlswtb05jIyFZOtf9cLu5L28K+
        KG+QH/seOenWbSJ2tKUE/Ha4vUPWsEGKhJoGPxAtqMM5g4lDzgVF+RjO/6Pl1uWkTRAwJM
        HHFU8HWmuz6qQjD3iUfdPVwsxpMCwcQ=
Date:   Mon, 24 Aug 2020 23:05:58 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] lib: decompress_unzstd: Limit output size
To:     Nick Terrell <terrelln@fb.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me
Message-Id: <YL6LFQ.1E9SOADXFSGD2@crapouillou.net>
In-Reply-To: <8E3C6FC0-2DF0-49B5-9885-BA4AC81A117D@fb.com>
References: <20200821162948.146947-1-paul@crapouillou.net>
        <8E3C6FC0-2DF0-49B5-9885-BA4AC81A117D@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le lun. 24 ao=C3=BBt 2020 =C3=A0 20:11, Nick Terrell <terrelln@fb.com> a =
=C3=A9crit=20
:
>=20
>=20
>>  On Aug 21, 2020, at 9:29 AM, Paul Cercueil <paul@crapouillou.net>=20
>> wrote:
>>=20
>>  The zstd decompression code, as it is right now, will have internal
>>  values overflow on 32-bit systems when the output size is LONG_MAX.
>>=20
>>  Until someone smarter than me can figure out how to fix the zstd=20
>> code
>>  properly, limit the destination buffer size to 512 MiB, which=20
>> should be
>>  enough for everybody, in order to make it usable on 32-bit systems.
>=20
> Can you bump the size up to 2GB? I suspect the problem inside of zstd
> is an off-by-one error or something similar, so getting closer to the=20
> limit
> shouldn't be a problem. I=E2=80=99d feel more comfortable with 2GB, since
> kernels can get pretty large.

SZ_1G is the biggest I can go to get the kernel to boot. With SZ_2G it=20
won't boot.

> Hmm, zstd shouldn=E2=80=99t be overflowing that value. I=E2=80=99m curren=
tly=20
> preparing
> a patch to updating the version of zstd in the kernel, and using=20
> upstream
> directly. I will add a test upstream in 32-bit mode to ensure that we=20
> don=E2=80=99t
> overflow a 32-bit size_t, so this will be fixed after the update.

Great, thanks.

Cheers,
-Paul

>=20
> -Nick
>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>  lib/decompress_unzstd.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>>  diff --git a/lib/decompress_unzstd.c b/lib/decompress_unzstd.c
>>  index 0ad2c15479ed..e1c03b1eaa6e 100644
>>  --- a/lib/decompress_unzstd.c
>>  +++ b/lib/decompress_unzstd.c
>>  @@ -77,6 +77,7 @@
>>=20
>>  #include <linux/decompress/mm.h>
>>  #include <linux/kernel.h>
>>  +#include <linux/sizes.h>
>>  #include <linux/zstd.h>
>>=20
>>  /* 128MB is the maximum window size supported by zstd. */
>>  @@ -179,7 +180,7 @@ static int INIT __unzstd(unsigned char *in_buf,=20
>> long in_len,
>>  	size_t ret;
>>=20
>>  	if (out_len =3D=3D 0)
>>  -		out_len =3D LONG_MAX; /* no limit */
>>  +		out_len =3D SZ_512M; /* should be big enough, right? */
>>=20
>>  	if (fill =3D=3D NULL && flush =3D=3D NULL)
>>  		/*
>>  --
>>  2.28.0
>>=20
>=20


