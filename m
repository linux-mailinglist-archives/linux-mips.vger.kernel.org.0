Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFCA2022E4
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jun 2020 11:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgFTJfN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Jun 2020 05:35:13 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:56248 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgFTJfN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 20 Jun 2020 05:35:13 -0400
Date:   Sat, 20 Jun 2020 09:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1592645711; bh=ZqCBGivQpOR7bWQOuKEUf/s+T102VDiFA/V/fTLFZqc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=DTzrTbxZrXttoZLXPKtH8AZoe5YO3WXyoqCLvHbdez2+t565T/Lerh1pRuOpcAicl
         dN7Z3iUCq8Figxs+3Fy917O08s5P3fzo56FUgsPf5Vn7SM3E0PeK2fVFYQSLTv3z0E
         mhXIceiqbwYrdsbtgR9BDoExCrJl4OHiV49wH3of+5YrB9ejbIHW75CgL9a3L+HOTQ
         a/IX+yb7G6/CDg9uyl48vNFxC64jo8/CwI8j2wDOAnPC3af6QWVgACKp7/UFt3X6yq
         bBeclz7JT1yB5tW59NbaOyXSL2utlZBcC7BZBFJbPq7l/FpmpUxbpTFUoL2lshYJRj
         IFNKA8M+uYmyg==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Paul Burton <paulburton@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 3/3] MIPS: checksum: fix sparse flooding on asm/checksum.h
Message-ID: <WDTCGAs6T_1WrYWzhajhKbTIXfzTBLg0bGDdJpUkGxVMdTG4pu3AzSorhGtletaoPhEf43qQ_F6kO0dndfIfhZsc2MGwcU9indtM80T4cI0=@pm.me>
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

csum_fold() in MIPS' asm/checksum.h is another source of sparse flooding
when building different networking source code.
The thing is that only half of __wsum <--> u32 casts inside the funtion
is forced, which is insufficient.
Add all necessary forced typecasting to stop floods and simplify actual
bug hunting.

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/include/asm/checksum.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/check=
sum.h
index dcebaaf8c862..181f7d14efb9 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -113,9 +113,9 @@ static inline __sum16 csum_fold(__wsum csum)
 =09u32 sum =3D (__force u32)csum;
=20
 =09sum +=3D (sum << 16);
-=09csum =3D (sum < csum);
+=09csum =3D (__force __wsum)(sum < (__force u32)csum);
 =09sum >>=3D 16;
-=09sum +=3D csum;
+=09sum +=3D (__force u32)csum;
=20
 =09return (__force __sum16)~sum;
 }
--=20
2.27.0


