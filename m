Return-Path: <linux-mips+bounces-12727-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B613CEFD02
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 09:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C39D3304356C
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 08:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C412F5A08;
	Sat,  3 Jan 2026 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9g65KJ8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527E52F533E
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430087; cv=none; b=rI6UAhY4G4O49cYeL1JsmI5QcB90+IZdZ72feRyObUdyb6h3tovPSB62wePmnoDUJr+rO1egUjbmBO6qiESIf89S7FKiclUlq2TT2ZCjF7dHjxN1tVHfr6sHududnz/4SO5nJ+2n7pNBkVFBXMrXCBrhjFyMmztkNfWc0+SmnXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430087; c=relaxed/simple;
	bh=oYuaUV5WENSL8F/FjXeon1A0GIHc+2y/rBKD0wnXrPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7Gfyo2om6JA0LuyWAtqIUB7HkSeMJtqbfYIuBkLxv+D1AvButvQGXL2SC/alRba0SgXZxv6OI+EacuPaERvcX+bIQQjfSUbjHu/QjIfrc8IwnDT2rYy7ivN636BZddsRFlEphiiwnVcCzbUeudltAUPN8s6o+R0xhq8skKMd68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9g65KJ8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so11946324b3a.1
        for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 00:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430082; x=1768034882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvs9mu39u8pUKEaoauSfWHl5WiFJwmaNAiuKq3SpZKw=;
        b=N9g65KJ8ls6eTbuuzFNnIHa8J4iX4HVSOKPC+OTcziaWUi2+UYW0Woy3QAm7tnyAec
         MdtbXdEDTvVTVFw+/wO+d+ijtz9jT70WrTR01g/rrChIdeHSXnfCc9joETFSihgZsp2u
         pXImFY8OPbtrtZR6x1i7PBWxLc9IvRaHofYkAdJRV9LxOjJ/V4TxC4VZ6+ReotXwhX3n
         r/fTwVikQc1ov1qB9bvAqHIbOZRQvAOsA3s1lVU3N89tRdrxdMOa5L9aU+P80DIfes+e
         45m8n12KfIoox+gCTiwPkpoZkRJO+bsk3zBClzl8GpqSmAtUrhlCZMkhbiMjuvHfMBW0
         GyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430082; x=1768034882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bvs9mu39u8pUKEaoauSfWHl5WiFJwmaNAiuKq3SpZKw=;
        b=n9uXsUywj9oOg40zyVupy8YYubDno81ZUHvQLhjSgM2Wk0lStzzu2iZlU0FTQuayox
         oyi+2keDw6p7HlA3TxpGYSn/SOpJrIiSzYSebL5wGaw05VxFvbgTsy5p35SgjV2lcjaK
         Z5mjAz7iRTeNJDf/DdTvG3uTHiPRjmGARMYa7UPpGXPsXJlZLOzyroxZBFV1Msob50YX
         foSiLjX7EjPHA+1mTNkXc/rkPnf2gPrDnjtPd/mNDzNhFwuOmzNxyAauaS47L7QbO41j
         S2iV/LAnPLiMDSaQi/wUxEGFRsD/g5VZTa+OaVkFaSNdON320rbnRaioaxuGjmIXiM0R
         4e8w==
X-Forwarded-Encrypted: i=1; AJvYcCUfNn6OyAqqkkRWATVOkSaV02XaxShal0OryaXKTyMO4Yv7u/vzouQBHcabn2eRLNweRjPgLsa9JgI5@vger.kernel.org
X-Gm-Message-State: AOJu0YwUoQQiazAMF5bJw3ou5V01SC5jbAi8F3zqhOg8ciHXDhy47nKv
	1gD6YzynVsBqCODi/DnCBpRxtX2WQKAO3N8RVw1xL/OnsSciv5/FxrWD
X-Gm-Gg: AY/fxX5UCIBYaGHBqO9GtGjUdUzH3GH/BSk6rBPGGuW0Ke79JC4jzZdT6aygOW+qE2A
	y3xPbAIWp327N89TbyNfBaRqenyUghb7LAeBrJVCSsQMgWT/PP/WtHz18Gi/wjjTt82SPG84F9i
	T6eNggCo+RpCUSIMKgZHA5NJecJHLoIfOVyyq/FNezaBYqoHhPxoqqegoIO3l2EhkvnDnuvQBJq
	440QV54cwSPApFZp2DIXJ9FX3QzpOrT/ksjWDSnBiy/mfm03B5So03kPaJu3lfbtwQ8rd3dNDLT
	Dafnfe+zI2DVXq7PcPIVL0aOA+caAKRXAAxGIgqd1rBAhRU5+90QZXmi+LSJfEFgpmX7OYKyy4G
	UigJliUzjC9FUNxc2FR/WcllOGdF0JU4D8xJcwx0vjDQfYgFvhijY1ylZVfbjMpkHMfwel8wE+7
	kyfbc3SpF5fhPYfpSamxWcrAz/4foAkAN8L+M=
X-Google-Smtp-Source: AGHT+IFtMJvjrpfUuqAmA+OpACtkefUVF2XH5YredFgsYPdy6OhoXIwbDm8pMiudZkIWzurpixeN8w==
X-Received: by 2002:a05:6a00:338f:b0:7a2:7792:a477 with SMTP id d2e1a72fcca58-7ff65d7e81amr37223258b3a.27.1767430082432;
        Sat, 03 Jan 2026 00:48:02 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:02 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 3/5] mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:41 +0800
Message-ID: <20260103084243.195125-4-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 arch/mips/kernel/uprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 401b148f8917..05cfc320992b 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -214,11 +214,11 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	unsigned long kaddr, kstart;
 
 	/* Initialize the slot */
-	kaddr = (unsigned long)kmap_atomic(page);
+	kaddr = (unsigned long)kmap_local_page(page);
 	kstart = kaddr + (vaddr & ~PAGE_MASK);
 	memcpy((void *)kstart, src, len);
 	flush_icache_range(kstart, kstart + len);
-	kunmap_atomic((void *)kaddr);
+	kunmap_local((void *)kaddr);
 }
 
 /**
-- 
2.43.0


