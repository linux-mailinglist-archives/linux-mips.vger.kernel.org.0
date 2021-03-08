Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D07330FD2
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 14:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhCHNqW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 08:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhCHNqF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 08:46:05 -0500
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF9CC06174A
        for <linux-mips@vger.kernel.org>; Mon,  8 Mar 2021 05:46:05 -0800 (PST)
Received: from miraculix.mork.no (fwa153.mork.no [192.168.9.153])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 128DjvQl025472
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 8 Mar 2021 14:45:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1615211157; bh=g8t3Kwr2yBg29PmpsGfghJSnCh3nRpE2B5pHrb0jdpk=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=WGTkwZM0222jtGoRNHZcKPrWpHRSnemPaY0JBgLc92Ma92IbUS+DN8klLE3llfkLh
         t6c6pKOFKy9JLgfUH71hXtj04G65tCpRCEDrKQ+x6wK7Jv4FruxdbylgUBgzsMa6z3
         uKEhTnJCeO/ygA56OVGAm+JipZjunIiT9N/vvu1s=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
        (envelope-from <bjorn@mork.no>)
        id 1lJGCr-000DeF-9D; Mon, 08 Mar 2021 14:45:57 +0100
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] MIPS: vmlinux.lds.S: align raw appended dtb to 8 bytes
Organization: m
References: <20210307182301.20710-1-bjorn@mork.no>
        <20210308105550.GC6622@alpha.franken.de>
        <87h7llc34m.fsf@miraculix.mork.no>
        <20210308125348.GA7976@alpha.franken.de>
Date:   Mon, 08 Mar 2021 14:45:57 +0100
In-Reply-To: <20210308125348.GA7976@alpha.franken.de> (Thomas Bogendoerfer's
        message of "Mon, 8 Mar 2021 13:53:49 +0100")
Message-ID: <878s6xbvxm.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Bogendoerfer <tsbogend@alpha.franken.de> writes:

> I see
>
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.ld=
s.S
> index c1c345be04ff..4b4e39b7c79b 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -145,6 +145,7 @@ SECTIONS
>         }
>=20=20
>  #ifdef CONFIG_MIPS_ELF_APPENDED_DTB
> +       STRUCT_ALIGN();
>         .appended_dtb : AT(ADDR(.appended_dtb) - LOAD_OFFSET) {
>                 *(.appended_dtb)
>                 KEEP(*(.appended_dtb))
> @@ -172,6 +173,7 @@ SECTIONS
>  #endif
>=20=20
>  #ifdef CONFIG_MIPS_RAW_APPENDED_DTB
> +       STRUCT_ALIGN();
>         __appended_dtb =3D .;
>         /* leave space for appended DTB */
>         . +=3D 0x100000;
>
> in that patch, and IMHO this does align the appended_dtb. What do I miss ?

I'll not pretend I know anything about this subject, so feel free to
adjust as necessary.

The problem with that patch is that it doesn't pad the image to the
aligment.   So you can't do

 cat my.dtb >> arch/mips/boot/vmlinux.bin

anymore.  This used to work before commit 79edff12060f.

This is an image build with that patch and an initramfs:

 bjorn@canardo:/usr/local/src/build-tmp/linux$ ls -l arch/mips/boot/vmlinux=
.bin
 -rwxr-xr-x 1 bjorn src 15724964 Mar  8 14:21 arch/mips/boot/vmlinux.bin

So that's aligned to 4 bytes, because it's terminated by the 32bit
length of the initramfs:
=20
 15724964/8
 1965620.50000000000000000000


Building with the attached patch results in:

 bjorn@canardo:/usr/local/src/build-tmp/linux$ ls -l arch/mips/boot/vmlinux=
.bin
 -rwxr-xr-x 1 bjorn src 15724992 Mar  8 14:29 arch/mips/boot/vmlinux.bin

Which is aligned to the 32 bytes expected after STRUCT_ALIGN():

15724992/8
1965624.00000000000000000000

The tail of the image shows the cpio trailer and cpio length
(0x0061f400) followed by enough padding to align an appended DTB to 32
bytes:

 bjorn@canardo:/usr/local/src/build-tmp/linux$ ls -l arch/mips/boot/vmlinux=
.bin
 -rwxr-xr-x 1 bjorn src 15724992 Mar  8 14:29 arch/mips/boot/vmlinux.bin
 bjorn@canardo:/usr/local/src/build-tmp/linux$ hexdump -C arch/mips/boot/vm=
linux.bin|tail
 00eff090  30 30 30 30 30 30 30 30  30 31 30 30 30 30 30 30  |0000000001000=
000|
 00eff0a0  30 30 30 30 30 30 30 30  30 30 30 30 30 30 30 30  |0000000000000=
000|
 *
 00eff0d0  30 42 30 30 30 30 30 30  30 30 54 52 41 49 4c 45  |0B00000000TRA=
ILE|
 00eff0e0  52 21 21 21 00 00 00 00  00 00 00 00 00 00 00 00  |R!!!.........=
...|
 00eff0f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
 *
 00eff1a0  00 61 f4 00 00 00 00 00  00 00 00 00 00 00 00 00  |.a...........=
...|
 00eff1b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.............=
...|
 00eff1c0



Yes, you can always pad the image yourself if you know about this
alignment requirement.  But it gets more complicated.  And it breaks my
home grown hackish build script. I know I'm not the only one...


Bj=C3=B8rn


--=-=-=
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: inline;
 filename=0001-MIPS-vmlinux.lds.S-fill-vmlinux.bin-to-DTB-alignment.patch
Content-Transfer-Encoding: quoted-printable

From c1bd611ae62db46db12d86196cade2613a291400 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Bj=3DC3=3DB8rn=3D20Mork?=3D <bjorn@mork.no>
Date: Mon, 8 Mar 2021 14:24:17 +0100
Subject: [PATCH] MIPS: vmlinux.lds.S: fill vmlinux.bin to DTB alignment
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Padding the binary to the required alignment for raw appended
DTBs so that it is possible to append one without detailed
knowledge of this requirement.

Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
---
 arch/mips/kernel/vmlinux.lds.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 4b4e39b7c79b..1f98947fe715 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -173,7 +173,11 @@ SECTIONS
 #endif
=20
 #ifdef CONFIG_MIPS_RAW_APPENDED_DTB
-	STRUCT_ALIGN();
+	.fill : {
+		FILL(0);
+		BYTE(0);
+		STRUCT_ALIGN();
+	}
 	__appended_dtb =3D .;
 	/* leave space for appended DTB */
 	. +=3D 0x100000;
--=20
2.20.1


--=-=-=--
