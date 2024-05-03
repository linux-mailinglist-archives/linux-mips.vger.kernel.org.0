Return-Path: <linux-mips+bounces-3039-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 081398BB2AF
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2024 20:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6ECD288F77
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2024 18:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BD0158D86;
	Fri,  3 May 2024 18:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UTtRwsdT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D81158D74
	for <linux-mips@vger.kernel.org>; Fri,  3 May 2024 18:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760265; cv=none; b=T8CUbhVR6c17Gou9+z4ABx3DoUamLhvBy+2p+u9R0YYRIeSjzZloL27Ujo4p7dEckHGxCzWmeawum84F+fLNDOqo/1QYqUnHnZ+EzZD99iWAHLcdgmpdCGTeNbH41E1R70CDhUo369fFUnbQMrJQH8AmXKdoIjNdwTV92ZuF/uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760265; c=relaxed/simple;
	bh=MnH1Wy/qfGLoK8pqY0vb3YbaD+FyQMej5pfO9Kyf6Bw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p3gz+iSNxofBliVClqGBPieoy92297kjSqwBJaCvvG7MzVVjZCJCF/TNiBdts7MBHqCdlmvcmrfJwuMesqkIgF5f7uNNkT1pS7cW7c9tHKV+2ESznNRAcRHcu5VujUJWtvxh5LzTdF1jyE6ToqUWCTgQIWWSWjjeptpcGjPXyA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UTtRwsdT; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61df903af62so71850517b3.1
        for <linux-mips@vger.kernel.org>; Fri, 03 May 2024 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760263; x=1715365063; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCWz5AboezUKY+fKcSkwtkc56yFvTydQOL6+C1uV1TA=;
        b=UTtRwsdT8uk2thfIcXtPuU7pHscZJWBYeHv7wvyURQSARTlHnNS47ky1LbBwz0blCB
         0maxojdoE78kFdCLmP+U9j89gf+UzWPkc1HPBMb5cZsLFLlkIAT1RiyfPgycKBIIYN/m
         bf/M8giqwWdJmM9kT+zGgGmUpiMQkg5nrXbpb845/aYrXvGvUJ01nrWIFnbndFtN5oJn
         bZ1/hGtwl7ol849efgECnOaJDPuU6QAZSf96V3SmmqmZ/fNbo4LgAKLRlk8xVZXwaQsc
         F/++iDVJsx3+s+OKWIedek4S7FLqsA+i925Kzi/RPg1WKJvg1yTRl7u5A4hS+ouNrgYu
         1O8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760263; x=1715365063;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCWz5AboezUKY+fKcSkwtkc56yFvTydQOL6+C1uV1TA=;
        b=Dc3oBzuF0vdzoSgvxno5xDvVE7XEKhlbsSZ+r93gN3hRoOMSEX59nU32o1T50GZTtU
         iDApxUXpXKj+sp+KWch6Mc+dY49KxTZZwZ/UYsEAvGG3SRtFyMX06PTA2FT6pCqVk/hA
         SYUllG9dnFqwYHj1Myx1X8pYW9jK1IlV8pGZzbshBFlKvQ1ID0SEeTSdOqmFMMkwWMSv
         oCYd6WcTqYzHIrQ7UtlrQdXb1DFU9NmrAv8k3/Y5aRDtbmVhO/bZT95TQ5GOFFX4cVQi
         NjTrB9nZmvmF+SQSBKvlncVUeu7yNxh2Owh+2zyYEpvEF65aFyJqvCUoA0VoycrAiMkM
         uw9A==
X-Forwarded-Encrypted: i=1; AJvYcCW8/sRcILoxx40HJKJptIcefkm/4keFFDYzwe22PoGvHznMLTS7PvVdkS7mo7eUYDHbyDx+fgxMqtiml6ZnHH+Wzt6Bzjuf1O4ejw==
X-Gm-Message-State: AOJu0Yzn/LDzGSqunNr0reZ82lN71KicD/kmnZ678HRwDAOgg+OKaOLT
	FuvR0qr/n7k1LgXscSN8Xuh8HkbWwBfAVHtipc4eET/qhQn9un3DxwNrV4tU6NDvw1ebbBkR2LH
	FkcNeMdWuPA==
X-Google-Smtp-Source: AGHT+IG8z91B85kZw12g8ILejBDce9nCeI6uZrPNjYvj7vQXfcVKq57xpnYqIWHHCJ8gvpfpvg4aSbrDSFG7Mg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a0d:ea05:0:b0:61b:7912:6cad with SMTP id
 t5-20020a0dea05000000b0061b79126cadmr815080ywe.2.1714760263504; Fri, 03 May
 2024 11:17:43 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:34 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-4-dmatlack@google.com>
Subject: [PATCH v3 3/3] KVM: Mark a vCPU as preempted/ready iff it's scheduled
 out while running
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

Mark a vCPU as preempted/ready if-and-only-if it's scheduled out while
running. i.e. Do not mark a vCPU preempted/ready if it's scheduled out
during a non-KVM_RUN ioctl() or when userspace is doing KVM_RUN with
immediate_exit.

Commit 54aa83c90198 ("KVM: x86: do not set st->preempted when going back
to user space") stopped marking a vCPU as preempted when returning to
userspace, but if userspace then invokes a KVM vCPU ioctl() that gets
preempted, the vCPU will be marked preempted/ready. This is arguably
incorrect behavior since the vCPU was not actually preempted while the
guest was running, it was preempted while doing something on behalf of
userspace.

This commit also avoids KVM dirtying guest memory after userspace has
paused vCPUs, e.g. for Live Migration, which allows userspace to collect
the final dirty bitmap before or in parallel with saving vCPU state
without having to worry about saving vCPU state triggering writes to
guest memory.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2b29851a90bd..3973e62acc7c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6302,7 +6302,7 @@ static void kvm_sched_out(struct preempt_notifier *pn,
 {
 	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
 
-	if (current->on_rq) {
+	if (current->on_rq && vcpu->wants_to_run) {
 		WRITE_ONCE(vcpu->preempted, true);
 		WRITE_ONCE(vcpu->ready, true);
 	}
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


