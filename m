Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42DEB10C111
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 01:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfK1Am4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Nov 2019 19:42:56 -0500
Received: from forward100j.mail.yandex.net ([5.45.198.240]:35711 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726984AbfK1Am4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Nov 2019 19:42:56 -0500
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id 664F750E0BEC;
        Thu, 28 Nov 2019 03:42:53 +0300 (MSK)
Received: from mxback3q.mail.yandex.net (mxback3q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:4545:437c])
        by forward101q.mail.yandex.net (Yandex) with ESMTP id 6014ACF40007;
        Thu, 28 Nov 2019 03:42:53 +0300 (MSK)
Received: from vla3-2bcfd5e94671.qloud-c.yandex.net (vla3-2bcfd5e94671.qloud-c.yandex.net [2a02:6b8:c15:350f:0:640:2bcf:d5e9])
        by mxback3q.mail.yandex.net (mxback/Yandex) with ESMTP id f0hdWVvhSr-grMa4Qcn;
        Thu, 28 Nov 2019 03:42:53 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1574901773;
        bh=+Yjb9jiHKoOqJQk4jBP8FPWUL0lfQqeGegVie0MZtMs=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=kBJ0KtR51HFkKShuq6XsYv/HHMzeN5TpQk6RYmg4WJLPQt3oNS1Jhi+rLyd4hVS3y
         zbAqmu5/kyDTEYA3k2WXJ8zbFRvnLdLA3uab7y1IAKHllP36BSRVXh6d4B+/uBscJk
         TCGFHNTtWd7GLJ29P8R32ZanTmKaVHoDdVa+cGB4=
Authentication-Results: mxback3q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla3-2bcfd5e94671.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id r8queTZ03p-gpVerA5I;
        Thu, 28 Nov 2019 03:42:51 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Thu, 28 Nov 2019 08:42:28 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20191127152612.21945-1-linux@roeck-us.net>
References: <20191127152612.21945-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Fix boot on Fuloong2 systems
To:     Guenter Roeck <linux@roeck-us.net>,
        Paul Burton <paulburton@kernel.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1F64121F-0A46-41C2-ABE0-917A1A968A3E@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B411=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
11:26:12, Guenter Roeck <linux@roeck-us=2Enet> =E5=86=99=E5=88=B0:
>Commit 268a2d60013049 ("MIPS: Loongson64: Rename CPU TYPES") changed
>Kconfig symbols as follows:
>	CPU_LOONGSON2 to CPU_LOONGSON2EF
>	CPU_LOONGSON3 to CPU_LOONGSON64
>	SYS_HAS_CPU_LOONGSON3 to SYS_HAS_CPU_LOONGSON64
>
>It did not touch SYS_HAS_CPU_LOONGSON2E or SYS_HAS_CPU_LOONGSON2F=2E
>However, the patch changed a conditional from
>
> #if defined(CONFIG_SYS_HAS_CPU_LOONGSON2E) || \
>     defined(CONFIG_SYS_HAS_CPU_LOONGSON2F)
>
>to
>
> #if defined(CONFIG_SYS_HAS_CPU_LOONGSON2EF)
>
>SYS_HAS_CPU_LOONGSON2EF does not exist, resulting in boot failures
>with the qemu fulong2e emulation=2E Revert to the original code=2E
>
>Fixes: 268a2d60013049 ("MIPS: Loongson64: Rename CPU TYPES")
>Cc: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>Signed-off-by: Guenter Roeck <linux@roeck-us=2Enet>
Acked-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

Apologies for the mistake=2E I ran some tests before sending the
patch but probably get this missed due to
difference between my local tree and next tree=2E

Thanks for catching that!
>---

--=20
Jiaxun Yang
