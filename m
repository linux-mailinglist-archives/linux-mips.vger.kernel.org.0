Return-Path: <linux-mips+bounces-8081-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A3A4E1B7
	for <lists+linux-mips@lfdr.de>; Tue,  4 Mar 2025 15:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C4AF3B0951
	for <lists+linux-mips@lfdr.de>; Tue,  4 Mar 2025 14:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A7E209F4E;
	Tue,  4 Mar 2025 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JmwuNN+e"
X-Original-To: linux-mips@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A863E236A63
	for <linux-mips@vger.kernel.org>; Tue,  4 Mar 2025 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741099325; cv=fail; b=aEiItLkQj78ex7vqbJYBuNN7tm04Dm67uc/75s5bZOLGcymhl60b4aYnKJctBOc7elnfhHxiWnVBI2jqWXdPnhvh1NDXCTeoCFsvR9O/lJFzGBY3t9jotJ4vAH9gjfI7NGw6LF+Q9skFbPAqE0mJ3cYNldniO4CQCeWOLH4PYWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741099325; c=relaxed/simple;
	bh=k/rQy+RjCWETgreu5x1IWsuns/rtCY8CSOq1ZHp4ux4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1Pvy6v7HtANhDxKO7GJAKzQ5S2JRKhUz2XLf6To061Xr4Kv2Pubyzc5U6FJU50LyYhDkOtnwaeFVEzyIUmKac3wpHmJ+XnvDXrG4l9XOnbnlG8rw4TeHkfZHD8WDEqaPHmDSP6YqWa62audttEsLZ2vkZ8J7l2m988ZfiNFmUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=bytedance.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JmwuNN+e reason="signature verification failed"; arc=none smtp.client-ip=209.85.216.54; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; arc=fail smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id E647A40CF120
	for <linux-mips@vger.kernel.org>; Tue,  4 Mar 2025 17:42:01 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=JmwuNN+e
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dcQ6swQzFwh6
	for <linux-mips@vger.kernel.org>; Tue,  4 Mar 2025 17:39:34 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 7CE5342743; Tue,  4 Mar 2025 17:39:17 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JmwuNN+e
X-Envelope-From: <linux-kernel+bounces-541090-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JmwuNN+e
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 26858424D3
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:26:57 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw1.itu.edu.tr (Postfix) with SMTP id B62AC3063EFF
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:26:56 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90F2416DFED
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DB41EB181;
	Mon,  3 Mar 2025 07:26:44 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60A1E9B18
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986800; cv=none; b=lblAuk9aznXpK0FUA33YUC5uEyqmKbQRJsiGeWQetCpUTEytGsgJ557NVLLXjuBW/pXjklJICsclUPlCJ3EOz40Pc2iFehiGDbPwyjVsxFwkanZMs93MXvYtemZB7WzzKqXlE6hECMntHSPqdsNBqOeRsQlZxdai6zOcGHNYOlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986800; c=relaxed/simple;
	bh=RuA+uroo3JnnqiveXvV7x6EK7oz5OdDodupXgS0+g8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VR61ZSyBAG/sIF/xOrpclfoaAxKthnyn6PEXxyKUR1z7abOtPBKsLRQ5/itmCgoQDalIg7b96KXVlppsiqJfagJK83Dd6y7y1VOhE3T7IyIcYXSqyFfp3cVONsLZNoFTgOkxP5e04nzJ8rF/aGVIrkEDnTQ+ybXNfNMbfS7/Jq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JmwuNN+e; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fea78afde5so5228634a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Mar 2025 23:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740986797; x=1741591597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKqMp2ldkM6onLRqmB7AQD5dXslJ0Fc9YwwNhjL6y0w=;
        b=JmwuNN+ei4ESiRC117RSoEZYWcwIzSKPybdb1RieM/Q//jBOfXCPZdcFaUip1h8PWm
         D0csP5OjzE0Hg6o5I5Vx1uF4NcjF+X41xIpW1+B9ORQkiVeOiXh/DNNaQtZbbjqdMW3n
         OL2vqZuivwSwxl+yNPUV4doAF8YoicRaMzpq9s5OfAQGqcRBdcyanRCAtNkfUL2efrtx
         0z7OT2vlQlN9SBAbZ85HohjXJ4xOnz+sOGeGalNRn1Cg9DrAlopeGD6Lry6+XT9ZzY2A
         OBdoprxaj5BsxDOiYh3oOazDNqR9n4KGpowKXGCghF36kjTRlE4iCkAMix7DNpeE+YsC
         sGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986797; x=1741591597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKqMp2ldkM6onLRqmB7AQD5dXslJ0Fc9YwwNhjL6y0w=;
        b=bb4N294oqd/OkIZkdCCnLEnC4grwsdXmGpV/YZh3mfd3BjDgKm1UfLfKdkaxtTHaJx
         k+tgojesd56DzJ6EwoeZDlERluB4RlDD4JSk7DI+0MB7mjOV2aR52Ld/VUaqzXACL4mw
         EHmIETzFtoAIJvGB5FLvtr+r5lrOp8EGdNWg8Z3koxwUCi+KTV2T1PfMPGkMzPMNSu6U
         A3j5MotgFxtfODQAgkE70Me0iP0wIzSRPXKpPluwkNwPhoIAhOZ6F6KCHHb7UOhVpnbg
         M2V+nAaAMLSzO+6bU7m7XZLLQ1w2gW70TncNNk8UkiRxH52EZb6qobf+knQo7pU5SRAT
         UDhA==
