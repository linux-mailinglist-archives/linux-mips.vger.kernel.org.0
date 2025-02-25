Return-Path: <linux-mips+bounces-7930-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D960AA433C4
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 04:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E360189D27D
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 03:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062CE13D509;
	Tue, 25 Feb 2025 03:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="gdYlHQw6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1E2B64A
	for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 03:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455181; cv=none; b=YPAG8YKaytUW1jMAF6Dfpc2e7XY9GxiriJTtA0i4PQ1bT0rg88vBclPepzn1lrFgKmbJ+4w4g+4xG/rGL6rE9DIJxR6DAZUTlOhMqswPZDCL0WRmemZb72RW7Zh0agXEBrengop26uyVqXdYKFytfzWn3DTSdSDjaIVgvvT5ZUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455181; c=relaxed/simple;
	bh=Xarqt6bJuNP7uDohIoZXfOCmOa/TOsimsTJDUmQhEAk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QOw0oOM7gaL6QQNGs4ieOwX4NgzjrQB3rMP7VLvyYQM65HoL1FeWf+5G/7gPQCknfGT4bJK0n2MWWqYbbB7mH30R/sQa0RFxkUFszVh25ckQBnKoibdD9C22kwOwkClAqfBruaexvTJ5ZNrWsHxgvOaFmOnUEcHTiv1TRcbPgcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=gdYlHQw6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220d398bea9so81286115ad.3
        for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455179; x=1741059979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28rhiB/GEX2aHidRfZsL1f1ynE4sxX3e1xrVD+t+cg0=;
        b=gdYlHQw6UMjvN66luBcJmpWC6mmBua2s+rF8MRPWFK89E4pqFtOL2sKZqJrZVhYeoi
         h0Az2B5W1RBkBDeXejxczzYtLaSHKgpaSe5nUZHyxE0sWPvVQ7egJNVQDD1ys4IP3awN
         qLM6wTWZZd+dWGjMGYn1T6VnY11ntvSuzT5g+i2JYvUa/QhroLjt1YE7cACEwy43Tlpv
         jo0AVkh3/z21TprOUpO6VJXxdZ5N+k1uTSGjpctRfwQfY+oc+T1qk2RWReDM4epWndH4
         L/VBJ1fD2gDNNbcNJZPmjF1uMUrsJieVg2ui5gAb/yK4rfTB3LlvdY6TbmJofmZ5KAbk
         G/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455179; x=1741059979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28rhiB/GEX2aHidRfZsL1f1ynE4sxX3e1xrVD+t+cg0=;
        b=RVxkZifVW/1XnTzPHaorXmWE5JiRnMHteL/Wy4mU7I9SUBp5saPUzmxpvTb+4HUhyX
         fRP4LVMXPhJWLCxIfji04b9C+AL6oLbmY1T4ggyu7kBAN69U4cNTaL6mB7HSkQiQXMPW
         FDOPzrx/G3grUv/fTCjlJ96OQU6Fz+qOs/nyH2RJ/sQPT3QWjRuDuVBTZ8lWKc5bZRZE
         o5cHAZfI6l8vqpLLG5dbmcb4/TcE504GcZXDzOsKnSA00G8vgO8EeHT6QTpUzhydRPpd
         KaIkhlcPG6Q8ALTq47mGJCUJxK17nkarR9kTRO/dF01XdIQ5KJrSUPD//DdA66exrfHn
         D/cA==
X-Forwarded-Encrypted: i=1; AJvYcCWkEost1x9t5F1LWSe0eI2gfq2JL3oScfmIB/DIam8sykrEM9wIc9IkDY2yWMBfxVtrFeArl5wXDvZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YwtJTy3Ca5EyyPOkJoc/fsY7SvHcxGTkpELnLnJRnMjleS7ctUj
	V788Am/OKl7r1uZHmqzqmt8SpRyicDrgNTyMnsgFyerjtXhCCtQlqrlGjWIah5w=
X-Gm-Gg: ASbGncvhXPvUGZNAgWyiQP2u6rs3RWxF29SoookxD4g6VRbrtOkxKykN34TN938p3qR
	DqIot/NSMUqdKk60cPS7iuX4ANxpxAQ3dORN5A+8gd6DG96HlZL1bIVRZGdGMZrVmW600QoeCWm
	kwY0F9lRNHJ3szhSrSUBr152X+F7/423FgZymC6Q29rOaIHMBLnYG4glCizEsYgeowESbS+AouE
	AE3oQJOv9XCKSQOve1ZARu6H4ukD/Q3N3DUlQoBpYecYg+1nrjpN+E4iOIA1EPZrwgb3WNT6m1F
	XWtXM/65EPsVZoSGJs6PwagPZbV6r6aDcEoyiv0EswL3ZMHThUJdS67meOVaCXdZ1Q==
X-Google-Smtp-Source: AGHT+IGCQV+aaAngRw7XrsDoRTV1d2A5MeKYpMO11TDMI4tHHu1SHT60kqvv/nxGByOS3x+4jf7H6Q==
X-Received: by 2002:a17:902:e744:b0:21f:89e5:2715 with SMTP id d9443c01a7336-221a0edd8cbmr248196785ad.19.1740455178926;
        Mon, 24 Feb 2025 19:46:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:18 -0800 (PST)
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
Subject: [PATCH v2 0/6] remove tlb_remove_page_ptdesc()
Date: Tue, 25 Feb 2025 11:45:50 +0800
Message-Id: <cover.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - add [PATCH v2 2/6] (Peter Zijlstra)
 - remove [PATCH 4/5] and add [PATCH v2 5/6]
 - rebase onto the next-20250224

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

This series is based on next-20250224.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/

Qi Zheng (6):
  mm: pgtable: make generic tlb_remove_table() use struct ptdesc
  mm: pgtable: change pt parameter of tlb_remove_ptdesc() to struct
    ptdesc *
  mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
  riscv: pgtable: unconditionally use tlb_remove_ptdesc()
  x86: pgtable: convert to use tlb_remove_ptdesc()
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
 arch/x86/mm/pgtable.c                |  8 ++++----
 include/asm-generic/tlb.h            | 14 ++++----------
 12 files changed, 26 insertions(+), 61 deletions(-)

-- 
2.20.1


