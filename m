Return-Path: <linux-mips+bounces-8430-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF057A7A7A2
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 18:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50794188D7FB
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 16:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6C72512E6;
	Thu,  3 Apr 2025 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZF06Q79g"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF0E24BC06
	for <linux-mips@vger.kernel.org>; Thu,  3 Apr 2025 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696720; cv=none; b=sEn9I5l7KeuW/jqAtfMltX5qZpUM1yAwgV49F4SMVA60d0PPRotK/c70Uvv5dQTFvjOnduem7qJ69+bEpkQ6HpQhX2OZ8Yo7t2omTz/mNEu2Le8QTqJBbNVPXUQ5iTvTMHn8TUMMXh6LNoyWdvCiNZNL8T0Qle2BS5Gl5kOZ7a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696720; c=relaxed/simple;
	bh=xWKvujlEc3a1G/hEnaEb4bbqAxOmpfHOmP/ZHXTCPoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9vypzEnQCLsv20bL+CDwuDXjUL1PP8vMR65PG4BM++dsshzJvIk3XVj5pvBrLowtgTyOPkRxz+xDAT0s0/wMG+z4xL/G4g2cIMGP6TAE1ciHDpQbvjWB6Xq5ivFg2L4oIsHY9ik37c0EShWzO8xyJ2xOJ6t3URtkmcM+2O4xAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZF06Q79g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c14016868so989829f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 03 Apr 2025 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743696716; x=1744301516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0qah5r0YxopdSOr3j8EB+UePdxFcMbP+QyWfcyYnfk=;
        b=ZF06Q79gpeeZJqR2sSQoJmY3m6ysRNnxaGVa6jNVWfEELTtpX+Im0IgY/mV4/UdZds
         3Lgm+enRane4PZ99GtwX+qoXPX+nfqqzOJwhNk07hvCA/weUIzvhlpX45h/nOAtHGL9w
         cZ8XuXyU19qfsU/4zFPtATYCPDY2JWSM+AppvEPaxkqZlF0URtRchevw05942zmldiW7
         sJSEi1b/qncMb8AiY6NVpGJuIPzY4i6HDZ/VW4zqWRsyBopHqm1trqebY/80jixFj6Ld
         QU50J9avKkf+wGWj6Spx8Yuu2TKOGBYM30MCOm8b/EBtIveezTwwLJH5KCZx+x1TEQLV
         QZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696716; x=1744301516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0qah5r0YxopdSOr3j8EB+UePdxFcMbP+QyWfcyYnfk=;
        b=n/1PmidDOCZfrONJSrUUNzl5xSiqBzxQd1veGSADjwPO8fPHKmhigHvpow1qAm+/Cg
         f7cZGO+O/GfHqHc9F6+DFk8QHpFvrVCnPiqHKKfieP1uCQEAYW9mnHuGva3dJM8/A8dz
         J0wPF4LaAmK4VxnG5T6z2mGFv72hSOV5+h+WXfZ+KUvjnms2LHocycWopkeCgR07rWjd
         7XMxMcSXgtgxch2My0WQXeSo4j6fNKdd6Yq0b+IEuW3e929/9oCeS/15hcMbcgEf5lZ9
         5UPq3ZrCw92+mBRK+sSxUNefBv911v3+rCJvzKGDABt3cPZ5SkyWD1+1thTEoXfPLbTw
         IlfQ==
X-Gm-Message-State: AOJu0YydLu+wxfLFJTbf01FwmnM13mMR2eELh1SkM1ukb637y7D2ZSXe
	lTCcqiTF7wN46A/rYviU9r314N5L54hbVHjSsoyPOUrL9+7p2OP5c2yVshGUNmwQVLWj0CGFFRd
	2
X-Gm-Gg: ASbGncuIEguh2VUvgg58CfDM1xsVw9ohBUnWeCl5udexwjS57CPNO1cQIC87tO/gOqX
	f8cQHztZJk/p+znFYJoWbQBWgay0s0iVzwQL67GXg2CtiXbJi8thgPfUBenbV/heU28xUUea6sF
	khoQnXsAwpLxD0F4PHuzyq0dxRhtLmQvMU8icU3n7LkR9L8x+ZhwvUjKPenW4BDsuQB+6+siOKv
	1YJowzbxkEH5waNozq0Y0l397mEu+6M0Kagxr1M4kFnhoheIKoxWEKJyuxzNoxw5aGUNOGPqJY/
	aopgtYgEObSFiuO1mmA8uBNG5ceedxhYPGVKGFmzlwX+IbfOKjh0QA/QRblDUGeoR4D2curAcNB
	naA==
X-Google-Smtp-Source: AGHT+IGHiHks5yY0kEiPYjy6t/YMBcLUNF8gYXeM9L8Y9BZZqlH8uwv5gbCILM3Ud6Tju1r2KbkGkg==
X-Received: by 2002:a5d:64c6:0:b0:38f:39e5:6b5d with SMTP id ffacd0b85a97d-39c12117d3emr19232449f8f.44.1743696716567;
        Thu, 03 Apr 2025 09:11:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226acfsm2112383f8f.88.2025.04.03.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:11:56 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
Date: Thu,  3 Apr 2025 18:11:43 +0200
Message-ID: <20250403161143.361461-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403161143.361461-1-marco.crivellari@suse.com>
References: <20250403161143.361461-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing .cpuidle.text section assignment for r4k_wait() to correct
backtracing with nmi_backtrace().

Fixes: 97c8580e85cf ("MIPS: Annotate cpu_wait implementations with __cpuidle")
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
---
 arch/mips/kernel/genex.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 46d975d00298..2cf312d9a3b0 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -104,6 +104,7 @@ handle_vcei:
 
 	__FINIT
 
+	.section .cpuidle.text,"ax"
 	/* Align to 32 bytes for the maximum idle interrupt region size. */
 	.align	5
 LEAF(r4k_wait)
-- 
2.49.0