X-Forwarded-Encrypted: i=1; AJvYcCUsQ9tEG+KowvCgCLbPmVevACZwheaomF994OuzCUW3ZLzagKO6fMFZVgdteVrDEQ0DWvPioWtQrOQTauQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyW3Yw0tpfH6Z11KAp8zzhw3FFW6j/KIcAdg41v+tzYp3G3gvq
	6O555YU8/fUB4eUJANKzAFwK9Xq+enomYtcpV0wuHjwQleblpKd20DMk9/QH+EM=
X-Gm-Gg: ASbGncuue8tyJXEiC8RHTdUDvF7msQduFiEGEzVepL1+UF644hzWMUt/NhVLRRO8Ixs
	EBB5hGPVxgwRGkwm5HaFD6EsP1BtZkc/Qjd/+pW26MFJvXKMy1vtrVCSVDROWVZpQE81Y/JWsnQ
	f3vr1wjP/l/YRfjNsM/0Jqaleox65520zVQI8hB0Kmwka4/Gnc1HLTkunj2f/20goNPBKtHQP4W
	gGj5btrdLbB3OU0s7IjuEOKrSWlTtOCdDD4Lbw3Nb3m2p5pO7SnJRNt0BAaWvOPVfs6tARXSSOW
	1TZ8DY2oymvg0rXICFbT4uyO9+UJGiZEq7JW4dP7wyQ3kWr1q9wwBynumhUQ/dNx8VcdetchjKr
	eoel9OQ==
X-Google-Smtp-Source: AGHT+IHY/mguPL5YJZdh+hkpdyJ3sc0BaAvd1rDPiW9eR/qaACJ5BQlxWj/zL9j3Gfy9PeYzz+4/5A==
X-Received: by 2002:a17:90a:f948:b0:2fe:d766:ad87 with SMTP id 98e67ed59e1d1-2fed766af9cmr12568619a91.7.1740986796693;
        Sun, 02 Mar 2025 23:26:36 -0800 (PST)
Received: from G7HT0H2MK4.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea676c06asm8211638a91.16.2025.03.02.23.26.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 02 Mar 2025 23:26:35 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 3/6 update] mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
Date: Mon,  3 Mar 2025 15:26:03 +0800
Message-ID: <20250303072603.45423-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
References: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6dcQ6swQzFwh6
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741704012.00573@qrzGMH7+B2KufYYiDN/b9w
X-ITU-MailScanner-SpamCheck: not spam

Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE=
,
and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
tlb_remove_page()). This is the same as the implementation of
tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
convert these architectures to use tlb_remove_ptdesc().

The ultimate goal is to make the architecture only use tlb_remove_ptdesc(=
)
or tlb_remove_table() for page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
---
Changes in v2 update:
 - remove the do { ... } while construct. (Geert Uytterhoeven)
 - collect the Reviewed-by and Acked-by.

 arch/csky/include/asm/pgalloc.h      |  7 ++-----
 arch/hexagon/include/asm/pgalloc.h   |  7 ++-----
 arch/loongarch/include/asm/pgalloc.h |  7 ++-----
 arch/m68k/include/asm/sun3_pgalloc.h |  7 ++-----
 arch/mips/include/asm/pgalloc.h      |  7 ++-----
 arch/nios2/include/asm/pgalloc.h     |  7 ++-----
 arch/openrisc/include/asm/pgalloc.h  |  7 ++-----
 arch/sh/include/asm/pgalloc.h        |  7 ++-----
 arch/um/include/asm/pgalloc.h        | 21 ++++++---------------
 9 files changed, 22 insertions(+), 55 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgal=
