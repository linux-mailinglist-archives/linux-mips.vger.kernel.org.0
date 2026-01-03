Return-Path: <linux-mips+bounces-12729-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A25CEFD08
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 09:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DC5F3037891
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 08:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F17298CC0;
	Sat,  3 Jan 2026 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bilx8RtB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2152F49EC
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430094; cv=none; b=cQe2aV/R6QM2zo4AZFZm4APsnyYj39tnERPDtquTlIC3nlKVtow8oAGYuBPUCvKOmuyjUEgH6YuUklwjrQip7Yp+F5WoSwUxl4uinTta/GstwOzVQmEQAoD1SFcgI1sbSXl9QRjuFgiAlijZoGBzs8S4RFw4o6tubfnvaSNpCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430094; c=relaxed/simple;
	bh=oIgv/iap6eJUypBzfrXqBPY24iAvY6WZM/n8hSDWbD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTUEJSRz+Q7pekL6wK8fdl5XrK4ue9Ie6aNyzuSlJleXeNRkcjs20fr+SHN28KByHD1vOqiN+VZOrNg2UMLTD1Bhta9vPMXjYbU8OQ2M1Z4xc7XvClAZbW8SxmbI9AclaUWzCj9zVX3yBFb8hYVGKReG/b1ae0dFLrUrBfuUBDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bilx8RtB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so7722303b3a.2
        for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 00:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430092; x=1768034892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNQtBvCUtmnAPeuru8aiLc1c6bgNqqxLSRGoZ3PSDyY=;
        b=bilx8RtBmkyiCfSsTQVLuz0FN3P+m625t1fYEnRdOwgYe/SRKzZKRM6N9yIk7cUO4d
         I6AMvULEQ6G+E2Z0i/6KfVBiYgaTVS5SI+xe6pHQ2zC8n8upoQxIdb5yXU/EatHFGzLO
         SG2PtaFj41WVpSUHLtla78uZN6+KH8/wJfVsdo6k+sxMCuAE5ihvZXMwFIlEGoBB9SGj
         s2BumkGobJrg5g4NNPqOMzofjaPwYxUWP9IcEBdQ+WVFgc9WyguoWbwgb8hqs3UyqTba
         WHniO1ywZqeKX8i3GeUmBEeXQHgW4+QIeT3U2V7EYciY6SebbWQ91B6jEeEOw29qkOHr
         +xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430092; x=1768034892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNQtBvCUtmnAPeuru8aiLc1c6bgNqqxLSRGoZ3PSDyY=;
        b=VsCkZOtufMIY4veXdXLHmBmbG5bjx1ps39/9jqg30nHMMvuROfV5Ujvb6dPU99sQok
         iwuDNrGrR/9Lk9IIPuEvlOUlsgxq/NhzTDrS7x0Pl1t+tgYRQXropw+P1X2blwX09Jhx
         /ucWrdB42jMINLA4vCksc0WVrLK6I978iQwah3jAEjF3a4fZpD3zEC02l4EqJFvxxuqq
         ARsJNTOxADvzDIO270l0Qyn9hszkCo9glNCi7GJpEW9LBJ8Ny4EupwziVhxuO0DynWTV
         KHafAW/cem5T+Xi4GfB+I9u6A+d6+OuaeI3C3MCQv1/SEplESX7M8J9LR3GZtj3KzO1q
         nTRA==
X-Forwarded-Encrypted: i=1; AJvYcCUak46QXiUomjTWhAoxWQYJWbzsvqZv5TuDrKMGMLxCRG2Fhpt3lIy/2/yaHpqzTZmkoKtIuort5uxQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ps320lfFGKF1rgNMCZlaMIkRxZyxuTndxI5sk2SmlXcZ3tRP
	eYU0DeLaPtMTYnq2Fenf3ym9GcD6C16pl5A583DrLF8Q9a53A08CUxdx
X-Gm-Gg: AY/fxX6SKxq+vHVtdasbzyJmGRQ9OGwL9h04bh3J8fmBvKLfydPT+puKMm/A1/09D3g
	KI24auYIAjFfuItIwJSuAmi6w+en74WZFjBe0Gq/n65ET9Lq5pcJLkg5zszin5/UKxFy4+EpFlP
	ZYFwwLAtCnfbHNj7u2VMOFiV7H7rBo7HHMDeFRzJ90weV+uRXLh/F/Ab2cwgQR19+1V4iZSCrWu
	tVXD0j/eO9Xrocwtf3RT9Ch2daiGd/Gl0qz6N71kSugjntCawyLzrVsJpn1cYCSPKwhT6m87s07
	Qbt0Ys4HTt/cmlcrXE7L26MB4lOXKAZDtBswppT3hipkTdEYa7QSy3lX9IJdC0P+zcku8hnsbM0
	C0ewkGmWLf/HY8axCiQd1+rpUY3BrLWriNsxTHkPgTNOPS/yMSD2Z1mrumNQ6bGCSyqiT56Q6lL
	E3arTtomrZMernzWjTJR51kBy7QTz+6UH5IuA=
X-Google-Smtp-Source: AGHT+IGp+2Ae35OlKcY/AZO4SFhsJuhif38Zo263lmc6gG+RjhGQaVQCgX9rVZBWLxbZMYLURcJ7SA==
X-Received: by 2002:a05:6a00:e11:b0:7b9:4e34:621b with SMTP id d2e1a72fcca58-7ff6421137cmr37196936b3a.12.1767430092345;
        Sat, 03 Jan 2026 00:48:12 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:12 -0800 (PST)
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
Subject: [PATCH 5/5] uprobes: use kmap_local_page() for temporary page mappings
Date: Sat,  3 Jan 2026 16:42:43 +0800
Message-ID: <20260103084243.195125-6-ming.jvle@gmail.com>
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
 kernel/events/uprobes.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index d546d32390a8..a7d7d83ca1d7 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -179,16 +179,16 @@ bool __weak is_trap_insn(uprobe_opcode_t *insn)
 
 void uprobe_copy_from_page(struct page *page, unsigned long vaddr, void *dst, int len)
 {
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	memcpy(dst, kaddr + (vaddr & ~PAGE_MASK), len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
 
 static void copy_to_page(struct page *page, unsigned long vaddr, const void *src, int len)
 {
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	memcpy(kaddr + (vaddr & ~PAGE_MASK), src, len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
 
 static int verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t *insn,
@@ -323,7 +323,7 @@ __update_ref_ctr(struct mm_struct *mm, unsigned long vaddr, short d)
 		return ret == 0 ? -EBUSY : ret;
 	}
 
-	kaddr = kmap_atomic(page);
+	kaddr = kmap_local_page(page);
 	ptr = kaddr + (vaddr & ~PAGE_MASK);
 
 	if (unlikely(*ptr + d < 0)) {
@@ -336,7 +336,7 @@ __update_ref_ctr(struct mm_struct *mm, unsigned long vaddr, short d)
 	*ptr += d;
 	ret = 0;
 out:
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 	put_page(page);
 	return ret;
 }
-- 
2.43.0


