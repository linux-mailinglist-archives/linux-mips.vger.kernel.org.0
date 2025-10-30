Return-Path: <linux-mips+bounces-11950-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095B5C2235D
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C04A4655B2
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 20:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75536329E5B;
	Thu, 30 Oct 2025 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VmRawTbN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4BE393DE8
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 20:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855051; cv=none; b=HCAj3GO5BDswIsQMV8Fow4LLXnLF5o/en24eiNGpuJKTKDN9/OV9NKiqRKlFc1LAklRddNIBF4Y8rUGsjyo5H2NeDa9jLHA7S4oqS/lL7xsmlLna1jqrf7ussHgT1y1ItjE/mngqJ+j6YLjpBA++YAlPs2V48GRLOMIRHy0CvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855051; c=relaxed/simple;
	bh=4WxHGoE93VOocFQ5wN0AUJ/80sFNRiS2hdmgOFi4y/A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c5ODqRr3Z5cfLN8WNN4z7ty37DB6J+ivz9ZheXmp7NolHzbpneroCkfQAmuajA9o/rbt3ophzn5R7zWNMnhRhLVU4RpC2cv+S5+jNzyMVA55TxKGBkadsC4R6h1TRsFJDGO46U1dkupdO91zWZ+aoUtjXrSgB4KwvRRTAgY/rsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VmRawTbN; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b57cf8dba28so1198540a12.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855048; x=1762459848; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=q3vUMZT0yYe1EXEiRgC8c4U03xvX09k6brWY3B4yx5I=;
        b=VmRawTbNAViiJiQpj/T71gWATAeSlhmr7dzX5KPAUeTJpZ1tsTsuufgapB047yQAmP
         J8yRP2yThpvFvFlSDMqdfD0g4SKcP7WpHKZQciWcQn/SkCPXVumuPE9P0dPM00sqE7xM
         fke0EbpU7W5Ri39dFAj1nL7srVlmwNY7oj4Go39PIUqs54a1+J9hEZ6bi/09u/jIrDLa
         VSl44p1XarJ51KQK7Zuv8dJPYoCDJince6wGoV7Sz06tB0rHw2ntJh0kgCXkfCfmJUHH
         Fq/p1+EMBMiFqSWiV4HuOol/v6nxdgVqVKn5uPzIBkGwdWKCanB+pgkYeZ7Al8XEN9mA
         AK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855048; x=1762459848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3vUMZT0yYe1EXEiRgC8c4U03xvX09k6brWY3B4yx5I=;
        b=SZDVvcicq3CIyAL9ouVgHodEA0ZdOKrUBY4VRFbCJFhTksvvxR3kBlplBbo1iKUajB
         DhjfnQ8Kv72Yu/hef2ulr3xZxMDaP0+eRk/Ow8NyUOxG4sSsVSBfGbnS2w0x6napU3gO
         FDLZDOvLTIZXg6XkR7F+D3wmEZ2cSnuUoj7bMSle9L5pqZXMht6TG914Dy326F+lvUia
         SJyzNTGj+TYjIc8qrpL3dou3jM3ROul+UY/yTSP2ra7x0htrO66j4hWPZJgsZGL+cD9r
         egfezBejWL8x4JWrcu4e6bwZ2a/KXGtCWhhFpctmIisw4qseFxk7qI/kCaGqM3d2ChI4
         rJ5A==
X-Forwarded-Encrypted: i=1; AJvYcCVef/nWUlMxTzcz3OlQzwqqkxgYPe63Ec/cquglnTDpa5aqBH6fIiYNQPOkrEA9ktuA2u+aLA1JRKA6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1KeBFKCznV7cXScqL8kCoFKpoGF0ziWINzbqq5E39NKK/1sLD
	OMlXJAZhiIytuaLvi87bx64Fh8LofqkW/oPMLWTXewA0x5DgPfmiKedPcY4XdjOqxwWW+9GR0TG
	3ozWnnA==
X-Google-Smtp-Source: AGHT+IGMIUiQfnFXRwKgU4xakuBoSsZwl0KV10BIrj34ojpFyNKXcMvJLG+bxMBFJqWMl0yCEf0bmf3P3I0=
X-Received: from pltj3.prod.google.com ([2002:a17:902:76c3:b0:294:8e58:7348])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2348:b0:295:1a63:57b0
 with SMTP id d9443c01a7336-2951a635c07mr12598385ad.23.1761855047670; Thu, 30
 Oct 2025 13:10:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:42 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-20-seanjc@google.com>
Subject: [PATCH v4 19/28] KVM: TDX: Derive error argument names from the local
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
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
index 5e6f2d8b6014..63d4609cc3bc 100644
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
2.51.1.930.gacf6e81ea2-goog


