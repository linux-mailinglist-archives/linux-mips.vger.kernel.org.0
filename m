Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CC22A1EE7
	for <lists+linux-mips@lfdr.de>; Sun,  1 Nov 2020 16:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgKAPNF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Nov 2020 10:13:05 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:52698 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgKAPNE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Nov 2020 10:13:04 -0500
Date:   Sun, 01 Nov 2020 15:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1604243576; bh=tx/dRo80n5uKCm55+fUENYot/kyMGnent/1JntjdJ9Q=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=IfX2enEnr5Lxe/hyFG6eiAzw+K69nk5fbmZJaSDuiQE6zFvTiVqQFbBqv+348Fyz5
         G9sdPyoeptX5oKqHx0eu5G7pxZBKnFxbmFzQBdfEm/6LTL00nLQopyDElLjTQcOo4t
         Lh5QQRVHfesZEAyUNwVyoQGtZcgSG/q2ahwGegubuQbg00dlhyvhpoXTjXUcX4GlaK
         FwWoph5FekAshqNWDp9+KocZzHZmz0Q1JE3YDNudOo/sPHT4da3VuRywaApbU++r9G
         icDcoy9QZM8uhTI93M9SH3jdeLnQxbq7d3/8Gshd4GwM/VNK/O3r+aMHPFFbKocLPD
         Q4NOHDczO8qBQ==
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
Subject: [PATCH mips-next 1/2] mips: boot: clean up self-extracting targets scenarios
Message-ID: <oYZzkIPMANKiEDPCYkSSsKoesUf0A2V1IJr1XUOcUg@cp3-web-009.plabs.ch>
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

1. All final targets like vmlinuz.{bin,ecoff,srec} etc. should reside in
   $(objtree)/arch/mips/boot, not in the root $(objtree) directory.
   The only file that should be left there is vmlinuz, similar to other
   architectures.
2. Add all the targets to $(targets) variable, so they'll be properly
   accounted by Kbuild. This also allows to remove redundant
   $(clean-files) (which were missing uzImage BTW).
3. Prefix all targets with $(obj)/$(objtree), depending on their
   locations.

Misc: fix the identation of the 'STRIP' quiet message.

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/Makefile                 |  2 +-
 arch/mips/boot/.gitignore          |  1 +
 arch/mips/boot/compressed/Makefile | 50 +++++++++++++++++++++---------
 3 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 0d0f29d662c9..622ee83dbb9b 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -378,7 +378,7 @@ ifdef CONFIG_SYS_SUPPORTS_ZBOOT
 # boot/compressed
 $(bootz-y): $(vmlinux-32) FORCE
 =09$(Q)$(MAKE) $(build)=3Darch/mips/boot/compressed \
-=09=09$(bootvars-y) 32bit-bfd=3D$(32bit-bfd) $@
+=09=09$(bootvars-y) 32bit-bfd=3D$(32bit-bfd) arch/mips/boot/$@
 else
 vmlinuz: FORCE
 =09@echo '   CONFIG_SYS_SUPPORTS_ZBOOT is not enabled'
diff --git a/arch/mips/boot/.gitignore b/arch/mips/boot/.gitignore
index 2adc8581a175..1c7adddf2e60 100644
--- a/arch/mips/boot/.gitignore
+++ b/arch/mips/boot/.gitignore
@@ -2,6 +2,7 @@
 mkboot
 elf2ecoff
 vmlinux.*
+vmlinuz.*
 zImage
 zImage.tmp
 calc_vmlinuz_load_addr
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed=
/Makefile
index d66511825fe1..fa2c1e1b303f 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -65,7 +65,9 @@ $(obj)/bswapsi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.=
c FORCE
 targets :=3D $(notdir $(vmlinuzobjs-y))
=20
 targets +=3D vmlinux.bin
+
 OBJCOPYFLAGS_vmlinux.bin :=3D $(OBJCOPYFLAGS) -O binary -R .comment -S
+
 $(obj)/vmlinux.bin: $(KBUILD_IMAGE) FORCE
 =09$(call if_changed,objcopy)
=20
@@ -78,12 +80,15 @@ tool_$(CONFIG_KERNEL_XZ)      =3D xzkern
 tool_$(CONFIG_KERNEL_ZSTD)    =3D zstd22
=20
 targets +=3D vmlinux.bin.z
+
 $(obj)/vmlinux.bin.z: $(obj)/vmlinux.bin FORCE
 =09$(call if_changed,$(tool_y))
