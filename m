Return-Path: <linux-mips+bounces-7932-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776FA433D2
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 04:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9C8189DA3F
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 03:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E077FD;
	Tue, 25 Feb 2025 03:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bWOqBTe0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06B18BC36
	for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 03:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455201; cv=none; b=albQBI2WYN6XyyZPivKLH9q0fldbgiNZgviBLptjFfktAQMdp3PitcDOjjipzH5rB5FJxAZAcrEgpXf4/sF2J4vxrtx6aRic8YXm8vKMxVpzqJTSGnyztw9ooCxUK07MmpbporkOw6UBUizB6vhJtT/CebfbZaG7PF1HBVk6kHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455201; c=relaxed/simple;
	bh=oBmV5ytFANypY5PKhoeTOhUVK0FgP+zeeiYW6bw8jKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=achbb3IfEjqmpqnQMdtQbexQTdJ9ZhQTEzM8e5nMa5M24f9lYqAamiVJUeQmeie7wMJX4yfRfJIPcgLQa1dBarfS8in5fWwA9eQu+2yiKZukSI7lULl8Fjw+/M/rjTfPytS15oJEh8Nel8Frv8OBoKDRtXvSAUwAaeNzTcNT7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bWOqBTe0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-221050f3f00so115931515ad.2
        for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 19:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455199; x=1741059999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OP1Tf7pAaJ4pNIvAgoQe1yrsY5TH0xWN2DlWHIb0tQ=;
        b=bWOqBTe0FNo2JdVQczJkB9CnLCjn2VsxTrBCMVEO2bTkBwn+9fWyHYUfMDgYlHDlO9
         TDmuZaxsUyySuy8UYSL6LHNPDqNr06zGC4mt7x9TGkuiwf9KeXk58HpCAKCaDHltt07U
         YoEE47cleCA2dOCEBABOZdBBc30QtUTENUi3AKhSwSeiyrIeTHWQ72YZw8/nRNL0Eqao
         MVHiYjurnYfe/P3inyxsjUHjzMLsK9zuTlHqXbnKYH31nouu2ZGM8X3B1qLuKsy5v0OJ
         fwMwi6YsDiBPkPC9QwuTZlX4L5QbZHPCnOVXqf+5suieKikkI6Jm1O5rCiHa81+a6o9S
         x9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455199; x=1741059999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OP1Tf7pAaJ4pNIvAgoQe1yrsY5TH0xWN2DlWHIb0tQ=;
        b=moU5/o1neJyN0fjUjxrdbklFSTTOtnMKifa0+5JZut3lfHsDltPvm6xUefgnz3MrNP
         7/ec/b+znf8EZsjoizCoJNugOc7O38LPz/iFAPPOZnPX034qh8t2APTUUyCRsr9WqrII
         xwrXHMRhr/H/yvKkH7M7IiE1y9PpMJ/bKBe2BNGAS/lNaDX10z7g4iY6UeQi6ysloHWw
         qxizG7RO7daqbPsC6sRdWzmEXL1O9A445oRKY8BdlWJv2yTyYDrlC8zLwVPw43YFxb9P
         Rb1V74/kQ8HQWNzZuhr9Uf2SSj+EiJOJVsghQB3rEh8qMPsR53Dusdo2zcyMR7VJ+WlF
         /DfA==
X-Forwarded-Encrypted: i=1; AJvYcCWB+yXwpGHOyodCJdN3NA7RyQABw4SVkX7xxPVAQjdLpU5Ot4cfIfyl7UyTIes2QxkgQhpiyWthziAA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxy38OyRvmxmQMc3VQG1gGP/jBS76TtLIGIjIakGG+7wqMs5Fr
	QSC1Ac9bpUplHFgSHF5K3OHgDngLEtcttzixfjx+e4yIjhGkSKCM22wFeC82ouA=
X-Gm-Gg: ASbGnctdwXI1Gc9vlx+p4jowNSSfYQ6gwpZ3BiTPMPC6TpLsgp9JJog0A5ab4bhNsyf
	Rvk1lTJ6URRkDb4wO5vBZijcqWNJydby2bi/mjSkvZ6YKYPzP7S7uD6sn8KX6k9nGdYNPWLrlCC
	UmlAPQ1GAGDZHg8CHAI8LeA4bzBDeiV7JmwZSDBeSM701euxc4LHYJOlc4u2Wc2bBzkKAqszj8I
	oRH1XcTTBMVBzxb2FD2r6L/M7px6hnMIRup/VdMLYelvEZ191ZI/cpJH9H243fzOvBvnnGnJasw
	4zMcot7VKhyhGZmf/D4qJGnk2pXDAiex6tY8u2drmAFCJvBR9oyNW0h5HkqaeWSQiw==
X-Google-Smtp-Source: AGHT+IFHXm4yz9k/q53vQDLsSd2kyUiUDLPeAK4sNAWc/t1WzpyNSO/kW4XJ16gHc0dMjVe/gJ+ItQ==
X-Received: by 2002:a05:6a00:230b:b0:734:9cc:a6e4 with SMTP id d2e1a72fcca58-734791ab6bfmr3168643b3a.21.1740455198810;
        Mon, 24 Feb 2025 19:46:38 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:38 -0800 (PST)
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
Subject: [PATCH v2 2/6] mm: pgtable: change pt parameter of tlb_remove_ptdesc() to struct ptdesc *
Date: Tue, 25 Feb 2025 11:45:52 +0800
Message-Id: <60bb44299cf2d731df6592e446e7f694054d0dbe.1740454179.git.zhengqi.arch@bytedance.com>
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

All callers of tlb_remove_ptdesc() pass it a pointer of struct ptdesc, so
let's change the pt parameter from void * to struct ptdesc * to perform
a type safety check.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/tlb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 54f579750c8e5..18bf499ef8801 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -506,7 +506,7 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
 	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
 }
 
-static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
+static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
 {
 	tlb_remove_table(tlb, pt);
 }
-- 
2.20.1


