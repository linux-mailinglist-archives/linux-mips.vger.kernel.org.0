Return-Path: <linux-mips+bounces-2978-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A44898B8091
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2024 21:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 113E31F2477D
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2024 19:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF6A1A0AF5;
	Tue, 30 Apr 2024 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pEws91zF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF4119DF57
	for <linux-mips@vger.kernel.org>; Tue, 30 Apr 2024 19:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714505526; cv=none; b=EZQWfgKvrE6uL7OCXhs7gBvrZO217Ggp7E9YE1rQWdbneewb1bgf8iUCRldQjYGrVX20htwpLp8cIr6gaxfqNFkaU0ECNiFw+lbaazge7OjExpYNXtO8T+HMxeIsNWexAOiizsei7AOj72EZ5eBa53yRb5i2ZV2qm/JwHx/yoYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714505526; c=relaxed/simple;
	bh=LpfSAtfaCACOaLvBplHLMq/lCqNS1Zqd5xDlARtwz50=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dAGIqmUJLKcL1584T9BbEHEX+qw2yZUueytP/JJaw90O1QOJBQtEF5qUFMcFWXRMHrPzKE4KF17uMRPTTrR206yPD8kp3cwvQqOQMajoEhuyJWOPAF3sfD1rW1Qm4cJWro67gBNshZDN+d1hqHRgu1o+f20hTcDa7gBsU1zrR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pEws91zF; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5c670f70a37so6249126a12.2
        for <linux-mips@vger.kernel.org>; Tue, 30 Apr 2024 12:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714505524; x=1715110324; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=teE05Ylose2pcYDprhAFOjLN/sOw6wgj1YwY4a/EgBU=;
        b=pEws91zFBG08nKmAbcexKp1RDm1i0jD+JNppz1g4odAPDckiDS2EyY/utf4f2iltAX
         3JX8LKG2DoEyY4nTDzeyKavCpWTjUDUVPwacQr3Ii9Wv+yZzRRwV5kdl29ePv4v8m5Oh
         EUVU7X61csMxGXG1V96eb/Hxhgk+G61QDMfjHb+ughUxynw/jcpIAkY3Fndy0kNQIOxO
         dcUpkMXbVAo0qtJBimEZq/TEibG2xoiTj+gxnm6eaLs0otz0pEkBc+A8tlw4PPhJfWoD
         mm/HTvkq+g02ECs6k+jCstGmkvhJlwQp5XQjGB8wuKfm3sKYNqTGWKPCq0kXKkeKlG/K
         g+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714505524; x=1715110324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teE05Ylose2pcYDprhAFOjLN/sOw6wgj1YwY4a/EgBU=;
        b=WiGGfqgFPSKtdA7d40PCFPh7G+blh2+39DEoRyBMBZiT/cywv7SEPTc9V4PhtNNapJ
         dhPgEt4Xc1hlRKNfJTh2zdf3hTe2KaETQZhn7nIHcS+JTEJ9a0E/pyrIlDgHmEJ2G+aS
         6sC56gdtmIFBI5JGMUrHAfiuGKy1V5Emx//DqB5TQGQlFOYGhPNEoJ6Kd+HpV4CrfGF8
         ekIkHVe/uUxCw8ZUXdPtVFHpWBU9JMCm7OmqYUXwIyHPyOnD5SlSu6c+E/AAL0f0vW7y
         wQ9MxK9iEF2mZASp2T0nlTpsbaLGBgk94sPnFpyM+rOlLbDdQbYNQGWUp6OzilB5/WXu
         5oqg==
X-Forwarded-Encrypted: i=1; AJvYcCXR1CJNA3Zp7okCJN8k9bEyX/RSDarGJBthVL4+vokkRc7Ef12CSzb6y+94gnTIvf/r9SRztHyzorfhRxcz4UdyxdK+56unpV3F0A==
X-Gm-Message-State: AOJu0YxqaMMeKTlC+mVomJNsuc/yrvcqjuJGvPzGpem/VfQ2DYazbE/8
	tsTAlj3f6oXxpl1/9tl44vh1/opR03YZl3y9TbHZc6DcqQafWvkw5/VbEvxBNTqSaEO8KU1o2gE
	gZg==
X-Google-Smtp-Source: AGHT+IEbG2WGq5H7HJJ3oJz7X/vycBy/FzdcOadqmLeOQqQxGZZjzOUu53htbVlU23el0Z9xOdv4S0UMTZ0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:6a1:b0:5dc:5111:d8b1 with SMTP id
 ca33-20020a056a0206a100b005dc5111d8b1mr1313pgb.5.1714505523833; Tue, 30 Apr
 2024 12:32:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Apr 2024 12:31:55 -0700
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240430193157.419425-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430193157.419425-3-seanjc@google.com>
Subject: [PATCH 2/4] KVM: VMX: Move PLE grow/shrink helpers above vmx_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Move VMX's {grow,shrink}_ple_window() above vmx_vcpu_load() in preparation
of moving the sched_in logic, which handles shrinking the PLE window, into
vmx_vcpu_load().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 64 +++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6780313914f8..cb36db7b6140 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1402,6 +1402,38 @@ static void vmx_write_guest_kernel_gs_base(struct vcpu_vmx *vmx, u64 data)
 }
 #endif
 
+static void grow_ple_window(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	unsigned int old = vmx->ple_window;
+
+	vmx->ple_window = __grow_ple_window(old, ple_window,
+					    ple_window_grow,
+					    ple_window_max);
+
+	if (vmx->ple_window != old) {
+		vmx->ple_window_dirty = true;
+		trace_kvm_ple_window_update(vcpu->vcpu_id,
+					    vmx->ple_window, old);
+	}
+}
+
+static void shrink_ple_window(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	unsigned int old = vmx->ple_window;
+
+	vmx->ple_window = __shrink_ple_window(old, ple_window,
+					      ple_window_shrink,
+					      ple_window);
+
+	if (vmx->ple_window != old) {
+		vmx->ple_window_dirty = true;
+		trace_kvm_ple_window_update(vcpu->vcpu_id,
+					    vmx->ple_window, old);
+	}
+}
+
 void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
 			struct loaded_vmcs *buddy)
 {
@@ -5871,38 +5903,6 @@ int vmx_vcpu_pre_run(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
-static void grow_ple_window(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	unsigned int old = vmx->ple_window;
-
-	vmx->ple_window = __grow_ple_window(old, ple_window,
-					    ple_window_grow,
-					    ple_window_max);
-
-	if (vmx->ple_window != old) {
-		vmx->ple_window_dirty = true;
-		trace_kvm_ple_window_update(vcpu->vcpu_id,
-					    vmx->ple_window, old);
-	}
-}
-
-static void shrink_ple_window(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	unsigned int old = vmx->ple_window;
-
-	vmx->ple_window = __shrink_ple_window(old, ple_window,
-					      ple_window_shrink,
-					      ple_window);
-
-	if (vmx->ple_window != old) {
-		vmx->ple_window_dirty = true;
-		trace_kvm_ple_window_update(vcpu->vcpu_id,
-					    vmx->ple_window, old);
-	}
-}
-
 /*
  * Indicate a busy-waiting vcpu in spinlock. We do not enable the PAUSE
  * exiting, so only get here on cpu with PAUSE-Loop-Exiting.
-- 
2.45.0.rc0.197.gbae5840b3b-goog


