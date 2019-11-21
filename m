Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E26104AA0
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 07:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfKUGRo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Nov 2019 01:17:44 -0500
Received: from forward106j.mail.yandex.net ([5.45.198.249]:48071 "EHLO
        forward106j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725842AbfKUGRo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Nov 2019 01:17:44 -0500
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
        by forward106j.mail.yandex.net (Yandex) with ESMTP id D140411A121D;
        Thu, 21 Nov 2019 09:17:41 +0300 (MSK)
Received: from mxback7q.mail.yandex.net (mxback7q.mail.yandex.net [IPv6:2a02:6b8:c0e:41:0:640:cbbf:d618])
        by forward101q.mail.yandex.net (Yandex) with ESMTP id C9F7CCF40012;
        Thu, 21 Nov 2019 09:17:41 +0300 (MSK)
Received: from vla3-2bcfd5e94671.qloud-c.yandex.net (vla3-2bcfd5e94671.qloud-c.yandex.net [2a02:6b8:c15:350f:0:640:2bcf:d5e9])
        by mxback7q.mail.yandex.net (mxback/Yandex) with ESMTP id y1BCvKFzf0-HfXOf6YF;
        Thu, 21 Nov 2019 09:17:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1574317061;
        bh=Op3BE2NZXtGbqpQuC/Bl23iPpO4DsoZfliQHQr+WNcc=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=ElaKvH6zLlcXAHQs6u81HnjurnY8Oa099yDiCRURVxjhMo5F9FKIKdZgUUuLNriSu
         DUd/q40+pe1X/6Wn+GfkyQH+TdnnbcF772ML4ZbUvqQErtneCCrAKO/NfDkzCuVgq4
         UPBGNK5Gny5LTo5pllFkA2LTI4YcKpjHOv0Cdqm4=
Authentication-Results: mxback7q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla3-2bcfd5e94671.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id USjOoAfIPR-HdV4BlZh;
        Thu, 21 Nov 2019 09:17:39 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Thu, 21 Nov 2019 14:17:28 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20191121014156.25618-1-liulichao@loongson.cn>
References: <20191121014156.25618-1-liulichao@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Use the macro CONFIG_I8259 to control whether to include the asm/i8259.h header file.
To:     Lichao Liu <liulichao@loongson.cn>, Huacai Chen <chenhc@lemote.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Marc Dionne <marc.dionne@auristor.com>,
        David Howells <dhowells@redhat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <E3B6A677-013F-4431-B29C-8C069931C84C@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B411=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
9:41:56, Lichao Liu <liulichao@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Not all platform config CONFIG_I8259, So Use the macro CONFIG_I8259
>to control whether to include the asm/i8259=2Eh header file=2E

You should have a dedicated short patch tittle=2E=20

Like MIPS: Loongson64: Limit i8259 include by config

>
>Signed-off-by: Lichao Liu <liulichao@loongson=2Ecn>
>---
> arch/mips/loongson64/common/pm=2Ec | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/arch/mips/loongson64/common/pm=2Ec
>b/arch/mips/loongson64/common/pm=2Ec
>index b8aed878d=2E=2Ebc619e4d0 100644
>--- a/arch/mips/loongson64/common/pm=2Ec
>+++ b/arch/mips/loongson64/common/pm=2Ec
>@@ -9,7 +9,9 @@
> #include <linux/interrupt=2Eh>
> #include <linux/pm=2Eh>
>=20
>+#ifdef CONFIG_I8259
> #include <asm/i8259=2Eh>
>+#endif
> #include <asm/mipsregs=2Eh>
>=20
> #include <loongson=2Eh>

--=20
Jiaxun Yang
