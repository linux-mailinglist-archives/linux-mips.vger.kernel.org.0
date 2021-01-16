Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78C12F8E9B
	for <lists+linux-mips@lfdr.de>; Sat, 16 Jan 2021 19:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbhAPSL7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Jan 2021 13:11:59 -0500
Received: from mail-41103.protonmail.ch ([185.70.41.103]:23431 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbhAPSLq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Jan 2021 13:11:46 -0500
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com [51.89.119.103])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 1E8FF2000A6E;
        Sat, 16 Jan 2021 15:04:11 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="W2c3xXYW"
Date:   Sat, 16 Jan 2021 15:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1610809366; bh=szQc7ok2ZUzEIxdMp0cTbpcM6sRv6WQkySAgozBWZyU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=W2c3xXYWubUtOxfVEZfaO5twJlLniiEDoWstyU8bubpsvOYvTuY3cT31B0bLCpKLq
         wgehgIqwGbo13PYmsbwFoToxOsePdIok0tCeQsG6h28iSZ64I2HbzsXK12ijFjBVFa
         0EUpeuwG/ibwbCtDcEIV5VESmghvsyxScCQXJL7DB86a8o3GUXqmb+sJqcnZaUij2X
         Ieg0s+k3SCkQ589OVGed1UQxEzDzWd+fmro1yxIViNO32hOXYDHdoM0VTMgANqeC+w
         Z9b3dwMN1Nz+PmpQxVbCtp+c4S0f6aE9l2c+vanPP9xblS9/ZBETUICIXWS0JY/hjH
         /oCVL2nAqXulg==
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
Subject: [PATCH mips-next 1/2] MIPS: module: optimize module relocations processing
Message-ID: <20210116150225.21127-1-alobakin@pm.me>
In-Reply-To: <20210116150126.20693-1-alobakin@pm.me>
References: <20210116150126.20693-1-alobakin@pm.me>
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

For now, module relocation functions are implemented as an array
of handlers of type reloc_handler_t.

Convert that array into a single switch-case function to:
 - remove unused arguments;
 - change the return type of simple handlers to void;
 - remove the array and don't use any data at all;
 - avoid using indirect calls;
 - allow the compiler to inline and greatly optimize
   the relocation function[s].

The result on MIPS32 R2 with GCC 10.2 -O2 is:

scripts/bloat-o-meter -c arch/mips/kernel/__module.o arch/mips/kernel/modul=
e.o
add/remove: 1/11 grow/shrink: 1/0 up/down: 876/-1436 (-560)
Function                                     old     new   delta
apply_relocate                               456    1148    +692
apply_r_mips_pc                                -     184    +184
apply_r_mips_none                              8       -      -8
apply_r_mips_32                               16       -     -16
apply_r_mips_64                               76       -     -76
apply_r_mips_highest                          88       -     -88
apply_r_mips_higher                          108       -    -108
apply_r_mips_26                              132       -    -132
apply_r_mips_pc26                            160       -    -160
apply_r_mips_pc21                            160       -    -160
apply_r_mips_pc16                            160       -    -160
apply_r_mips_hi16                            172       -    -172
apply_r_mips_lo16                            356       -    -356
Total: Before=3D2608, After=3D2048, chg -21.47%
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Data                                         old     new   delta
Total: Before=3D12, After=3D12, chg +0.00%
add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-248 (-248)
RO Data                                      old     new   delta
reloc_handlers                               248       -    -248
Total: Before=3D248, After=3D0, chg -100.00%

All functions were collapsed into a single one that is called
directly by $(srctree)/kernel/module.c.

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/kernel/module.c | 109 ++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 57 deletions(-)

diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 3c0c3d1260c1..14f46d17500a 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -40,22 +40,13 @@ void *module_alloc(unsigned long size)
 }
 #endif
=20
-static int apply_r_mips_none(struct module *me, u32 *location,
-=09=09=09     u32 base, Elf_Addr v, bool rela)
-{
-=09return 0;
-}
-
-static int apply_r_mips_32(struct module *me, u32 *location,
-=09=09=09   u32 base, Elf_Addr v, bool rela)
+static void apply_r_mips_32(u32 *location, u32 base, Elf_Addr v)
 {
 =09*location =3D base + v;
-
-=09return 0;
 }
