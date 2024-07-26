Return-Path: <linux-mips+bounces-4472-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807393DB3B
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 01:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26239B21429
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2024 23:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A5B155316;
	Fri, 26 Jul 2024 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oeSL7w4J"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F161F154452
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037964; cv=none; b=io5bRLlomEMUq6kUPdiS8YBKS3W7QZyKa2C64VwBApvPeZe20eFxSNhMysmYpeD1dFFgihojXjlMpumEWclLca8NvuoqtRXw6B/hM35qCYzQe6g8yENuyJRmQ/GXOxTNpD57ki7mNgvaFRX1wL7DchsoWDsLL7ZCGNXehr/yPYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037964; c=relaxed/simple;
	bh=FV9suUWbUk18QdDUsD1tv1G/hfnnbrNwbRzzjldv2AY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZcCq4GLjiX9wnTAYxVQ59BZVXvNXEyhlyU0LT3bNXi3qmRKiy3e6w+OopwuUdG4URFnfTWkqrtVb/bxEyShEtlw+RX5Fj54TJcGhWcaJEuB0ZNMLYHeG4DpNHl7rJQlpCAo3qHUdK1SxEEvWnTUYBjrMNhw+ENxTMmxRwM1Tg3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oeSL7w4J; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70e9ea89b42so1343202b3a.3
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037962; x=1722642762; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+ACqpXiHFW0htcnePdxx7jkBXYAkQBnbtzPYGP86yy4=;
        b=oeSL7w4Jw3SPt6gEE8Sx8A5Ga0fdK9b56eKcopjkr4euW4NVPZ8DVWiGuQwIn0crS9
         kmfFA2XIflKDg14uOMpPHhFXS6lt2zgrM/WiQUMLiJB89QRcNewxVU2b7U1wRgR9ZOTG
         MnOvV13KTqth75/dJJt6IuqkEpViyVYJ08004N4BxUzcVNAvqv1MFMXR328D4UmxCrLc
         20aP8s+q7QGAFVY23OsCIt0QdrgVqJUwKNgdIV/uAAaCOyqO1iAI68mz1XKKPvvPNxPe
         6AeDMLEl8n/gXmC1aLqXz5Gw6DKPndtKCQF4+mJdgBoPYusH1Drij/g5YEZI+hA2m3LI
         MuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037962; x=1722642762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ACqpXiHFW0htcnePdxx7jkBXYAkQBnbtzPYGP86yy4=;
        b=TOqSiXjXMy5jKkjAuK/uisc6vLq4DE6aOZWumGKaIxq04iZZQKHLZO+XTA0cp2tt5c
         uW42ZefXIdTcAwbhcNO1hOodWcpETy0Xd2HqFnP1nkqZE97up+67bfQNf5aV5anoTxBh
         hy3PUIm1J1bilSvgl7pUTQotY4IG3vOgd80q+FqnCh/lR27xJu8Wn41snH4diYN9koOj
         ZF8o61YZ8QUPxCnaGGjqIKKhY5hbQ7EYNVn0xs514HYKmDQoHeiYP+fn6P3XDo0fbyq4
         crFXMz4zu9B1W70aQSVQGuJ01SNB04G8kDPJTrr3G8iAGPfUu9pHyYzYb5DYiU+WjSOm
         4W2w==
X-Forwarded-Encrypted: i=1; AJvYcCWK/CAIscLWz4JVBiofOChxa3kJpGfTn+A1mTf3shPqIN7l4wXdujCDTV0ZH9WvgYjoKk6ZpfA7vtAJkYkNnjD+hOzaVBSWtYxKhQ==
X-Gm-Message-State: AOJu0YwxhrwDKAW2cTTnuCddidIqEqKtE2jk8HeX7ZKi88HUCmkToyh3
	EjT6oGnWNYYHHyUQYT1kxpjGd4fSaWaBHQUwisOlulS5vSPwvdfGBJZ/gNbav5xN2eBdwYzas/s
	Ntw==
X-Google-Smtp-Source: AGHT+IGwCQGQqihWYa2umPunvMXl+38XfICaGVr07aRfeEr4UWXG0owvMV5oQenmn7mjdAWrLBWC2Kt2f3c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d5:b0:70d:1cb3:e3bb with SMTP id
 d2e1a72fcca58-70ecedee1c9mr17317b3a.5.1722037961972; Fri, 26 Jul 2024
 16:52:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:11 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-3-seanjc@google.com>
Subject: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest memory
 while KVM is dirty logging
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Disallow copying MTE tags to guest memory while KVM is dirty logging, as
writing guest memory without marking the gfn as dirty in the memslot could
result in userspace failing to migrate the updated page.  Ideally (maybe?),
KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
and presumably the only use case for copy MTE tags _to_ the guest is when
restoring state on the target.

Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index e1f0ff08836a..962f985977c2 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 
 	mutex_lock(&kvm->slots_lock);
 
+	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
 	while (length > 0) {
 		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
 		void *maddr;
-- 
2.46.0.rc1.232.g9752f9e123-goog


