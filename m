Return-Path: <linux-mips+bounces-10591-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EEBB34E6B
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 23:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FB60167430
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 21:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DFF29B8CF;
	Mon, 25 Aug 2025 21:51:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4028D8CE;
	Mon, 25 Aug 2025 21:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=162.55.131.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756158664; cv=pass; b=OmWm59L/dPfjB5h3MQbNvG24eS0GDWxRhQj15fudZea1ctDmjZ7sWKkmdBPk5tt4bUhRgHqWPYh/4f3jcvKqmffuRtCYLaedOuboIbg/ICMipEoSXw45CgSt7hFCbyEqixx2T2UHgaB0MlOfTVklOHd0chkd8HEMiW6k6NWxSB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756158664; c=relaxed/simple;
	bh=Sxg8UGUkNSPcHnK3WfU9gOagF9nKZh7qvFXxzCg6eBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bgVkr7EP9m1YFSLnCY1WFNMf8GG9wFywKvY4gMo0DPK0TkOx5qsTbjHZH5Z3/Kk2spOxia6rBDnQFOMKfBu1XXApIZbbjopVzbY5PYEmHvHM7NPhlhakypU2osqNmcbXIlXZ3bbuhzTkKYbHkQXfFCvqf2zyQui7W5dVKny5blA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=pass smtp.client-ip=162.55.131.47
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=135.181.133.111
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756158190;
	b=3UrokH7dlEW73ah57rFFCDGOtWgoElJl8oYnwLzTJWMREKde/7u+4ewA1VPyu07jSWQh
	 3TLVoSfqiVDtSdSkC0N1BE0F+h5V4Re4PalxHvFCqOwVRJ61+pXneMUIQyQBYN8CvKj28
	 xHc2sRibVMbp6osAawttEIxVFdXRtegGGEir4Hx0wL2Z7MQEVqHoxZShDHZoQa2pxeM1z
	 u06xiIc50NrwkTE4bE+yAN+/EZPErQBUTwyPDqy4fo5WbNYC9RbQrxYbuPcODQ8hwy/B/
	 vFf8GuaF8DzuTpz4Im4CgIHth4Hvhi5uRsUtT/8yUXd0W8FoDW7zRxE9KGrW1ZUGWrTzo
	 OllqSn3dB54qHiCxYfHnraitRnDjSQ8RZW3o/WCEqu4BhCCV9Et2sgsFsUgYBZjcf0WlS
	 RmWGvTF7Z2xuT7APIeYFprQ9mgckMZjHnOt0SRCT8g6uxQn1kionoc+LK1rEy8OI0+DFI
	 fNfw5FodA0VIFcYCjTPiA5TRlF9il7bEaojRZEbFXN722k+i2HdcXuy4xa5pex3QrJzae
	 jk4cermVpZ2R3rD6+nyhQqDgbwu1Pu9T6xiWzEDFIFQOA3nds0He513qYhyKcMuMn8ool
	 j40MYsdQ/j0VWK9jdjxhcuz49qaVq2n7jfYtEasgsTZk38vvt+qLkLssauP6CXk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756158190;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=OdPgDqkLgH4vvEd5//GdxbEVBYaCBTm9uHrvVmZJwj4=;
	b=LgUWm4urIveDA+EgqvTA9J6hf0qE2Rnmqb2gMvCkF5vOT0kZ9dktco7T7dRg7cEXNUnR
	 8VRI0T4ZwYvgFl3gZ06QLZChRqKAWrXKzJ2Sw3xWGrz5zDVLGGjVnF3p/ELTeiNpOdq8z
	 BzRf0tQxwMrEQL2SVQJXwAJmn5yl0COynYL7K+I7Wjo6p1Arcs4p0grlXDAft+zll3EnJ
	 LkUJ7I18tGAW3xwJJkK//HFsVxo2e9hsBwu9lgsMXyZrP/AeWAB7Fj/6Ky2xUIu20XBcM
	 FieSD8gc6OTyBmE7AgFOfeXvtr2PGe5qiRcnbXaTgRgFwiKsejF8tWpJYGjalNDxlozcC
	 P5NpaTGZrUsr0lWqaH8xMMhqo+81BAVcnoJsJZ5Ldcq5cXBssCARDg1Z8N7XoKEXIjWZJ
	 jmoCSJfjnhWIITFIJON8jTdwxNTgo7C/KIokV+HApjSYyVCJexSLOR96I3nFVWXxx73W6
	 Ksm8vAgleOOXrag7xEX9cc38uHNuw5TySX4vAXg7ij7Fk1ke783l0192vm2a7Lb7Puj+n
	 ZEia4lnt2gZ2AoBaJvWbZ3pXcKfzn5Brte8vuPY+7dFAifDGoedWzQO8jMKUbXAymMkPb
	 lgwg9inLBbJGRcnszfkux/vYu0h9TNN+GdyGw/Sy4F2+US9uh8aylrZpf3xRQIQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=135.181.133.111
