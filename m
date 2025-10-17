Return-Path: <linux-mips+bounces-11759-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1212CBE5F69
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 02:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1F419A0FFD
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 00:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217EF2C0282;
	Fri, 17 Oct 2025 00:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I2d2BaLt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AED2BEC30
	for <linux-mips@vger.kernel.org>; Fri, 17 Oct 2025 00:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661207; cv=none; b=Iy3GhZw0aXY42k5yOrmUr3dqpF4oyuZU+ko57wUApj3aKci4TlGUK97jhYChHmC5W2kZUA97ZVkd7/hzMfv90zaXuZjs5My6Vwpq09pUCSKR8vEb5up8oj58X7G3tBul2OPBdtSemaqBwtxfyb1JGuUTM7quG37aflyGmsVyG3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661207; c=relaxed/simple;
	bh=7L8ZMSuIkRJTkNiFBvS5epoU4gg7pv9o+BehY7SDauc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K3J1sYf2r6tc32nxwLSLsA6MCe3E1KpNk8yaMhXqqv+lH0SbtGMhdb3IuhV0Yhg/vcZ/4x6Jg6iOeiNRB2YSxchRxNmD+PWwJB/BsIz9pUpnjLhaeFIX5h/5Z01dQypfCeOSqdJwJE8a8E7l5RPbUd35mjbzSBzmRwD2IeWDbWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I2d2BaLt; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1156371a91.2
        for <linux-mips@vger.kernel.org>; Thu, 16 Oct 2025 17:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661205; x=1761266005; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=I2d2BaLtXqDJIKsNYUqpCOnQeIzAGYVpirrMAlP0NvOM+mzhb0h0sgpGfn0PitSFTU
         +5dns31JOWekYVeclB4cNzOz/l06RBk+7mBe+cupAbWT/FfI0Jl7ZUFTYguzroQROfqw
         +hFhYY6VZR8XnV7MFhanRhR9G9xvLAxF4X46uQbEubCFfqLGRiEuWlYpVhCb7JpINlyM
         nlabs3mKEln6vSpYDZEPDRai6uaWjlsqTEFM6xQ8QBrW6ullentcn29VVQnk1T/XsCo/
         10AWXS1pVYoYiud2ksL9f6HFJzWRLNNxEEJiS3dVOdgcOVLgyGkJ6kiO5T5BMRXMjhNt
         6VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661205; x=1761266005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=mpcOYan5iONF3Xb4UyPP4bjvQY8CQo5OGgdSOUZ2l5/EWFcEGmUzs9yI92mxhvBv6j
         uigIOXW49MaISlR+9YiqQHSngXlFSQynbTZdybKP6iP0NUHTkuiP8Je/TL0FGM6LiR8T
         4cbG0QyKZDaMnBBSqvAEz9vHjnJTCQPYUFkj1scEmVnimTXkSwq/LWd1KRYPWs9ddabH
         g/agSwRIwZN0u8EEYS72+wrj98JPTdjdqgm+OGFm1g/Rv3+YUl2HYwudpA5ZCrdu7Zc4
         QdVyRP8zzuH/wTeDgXqXbfALwiojKYjunNkk9wc2jLqAMuefEuVu9juNq1sov1Qfv+LE
         OtZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZJsHPoGP2FcEWlZqoAk1XrzCXT2JH8t4QtiFaMH9XWxwcpiLi9EGrnYq1EHmTzDscRaJps9eYj0a@vger.kernel.org
X-Gm-Message-State: AOJu0YzU0iT7TtlJJaGO8QHUgSibKO85+nmh7a7If0+LQqN7fTU/MADn
	2BYWUKYKgng96h7dQVwVNyvMZc5xcdL1WJiAdf7V4etrm4SHj1BCtXJQydtIViwyFvU6zvOZJ3M
	2GnAZcQ==
X-Google-Smtp-Source: AGHT+IFb3cb9XScIkfIbQA2oQID7nhqxfExRyWF6N5UGcVhE3T71y0SJP1d51io6pNMM6/KZP3XG25y1rx0=
X-Received: from pjoa3.prod.google.com ([2002:a17:90a:8c03:b0:32e:a549:83e3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d8f:b0:335:2eee:19dc
 with SMTP id 98e67ed59e1d1-33bcf8f94b6mr1826093a91.28.1760661204960; Thu, 16
 Oct 2025 17:33:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:39 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-22-seanjc@google.com>
Subject: [PATCH v3 21/25] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
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

Add a helper to copy a kvm_tdx_cmd structure from userspace and verify
that must-be-zero fields are indeed zero.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2e2dab89c98f..d5f810435f34 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2761,20 +2761,25 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 	return 0;
 }
 
+static int tdx_get_cmd(void __user *argp, struct kvm_tdx_cmd *cmd)
+{
+	if (copy_from_user(cmd, argp, sizeof(*cmd)))
+		return -EFAULT;
+
+	if (cmd->hw_error)
+		return -EINVAL;
+
+	return 0;
+}
+
 int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 {
 	struct kvm_tdx_cmd tdx_cmd;
 	int r;
 
-	if (copy_from_user(&tdx_cmd, argp, sizeof(struct kvm_tdx_cmd)))
-		return -EFAULT;
-
-	/*
-	 * Userspace should never set hw_error. It is used to fill
-	 * hardware-defined error by the kernel.
-	 */
-	if (tdx_cmd.hw_error)
-		return -EINVAL;
+	r = tdx_get_cmd(argp, &tdx_cmd);
+	if (r)
+		return r;
 
 	mutex_lock(&kvm->lock);
 
@@ -3152,11 +3157,9 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
 
-	if (copy_from_user(&cmd, argp, sizeof(cmd)))
-		return -EFAULT;
-
-	if (cmd.hw_error)
-		return -EINVAL;
+	ret = tdx_get_cmd(argp, &cmd);
+	if (ret)
+		return ret;
 
 	switch (cmd.id) {
 	case KVM_TDX_INIT_VCPU:
-- 
2.51.0.858.gf9c4a03a3a-goog


