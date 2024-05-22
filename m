Return-Path: <linux-mips+bounces-3310-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A388CB89F
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 03:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90A43283F84
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 01:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7C63B796;
	Wed, 22 May 2024 01:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nY9OjUbo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1945F2EB07
	for <linux-mips@vger.kernel.org>; Wed, 22 May 2024 01:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716342029; cv=none; b=FMi0czbxuyp9fIPAOLknUH/IhdxoNgc62qXdmHthxlYazBjfwIcDlTW1/w7LFLQonpVs2cbK4va3tdJ88AL3nFfMbUiF0x/bG54MflPtIxPMhM5dDwRvDqgmLJzVieT2Xp9H5GnPmmnSTW7Zn61jMM3i7fEsK8+r/xQlc4Op1Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716342029; c=relaxed/simple;
	bh=FJaY5ZXsWt+iV/k6HY2WFFz74BTaJg/mMtL9qyrhSP8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UxbrgjWIXe2lp9/1niz3662Bfc9VY7TXcY2cOgeZ8pX/H+Ep4jz+F5jDcncLqgiZUe4L5doSibPppzp7KEV+OEQCzrZ6Tpj5wA3dQ1s2BIRrJXO81g4dMFwi5Zd7gVCpZO964GXEXTwgzajKKD4RSK/aEk9gKCMTxbcqOSj9sTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nY9OjUbo; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-627751b5411so138420967b3.2
        for <linux-mips@vger.kernel.org>; Tue, 21 May 2024 18:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342027; x=1716946827; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=N3tcdNqgpk0g0Qawt6D2SIU8FL4Y9j5vsBcc8xUlRY4=;
        b=nY9OjUbo8J/1K6KSfmzP93ciQH1ZkN1SQFK0scAlnFw3BPsCHA9otMjPsJ4OdAzMr4
         o4IODDP3MUjcpCtOgl99cJtvgDmDGnUMrs4LfvZhpr33t7NPZCH8J/QaOJLSkENEQy6Y
         KsMTAISzXcD39VsGwgpk4yLv5X6ycrWn1VtXYWtMidCxgR+q0XP/9pQt51DP1L/dmUWs
         YeKSQyQpM4NpTDjI0htXkmnrYh+vEt36G0QErbBgSQeY6kH2pnxwbKbOpX7+uLiUPvO0
         C0zBkhAfKorQ/7n7e18+FRyIGS5E/w/4Mn5BuWbTN91OjRaJhxM7LfxtD1ceCnoKOM/S
         /JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342027; x=1716946827;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3tcdNqgpk0g0Qawt6D2SIU8FL4Y9j5vsBcc8xUlRY4=;
        b=kptXXUVbBK5ZCRHEFJQLykCQhBZv04XzQKz7LuvIPUYdG1QkXFV2XcrDAOiXn0MVpz
         fFKYFoa6VsoZvK3aM3NIlKV9CBaAvAzsJICyaHYoanA9QR6gb5/+lgKyD/fhc64QOvqw
         U2MqmVf5bbhRi4+Es3LkWe6Ob4rzeQDC5spobahXlFj7Q0QbSPb6NY1wvzhYYrEEWRpa
         pwyqDopM1GC0UCHP7JNSRDEgG6ZNBGyKHmMCfTbf+LaG3Qd79gg0jvp0vnui2rg0AmRO
         RZ75kqxLT5XVfgO9F+6IthCWoTNCacZBehquFuhMb3bNtYKUQgVJ98E/RnP4Q204kvdM
         VCHA==
X-Forwarded-Encrypted: i=1; AJvYcCU60C7ppWvP4XszvYTfjWt10UHPFuZ6vr5m4N1BlpftriT0oqNotqoSKhE3Dh0tmVyblNV58p0oTUXHMdJFE/ada7+UaC3TMhfzpQ==
X-Gm-Message-State: AOJu0YysgQ+XMCFBeHE8Kh5rHDam3iVhfR7d3nOYyiQy9TNDgqc658q9
	/iKkzEEziE9vPnceR1GfTkzgIwHZfWykVNRQqZ0MSs+uZB0GCm4xuyihHPfz+xS4dBjtaBuYgjr
	BaA==
X-Google-Smtp-Source: AGHT+IFL81/qwy5rtkuJ10qcaRdu2JQbneM9E+pjVdbps1/0e/VA4O7XiaE6CliC0DQxJV6ImSRXVMyGgXw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4984:0:b0:61b:e6d8:1c01 with SMTP id
 00721157ae682-627e487fd2emr1914977b3.10.1716342027243; Tue, 21 May 2024
 18:40:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 May 2024 18:40:13 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-7-seanjc@google.com>
Subject: [PATCH v2 6/6] KVM: x86: Drop now-superflous setting of
 l1tf_flush_l1d in vcpu_run()
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

Now that KVM unconditionally sets l1tf_flush_l1d in kvm_arch_vcpu_load(),
drop the redundant store from vcpu_run().  The flag is cleared only when
VM-Enter is imminent, deep below vcpu_run(), i.e. barring a KVM bug, it's
impossible for l1tf_flush_l1d to be cleared between loading the vCPU and
calling vcpu_run().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 7 ++++---
 arch/x86/kvm/x86.c     | 1 -
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index da2f95385a12..552b6a9887a5 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6672,9 +6672,10 @@ static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
 		bool flush_l1d;
 
 		/*
-		 * Clear the per-vcpu flush bit, it gets set again
-		 * either from vcpu_run() or from one of the unsafe
-		 * VMEXIT handlers.
+		 * Clear the per-vcpu flush bit, it gets set again if the vCPU
+		 * is reloaded, i.e. if the vCPU is scheduled out or if KVM
+		 * exits to userspace, or if KVM reaches one of the unsafe
+		 * VMEXIT handlers, e.g. if KVM calls into the emulator.
 		 */
 		flush_l1d = vcpu->arch.l1tf_flush_l1d;
 		vcpu->arch.l1tf_flush_l1d = false;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 60fea297f91f..86ae7392cc59 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11264,7 +11264,6 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 	int r;
 
 	vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
-	vcpu->arch.l1tf_flush_l1d = true;
 
 	for (;;) {
 		/*
-- 
2.45.0.215.g3402c0e53f-goog


