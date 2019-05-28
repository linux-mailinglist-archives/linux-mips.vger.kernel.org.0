Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D36E2D161
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2019 00:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfE1WNH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 May 2019 18:13:07 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:46967 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbfE1WNH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 May 2019 18:13:07 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2CE81806B7;
        Wed, 29 May 2019 10:13:05 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1559081585;
        bh=+2CkAXJ98WAkefkx5rtcAJw6vq2W+At457odAut87wE=;
        h=From:To:Cc:Subject:Date;
        b=WAptlmw2ams8Vlx0OfMXiDKgKilEpn6PnKKxS4QuV/kdXe4D3nFisZYPSlicbZ29J
         2WFhyD/wqIbWRrkiGkEegabcG3DdWAOt001SSTZ2Vq8UfKqjQX8lTYQN7G7hGr6tg+
         5ZBQwtFSklvoqf0Vi9sIijbotnK2L5b8Ue6YH6YFQ63wj7ZI19d4qQy8ZPUplo+Nv3
         KF+g4IoZj6AjTuvbWZiTMAMIJDkjX/i79rhdDRKCWs2ritS+pMcxcOqqP4f6cA1GxT
         HM22O8lPsyFb9Arr9Oh5PGFFc97oxqeOlvLyd8Z56DzMeZIgkxOhI/qTXT8Ea7xPTO
         IR4I9gKotIl5A==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5cedb26e0000>; Wed, 29 May 2019 10:13:03 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id DD06613ED45;
        Wed, 29 May 2019 10:13:04 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 287221E1E3F; Wed, 29 May 2019 10:13:04 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org
Cc:     Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] MIPS: mm: Use SMP safe operations for flush_cache_vmap
Date:   Wed, 29 May 2019 10:12:54 +1200
Message-Id: <20190528221255.22460-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

flush_cache_vmap() and flush_cache_vunmap() were calling
r4k_blast_dcache() which is not safe to do on a SMP system. Redefine
them to call r4k_flush_kernel_vmap_range() which will correctly handle
the SMP/UP cases.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
I don't know if passing 0, dcache_size to r4k_flush_kernel_vmap_range is
a good idea. It does have the desired outcome but it could be a bit
fragile.

Getting the address and size through to r4k__flush_cache_vmap involves
updating the prototype for __flush_cache_vmap() which meant touching
more code than I was comfortable doing. It would be relatively straight
forward to do but then I'd hit things I have no way of testing.

 arch/mips/mm/c-r4k.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5166e38cd1c6..976c54268456 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -559,16 +559,6 @@ static inline int has_valid_asid(const struct mm_str=
uct *mm, unsigned int type)
 	return 0;
 }
=20
-static void r4k__flush_cache_vmap(void)
-{
-	r4k_blast_dcache();
-}
-
-static void r4k__flush_cache_vunmap(void)
-{
-	r4k_blast_dcache();
-}
-
 /*
  * Note: flush_tlb_range() assumes flush_cache_range() sufficiently flus=
hes
  * whole caches when vma is executable.
@@ -986,6 +976,16 @@ static void r4k_flush_kernel_vmap_range(unsigned lon=
g vaddr, int size)
 				&args);
 }
=20
+static void r4k__flush_cache_vmap(void)
+{
+	r4k_flush_kernel_vmap_range(0, dcache_size);
+}
+
+static void r4k__flush_cache_vunmap(void)
+{
+	r4k_flush_kernel_vmap_range(0, dcache_size);
+}
+
 static inline void rm7k_erratum31(void)
 {
 	const unsigned long ic_lsize =3D 32;
--=20
2.21.0

