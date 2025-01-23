Return-Path: <linux-mips+bounces-7594-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5485AA1A4FF
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 14:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D67B188C4E3
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 13:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75CB21129D;
	Thu, 23 Jan 2025 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="M/dznGMi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB920F99E
	for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638950; cv=none; b=TZFmib8zw1Y+4/z4PeBtpHmLVe51SsqtUJ5S4tlBI5fsKQLuJH18Vr7tRts2TQJdjbd/SINE5W4ri2Eq5rLNCB1Kp28EBKKYIp7KcO86cjyOaPbrJvMYrepUAy1Yp6Vw+/LWZk/4a0HRZoGRrdV3XXKUKHEnaj1lbiBDI7cGdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638950; c=relaxed/simple;
	bh=xyoxab241Xbf++2pkWevGXAMdg+Lltm4zD7nrlxitWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KEXZVi4nMXXb2O4J2T1zUWzezF1yD4ItrRzDyVSqR1WKgN5yAYj0WzRiVE3tE/uNraohprJUDFOk7W8LNkuGhjN75O9jpM0DaRECuOflMDx5Z0CmK51nhg9F1SzdIr9Mw7yVTkxJcS46FKtkQNXiAOmBkdDxbweu155+d7TGv7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=M/dznGMi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21669fd5c7cso15088075ad.3
        for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 05:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638948; x=1738243748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C94XB4BAC98f0nzKDfhip6ZZIJjZtAIgTVlkxB/zEY=;
        b=M/dznGMiy55gDN4Bz8oivIoQTni4ET1ZdrZPukL3yR3sGAC7Cvy+xQhynQvdI9/yh/
         ZQhlAxWVub1c7f2ZbaFFGvnfuvRkZb9H503JbCXZ9Vwkj9KLUpJs858s5RNnYjaiIaUw
         lI+tSM14c88PHsh54pfbFBxD5Suu8dOiyPSrV0KN+iVRZYm9Cm7ppVSRLoIHQSBzDtdz
         Jsh/HsULJhEJkCcTSeINtQcE8kD55A6TDD3zUx8V22bZSdALpxtluCsNKwjK4/IFZG5q
         ocjAsy04352y4mPBGnCbJBzRQ0CcXjQltc3ceT0KbJtw9ZluGYhD3Nex0Q5FhRZl2RLm
         rHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638948; x=1738243748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C94XB4BAC98f0nzKDfhip6ZZIJjZtAIgTVlkxB/zEY=;
        b=Kt+ux4YD0iNSyq08ynoasB4gnLF7BLNFRbXLv9WzWjl6HeBWC4UeCyYjQtvekWwnxz
         UdE7f20Yl1y7v5OfTbe56AdC0KRYwzBHHIoxyOU1ExttyWwNRuxZpzOf0lJxKvQBlbwc
         ZAh9aKSyWzOTkRFZ9MhRLxRjXtfNrRab5d4n+8Yhi/flPKx/Kp1ABc6W/v7nt845BbO9
         5uxorCY82IuNeOQmvCcb/oA0TD09vpVdI57ojwrKRSgjO+l1nebgq1Qer5KDt+NJOFqb
         YxcB60h8bUquRUoodrdUHLxj+ZNtz+5HlAXPVG3N6BeBYWHKUzPjl5UrG6faT/giu+gm
         FWfA==
X-Forwarded-Encrypted: i=1; AJvYcCWbD0Go/5SnurXGu5wbvmjxae+Ukf+ECiVxyUdJo2Vg/RvS64jCEgj2hWxhLVz53/rTFDt0NbIsUENC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6M8p4Q0NhIfwqv/L99EMibK0ubftn2BYXF0O+aVF2akwrs3p
	jJlq+r1W5D/byw+LK8mborsGoWDvgB7cQd+a6+FqWaklDAGjy9+39DMt34c80FE=
X-Gm-Gg: ASbGncsx0GHLsvbmfjnduSyW9bscPp9WPbw29YaFWJe1o9BqaO8OWWunSqN3AxykWHi
	Oi9rTgoMmSn5/rNcf96PMnfSiqAE/qiuq+ES3sKKgXgW2xqejf/xie+iggETAPO2J4ys8zrjTvq
	P2+WHuZWcDsvGAz7U9pI2QFKgWWmb+mI/G8U1bydFwjejuw4UBKvDWD5id0v5ZO/P8vvQo619Lz
	so5GOypB49Ap5M7BMa58jgYDlMITWnmQgoAgwfXajXC6vGbcS2PemZpRnbVdiihuuCAqz34uLJO
	Gf9KotorxXqkUotJtx83vDlarJVlTY+QLjgv16m0yC5o
X-Google-Smtp-Source: AGHT+IFkSdO3UtmG5jKkAJtanqQZSHufZoNoVtMFPHl42HZUz79kP6iB5Pw4LWGczfrtYHtt4kZUXA==
X-Received: by 2002:a17:902:f54f:b0:215:b468:1a33 with SMTP id d9443c01a7336-21c351c67acmr376126085ad.4.1737638948337;
        Thu, 23 Jan 2025 05:29:08 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:29:07 -0800 (PST)
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
Subject: [PATCH 5/5] mm: pgtable: remove tlb_remove_page_ptdesc()
Date: Thu, 23 Jan 2025 21:26:18 +0800
Message-Id: <62d6a04c3a0e70efd435cc2c8a4d9d07d94e7ece.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
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
index 10cdbe0e7adfe..dec030cb12108 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -509,12 +509,6 @@ static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
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


