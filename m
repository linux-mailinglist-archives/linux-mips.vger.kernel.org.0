Return-Path: <linux-mips+bounces-11756-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F4BE5F4E
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 02:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2E10188A766
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 00:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCC42BDC15;
	Fri, 17 Oct 2025 00:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tl8JaAdf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13D29D29C
	for <linux-mips@vger.kernel.org>; Fri, 17 Oct 2025 00:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661203; cv=none; b=nnvHvuf3bK5Y7SZyeTQeunX8Fc03lw0Qfl4UuK+rfDML+gugbVexvaCs4ZpUoB88nFbwUrid9yM+Iy/ERBtx1rcFbbklY88VVAkXzjPJZIRoxSiAiGVNSeZ0PYu+O8de7xYIGhz49UUe45pBTVfLxYP4670YX2oL4DUV3SsVnY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661203; c=relaxed/simple;
	bh=tg0l56HvAdoWWKikkxStnVhmDSB2cUfpRDPGIT/ddFc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vx0PytgHahv3/dSUmxQXv1aSH3MzINEw2bgaAGqmriGZguCycg9Yt6IM/aijdW7xqLp1Pkkq9oDKJjl93LsR0jteuIStSXPaMg/b3XFle8YZ38IQ8cL9W699l3q9Bqykn4+plDANYY1/9QK4hv4J+EsQKavVLiK2W/dX7cF6Hfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tl8JaAdf; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-290b13e3ac0so10260255ad.0
        for <linux-mips@vger.kernel.org>; Thu, 16 Oct 2025 17:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661200; x=1761266000; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=;
        b=tl8JaAdfHhXoNOtZDXn8LDYLS+l/s5jkVijG6SU417ryDCkaSiAEsS0sHwtCeXxCn1
         YQhlXPEGfCD8pEnp9USPKYIqfNrsPbieBVp/5bDBLXLyx/IvQ9XV9gShpWx32fYrXY6J
         BQi4bc3GKXFVjaiI4fOzZDvy98hQhpnFtQHEPepLf08OvlConiOC0GrX/lTqmzglp101
         3b6u3IPDiMR4YZr3/TaouteG6gmOgaSNWr7MGVlsEg5TI15x/OI63sf4gzkgs+VXDGep
         Xthn/g8sG6oThIJb7M1E0fBxU2htOBqok16jWkNvJa8n79Kw1zezjoIK3OXR4edooQAP
         DPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661200; x=1761266000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=;
        b=Je05MK0JciIcNRvHaXqxvSjRNeZdpKjEwfUEHwWNoDno7pVMW/ox9L+2dbViVdGE4U
         XN6hOETNlALaJEykjSql6BNM3AyqKWI/HH9iBsJNRnt1iZTKmuGZXWKMC+plznUNYXAh
         OYXHz1jzga4ZQ6Zgb+Xz0m2JuVFu/BjgQ0fUCbaMJ1GF+Ee6lEGGc2bFC/7x1k5TkzG6
         wjh2t8zt/Jdz7jnYHjimmV6i6v2UeBNYg5NyeHHGmuEo3mc1qEdsHWVYm4PRSByLHrOd
         RbDroIPRhQZaDG6oVeBHd3c5uyQsWHxLM3mTsXIgakQFCcRM0Kgp2esyXmdvq8EvRraG
         rblg==
X-Forwarded-Encrypted: i=1; AJvYcCUxWW+OwrsU+UuFxbTeijAr2Z8iXdYG839wYoHElcFdcsacT6XlBb05K8hY34dEJD19GiHFTx/iF/Fd@vger.kernel.org
X-Gm-Message-State: AOJu0YzY73u5EvLp8EbmpWSA9y+CkWNK0O87yrNXDVIKsHiqd+BTCiPH
	wmPtx+Zx2iJmiaqFVpahAJ8ENEUFV+/4V4AZLZkcAobeO+1fZY0aD/hwXA4LlLA0dcOe+Q17cPK
	d2zwqcg==
X-Google-Smtp-Source: AGHT+IF8DlOutKWl0i8m+B1TfQqXPthFr1585kr7hlu5o2md7/0QzZzZHhKvSNGyUqeTAbPYZaEbqdnIEp8=
X-Received: from pjbmr8.prod.google.com ([2002:a17:90b:2388:b0:330:49f5:c0a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e544:b0:26b:5346:5857
 with SMTP id d9443c01a7336-290c9cd4b82mr18056465ad.24.1760661200311; Thu, 16
 Oct 2025 17:33:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:36 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-19-seanjc@google.com>
Subject: [PATCH v3 18/25] KVM: TDX: Derive error argument names from the local
 variable names
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

When printing SEAMCALL errors, use the name of the variable holding an
error parameter instead of the register from whence it came, so that flows
which use descriptive variable names will similarly print descriptive
error messages.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d587a38581e..e517ad3d5f4f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -41,14 +41,15 @@
 #define TDX_BUG_ON(__err, __fn, __kvm)				\
 	__TDX_BUG_ON(__err, #__fn, __kvm, "%s", "")
 
-#define TDX_BUG_ON_1(__err, __fn, __rcx, __kvm)			\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx", __rcx)
+#define TDX_BUG_ON_1(__err, __fn, a1, __kvm)			\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx", a1)
 
-#define TDX_BUG_ON_2(__err, __fn, __rcx, __rdx, __kvm)		\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx", __rcx, __rdx)
+#define TDX_BUG_ON_2(__err, __fn, a1, a2, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 " 0x%llx", a1, a2)
 
-#define TDX_BUG_ON_3(__err, __fn, __rcx, __rdx, __r8, __kvm)	\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx, r8 0x%llx", __rcx, __rdx, __r8)
+#define TDX_BUG_ON_3(__err, __fn, a1, a2, a3, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 ", 0x%llx, " #a3 " 0x%llx", \
+		     a1, a2, a3)
 
 
 bool enable_tdx __ro_after_init;
-- 
2.51.0.858.gf9c4a03a3a-goog