=20
 targets +=3D piggy.o dummy.o
+
 OBJCOPYFLAGS_piggy.o :=3D --add-section=3D.image=3D$(obj)/vmlinux.bin.z \
 =09=09=09--set-section-flags=3D.image=3Dcontents,alloc,load,readonly,data
+
 $(obj)/piggy.o: $(obj)/dummy.o $(obj)/vmlinux.bin.z FORCE
 =09$(call if_changed,objcopy)
=20
@@ -102,14 +107,21 @@ UIMAGE_LOADADDR =3D $(VMLINUZ_LOAD_ADDRESS)
=20
 vmlinuzobjs-y +=3D $(obj)/piggy.o
=20
+targets +=3D ../../../../vmlinuz
+
 quiet_cmd_zld =3D LD      $@
       cmd_zld =3D $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LOAD_ADDRESS) -=
T $< $(vmlinuzobjs-y) -o $@
-quiet_cmd_strip =3D STRIP=09  $@
+quiet_cmd_strip =3D STRIP   $@
       cmd_strip =3D $(STRIP) -s $@
-vmlinuz: $(src)/ld.script $(vmlinuzobjs-y) $(obj)/calc_vmlinuz_load_addr
+
+$(objtree)/vmlinuz: $(src)/ld.script $(vmlinuzobjs-y) $(obj)/calc_vmlinuz_=
load_addr
 =09$(call cmd,zld)
 =09$(call cmd,strip)
=20
+objboot :=3D $(objtree)/arch/mips/boot
+
+$(objboot)/vmlinuz: $(objtree)/vmlinuz FORCE
+
 #
 # Some DECstations need all possible sections of an ECOFF executable
 #
@@ -121,34 +133,42 @@ endif
 hostprogs +=3D ../elf2ecoff
=20
 ifdef CONFIG_32BIT
-=09VMLINUZ =3D vmlinuz
+=09VMLINUZ =3D $(objtree)/vmlinuz
 else
-=09VMLINUZ =3D vmlinuz.32
+=09VMLINUZ =3D $(objboot)/vmlinuz.32
 endif
=20
+targets +=3D ../vmlinuz.32
+
 quiet_cmd_32 =3D OBJCOPY $@
       cmd_32 =3D $(OBJCOPY) -O $(32bit-bfd) $(OBJCOPYFLAGS) $< $@
-vmlinuz.32: vmlinuz
+
+$(objboot)/vmlinuz.32: $(objtree)/vmlinuz
 =09$(call cmd,32)
=20
+targets +=3D ../vmlinuz.ecoff
+
 quiet_cmd_ecoff =3D ECOFF=09  $@
       cmd_ecoff =3D $< $(VMLINUZ) $@ $(e2eflag)
-vmlinuz.ecoff: $(obj)/../elf2ecoff $(VMLINUZ)
+
+$(objboot)/vmlinuz.ecoff: $(objboot)/elf2ecoff $(VMLINUZ)
 =09$(call cmd,ecoff)
=20
+targets +=3D ../vmlinuz.bin
+
 OBJCOPYFLAGS_vmlinuz.bin :=3D $(OBJCOPYFLAGS) -O binary
-vmlinuz.bin: vmlinuz
+
+$(objboot)/vmlinuz.bin: $(objtree)/vmlinuz
 =09$(call cmd,objcopy)
=20
+targets +=3D ../vmlinuz.srec
+
 OBJCOPYFLAGS_vmlinuz.srec :=3D $(OBJCOPYFLAGS) -S -O srec
-vmlinuz.srec: vmlinuz
+
+$(objboot)/vmlinuz.srec: $(objtree)/vmlinuz
 =09$(call cmd,objcopy)
=20
-uzImage.bin: vmlinuz.bin FORCE
-=09$(call if_changed,uimage,none)
+targets +=3D ../uzImage.bin
=20
-clean-files +=3D $(objtree)/vmlinuz
-clean-files +=3D $(objtree)/vmlinuz.32
-clean-files +=3D $(objtree)/vmlinuz.ecoff
-clean-files +=3D $(objtree)/vmlinuz.bin
-clean-files +=3D $(objtree)/vmlinuz.srec
+$(objboot)/uzImage.bin: $(objboot)/vmlinuz.bin FORCE
+=09$(call if_changed,uimage,none)
--=20
2.29.2


