Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154DF2022DA
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jun 2020 11:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgFTJe5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Jun 2020 05:34:57 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:32218 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbgFTJe4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 20 Jun 2020 05:34:56 -0400
Date:   Sat, 20 Jun 2020 09:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1592645694; bh=agNVtYyFVqOBDHZGb6RZWP94lkQhp18/tjm/4c8bTHY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=mWjxeu+JH7vswWbq8t1FQGPD3AKApQlQopiFf+wEtsvR3Qmh3MKXhWbFBpLKJzaIg
         oS9uT7imSL5OwgErXQOYXKPzAuM7RPLnhQgioCWIijpaOkI0BYMeRk2Uy6/1SMX2xU
         l+BNRJ+1joIdlRmwi8UY4Gs2WzbQKFEbf4OMCr7XHvGuUg4GDG8QwFrOdcdts7VMZg
         4I9YwvryOfyDrAxqqA0g+SIGoltrJafuEO5nIfj2zPSOKc5WGvrFIA6k4yeagmOsRc
         31eVG8XKntKR+j1wiDXCyT5eudkz90pvS6SYhzIGhWFn7XxMz8KweAWKzdalcwKxPD
         nXwFRRbRBGrzQ==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Paul Burton <paulburton@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 1/3] MIPS: generic/ip32: io: fix __mem_ioswabq()
Message-ID: <RAoD2jLl8oMTRwtBmAR-ulz4YFtWgKdqDy27huG3gwHewm5Os2Ce0lD8sECV1w0lIjH3wAQDdecTbSnJKwfQCpnnYYA39NKuiUi00xiBoB0=@pm.me>
In-Reply-To: <OXAnLrccR2GxIpepN5IUjppNnjyVAnjQmCIx2RmgpMLsOzOBgXMKYvmjivy4Rq0bAVf11R5V9_FwfGx-MML3dShuOOoPUtAHUHUedlVrW_g=@pm.me>
References: <OXAnLrccR2GxIpepN5IUjppNnjyVAnjQmCIx2RmgpMLsOzOBgXMKYvmjivy4Rq0bAVf11R5V9_FwfGx-MML3dShuOOoPUtAHUHUedlVrW_g=@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

*readq() family operates with u64 arguments, so they need 64-bit
byteswaps.
Correct macros for Generic MIPS and IP-32 to match other machines'
implementations.

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/include/asm/mach-generic/mangle-port.h | 2 +-
 arch/mips/include/asm/mach-ip32/mangle-port.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-generic/mangle-port.h b/arch/mips/i=
nclude/asm/mach-generic/mangle-port.h
index f49dc990214b..e4daf163706c 100644
--- a/arch/mips/include/asm/mach-generic/mangle-port.h
+++ b/arch/mips/include/asm/mach-generic/mangle-port.h
@@ -45,7 +45,7 @@
 # define ioswabl(a, x)=09=09(x)
 # define __mem_ioswabl(a, x)=09cpu_to_le32(x)
 # define ioswabq(a, x)=09=09(x)
-# define __mem_ioswabq(a, x)=09cpu_to_le32(x)
+# define __mem_ioswabq(a, x)=09cpu_to_le64(x)
=20
 #endif
=20
diff --git a/arch/mips/include/asm/mach-ip32/mangle-port.h b/arch/mips/incl=
ude/asm/mach-ip32/mangle-port.h
index f1d0f1756a9f..c5ef72ccb0d5 100644
--- a/arch/mips/include/asm/mach-ip32/mangle-port.h
+++ b/arch/mips/include/asm/mach-ip32/mangle-port.h
@@ -21,6 +21,6 @@
 # define ioswabl(a, x)=09=09(x)
 # define __mem_ioswabl(a, x)=09cpu_to_le32(x)
 # define ioswabq(a, x)=09=09(x)
-# define __mem_ioswabq(a, x)=09cpu_to_le32(x)
+# define __mem_ioswabq(a, x)=09cpu_to_le64(x)
=20
 #endif /* __ASM_MACH_IP32_MANGLE_PORT_H */
--=20
2.27.0