=20
-static int apply_r_mips_26(struct module *me, u32 *location,
-=09=09=09   u32 base, Elf_Addr v, bool rela)
+static int apply_r_mips_26(struct module *me, u32 *location, u32 base,
+=09=09=09   Elf_Addr v)
 {
 =09if (v % 4) {
 =09=09pr_err("module %s: dangerous R_MIPS_26 relocation\n",
@@ -75,8 +66,8 @@ static int apply_r_mips_26(struct module *me, u32 *locati=
on,
 =09return 0;
 }
=20
-static int apply_r_mips_hi16(struct module *me, u32 *location,
-=09=09=09     u32 base, Elf_Addr v, bool rela)
+static int apply_r_mips_hi16(struct module *me, u32 *location, Elf_Addr v,
+=09=09=09     bool rela)
 {
 =09struct mips_hi16 *n;
=20
@@ -217,26 +208,25 @@ static int apply_r_mips_pc(struct module *me, u32 *lo=
cation, u32 base,
 =09return 0;
 }
=20
-static int apply_r_mips_pc16(struct module *me, u32 *location,
-=09=09=09     u32 base, Elf_Addr v, bool rela)
+static int apply_r_mips_pc16(struct module *me, u32 *location, u32 base,
+=09=09=09     Elf_Addr v)
 {
 =09return apply_r_mips_pc(me, location, base, v, 16);
 }
=20
-static int apply_r_mips_pc21(struct module *me, u32 *location,
-=09=09=09     u32 base, Elf_Addr v, bool rela)
+static int apply_r_mips_pc21(struct module *me, u32 *location, u32 base,
+=09=09=09     Elf_Addr v)
 {
 =09return apply_r_mips_pc(me, location, base, v, 21);
 }
=20
-static int apply_r_mips_pc26(struct module *me, u32 *location,
-=09=09=09     u32 base, Elf_Addr v, bool rela)
+static int apply_r_mips_pc26(struct module *me, u32 *location, u32 base,
+=09=09=09     Elf_Addr v)
 {
 =09return apply_r_mips_pc(me, location, base, v, 26);
 }
=20
-static int apply_r_mips_64(struct module *me, u32 *location,
-=09=09=09   u32 base, Elf_Addr v, bool rela)
+static int apply_r_mips_64(u32 *location, Elf_Addr v, bool rela)
 {
 =09if (WARN_ON(!rela))
 =09=09return -EINVAL;
@@ -246,8 +236,7 @@ static int apply_r_mips_64(struct module *me, u32 *loca=
tion,
 =09return 0;
 }
=20
-static int apply_r_mips_higher(struct module *me, u32 *location,
-=09=09=09       u32 base, Elf_Addr v, bool rela)
+static int apply_r_mips_higher(u32 *location, Elf_Addr v, bool rela)
 {
 =09if (WARN_ON(!rela))
 =09=09return -EINVAL;
@@ -258,8 +247,7 @@ static int apply_r_mips_higher(struct module *me, u32 *=
location,
 =09return 0;
 }
=20
-static int apply_r_mips_highest(struct module *me, u32 *location,
-=09=09=09=09u32 base, Elf_Addr v, bool rela)
+static int apply_r_mips_highest(u32 *location, Elf_Addr v, bool rela)
 {
 =09if (WARN_ON(!rela))
 =09=09return -EINVAL;
@@ -272,12 +260,14 @@ static int apply_r_mips_highest(struct module *me, u3=
2 *location,
=20
 /**
  * reloc_handler() - Apply a particular relocation to a module
+ * @type: type of the relocation to apply
  * @me: the module to apply the reloc to
  * @location: the address at which the reloc is to be applied
  * @base: the existing value at location for REL-style; 0 for RELA-style
  * @v: the value of the reloc, with addend for RELA-style
+ * @rela: indication of is this a RELA (true) or REL (false) relocation
  *
- * Each implemented reloc_handler function applies a particular type of
+ * Each implemented relocation function applies a particular type of
  * relocation to the module @me. Relocs that may be found in either REL or=
 RELA
  * variants can be handled by making use of the @base & @v parameters whic=
h are
  * set to values which abstract the difference away from the particular re=
loc
@@ -285,23 +275,40 @@ static int apply_r_mips_highest(struct module *me, u3=
2 *location,
  *
  * Return: 0 upon success, else -ERRNO
  */
-typedef int (*reloc_handler)(struct module *me, u32 *location,
-=09=09=09     u32 base, Elf_Addr v, bool rela);
-
-/* The handlers for known reloc types */
-static reloc_handler reloc_handlers[] =3D {
-=09[R_MIPS_NONE]=09=09=3D apply_r_mips_none,
-=09[R_MIPS_32]=09=09=3D apply_r_mips_32,
-=09[R_MIPS_26]=09=09=3D apply_r_mips_26,
-=09[R_MIPS_HI16]=09=09=3D apply_r_mips_hi16,
-=09[R_MIPS_LO16]=09=09=3D apply_r_mips_lo16,
-=09[R_MIPS_PC16]=09=09=3D apply_r_mips_pc16,
-=09[R_MIPS_64]=09=09=3D apply_r_mips_64,
-=09[R_MIPS_HIGHER]=09=09=3D apply_r_mips_higher,
-=09[R_MIPS_HIGHEST]=09=3D apply_r_mips_highest,
-=09[R_MIPS_PC21_S2]=09=3D apply_r_mips_pc21,
-=09[R_MIPS_PC26_S2]=09=3D apply_r_mips_pc26,
-};
+static int reloc_handler(u32 type, struct module *me, u32 *location, u32 b=
ase,
+=09=09=09 Elf_Addr v, bool rela)
+{
+=09switch (type) {
+=09case R_MIPS_NONE:
+=09=09break;
+=09case R_MIPS_32:
+=09=09apply_r_mips_32(location, base, v);
+=09=09break;
+=09case R_MIPS_26:
+=09=09return apply_r_mips_26(me, location, base, v);
+=09case R_MIPS_HI16:
+=09=09return apply_r_mips_hi16(me, location, v, rela);
+=09case R_MIPS_LO16:
+=09=09return apply_r_mips_lo16(me, location, base, v, rela);
+=09case R_MIPS_PC16:
+=09=09return apply_r_mips_pc16(me, location, base, v);
+=09case R_MIPS_PC21_S2:
+=09=09return apply_r_mips_pc21(me, location, base, v);
+=09case R_MIPS_PC26_S2:
+=09=09return apply_r_mips_pc26(me, location, base, v);
+=09case R_MIPS_64:
+=09=09return apply_r_mips_64(location, v, rela);
+=09case R_MIPS_HIGHER:
+=09=09return apply_r_mips_higher(location, v, rela);
+=09case R_MIPS_HIGHEST:
+=09=09return apply_r_mips_highest(location, v, rela);
+=09default:
+=09=09pr_err("%s: Unknown relocation type %u\n", me->name, type);
+=09=09return -EINVAL;
+=09}
+
+=09return 0;
+}
=20
 static int __apply_relocate(Elf_Shdr *sechdrs, const char *strtab,
 =09=09=09    unsigned int symindex, unsigned int relsec,
@@ -311,7 +318,6 @@ static int __apply_relocate(Elf_Shdr *sechdrs, const ch=
ar *strtab,
 =09=09Elf_Mips_Rel *rel;
 =09=09Elf_Mips_Rela *rela;
 =09} r;
-=09reloc_handler handler;
 =09Elf_Sym *sym;
 =09u32 *location, base;
 =09unsigned int i, type;
@@ -343,17 +349,6 @@ static int __apply_relocate(Elf_Shdr *sechdrs, const c=
har *strtab,
 =09=09}
=20
 =09=09type =3D ELF_MIPS_R_TYPE(*r.rel);
-=09=09if (type < ARRAY_SIZE(reloc_handlers))
-=09=09=09handler =3D reloc_handlers[type];
-=09=09else
-=09=09=09handler =3D NULL;
-
-=09=09if (!handler) {
-=09=09=09pr_err("%s: Unknown relocation type %u\n",
-=09=09=09       me->name, type);
-=09=09=09err =3D -EINVAL;
-=09=09=09goto out;
-=09=09}
=20
 =09=09if (rela) {
 =09=09=09v =3D sym->st_value + r.rela->r_addend;
@@ -365,7 +360,7 @@ static int __apply_relocate(Elf_Shdr *sechdrs, const ch=
ar *strtab,
 =09=09=09r.rel =3D &r.rel[1];
 =09=09}
=20
-=09=09err =3D handler(me, location, base, v, rela);
+=09=09err =3D reloc_handler(type, me, location, base, v, rela);
 =09=09if (err)
 =09=09=09goto out;
 =09}
--=20
2.30.0


