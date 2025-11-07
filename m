Return-Path: <linux-mips+bounces-12140-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF0BC41F2F
	for <lists+linux-mips@lfdr.de>; Sat, 08 Nov 2025 00:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C5F234A66E
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 23:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FAE313E20;
	Fri,  7 Nov 2025 23:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGapfCye"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49948313E12
	for <linux-mips@vger.kernel.org>; Fri,  7 Nov 2025 23:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762558088; cv=none; b=HYKo2R57NBsfipLx2cYuqriZgpLIL7C0x+j363Q85GCRkxyZNC9XysRCRMF9ClZy4xGTHxOxMiZ+HBgJJsDJjt4Ba6/+/aBLwaAunUke+Vp4umC2cPQmHxPHxhHEL/mjXuUPQhYDSv9HVh9SgrrpGpRI/w8SrmTflTAg4rW4TKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762558088; c=relaxed/simple;
	bh=+/fFPp+rQE0Kv4hAWny8nwSCwR4OhKVRzT5fLbOpHa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYa2SD5klDHwSvlKg0WlLK2Jbcu3hRt+S3JHSbGtPwq9RL4eZGSCnzhjCSb0qplgMMg8O8eqhS9NNYkSzH2btj2MklzQRp2D/3aRz+jTj9/fHThvRIH5dyLeE1WYG252x/dz6uynCQIqClqrkcrBTWHkOSP9DC15BeqXeJyAVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGapfCye; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso192999a91.3
        for <linux-mips@vger.kernel.org>; Fri, 07 Nov 2025 15:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762558086; x=1763162886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FRIkjyQLpnKSuNdHtvanSQnNNTZlAIBvW93bELD2Kc=;
        b=EGapfCyeIhBL8Yr7SgHoNHSqPpXt/YroOD4EOwyodvIe5hpLH84XTbBt9GwwRFzenc
         g/Kxh84G/a/RGdtuaxMEf4SkEbBaB5r5Xt9lpQyNYeMZPbOio/uUXZLCuLqajUFSn5iH
         xn8uwPTwvnEMzel97dVbIMbxukFMmkM5o1S9YnBSDpDeZtEH3KrXV1P92v+C48T4H+/E
         GWDveuuENdgcZZFA6Zgq6N3LOvZNL0LBnr5TrzTibDXMF3CQxfHAe2Ah7+fl8MClTHbI
         tOpSPL0ZrdrIbw9HBRq+fqofMREV3MSB9qkK0es79vOftJpULebSn9EL7fyi7vUx2ROs
         qmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762558086; x=1763162886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FRIkjyQLpnKSuNdHtvanSQnNNTZlAIBvW93bELD2Kc=;
        b=m0yXJ4DkcrTsJ30B65lU1qqz2aywg1F6Fs+1pyJT+S6rkqGKGcWmMYYE1CNYwru3Md
         ktz0CWYuhFY6Z+yyyXjf+aDY567A/pJQ6HM7+y8bkTHlxu5LJ4Yvfs8KGfDCHbdGJ3p5
         HjoevcNgX9PdOAfCVEwKrXaWC2RkwoKJd13oZwFB/xlWqyGRe+qcVHqbEG+8QbFMzdMJ
         0joBU95wznN1dCFn8Wkx/j16tOY70JDRBPf8DYULq5DWFHp5BSMuKMSO+ZYe4WhzczWQ
         9ppub8FXZF3ReqRoODt29rAtldi0d+GI2S5hJyxwPHaUN9+IslLfaCqLvxeGXjdhHjfK
         tgkw==
X-Gm-Message-State: AOJu0YxSaG9GpGlzkZ5xi6EHbQqTcugBuy95PJV7WCDOt5QilYWYGw2Z
	RllaR+3JXyyhySg7B6L6Q5/SevGxCCnY5BUNBdTwQIbc7GzYRon2LXdNbZvX8Tye
X-Gm-Gg: ASbGncuB6Iha4ehAGga8AftATFi9Z997B+PA416pQPNm93C5IwLXZi9EyH1ifdv0/Im
	O7z31QLdpZDiSVlnoChrqln5fUPgGV4wUimsrPFHFlS2RH+X7u2XpRiN+DNnPzfMouYHIu7OvWg
	NmGEqWVGaczZhiN+ddoulwAReVUFTmEuwwsKJHdoyXsnRLRSEqy1psls9RpRSMQpyM8by/VhKe+
	7nT19zGoZabAws+qF5dSKSM9NVgUHTL/Bz+xlXPj3EvWZ4FgtYfQVYpTc9/MiSOow1ljG+MB+Jc
	MONObLpGdeeVrTECRgTVmH3j56p/DKrPS2tpIlWdwKU7z8ICE+i/zAxRwyQRHanJVCCkhzb9DHl
	552cj8CjK+YdUGjVWMMC5EQIEhaCUbcV+PaNd/FaF47QVLptP/WkHdXi6cfmYTKwPwWm7aNDauW
	tS2gxhS0Tv/gyyTXYtlTXDbIs4HHeOEUoZHjsL0GWhUrE=
X-Google-Smtp-Source: AGHT+IEnfB6XHf0tun8R6O8Jd/whhZxRIBexp6VVi1lZY68s7/51Itvmvrdz7VaaTUr138BNkkf6Iw==
X-Received: by 2002:a17:90b:3885:b0:340:ad5e:cb with SMTP id 98e67ed59e1d1-3436cb7ddacmr770381a91.8.1762558085998;
        Fri, 07 Nov 2025 15:28:05 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ba90138f614sm6166240a12.27.2025.11.07.15.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:28:05 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH] mips: Remove __GFP_HIGHMEM masking
Date: Fri,  7 Nov 2025 15:27:58 -0800
Message-ID: <20251107232758.105850-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary __GFP_HIGHMEM masking, which was introduced with
commit 3e14fb19ad7c ("mips: convert various functions to use ptdescs").
GFP_KERNEL doesn't contain __GFP_HIGHMEM.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/mips/include/asm/pgalloc.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 942af87f1cdd..7a04381efa0b 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -81,8 +81,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM,
-			PUD_TABLE_ORDER);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
 
 	if (!ptdesc)
 		return NULL;
-- 
2.51.1


