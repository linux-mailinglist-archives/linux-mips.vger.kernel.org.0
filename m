Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1E62F6991
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 19:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbhANSbI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jan 2021 13:31:08 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:22508 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbhANSbH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jan 2021 13:31:07 -0500
Date:   Thu, 14 Jan 2021 18:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1610649022; bh=rQYRb+PWaSyETWUEHy6RM0F+c/zvcfpDUyogIYo7a8M=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=hJbnqmoCJRIqQzQ5xpmlzejhUmiZ+oFYrI6KrVldin0S9KFLW/HvXytsydjhuAcQx
         JZlrPgKB5hy0XWdIugah/qwKkLiSW7+wSgjGXj89mi2aDLkbrhpLKb6Yrhxan22wZ3
         joI0B4bl01BVMsCCmMM5pJPzC1OHBXsvAqHWuzf+eJlIjWllEyqLK7agmDeDybhUch
         2uaKtiLt2wMiOY0ZzwrYcqut63Fo4INYkb0SIpZXs6SUtclbKPBQdACvqu5I+CTMVe
         5N2lKoNdIrytfZwjDh2uJgziqlcKJGYM94wdxzHekVLN38S32O4bUzH5dXL0+i35wM
         XNPiD7WMHXMVg==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bibo Mao <maobibo@loongson.cn>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Paul Burton <paulburton@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Guoyun Sun <sunguoyun@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 1/2] MIPS: bitops: fix -Wshadow in asm/bitops.h
Message-ID: <20210114183001.110729-1-alobakin@pm.me>
In-Reply-To: <20210114182905.110574-1-alobakin@pm.me>
References: <20210114182905.110574-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Solves the following repetitive warning when building with -Wshadow:

In file included from ./include/linux/bitops.h:32,
                 from ./include/linux/kernel.h:11,
                 from ./include/linux/skbuff.h:13,
                 from ./include/linux/if_ether.h:19,
                 from ./include/linux/etherdevice.h:20:
./arch/mips/include/asm/bitops.h: In function =E2=80=98test_and_set_bit_loc=
k=E2=80=99:
./arch/mips/include/asm/bitops.h:46:16: warning: declaration of =E2=80=
=98orig=E2=80=99 shadows a previous local [-Wshadow]
   46 |  unsigned long orig, temp;    \
      |                ^~~~
./arch/mips/include/asm/bitops.h:190:10: note: in expansion of macro =
=E2=80=98__test_bit_op=E2=80=99
  190 |   orig =3D __test_bit_op(*m, "%0",
      |          ^~~~~~~~~~~~~
./arch/mips/include/asm/bitops.h:185:21: note: shadowed declaration is here
  185 |  unsigned long res, orig;
      |                     ^~~~
./arch/mips/include/asm/bitops.h: In function =E2=80=98test_and_clear_bit=
=E2=80=99:
./arch/mips/include/asm/bitops.h:46:16: warning: declaration of =E2=80=
=98orig=E2=80=99 shadows a previous local [-Wshadow]
   46 |  unsigned long orig, temp;    \
      |                ^~~~
./arch/mips/include/asm/bitops.h:236:9: note: in expansion of macro =
=E2=80=98__test_bit_op=E2=80=99
  236 |   res =3D __test_bit_op(*m, "%1",
      |         ^~~~~~~~~~~~~
./arch/mips/include/asm/bitops.h:229:21: note: shadowed declaration is here
  229 |  unsigned long res, orig;
      |                     ^~~~
./arch/mips/include/asm/bitops.h:46:16: warning: declaration of =E2=80=
=98orig=E2=80=99 shadows a previous local [-Wshadow]
   46 |  unsigned long orig, temp;    \
      |                ^~~~
./arch/mips/include/asm/bitops.h:241:10: note: in expansion of macro =
=E2=80=98__test_bit_op=E2=80=99
  241 |   orig =3D __test_bit_op(*m, "%0",
      |          ^~~~~~~~~~~~~
./arch/mips/include/asm/bitops.h:229:21: note: shadowed declaration is here
  229 |  unsigned long res, orig;
      |                     ^~~~
./arch/mips/include/asm/bitops.h: In function =E2=80=98test_and_change_bit=
=E2=80=99:
./arch/mips/include/asm/bitops.h:46:16: warning: declaration of =E2=80=
=98orig=E2=80=99 shadows a previous local [-Wshadow]
   46 |  unsigned long orig, temp;    \
      |                ^~~~
./arch/mips/include/asm/bitops.h:273:10: note: in expansion of macro =
=E2=80=98__test_bit_op=E2=80=99
  273 |   orig =3D __test_bit_op(*m, "%0",
      |          ^~~~~~~~~~~~~
./arch/mips/include/asm/bitops.h:266:21: note: shadowed declaration is here
  266 |  unsigned long res, orig;
      |                     ^~~~

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/include/asm/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 1b08f9f38593..dc2a6234dd3c 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -26,7 +26,7 @@
 #include <asm/war.h>
=20
 #define __bit_op(mem, insn, inputs...) do {=09=09=09\
-=09unsigned long temp;=09=09=09=09=09\
+=09unsigned long __temp;=09=09=09=09=09\
 =09=09=09=09=09=09=09=09\
 =09asm volatile(=09=09=09=09=09=09\
 =09"=09.set=09=09push=09=09=09\n"=09\
@@ -37,13 +37,13 @@
 =09"=09" __SC=09=09"%0, %1=09=09=09\n"=09\
 =09"=09" __SC_BEQZ=09"%0, 1b=09=09=09\n"=09\
 =09"=09.set=09=09pop=09=09=09\n"=09\
-=09: "=3D&r"(temp), "+" GCC_OFF_SMALL_ASM()(mem)=09=09\
+=09: "=3D&r"(__temp), "+" GCC_OFF_SMALL_ASM()(mem)=09=09\
 =09: inputs=09=09=09=09=09=09\
 =09: __LLSC_CLOBBER);=09=09=09=09=09\
 } while (0)
=20
 #define __test_bit_op(mem, ll_dst, insn, inputs...) ({=09=09\
-=09unsigned long orig, temp;=09=09=09=09\
+=09unsigned long __orig, __temp;=09=09=09=09\
 =09=09=09=09=09=09=09=09\
 =09asm volatile(=09=09=09=09=09=09\
 =09"=09.set=09=09push=09=09=09\n"=09\
@@ -54,12 +54,12 @@
 =09"=09" __SC=09=09"%1, %2=09=09=09\n"=09\
 =09"=09" __SC_BEQZ=09"%1, 1b=09=09=09\n"=09\
 =09"=09.set=09=09pop=09=09=09\n"=09\
-=09: "=3D&r"(orig), "=3D&r"(temp),=09=09=09=09\
+=09: "=3D&r"(__orig), "=3D&r"(__temp),=09=09=09=09\
 =09  "+" GCC_OFF_SMALL_ASM()(mem)=09=09=09=09\
 =09: inputs=09=09=09=09=09=09\
 =09: __LLSC_CLOBBER);=09=09=09=09=09\
 =09=09=09=09=09=09=09=09\
-=09orig;=09=09=09=09=09=09=09\
+=09__orig;=09=09=09=09=09=09=09\
 })
=20
 /*
--=20
2.30.0