loc.h
index bf8400c28b5a3..11055c5749686 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -61,11 +61,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 	return ret;
 }
=20
-#define __pte_free_tlb(tlb, pte, address)		\
-do {							\
-	pagetable_dtor(page_ptdesc(pte));		\
-	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
=20
 extern void pagetable_init(void);
 extern void mmu_init(unsigned long min_pfn, unsigned long max_pfn);
diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/as=
m/pgalloc.h
index 1ee5f5f157ca7..937a11ef4c33c 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,7 @@ static inline void pmd_populate_kernel(struct mm_struc=
t *mm, pmd_t *pmd,
 		max_kernel_seg =3D pmdindex;
 }
=20
-#define __pte_free_tlb(tlb, pte, addr)				\
-do {								\
-	pagetable_dtor((page_ptdesc(pte)));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
=20
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/includ=
e/asm/pgalloc.h
index 7211dff8c969e..73629c1b8328e 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -55,11 +55,8 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_st=
ruct *mm)
 	return pte;
 }
=20
-#define __pte_free_tlb(tlb, pte, address)			\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));
=20
 #ifndef __PAGETABLE_PMD_FOLDED
=20
diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm=
/sun3_pgalloc.h
index 80afc3a187249..1e21c758b774e 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -17,11 +17,8 @@
=20
 extern const char bad_pmd_string[];
=20
-#define __pte_free_tlb(tlb, pte, addr)				\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
=20
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,=
 pte_t *pte)
 {
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgal=
loc.h
index 26c7a6ede983c..bbca420c96d3c 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -48,11 +48,8 @@ static inline void pud_populate(struct mm_struct *mm, =
pud_t *pud, pmd_t *pmd)
 extern void pgd_init(void *addr);
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
=20
-#define __pte_free_tlb(tlb, pte, address)			\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
=20
 #ifndef __PAGETABLE_PMD_FOLDED
=20
diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pg=
alloc.h
index 12a536b7bfbd4..db122b093a8be 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,7 @@ static inline void pmd_populate(struct mm_struct *mm, =
pmd_t *pmd,
=20
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
=20
-#define __pte_free_tlb(tlb, pte, addr)					\
-	do {								\
-		pagetable_dtor(page_ptdesc(pte));			\
-		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-	} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
=20
 #endif /* _ASM_NIOS2_PGALLOC_H */
diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/=
asm/pgalloc.h
index 3372f4e6ab4b5..3f110931d8f6e 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -64,10 +64,7 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
=20
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
=20
-#define __pte_free_tlb(tlb, pte, addr)				\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
=20
 #endif
diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.=
h
index 96d938fdf2244..6fe7123d38fa9 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -32,10 +32,7 @@ static inline void pmd_populate(struct mm_struct *mm, =
pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
=20
-#define __pte_free_tlb(tlb, pte, addr)				\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
=20
 #endif /* __ASM_SH_PGALLOC_H */
diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.=
h
index f0af23c3aeb2b..826ec44b58cdb 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,27 +25,18 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
=20
-#define __pte_free_tlb(tlb, pte, address)			\
-do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-} while (0)
+#define __pte_free_tlb(tlb, pte, address)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
=20
 #if CONFIG_PGTABLE_LEVELS > 2
=20
-#define __pmd_free_tlb(tlb, pmd, address)			\
-do {								\
-	pagetable_dtor(virt_to_ptdesc(pmd));			\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
-} while (0)
+#define __pmd_free_tlb(tlb, pmd, address)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd))
=20
 #if CONFIG_PGTABLE_LEVELS > 3
=20
-#define __pud_free_tlb(tlb, pud, address)			\
-do {								\
-	pagetable_dtor(virt_to_ptdesc(pud));		\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
-} while (0)
+#define __pud_free_tlb(tlb, pud, address)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pud))
=20
 #endif
 #endif
--=20
2.20.1