Received: from eclairit (eclairit.com [135.181.133.111])
	by support.bugseng.com (Postfix) with ESMTPS id 2E42E4EEBC47;
	Mon, 25 Aug 2025 23:43:10 +0200 (CEST)
Received: by eclairit (Postfix, from userid 1011)
	id 8A0B2644066B; Mon, 25 Aug 2025 23:43:09 +0200 (CEST)
From: Nicola Vetrini <nicola.vetrini@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	regressions@lists.linux.dev
Cc: tsbogend@alpha.franken.de,
	willy@infradead.org,
	anders.roxell@linaro.org,
	naresh.kamboju@linaro.org,
	Nicola Vetrini <nicola.vetrini@gmail.com>
Subject: [PATCH] mips: fix compilation error
Date: Mon, 25 Aug 2025 23:42:45 +0200
Message-ID: <20250825214245.1838158-1-nicola.vetrini@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following build error occurs on a mips build configuration
(32r2el_defconfig and similar ones)
./arch/mips/include/asm/cacheflush.h:42:34: error: passing argument 2 of ‘set_bit’
from incompatible pointer type [-Werror=incompatible-pointer-types]
   42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
      |                                  ^~~~~~~~~~~~~~~
      |                                  |
      |                                  memdesc_flags_t *

This is due to changes introduced by
commit 30f45bf18d55 ("mm: introduce memdesc_flags_t"), which did not update
these usage sites.

Link: https://lore.kernel.org/lkml/CA+G9fYvkpmqGr6wjBNHY=dRp71PLCoi2341JxOudi60yqaeUdg@mail.gmail.com/
Fixes: 30f45bf18d55 ("mm: introduce memdesc_flags_t")
Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
---
First time sending a Linux patch, so I may have gotten some part of
it wrong.

Bisection was done at the provided link.
---
 arch/mips/include/asm/cacheflush.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
index 1f14132b3fc9..5d283ef89d90 100644
--- a/arch/mips/include/asm/cacheflush.h
+++ b/arch/mips/include/asm/cacheflush.h
@@ -37,11 +37,11 @@
 #define PG_dcache_dirty			PG_arch_1
 
 #define folio_test_dcache_dirty(folio)		\
-	test_bit(PG_dcache_dirty, &(folio)->flags)
+	test_bit(PG_dcache_dirty, &(folio)->flags.f)
 #define folio_set_dcache_dirty(folio)	\
-	set_bit(PG_dcache_dirty, &(folio)->flags)
+	set_bit(PG_dcache_dirty, &(folio)->flags.f)
 #define folio_clear_dcache_dirty(folio)	\
-	clear_bit(PG_dcache_dirty, &(folio)->flags)
+	clear_bit(PG_dcache_dirty, &(folio)->flags.f)
 
 extern void (*flush_cache_all)(void);
 extern void (*__flush_cache_all)(void);

base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
-- 
2.43.0


