Return-Path: <linux-mips+bounces-7936-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 856C9A433E9
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 04:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F32A7A5186
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 03:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451E51FBEB5;
	Tue, 25 Feb 2025 03:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="N62m9mDv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4910F1684AE
	for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 03:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455242; cv=none; b=Cd6We8QbLywRkStjgMdcAoeOc4P6WzCv3rzcKf06nnrBf2Z1TK06/nN/GdVHD1eL7P3El6pWXUoIkQXnjSqSdwAJX148m4ptiTVAAgC1WHyLO1VdaXulIkm+ZllyN8DeFl2RRipEJ2nvTDV62Svjeyc2U8ujm1CwyPKbstklfoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455242; c=relaxed/simple;
	bh=007QVVVFe489JDQoxvXq6IPNtqGHUmY/RQmaczrx98Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=orsCuZry3korfV+dXHvvCO614gKiNMOnWkVVLa/2n36wBzicAETaeWcJvBk+mi7FKZEIQL6E+bKS1d2o7fn8R1776/beQyJoItxz7Rc8nsuBnpgckuWzr/WUjDUKHnX0B9OH9vjqiL+CmLLPwaK9YtXXMT7cnGeR6RwA0ltcWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=N62m9mDv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220dc3831e3so95477905ad.0
        for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 19:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455238; x=1741060038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+AOLMBHyoEBsAHQDRMLfrp+DU3rIi9C1hjH+u4umGY=;
        b=N62m9mDvTU0KT7/zOgSYI5Gj+Rt2Y3m3JKGSoFuLFr5cQorgKfTRV3LgEs7+XNq9Cl
         PX6qN90TgUX+eHKhfEK8YzIInYLCyIA2/pOt5HC5z8LmoAvu8jYNeJ/1n7Wy5AZ8lSPC
         EQ26Vg404rAFBoO2dNhd67BfEQKALCw9FTmPKOaabEw50R2u18jskTqSg7vpL45v2F+l
         oiu+1rGs13S30DbRSlEK5+05Ejsz0bg5QepFgIJfGolmaG/57Qn897DbgIanmZnB2ayr
         RQkux5Xr14cSTPhqWwo1Ne2TRXGddxosb9mt7RE5PwdXQh2DtuoP4h7G69I5OvjvxgsE
         vMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455238; x=1741060038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+AOLMBHyoEBsAHQDRMLfrp+DU3rIi9C1hjH+u4umGY=;
        b=cJI30fkDS0OW3GDf5nsoyZ1P1e0v/RTLwO92HWgqyDYEPSnw5OxVdfhjJeXVlm60cr
         GSdFSBEMZcqAxCAg5br+3hTsQtL6xce5QvtQaqAxsTOFaZ1tStQwVtobgOWo+Ju68fTB
         zLtt8BdhG/jY1hu4fARbiwGuySXzMWFkpv2B07NH8+SRw2Vt3bSkoqZW9U5NU3HGNJFE
         wqJ/Jg6C7+BGPiHMkWStiNt0fM/JxpbUHOlN8dBse7zMrRLLCv63MpDECUTVl9MDovlf
         dOTui3S3ysSV4SS1feiVYgBjpl1yRxXx82h4YMEScktHlMWvIZG/LWYKbCJLpQ0Ydq8O
         Rwkg==
X-Forwarded-Encrypted: i=1; AJvYcCX4FEmx6qvXy4e5si0wsF52zTfiiuuP8UyW1aqyQMRjU8fwrtYMmP61zU3UyPHPmcSsXDh5Uz8i109g@vger.kernel.org
X-Gm-Message-State: AOJu0YyaHX1Dw4zb/AcjDtLZNQB+e36JqKrMWn6VS1o/NO9buC6xYijO
	kemXlaxl1gbBxyyuKHUQAynf3RqpFr6SUjcEpeuk4Swzir30I9GARfneODXHn/U=
X-Gm-Gg: ASbGncuSs0cTxOn9I2qNrFCjVtV9Q9LuIl1fM8bNJjRgoZznBVJwPzVehf6AYJpz4HZ
	4oq2Vx+sdSuLLtwXF/EU4BdDurm7nFDeCMYimBKxvrttLpOCWb94/ofiG91y4EJEWoHHqRl4igL
	t3pcAhDIc5soeqTO8cfrZXTg49WHh6hl0ltbyR5KolDPK4dTktN4okG74DUxWSEBgHqHku+GwaI
	FaPVK8Gsczydmla4+eR5Z9n0ja2uHYUN6r2ja4VeMvqxNDuhoko+dmm3/GzzyQSQvAWnXEjIf9S
	XwTF3ZV+QvIFUKt/k1FFUc5ipuGVnYo8Fh99s9Nk1FFIVyAbyapcBMCpQWNmz7GIzQ==
X-Google-Smtp-Source: AGHT+IHDwvQZzbKv24vEjKNvLJNI+R1iJ4OqsIlmXN9p1d6u9OWq0+ZfVfD6gOTuv6xGQ3OntwSRRg==
X-Received: by 2002:a05:6a00:6f0e:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-73426c62969mr26062579b3a.5.1740455238550;
        Mon, 24 Feb 2025 19:47:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:47:18 -0800 (PST)
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
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 6/6] mm: pgtable: remove tlb_remove_page_ptdesc()
Date: Tue, 25 Feb 2025 11:45:56 +0800
Message-Id: <3df04c8494339073b71be4acb2d92e108ecd1b60.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tlb_remove_ptdesc()/tlb_remove_table() is specially designed for page
table pages, and now all architectures have been converted to use it to
remove page table pages. So let's remove tlb_remove_page_ptdesc(), it
currently has no users and should not be used for page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/tlb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 18bf499ef8801..dd292c6d3ce88 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -511,12 +511,6 @@ static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
 	tlb_remove_table(tlb, pt);
 }
 
-/* Like tlb_remove_ptdesc, but for page-like page directories. */
-static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
-{
-	tlb_remove_page(tlb, ptdesc_page(pt));
-}
-
 static inline void tlb_change_page_size(struct mmu_gather *tlb,
 						     unsigned int page_size)
 {
-- 
2.20.1


