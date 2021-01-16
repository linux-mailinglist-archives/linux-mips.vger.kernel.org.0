Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1472F8E98
	for <lists+linux-mips@lfdr.de>; Sat, 16 Jan 2021 19:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbhAPSLj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Jan 2021 13:11:39 -0500
Received: from mail-41104.protonmail.ch ([185.70.41.104]:60772 "EHLO
        mail-41104.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbhAPSLj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Jan 2021 13:11:39 -0500
X-Greylist: delayed 4068 seconds by postgrey-1.27 at vger.kernel.org; Sat, 16 Jan 2021 13:11:36 EST
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com [51.89.119.103])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4281E2004D03
        for <linux-mips@vger.kernel.org>; Sat, 16 Jan 2021 15:04:26 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
        dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="SYvyT19s"
Date:   Sat, 16 Jan 2021 15:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1610809382; bh=a71jRuwHG49p+rEiIK2HsboKsC4ZpRrTSk9k/EY42YM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=SYvyT19s9omQInLAU0wuHr/3iYLXt0OeU6fCva7KLyAs9L93jHWRRf/0RUzvPuQ9r
         v4ZcmN77a2/0siTs1ShKzLMgUyIrPnglgwrq23KX11k2Jx7LO9T9WtUqes96dw3mru
         K4cfsO7io96BS1BG4C9kEhsqDp2BESvmNzaVlsX4e8evZtwumm5yzoYTuBy3bpXnte
         MN9yOCUUfncMAvCyunpW1uf7KyB6Gtf0F7zjiPl8fUehVlj+o16rwJTJaBVx5udixy
         0X1j7jBNPSl+ok+AZnekfnGt2JTHQgkDFNn60qN4Ha0XD/XhPpcOAOMFRphATaP9yK
         9dCiHZHB9zdGg==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 2/2] MIPS: relocatable: optimize the relocation process
Message-ID: <20210116150225.21127-2-alobakin@pm.me>
In-Reply-To: <20210116150225.21127-1-alobakin@pm.me>
References: <20210116150126.20693-1-alobakin@pm.me> <20210116150225.21127-1-alobakin@pm.me>
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

For now, vmlinux relocation functions for relocatable kernel are
implemented as an array of handlers of a particular type.

Convert that array into a single switch-case function to:
 - remove unused arguments;
 - change the return type of simple handlers to void;
 - remove the array and don't use any data at all;
 - avoid using indirect calls;
 - allow the compiler to inline and greatly optimize
   the relocation function[s];

and also mark do_relocations() and show_kernel_relocation() static
as they aren't used anywhere else.

The result on MIPS32 R2 with GCC 10.2 -O2 is:

scripts/bloat-o-meter -c arch/mips/kernel/__relocate.o arch/mips/kernel/rel=
ocate.o
add/remove: 0/6 grow/shrink: 1/0 up/down: 356/-640 (-284)
Function                                     old     new   delta
relocate_kernel                              852    1208    +356
apply_r_mips_32_rel                           20       -     -20
apply_r_mips_hi16_rel                         40       -     -40
apply_r_mips_64_rel                           44       -     -44
apply_r_mips_26_rel                          144       -    -144
show_kernel_relocation                       164       -    -164
do_relocations                               228       -    -228
Total: Before=3D1780, After=3D1496, chg -15.96%
add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-76 (-76)
Data                                         old     new   delta
reloc_handlers_rel                            76       -     -76
Total: Before=3D92, After=3D16, chg -82.61%
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
RO Data                                      old     new   delta
Total: Before=3D0, After=3D0, chg +0.00%

All functions were collapsed into the main one, relocate_kernel().

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/kernel/relocate.c | 54 ++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 47aeb3350a76..c643c816cbe0 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -70,18 +70,14 @@ static void __init sync_icache(void *kbase, unsigned lo=
ng kernel_length)
 =09__sync();
 }
=20
-static int __init apply_r_mips_64_rel(u32 *loc_orig, u32 *loc_new, long of=
fset)
+static void __init apply_r_mips_64_rel(u32 *loc_new, long offset)
 {
 =09*(u64 *)loc_new +=3D offset;
-
-=09return 0;
 }
