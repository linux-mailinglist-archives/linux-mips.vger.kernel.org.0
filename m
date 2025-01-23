Return-Path: <linux-mips+bounces-7589-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A81A1A4E1
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 14:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CF833AB432
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 13:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687B620F98F;
	Thu, 23 Jan 2025 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PlC3Yor4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ED120F989
	for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638902; cv=none; b=NnIDmU/tqrmRyzSiT23AgfD+PerTNP1Marz8NaragEceM31isPpGV5Z2ZLlY96HDTNBnR5UGzeE9BCtqKnc8sWv/8o4Vz7H9TD/ighnkKu1A/DoqI0HQG3iAIHYX9fiMECvmEeiFMkkpBzdLzXcZIy8f5z1wKhCz2A2mMGpyelY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638902; c=relaxed/simple;
	bh=2QT8xw8Hnr0PZ0li5OKVWEtgoR+SI3nKyV65SN+WB9w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vAuFBR+Vr4wQWXSPizjOik9cxPpNDU8efy3nRplawGRHbCu0FCpxegUyOZmWOkSy8FM82oXYNKSiYkDLPCCUDkYumqTw0v9Epd4fZT3eE8GkSfcb8kJ+egtPxG0Zmv3Jw8wlObDGrLh6OqDTaOgBJFNz+6yFIfkFJiNfKqucvb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PlC3Yor4; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21644aca3a0so18727685ad.3
        for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638899; x=1738243699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcMJmKKEtX+iYg+m7hTSfwAHD3Zpn1mRc3DXgtsxucU=;
        b=PlC3Yor4kuIjyynz0ZpYQd2kUV2zjcprsHeUzmmQfysdjL9qIP1XqAkx1MpbxGP6Wo
         P9tPiOG/2khvgZJ1N5PKmsmAXJzaM3jbHdmHRCBDWEj8vq0bOvs0Gb6c92RTcg1ZHj2Z
         8C3yUvQ3zlvSmi4TI2HzJ7S2DihwA2CT0m/nd2ywaOvVSOySSesNu/YnO3WGLI2hkRpm
         h0EYQlcugmmDQJkyfwsIDXnbOVr1PYcQhoWvuOmVhxHGDBAqAAi2JE26CUqjSr0nDk0t
         PXiRjzfXYuM/HET3s4Ht5OLmekBLIAO1uIDZwRaN9Lyfe7TILowl7RWNgpNi2cEiY+gy
         qpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638899; x=1738243699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcMJmKKEtX+iYg+m7hTSfwAHD3Zpn1mRc3DXgtsxucU=;
        b=ui7SxiYa5bg2p46VNI7nsCdCP9XVJCIuF0yLgwoDfCm6BUqk8QzXIKoP3hQF/XsGCw
         WZDmIMPeJ8RsDLwOgu2zd8dp1L1TcJGowqDdGAutLS2xHMA9Pwz3IQf63oGSTfrLpDHL
         D/yYICi783u4814TST8mKqAEJFxRMRbiIj1n9gUgGiJBzs/4sCbobeYIMGhd2tX1n/FU
         XjtZ3TxoDXPHQrT01nuuVkZCf0pYwmyKzzvLDTGwGXyRvgAgLeu/msMLk1bcc3qk9fRb
         /pGfMPMFRS1lqlCZ5zuVHuMsfdSYb6wwhdriCNTADMtqwzqAUg8hczGZ4z0mM+S7CzJa
         QyJg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+FS79InDSbaAxBA0GsAxsyW3OF1WqYZ8TvRnPhbVxwQNPwgznDFRbzNL8D/wZT/9WhkTpThfqwN/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz34PRt8rh34/0SqwzmVx022nNFbFZr2TZgy1uNqBkzEOB+ZZee
	A95I4hPzEv2DscngymmHXWf9gHnOrXgClOjbPbipfDM2xFwLymBBLJ1KfjjalCY=
X-Gm-Gg: ASbGncvZsR7x1V5pMj0dFRDD5F6FkyBV8xcWFlQEX00GmNt1kzs/vFNNyI4/Gzk7YiO
	Z0rUzLzJ/6UDp+K57WVm8E6ZCAHssVGt4dBdHfEwZzq7Hec34gvhZp/AeDMqcSStKFkRhbK3Xit
	k2N+B7iz454LoBsPRvLPSf3ZZmgvaBNA1UBPJIzlg6UDi2Gm6x0IRIR0NL0QfSV9cJKXMzzIbt0
	4R2BNos2FkQGXalHebI8XFTBiZX6fR/XDSaUAVMcqLHsj3WU36zGqWOE1z35k5Lr9fGeIFnnx9j
	O7TcdgzF5cI4c9oK71eIqi24cOfe15jIJBMPV7TXroMr
X-Google-Smtp-Source: AGHT+IEganAe939WGDJlfH9nAWVZpA3TvM5SaYn7UYpmBsqsQlG5HSrZSGt5JfnUpmvzTx71ZR7Ekg==
X-Received: by 2002:a17:902:f545:b0:215:6e01:ad19 with SMTP id d9443c01a7336-21c35587f37mr410676135ad.29.1737638898793;
        Thu, 23 Jan 2025 05:28:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:18 -0800 (PST)
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
Subject: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Date: Thu, 23 Jan 2025 21:26:13 +0800
Message-Id: <cover.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

As suggested by Peter Zijlstra below [1], this series aims to remove
tlb_remove_page_ptdesc().

: Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
: there should not be a page-table anywhere near here *ever*.
:
: Yes, some architectures use tlb_remove_page() for page-tables too, but
: that is more or less an implementation detail that can be fixed.

After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
to remove the page table pages. In the future, once all architectures using
tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
may be possible to use only tlb_remove_ptdesc().

Note: there will be some overlap between my patch #4 and Rik van Riel's patch #1 [2],
      once his patch is merged into the next branch, I can rebase onto his patch.
      And patch #4 can actually make x86 use tlb_remove_ptdesc(), but due to the
      above situation, I have not done so yet.

This series is based on next-20250122.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/
[2]. https://lore.kernel.org/lkml/20250123042447.2259648-2-riel@surriel.com/

Qi Zheng (5):
  mm: pgtable: make generic tlb_remove_table() use struct ptdesc
  mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
  riscv: pgtable: unconditionally use tlb_remove_ptdesc()
  x86: pgtable: unconditionally use tlb_remove_table()
  mm: pgtable: remove tlb_remove_page_ptdesc()

 arch/csky/include/asm/pgalloc.h      |  3 +--
 arch/hexagon/include/asm/pgalloc.h   |  3 +--
 arch/loongarch/include/asm/pgalloc.h |  3 +--
 arch/m68k/include/asm/sun3_pgalloc.h |  3 +--
 arch/mips/include/asm/pgalloc.h      |  3 +--
 arch/nios2/include/asm/pgalloc.h     |  9 ++++-----
 arch/openrisc/include/asm/pgalloc.h  |  3 +--
 arch/riscv/include/asm/pgalloc.h     | 26 ++++----------------------
 arch/sh/include/asm/pgalloc.h        |  3 +--
 arch/um/include/asm/pgalloc.h        |  9 +++------
 arch/x86/kernel/paravirt.c           | 17 +----------------
 arch/x86/mm/pgtable.c                | 11 -----------
 include/asm-generic/tlb.h            | 12 +++---------
 13 files changed, 22 insertions(+), 83 deletions(-)

-- 
2.20.1


