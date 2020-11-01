Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B474F2A1EE9
	for <lists+linux-mips@lfdr.de>; Sun,  1 Nov 2020 16:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgKAPNS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Nov 2020 10:13:18 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:52700 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbgKAPNS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Nov 2020 10:13:18 -0500
Date:   Sun, 01 Nov 2020 15:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1604243592; bh=r7VPPdvNAzF9CgvJDErC+SkdSrKz+wzaXEr5lvipxXw=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=HxW/l+vCx48Rpye0VEwu1kFCS0fXtlN4zd26a8p9ojYYWJ0XT/I7ePjFZtxf/3q9w
         WF/OmyDydikGFWNvg37+Y1WgH5iDz3ZlquLqwSr0tOKr119y2rV+TkicRpC6irqZjf
         NemLvsKH0UujBx3H0pZi7zjHvl83TudfM31siRu/8pRkZzTml9IQmu+TdeipsnQddP
         ZZJyZksxlzBMOeQo6NRcrjPCFma6337M8/+sL5U/B86MY2gJyls2YGQHE8XvChJ3B/
         gAaCJ7KXUkgyOHTwPYYDX28xTRLoX+TrTjWaKckpxvCmlDf4enrt3qLEbbztOE3MlF
         dF/PTEk3/Bfzw==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 2/2] mips: boot: add support for self-extracting FIT images (vmlinuz.itb)
Message-ID: <WGqR3V4gpnacbqUy0YPJaQlGbYRov7NmnVOr8w4wMVk@cp4-web-036.plabs.ch>
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

Commit c3e2ee657418 ("MIPS: generic: Add support for zboot") added
support for self-extracting images to Generic MIPS. However, the
intended way to boot Generic MIPS kernels is using FIT Images and
UHI boot protocol, but currently there's no way to make self-extracting
FIT Image (only legacy uzImages).
Add a target for this named "vmlinuz.itb", which will consist of
vmlinuz.bin and selected DT blobs. It will allow to have the advantages
of both UHI and self-extracting images.

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/Makefile                 |  1 +
 arch/mips/boot/compressed/Makefile | 48 ++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 622ee83dbb9b..cd4343edeb11 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -347,6 +347,7 @@ bootz-y=09=09=09+=3D vmlinuz.srec
 ifeq ($(shell expr $(zload-y) \< 0xffffffff80000000 2> /dev/null), 0)
 bootz-y=09=09=09+=3D uzImage.bin
 endif
+bootz-y=09=09=09+=3D vmlinuz.itb
=20
 #
 # Some machines like the Indy need 32-bit ELF binaries for booting purpose=
s.
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed=
/Makefile
index fa2c1e1b303f..4c3bc7e3d56d 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -172,3 +172,51 @@ targets +=3D ../uzImage.bin
=20
 $(objboot)/uzImage.bin: $(objboot)/vmlinuz.bin FORCE
 =09$(call if_changed,uimage,none)
+
+#
+# Flattened Image Tree (.itb) image
+#
+
+ifeq ($(ADDR_BITS),32)
+itb_addr_cells =3D 1
+endif
+ifeq ($(ADDR_BITS),64)
+itb_addr_cells =3D 2
+endif
+
+targets +=3D ../vmlinuz.its.S
+
+quiet_cmd_its_cat =3D CAT     $@
+      cmd_its_cat =3D cat $(real-prereqs) >$@
+
+$(objboot)/vmlinuz.its.S: $(addprefix $(srctree)/arch/mips/$(PLATFORM)/,$(=
ITS_INPUTS)) FORCE
+=09$(call if_changed,its_cat)
+
+targets +=3D ../vmlinuz.its
+
+quiet_cmd_cpp_its_S =3D ITS     $@
+      cmd_cpp_its_S =3D $(CPP) -P -C -o $@ $< \
+=09=09        -DKERNEL_NAME=3D"\"Linux $(KERNELRELEASE)\"" \
+=09=09=09-DVMLINUX_BINARY=3D"\"$(2)\"" \
+=09=09=09-DVMLINUX_COMPRESSION=3D"\"none\"" \
+=09=09=09-DVMLINUX_LOAD_ADDRESS=3D$(VMLINUZ_LOAD_ADDRESS) \
+=09=09=09-DVMLINUX_ENTRY_ADDRESS=3D$(VMLINUZ_LOAD_ADDRESS) \
+=09=09=09-DADDR_BITS=3D$(ADDR_BITS) \
+=09=09=09-DADDR_CELLS=3D$(itb_addr_cells)
+
+$(objboot)/vmlinuz.its: $(objboot)/vmlinuz.its.S FORCE
+=09$(call if_changed,cpp_its_S,vmlinuz.bin)
+
+targets +=3D ../vmlinuz.itb
+
+quiet_cmd_itb-image =3D ITB     $@
+      cmd_itb-image =3D \
+=09=09env PATH=3D"$(objtree)/scripts/dtc:$(PATH)" \
+=09=09$(BASH) $(MKIMAGE) \
+=09=09-D "-I dts -O dtb -p 500 \
+=09=09=09--include $(objtree)/arch/mips \
+=09=09=09--warning no-unit_address_vs_reg" \
+=09=09-f $(2) $@
+
+$(objboot)/vmlinuz.itb: $(objboot)/vmlinuz.its $(objboot)/vmlinuz.bin FORC=
E
+=09$(call if_changed,itb-image,$<)
--=20
2.29.2


