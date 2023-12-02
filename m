Return-Path: <linux-mips+bounces-470-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646A801C6A
	for <lists+linux-mips@lfdr.de>; Sat,  2 Dec 2023 12:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EABB28187D
	for <lists+linux-mips@lfdr.de>; Sat,  2 Dec 2023 11:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25B81640D;
	Sat,  2 Dec 2023 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeVnEhLb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDE318C;
	Sat,  2 Dec 2023 03:19:01 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be9e6427dso263849e87.1;
        Sat, 02 Dec 2023 03:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701515940; x=1702120740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ168aVq5QXOtHooxbH+odPbZ9pENqVHXwP/aZSJoxY=;
        b=YeVnEhLbgyDw3B1XXHHKA8yp6osJqjS6IR1AHUCfiKPszypzFQ+bKI1Y0IXI0Xha5n
         R0o7bQDcyc0mbhq2i/KnfP7wYJpmoX6q2oztruhfFr3qD/4WziQTKW/6/xexXKYhcASd
         nl9bgaDbkrUOzhWPg+bA1dhfZjK8wqP+Nxv8NDLrNsG8NdKU1WYRtMbSs9pwsiJ19MYL
         n+ZIrIyPHg4X92OGTHMg/nSP+bEociJObRA5VoQ+TP9oDKMhyJ2P9Bek4aD8HozjUcdk
         61yFU6NqdOmefVywLIA7aH1dE6/B4l5ZZOfrrBdzheFry7lIx6IrdeDQWyUT5fcITsRi
         L/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701515940; x=1702120740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ168aVq5QXOtHooxbH+odPbZ9pENqVHXwP/aZSJoxY=;
        b=p1wUj96fQmmKy/hnmFU+p9s/pNc49imNS4KxjxdEW6uNJQ/E+N/oKoTe7KAkT6grpW
         pclyd8aupC8Fmj4U3W08eJnXdG1YVRMBs7pm8rEg63iIwhGo2c+F1oZWkiqvus7ajx1o
         AJueupfmwPcWM0SZRGPJrlBnfznFygc0hvMVqOvucdy5DGU9G1JNNhBerIxMD322/4Ra
         zmRL+w4jYES+8U5Ux/+kCM2i16UlZemtHBtJdRRZnvA94Ae5coW9p+OWwPJ6sNRZJ/7I
         heCuty4ZN5iUJncHgPRrc+0JDihqza7q4KHVak2OiY2bHrHFBfuBdeBOoVpRVBpoy/FT
         OhLQ==
X-Gm-Message-State: AOJu0YweiEk7sphsTYLeFeHDlLA163IuTM5ga8rpz6elOnjY/HAdBhaD
	XQ1hbsrHFC0SCx5nTb/sYcU=
X-Google-Smtp-Source: AGHT+IErfZeBgQvhH6+UfukRjO2daCpV0/rvJfCL6UgL0+RAW9RuRhKB9V2J64iiN5h4LjG9319TsQ==
X-Received: by 2002:ac2:5e63:0:b0:50b:d764:8024 with SMTP id a3-20020ac25e63000000b0050bd7648024mr1399573lfr.87.1701515939941;
        Sat, 02 Dec 2023 03:18:59 -0800 (PST)
Received: from localhost ([95.79.203.166])
        by smtp.gmail.com with ESMTPSA id z10-20020a19f70a000000b0050bc4ed121dsm692406lfe.254.2023.12.02.03.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 03:18:59 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm/mm_init.c: Extend init unavailable range doc info
Date: Sat,  2 Dec 2023 14:18:52 +0300
Message-ID: <20231202111855.18392-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Besides of the already described reasons the pages backended memory holes
might present due to having non-memory regions covered by the contiguous
flatmem mapping. Add such note to the init_unavailable_range() method kdoc
in order to point out to one more reason of having the function executed
for such regions.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Link: https://lore.kernel.org/linux-mips/20231122182419.30633-6-fancer.lancer@gmail.com/
Changelog v2:
- The holes in the memory are actually justified by having the flatmem
  mapping model. Change the patch and the log accordingly. (@Mike)
---
 mm/mm_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 077bfe393b5e..824bf53e8253 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -796,6 +796,7 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
  * - physical memory bank size is not necessarily the exact multiple of the
  *   arbitrary section size
  * - early reserved memory may not be listed in memblock.memory
+ * - non-memory regions covered by the contigious flatmem mapping
  * - memory layouts defined with memmap= kernel parameter may not align
  *   nicely with memmap sections
  *
-- 
2.42.1


