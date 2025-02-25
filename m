Return-Path: <linux-mips+bounces-7921-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC6A43160
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 00:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A2A18882E9
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 23:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CB320E324;
	Mon, 24 Feb 2025 23:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cS404g5M"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EA420D4FA
	for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 23:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740441351; cv=none; b=AEI4jn3qlJ7QqPvOd5cGefa0c6wvMED2eQ2VqhdV4I93qNCvkSDwRWkvHyZSFRv8j0xQlnzododvuG7WgCWGCiWv8z8+V2GcJLTf9TISzjdOeYs+cdxE44T3hWyuTeL/JOodJqdJcXR0cDmEcYOtQo7u5IORrEAEmMek0qQ9KsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740441351; c=relaxed/simple;
	bh=Pgnsnfhe7JEsCHeo8nxgfh9t3AoyozrxKe/Nn1f4YRk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OrjwXcGVjeMKbQhwYjmpZ1briQZarEd1A1zfwQeuJrPqQZ8xY2SwwFu5OzdgmC8wEj+XY7oJtc7U8mV0Wxkq23NzR9S+rpwVog/2k0Rkun57ACbgZd/J6Ugjit4UiYY4ECKEuQi/SL+stL8HsCdiijajX5xVYqqtHce5bY655k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cS404g5M; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc43be27f8so16634413a91.1
        for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 15:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441349; x=1741046149; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TGU0ybTwy223eIpDzZVLI/W8vnqy8rZ9uLMIqzhcN/c=;
        b=cS404g5MRmCHdXBoRyF5yO1wQTbGnYu7txQDUK/dvXjPWEsdRNd0ftO8I8PeaOT2+4
         SauNFfEuVPinGQ/Qs73c0es8Jv9qUSbmngL/qMVHaKMFbAWPYN/3hNOQh1WMCINkkgRy
         TbrDB1V//I6O+dpwYCghirUwbAGIAS7/SLhSBO+6Wd5nel4yfRKxqVuWdV4vbrfjHmOX
         DMassa/zQ9xgUkTKlXRB283Zm/xzi2k5zm3h1zH7//LwXHinUB7EHcLJKwsQzIvB46M7
         mJUa/IIJAmfq4UeD8NTQpw6m+fdh5Fe+B4wp2i7Sw+yj2hrFnTkCjLdW5+DYa4k387YB
         cckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441349; x=1741046149;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGU0ybTwy223eIpDzZVLI/W8vnqy8rZ9uLMIqzhcN/c=;
        b=UK2IOqivs+ebaYdSM3QpvBQfsViFxJB+/5pryELSYiNwh6WBo1xEngDtS6tJxZduHU
         kQhcza/MXK62DAzD6pydA+2fd0a/dFhcfKRT16IxnWakkbtU8FEVcREGsInMgphSOpM7
         8qWrw2p+C/8asMx3C8qyDgQ3MlwWd4piTF8Vh+/SZEY2SCEgrvgDlZO1es6CkY/q377p
         jmVoP3Ezl9UN09JvQjd9PGPNYrNufyDEqSn61pMZM7gBpOJlj7ELGgRMf/LzWAO/smqs
         FEc9SHBCIYwUkJaxvYDjPY5d401NE/eZBFeJI0ool+s5gkaK1YesNQYBnL2pSZ8ENOKd
         dkZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5d83ZsFada1rbzewvMbg2PYUGJYxmgTjPDjHQhyM7p9YLLjYeTi4t/wpoNtJDhSpAtBwdHoJUAWzH@vger.kernel.org
X-Gm-Message-State: AOJu0YzTxeQ5eWqW2Aj1d9amSD7ZzZtxpEuCt3XkvLwDEBk0xokyZopU
	h5D0B/5V/CaPmMF480C9nl/WFusB9aVZQ51VPTfGeokGnzM+6RWVc2G0wPTgDW4OdRDpnxSIavA
	9Tg==
X-Google-Smtp-Source: AGHT+IHcos0szxLwYcsW2Q/WbhHjoZ/1wFjhF3Xa+8fw1kzKNZT2q6/VDS58iA2uFYrVe3USusRDS/R8AlY=
X-Received: from pjbnb15.prod.google.com ([2002:a17:90b:35cf:b0:2fc:b544:749e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7cd:b0:2fa:17d2:166
 with SMTP id 98e67ed59e1d1-2fce7b40077mr23992311a91.31.1740441348957; Mon, 24
 Feb 2025 15:55:48 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Feb 2025 15:55:37 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-3-seanjc@google.com>
Subject: [PATCH 2/7] KVM: nVMX: Process events on nested VM-Exit if injectable
 IRQ or NMI is pending
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

Process pending events on nested VM-Exit if the vCPU has an injectable IRQ
or NMI, as the event may have become pending while L2 was active, i.e. may
not be tracked in the context of vmcs01.  E.g. if L1 has passed its APIC
through to L2 and an IRQ arrives while L2 is active, then KVM needs to
request an IRQ window prior to running L1, otherwise delivery of the IRQ
will be delayed until KVM happens to process events for some other reason.

The missed failure is detected by vmx_apic_passthrough_tpr_threshold_test
in KVM-Unit-Tests, but has effectively been masked due to a flaw in KVM's
PIC emulation that causes KVM to make spurious KVM_REQ_EVENT requests (and
apparently no one ever ran the test with split IRQ chips).

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index bca2575837ce..8220b09e91ce 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5084,6 +5084,17 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 
 		load_vmcs12_host_state(vcpu, vmcs12);
 
+		/*
+		 * Process events if an injectable IRQ or NMI is pending, even
+		 * if the event is blocked (RFLAGS.IF is cleared on VM-Exit).
+		 * If an event became pending while L2 was active, KVM needs to
+		 * either inject the event or request an IRQ/NMI window.  SMIs
+		 * don't need to be processed as SMM is mutually exclusive with
+		 * non-root mode.  INIT/SIPI don't need to be checked as INIT
+		 * is blocked post-VMXON, and SIPIs are ignored.
+		 */
+		if (kvm_cpu_has_injectable_intr(vcpu) || vcpu->arch.nmi_pending)
+			kvm_make_request(KVM_REQ_EVENT, vcpu);
 		return;
 	}
 
-- 
2.48.1.658.g4767266eb4-goog


