Return-Path: <linux-mips+bounces-465-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B58801C5C
	for <lists+linux-mips@lfdr.de>; Sat,  2 Dec 2023 12:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F6E1C209E2
	for <lists+linux-mips@lfdr.de>; Sat,  2 Dec 2023 11:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5727493;
	Sat,  2 Dec 2023 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISJDB0Yi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96357181;
	Sat,  2 Dec 2023 03:14:47 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bca79244fso4266237e87.3;
        Sat, 02 Dec 2023 03:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701515686; x=1702120486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoxEo8hjT6ynXu2QIn5RXNLR4Bk19U6JI/QFXIIvaMA=;
        b=ISJDB0Yi3s46Hj/mjAwIHThxqr1SrXH0/ojUZwFUo0e1moJLtGRGyBXxX8VT33E5Ty
         7IRPtxayv1BTFzwK2MikPg8mvmSk28AsmimR+37Svlqu3MkH9Px6KvcilfUGLClAJdmU
         YSMJfXjcEBFpMHBPHlz5jn6edJvgnHFZeclVbvzy8KgviIwulhmJ3WwG4B2BjVvVVNjt
         p0FAXplemjvruM3lt1Kfpsh/mll9GFlWoBBtxoQCYV4/+L1zc5RGs6k4oa5ktE7brW1b
         zgYMhBqNCKogdfqXQNc217Wyd4pnEg+KBR6MzZT8sY5fxM+UcXZR83XriC7x7B5FiTb6
         o7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701515686; x=1702120486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoxEo8hjT6ynXu2QIn5RXNLR4Bk19U6JI/QFXIIvaMA=;
        b=HKcEgn1k39aL4iqOzfkC92ad78zW2E1O3y7U3SY7JHmJTbueeS+OXsDwX1rQa5jxR3
         44mVIITkDWDXT6YT8cBA9EA/8zX5tguPD8WKQu2g+vDR2ryVDjg8EFPmsSiVrj2NHug+
         FZiwlyHgRN5nANJzNOmhDbDzmqn7IdDhtls4jzQ/25d5lAtd597uzroL5eesKQWfMN61
         L2imd3TgtNcSwZstBAuOdHOFUw5N8qv5rjiFNNxO17aAUC57+XLnkjCpRlNKRqSNMySX
         gOBsKB66Wsyllal1GeVIR3rSn8hW7DWjgBZmY6hNDpDoeIa5NiOzjwjT9JTzhm5d5ozv
         Nu2Q==
X-Gm-Message-State: AOJu0YyDCANue1obym7oXyd4kzAIw/q91B0Aq4MLK9n/X60F5gyrmmIJ
	vUIGrBSY75QHRxLlYy4fxvI=
X-Google-Smtp-Source: AGHT+IFkxeL1RwTUhTnJP1CUm9Cbq+eu0HhVMHbrUruBo9ZhC8OKhsQl8pDOslnE74g1kgJTDtHEmw==
X-Received: by 2002:a05:6512:3113:b0:50b:e277:ef7 with SMTP id n19-20020a056512311300b0050be2770ef7mr528257lfb.139.1701515685791;
        Sat, 02 Dec 2023 03:14:45 -0800 (PST)
Received: from localhost ([95.79.203.166])
        by smtp.gmail.com with ESMTPSA id o18-20020a05651205d200b0050aaa813895sm690382lfo.132.2023.12.02.03.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 03:14:45 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Burton <paulburton@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Baoquan He <bhe@redhat.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Yinglu Yang <yangyinglu@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Mike Rapoport <rppt@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] mips: Fix incorrect max_low_pfn adjustment
Date: Sat,  2 Dec 2023 14:14:19 +0300
Message-ID: <20231202111430.18059-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231202111430.18059-1-fancer.lancer@gmail.com>
References: <20231202111430.18059-1-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max_low_pfn variable is incorrectly adjusted if the kernel is built with
high memory support and the later is detected in a running system, so the
memory which actually can be directly mapped is getting into the highmem
zone. See the ZONE_NORMAL range on my MIPS32r5 system:

> Zone ranges:
>   DMA      [mem 0x0000000000000000-0x0000000000ffffff]
>   Normal   [mem 0x0000000001000000-0x0000000007ffffff]
>   HighMem  [mem 0x0000000008000000-0x000000020fffffff]

while the zones are supposed to look as follows:

> Zone ranges:
>   DMA      [mem 0x0000000000000000-0x0000000000ffffff]
>   Normal   [mem 0x0000000001000000-0x000000001fffffff]
>   HighMem  [mem 0x0000000020000000-0x000000020fffffff]

Even though the physical memory within the range [0x08000000;0x20000000]
belongs to MMIO on our system, we don't really want it to be considered as
high memory since on MIPS32 that range still can be directly mapped.

Note there might be other problems caused by the max_low_pfn variable
misconfiguration. For instance high_memory variable is initialize with
virtual address corresponding to the max_low_pfn PFN, and by design it
must define the upper bound on direct map memory, then end of the normal
zone. That in its turn potentially may cause problems in accessing the
memory by means of the /dev/mem and /dev/kmem devices.

Let's fix the discovered misconfiguration then. It turns out the commit
a94e4f24ec83 ("MIPS: init: Drop boot_mem_map") didn't introduce the
max_low_pfn adjustment quite correct. If the kernel is built with high
memory support and the system is equipped with high memory, the
max_low_pfn variable will need to be initialized with PFN of the most
upper directly reachable memory address so the zone normal would be
correctly setup. On MIPS that PFN corresponds to PFN_DOWN(HIGHMEM_START).
If the system is built with no high memory support and one is detected in
the running system, we'll just need to adjust the max_pfn variable to
discard the found high memory from the system and leave the max_low_pfn as
is, since the later will be less than PFN_DOWN(HIGHMEM_START) anyway by
design of the for_each_memblock() loop performed a bit early in the
bootmem_init() method.

Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 2d2ca024bd47..0461ab49e8f1 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -321,11 +321,11 @@ static void __init bootmem_init(void)
 		panic("Incorrect memory mapping !!!");
 
 	if (max_pfn > PFN_DOWN(HIGHMEM_START)) {
+		max_low_pfn = PFN_DOWN(HIGHMEM_START);
 #ifdef CONFIG_HIGHMEM
-		highstart_pfn = PFN_DOWN(HIGHMEM_START);
+		highstart_pfn = max_low_pfn;
 		highend_pfn = max_pfn;
 #else
-		max_low_pfn = PFN_DOWN(HIGHMEM_START);
 		max_pfn = max_low_pfn;
 #endif
 	}
-- 
2.42.1


