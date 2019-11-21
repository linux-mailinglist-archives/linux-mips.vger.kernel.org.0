Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72E09104A94
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 07:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfKUGMy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Nov 2019 01:12:54 -0500
Received: from forward104p.mail.yandex.net ([77.88.28.107]:42803 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725842AbfKUGMy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Nov 2019 01:12:54 -0500
Received: from mxback24g.mail.yandex.net (mxback24g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:324])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id ED4604B02103;
        Thu, 21 Nov 2019 09:12:50 +0300 (MSK)
Received: from myt2-853c0a8cbfab.qloud-c.yandex.net (myt2-853c0a8cbfab.qloud-c.yandex.net [2a02:6b8:c00:1796:0:640:853c:a8c])
        by mxback24g.mail.yandex.net (mxback/Yandex) with ESMTP id hgCGn180GH-CnomQ2ex;
        Thu, 21 Nov 2019 09:12:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1574316770;
        bh=PXo65QxMlWhp/UDTIBmzqTf/sEd8JUruM/q7kIX5HZI=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=PSMYM+fm7kL4yAFJPPDp2EMytG5DXU8lH/m5vYOkDBR3cOtKP3KzOw9sJSg4SsGv8
         vKPrO4+INszoXlZB+bJjbZgSqHX/vj9XVYfZDGbm0RwteKDgZq2310nDEVZHgx6oTu
         0t4PsUSxF/Zp2ui4sh81lLNuzzVGumxHSL3p6K/c=
Authentication-Results: mxback24g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt2-853c0a8cbfab.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id ELM35Wy97q-Cl1CZMtN;
        Thu, 21 Nov 2019 09:12:48 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Thu, 21 Nov 2019 14:12:40 +0800
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
Message-ID: <61337744-0502-4245-8129-535B9125939C@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B411=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
9:41:56, Lichao Liu <liulichao@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Not all platform config CONFIG_I8259, So Use the macro CONFIG_I8259
>to control whether to include the asm/i8259=2Eh header file=2E
>
>Signed-off-by: Lichao Liu <liulichao@loongson=2Ecn>

Acked-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

I'm glad to see Loongson guys finally get here=2E

I will send v3 of my previous "modernize" set=2E
Which will also refactor interrupt part=2E=20
Do you have any comments based on v2 [1]?

[1]: https://patchwork=2Ekernel=2Eorg/cover/11133237/
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
