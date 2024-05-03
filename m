Return-Path: <linux-mips+bounces-3038-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FCE8BB2AE
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2024 20:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 840FF1C20C2E
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2024 18:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89366158D70;
	Fri,  3 May 2024 18:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xp7JuRF6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93BA158D67
	for <linux-mips@vger.kernel.org>; Fri,  3 May 2024 18:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760265; cv=none; b=Q0cuw8Y6eNECifktuHZn97CMPk3al3ZqBe3qer9qMuxRosY/myIRkrsX1C8zlA6bFXJG1z+Z7W576aZlVoKI+R5u5rLgL8insSBhqEV3QFKdmYF0E33mPMsmjtpbkoV/hPqvz14yJ625la3v/tdZPLj+xm2XiNZD/wFFEuSoO28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760265; c=relaxed/simple;
	bh=mXEp7/JVq5ahA3gE3cHKv/B7qtsS8wcRgKa4iiw3GNs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lrEizUVC7zsEYMuMvDDEmrK6G16HQcdeLS/01lnIBPqHZBD1+0xb+LBEX3uuTkD5T5O5WMpsKHcb0DGR37/E+mueGAQr3NCGKxOfLs8XtYFwODvxPlC9/vIRMLg/u1ip8D+UP3Mhdl/NCNmDwJ+ODw1w3s5AzIMIgJHW1qNb2Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xp7JuRF6; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-de603db5d6aso9890696276.2
        for <linux-mips@vger.kernel.org>; Fri, 03 May 2024 11:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760262; x=1715365062; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QHXu+3wMl1x8qNonydytLIV6nGk0zgXCPmBNIKdSDOU=;
        b=Xp7JuRF6KzK9RhwEzZqYKBxAr5JJ1yJQJCZxHhdf9FBLSCiDNoBj099QKXwT+ooPnr
         Bywfs1QmeQk6JiEoVBu48J8Susf50V5mmMXr1JlogZfrowZj/Xr21gsbz4k4bHDi2CJQ
         qzSG5fwIiDZj3ug4Ss98yonOIlB97aLBM5AqdqtLksyO6KQpfwrojEI54fIXjUJa0uue
         Rtfv+vydWfgpAjjNSL2CVEY4l0o1rUbeOt9f/xZRtiDTR/FcVTuCRYEXbzPzEiP7SoKM
         WRCJ0kTgGEgDBKU074MywegCaqRe81cehnIw1jHmL0oyVVqDN9Yc1aPAYVMoHXH3u7Ov
         IpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760262; x=1715365062;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHXu+3wMl1x8qNonydytLIV6nGk0zgXCPmBNIKdSDOU=;
        b=N4IU+Y/1ahaREpma0FDgzN17rShRMgctuLCaG1yHHi8vVSgfi94CZUzUx+qi1NAzSS
         uHGBSdWGJPniGBUcH3uj0uf214NsXechFFc0Nk+A1+JfzhxaqAaTjp66YZpCTW2/ZylC
         rkT5UiOCuTRY8PTQ5c5w1NU+1vVZQblo7JmfIfpEzvyn5EGReRyWA3HYsZPlUdel6qnc
         qGK6VexcPLcwhoJMeCm28bCzGwTrPmwtRV52uLYW2tB+66BTAuzcZ/t3lQKnPPENPMk4
         a9gBRLD//qpb8NdhX3D20SPYjWUA+ZyHwVoof1j2a77gxi0PyFJs1HOPBz5uHMCbcW80
         iCLA==
X-Forwarded-Encrypted: i=1; AJvYcCUsYS9gXig8AGaK5OVdeCxNiUnxEdTvgUnnZAYURYueyJNDjqSqKNsphhRykI17v9ZeikQy8Ujs2UK7OptcVw+uV5EIVhkaZXRo/g==
X-Gm-Message-State: AOJu0Yx6dCGCuK5Gv4hWclN4xHGxsCXT0WfS6QFzTEurXEyI7CvHhyFs
	QkrYDNDV1BnfirkftIzPSVgwyTnXFedN923LTllHv38YhhuFxWkd4K0+JfWHJdjIrC8MWu6vh1I
	Nb2l4nUpDxw==
X-Google-Smtp-Source: AGHT+IH9qLn6o/uHe9WEM8VyAqFxWSMZ3MFnxC1YcYZ+IPtGArmXDrrlLFlgmBP/HenuKUWhjozjdfJl16Pvww==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:26cc:0:b0:de4:e042:eee9 with SMTP id
 m195-20020a2526cc000000b00de4e042eee9mr1003169ybm.6.1714760262024; Fri, 03
 May 2024 11:17:42 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:33 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-3-dmatlack@google.com>
Subject: [PATCH v3 2/3] KVM: Ensure new code that references immediate_exit
 gets extra scrutiny
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Ensure that any new KVM code that references immediate_exit gets extra
scrutiny by renaming it to immediate_exit__unsafe in kernel code.

All fields in struct kvm_run are subject to TOCTOU races since they are
mapped into userspace, which may be malicious or buggy. To protect KVM,
this commit introduces a new macro that appends __unsafe to field names
in struct kvm_run, hinting to developers and reviewers that accessing
this field must be done carefully.

Apply the new macro to immediate_exit, since userspace can make
immediate_exit inconsistent with vcpu->wants_to_run, i.e. accessing
immediate_exit directly could lead to unexpected bugs in the future.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/uapi/linux/kvm.h | 15 ++++++++++++++-
 virt/kvm/kvm_main.c      |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 2190adbe3002..3611ad3b9c2a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -192,11 +192,24 @@ struct kvm_xen_exit {
 /* Flags that describe what fields in emulation_failure hold valid data. */
 #define KVM_INTERNAL_ERROR_EMULATION_FLAG_INSTRUCTION_BYTES (1ULL << 0)
 
+/*
+ * struct kvm_run can be modified by userspace at any time, so KVM must be
+ * careful to avoid TOCTOU bugs. In order to protect KVM, HINT_UNSAFE_IN_KVM()
+ * renames fields in struct kvm_run from <symbol> to <symbol>__unsafe when
+ * compiled into the kernel, ensuring that any use within KVM is obvious and
+ * gets extra scrutiny.
+ */
+#ifdef __KERNEL__
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol##__unsafe
+#else
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol
+#endif
+
 /* for KVM_RUN, returned by mmap(vcpu_fd, offset=0) */
 struct kvm_run {
 	/* in */
 	__u8 request_interrupt_window;
-	__u8 immediate_exit;
+	__u8 HINT_UNSAFE_IN_KVM(immediate_exit);
 	__u8 padding1[6];
 
 	/* out */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index bdea5b978f80..2b29851a90bd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4425,7 +4425,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				synchronize_rcu();
 			put_pid(oldpid);
 		}
-		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit);
+		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
 		vcpu->wants_to_run = false;
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


