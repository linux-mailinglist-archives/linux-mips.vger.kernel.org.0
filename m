Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C502F2E9909
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 16:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbhADPml (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 10:42:41 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:25825 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbhADPml (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 10:42:41 -0500
Date:   Mon, 04 Jan 2021 15:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1609774914; bh=n+CrnFEd2Lw5K6HjyRrpeVi2Si8UENB1mJAwqXegCSA=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=aKt1KmZa7kkUKj6U02aWZirM/7iOS7atgvVWoGItBvC8Y3iWGLj0EkW1nPS2UhntN
         Q2cSQ1LB9UhKPc7zbIBWGlbbAKIdvpu4kEJhp5a9jj3W/mQhCYvoMpXNHQFdXhfWcj
         kaNUWtSEKi2Ka9Uc3GrXQuErigvz6sxzezNlcLO/T4WySD8ee6Pep+hc2oogRB8CTI
         1q9MFQzSId3PfVVa7xSskSP/jEhgYs7JbrvjTk8xhtlDCRRFz3G6CTS7jduaepK1N9
         RC/yxjA0TMyNGto98WOuhd8deYmYcVbuXk3Lae94W6L/EpXTcI5VEjy3bRZ0SfmPhx
         pTEqNdgh2osqA==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Alexander Lobakin <alobakin@pm.me>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next] MIPS: UAPI: unexport unistd_nr_{n32,n64,o32}.h
Message-ID: <20210104154115.213029-1-alobakin@pm.me>
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

unistd_nr_{n32,n64,o32}.h are needed only by include/asm/unistd.h,
which is a kernel-side header file, and their contents is generally
not for userland use.
Move their target destination from include/generated/uapi/asm/ to
include/generated/asm/ to disable exporting them as UAPI headers.

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/include/asm/Kbuild       |  4 ++++
 arch/mips/include/uapi/asm/Kbuild  |  3 ---
 arch/mips/kernel/syscalls/Makefile | 16 ++++++++--------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index 198b3bafdac9..9040ff0b3a14 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -4,6 +4,10 @@ generated-y +=3D syscall_table_32_o32.h
 generated-y +=3D syscall_table_64_n32.h
 generated-y +=3D syscall_table_64_n64.h
 generated-y +=3D syscall_table_64_o32.h
+generated-y +=3D unistd_nr_n32.h
+generated-y +=3D unistd_nr_n64.h
+generated-y +=3D unistd_nr_o32.h
+
 generic-y +=3D export.h
 generic-y +=3D kvm_para.h
 generic-y +=3D local64.h
diff --git a/arch/mips/include/uapi/asm/Kbuild b/arch/mips/include/uapi/asm=
/Kbuild
index 6db08385d3d8..fdb9c5412cd9 100644
--- a/arch/mips/include/uapi/asm/Kbuild
+++ b/arch/mips/include/uapi/asm/Kbuild
@@ -2,8 +2,5 @@
 generated-y +=3D unistd_n32.h
 generated-y +=3D unistd_n64.h
 generated-y +=3D unistd_o32.h
-generated-y +=3D unistd_nr_n32.h
-generated-y +=3D unistd_nr_n64.h
-generated-y +=3D unistd_nr_o32.h
=20
 generic-y +=3D kvm_para.h
diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls=
/Makefile
index 6efb2f6889a7..a1ce8b7dbcfa 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -44,17 +44,17 @@ $(uapi)/unistd_o32.h: $(syscallo32) $(syshdr)
=20
 sysnr_pfx_unistd_nr_n32 :=3D N32
 sysnr_offset_unistd_nr_n32 :=3D 6000
-$(uapi)/unistd_nr_n32.h: $(syscalln32) $(sysnr)
+$(kapi)/unistd_nr_n32.h: $(syscalln32) $(sysnr)
 =09$(call if_changed,sysnr)
=20
 sysnr_pfx_unistd_nr_n64 :=3D 64
 sysnr_offset_unistd_nr_n64 :=3D 5000
-$(uapi)/unistd_nr_n64.h: $(syscalln64) $(sysnr)
+$(kapi)/unistd_nr_n64.h: $(syscalln64) $(sysnr)
 =09$(call if_changed,sysnr)
=20
 sysnr_pfx_unistd_nr_o32 :=3D O32
 sysnr_offset_unistd_nr_o32 :=3D 4000
-$(uapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr)
+$(kapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr)
 =09$(call if_changed,sysnr)
=20
 systbl_abi_syscall_table_32_o32 :=3D 32_o32
@@ -79,14 +79,14 @@ $(kapi)/syscall_table_64_o32.h: $(syscallo32) $(systbl)
=20
 uapisyshdr-y=09=09+=3D unistd_n32.h=09=09=09\
 =09=09=09   unistd_n64.h=09=09=09\
-=09=09=09   unistd_o32.h=09=09=09\
-=09=09=09   unistd_nr_n32.h=09=09\
-=09=09=09   unistd_nr_n64.h=09=09\
-=09=09=09   unistd_nr_o32.h
+=09=09=09   unistd_o32.h
 kapisyshdr-y=09=09+=3D syscall_table_32_o32.h=09\
 =09=09=09   syscall_table_64_n32.h=09\
 =09=09=09   syscall_table_64_n64.h=09\
-=09=09=09   syscall_table_64_o32.h
+=09=09=09   syscall_table_64_o32.h=09\
+=09=09=09   unistd_nr_n32.h=09=09\
+=09=09=09   unistd_nr_n64.h=09=09\
+=09=09=09   unistd_nr_o32.h
=20
 targets=09+=3D $(uapisyshdr-y) $(kapisyshdr-y)
=20
--=20
2.30.0


