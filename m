Return-Path: <linux-mips+bounces-11761-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C87BE5F9F
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 02:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC0A3A132F
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 00:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C6E2D0283;
	Fri, 17 Oct 2025 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sngaEqzA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D062C0F6C
	for <linux-mips@vger.kernel.org>; Fri, 17 Oct 2025 00:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661211; cv=none; b=kvkZN38Hkfprk2M7ZAMvNHuW0bueIqgMG5sgMmJP9JsbExr7Juykvpi7Bq7hjthqLsDRZdO6+zYG8zGqqsCbwc1X5cYDEETc2jUcupxTW23crO4zH9yRIGFP9wepkr4DiQPJ0EE3rqVPKyOLA5/P8hqhgnlEBoNI58TTqMibDdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661211; c=relaxed/simple;
	bh=Jnfkzx2NqZmze1Ji5qS22be+VpNyN9sUekdU/ad34no=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QUcIgYjbjTOqZR9lQufKDa46DVu3Wd5m1evac/gixs6w0CJCALv7iPW5Z4ejKovfiFrQS66LWWvbc3eFxA6P8yTGuj0gT3GsMpAbbUedE/nh3ABpxkfbXqCl0FHJpCymjvJ4zGvVp/9LC4w3GCps03SiEQc0zIXLstO86c8N8/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sngaEqzA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so1124883a91.3
        for <linux-mips@vger.kernel.org>; Thu, 16 Oct 2025 17:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661208; x=1761266008; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=sngaEqzAHb8MQs/iSf/hJnu8gNDhAdNioYdvIFpPSYOtnOD5Ae5YimT0S3efsoguaF
         Z2Cr6X3SnCjAY/H+1yaZd5bCnG1eEXj1tXwopYkJmXmNHdriCjVeq/OZXsUI33Nrkq8k
         zoEGfbnL4NOSOO2Cp4wHVG8XMuhba8otSO8UKw/Y80bGAsPi47KrXw4fykrtqq3evDvR
         R4yPN+SZkzpLnzWY9pNGni6pAt6Un7lD71etCgPrw80UF7dpuEkosvOK512E+oM49H0G
         8lj7SJoyQO4Ulkq4enBxNvqhamzpPCjpHjUwFNWecIMBKfy9u5SpS0sqyJYZ+5+OkRy2
         ZHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661208; x=1761266008;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=lhO79vQ4JURdJdOdWzBfEYWkF+phdzYG5YK34FTYv4JJEDu69fE2xz86j7Cg/Oq/nN
         O5xPEPpOBuxJnneeXaxOjHjeztDwCOkYEo2adek6kHtENK1rEi0zl5kxjuIunfkl6Zd8
         pd6Q8C6Vh27zI1OmNksG5l/sHEH4xafqciVWO4q9SbJeTCcx0cHNm6uAYsI751p3OtPj
         zqCooRJ53GtDQ7DZhoLVQE/qCtJTWx4BoMNJrOOGEAZsh+TYcBU6AgUdjR+x7TpvUbi5
         akbirMEZPKSbYAKvRIdgPnPsv+cVJHn2+dp6OoHBfZhJbkZggwAnlQxL+VTzAT+HokSG
         GBvg==
X-Forwarded-Encrypted: i=1; AJvYcCWpm7KsAgdemlUPQ4H7ryoAt5TqkJ+r0/ovymgyUBzaJq6DeUGxBPbZuUAmbXXRIxuuxcwCQwSTYIIh@vger.kernel.org
X-Gm-Message-State: AOJu0YxzoEeN88BvWZxhpNSKcAeqp89T8MyNJcrH/TssfxgGxN/XXVnf
	iZknJWSDRpXz1JcebNIEJHcURXlFwaPFj/AKHFDDFMbZSdTC4tm8ZD95XvTLzvAXA3IweTgEp85
	+CgalDg==
X-Google-Smtp-Source: AGHT+IHg17I+MrCPzq5TEoO4O1fEv/5Rea+bFeeHOFAKW3+uW2v4jsY6m0H6q4wWDO+YA+zfXcJHtbyRmvo=
X-Received: from pjot19.prod.google.com ([2002:a17:90a:9513:b0:323:25d2:22db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38c7:b0:335:2747:a9b3
 with SMTP id 98e67ed59e1d1-33bcf90e717mr1807890a91.32.1760661208480; Thu, 16
 Oct 2025 17:33:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:41 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-24-seanjc@google.com>
Subject: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
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

Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
importantly to minimize the diff of a future change, which will use
guard-like semantics to acquire and release multiple locks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1de5f17a7989..84b5fe654c99 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2781,7 +2781,7 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	mutex_lock(&kvm->lock);
+	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
@@ -2794,15 +2794,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 		r = tdx_td_finalize(kvm, &tdx_cmd);
 		break;
 	default:
-		r = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
-		r = -EFAULT;
+		return -EFAULT;
 
-out:
-	mutex_unlock(&kvm->lock);
 	return r;
 }
 
-- 
2.51.0.858.gf9c4a03a3a-goog