=20
-static int __init apply_r_mips_32_rel(u32 *loc_orig, u32 *loc_new, long of=
fset)
+static void __init apply_r_mips_32_rel(u32 *loc_new, long offset)
 {
 =09*loc_new +=3D offset;
-
-=09return 0;
 }
=20
 static int __init apply_r_mips_26_rel(u32 *loc_orig, u32 *loc_new, long of=
fset)
@@ -114,7 +110,8 @@ static int __init apply_r_mips_26_rel(u32 *loc_orig, u3=
2 *loc_new, long offset)
 }
=20
=20
-static int __init apply_r_mips_hi16_rel(u32 *loc_orig, u32 *loc_new, long =
offset)
+static void __init apply_r_mips_hi16_rel(u32 *loc_orig, u32 *loc_new,
+=09=09=09=09=09 long offset)
 {
 =09unsigned long insn =3D *loc_orig;
 =09unsigned long target =3D (insn & 0xffff) << 16; /* high 16bits of targe=
t */
@@ -122,17 +119,33 @@ static int __init apply_r_mips_hi16_rel(u32 *loc_orig=
, u32 *loc_new, long offset
 =09target +=3D offset;
=20
 =09*loc_new =3D (insn & ~0xffff) | ((target >> 16) & 0xffff);
-=09return 0;
 }
=20
-static int (*reloc_handlers_rel[]) (u32 *, u32 *, long) __initdata =3D {
-=09[R_MIPS_64]=09=09=3D apply_r_mips_64_rel,
-=09[R_MIPS_32]=09=09=3D apply_r_mips_32_rel,
-=09[R_MIPS_26]=09=09=3D apply_r_mips_26_rel,
-=09[R_MIPS_HI16]=09=09=3D apply_r_mips_hi16_rel,
-};
+static int __init reloc_handler(u32 type, u32 *loc_orig, u32 *loc_new,
+=09=09=09=09long offset)
+{
+=09switch (type) {
+=09case R_MIPS_64:
+=09=09apply_r_mips_64_rel(loc_new, offset);
+=09=09break;
+=09case R_MIPS_32:
+=09=09apply_r_mips_32_rel(loc_new, offset);
+=09=09break;
+=09case R_MIPS_26:
+=09=09return apply_r_mips_26_rel(loc_orig, loc_new, offset);
+=09case R_MIPS_HI16:
+=09=09apply_r_mips_hi16_rel(loc_orig, loc_new, offset);
+=09=09break;
+=09default:
+=09=09pr_err("Unhandled relocation type %d at 0x%pK\n", type,
+=09=09       loc_orig);
+=09=09return -ENOEXEC;
+=09}
=20
-int __init do_relocations(void *kbase_old, void *kbase_new, long offset)
+=09return 0;
+}
+
+static int __init do_relocations(void *kbase_old, void *kbase_new, long of=
fset)
 {
 =09u32 *r;
 =09u32 *loc_orig;
@@ -149,14 +162,7 @@ int __init do_relocations(void *kbase_old, void *kbase=
_new, long offset)
 =09=09loc_orig =3D kbase_old + ((*r & 0x00ffffff) << 2);
 =09=09loc_new =3D RELOCATED(loc_orig);
=20
-=09=09if (reloc_handlers_rel[type] =3D=3D NULL) {
-=09=09=09/* Unsupported relocation */
-=09=09=09pr_err("Unhandled relocation type %d at 0x%pK\n",
-=09=09=09       type, loc_orig);
-=09=09=09return -ENOEXEC;
-=09=09}
-
-=09=09res =3D reloc_handlers_rel[type](loc_orig, loc_new, offset);
+=09=09res =3D reloc_handler(type, loc_orig, loc_new, offset);
 =09=09if (res)
 =09=09=09return res;
 =09}
@@ -412,7 +418,7 @@ void *__init relocate_kernel(void)
 /*
  * Show relocation information on panic.
  */
-void show_kernel_relocation(const char *level)
+static void show_kernel_relocation(const char *level)
 {
 =09unsigned long offset;
=20
--=20
2.30.0


