Return-Path: <linux-mips+bounces-4540-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEB393DC2E
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 505891C20BE4
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46E318EFCA;
	Fri, 26 Jul 2024 23:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tme8JUNj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B118EFCE
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038105; cv=none; b=iy1T/dTOPGSa1dR5Z9hHUh8ihbosCZZHJHlKaxW1iy6ISLAI2/hCOl0MhZquK09LPjOL7h3OcqGyZ/tSbTGboceyrAKDEBXeHCT/tTUrGl7vPaxTJ3gvahuo5207+q9Fh3YHJF7XXL1rj5xYJ7Mvwu2afOYsEg5l9z+gLG76mMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038105; c=relaxed/simple;
	bh=ziM2BhZeDvRuc7Kv6C0zNSnuZJuDBMOs3hNrlsk1v5s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V7hmbd4PoqtI2CekdT/IlT71DOr00y6oaNZ0VPWOwcgYxLmKKoIRLpAttyFzsgvGw35vYcgr5VKWaehdKEstY+fiXXxbCPuzWIegls/Lu7iGKh/Yu0eWqUfSRqkP7W0PlvzS7UsXP0rDiY3iCvnefUx7mH8GAdmdLTTnXxWsaHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tme8JUNj; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1272981a12.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038104; x=1722642904; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=y+Ar7T6On16alzy9M8c5sPTmukkBuZuZUdMs6MViY54=;
        b=tme8JUNjEVxgRFC3Oc1gWy+XPRFWvWtTAPAMPSI2WbEYU129+X+s0E+ZrSjVDzZNVE
         5DlHXVGCBBObNjpvosHB7VKYw6PR6AsprQt2c5TGekb/CphFEw9zBFRw9GM3T5eTQ2bR
         7QoPwY0hZa/rEpWR0lDeoeN6opWOGyl5kQsmzWTYQms6+WQkZnz3n8EPc8wgY9ZMv0mS
         yiRPPHpWX1NCgxsV+SUcD3UGOOzd0pNNBi1HEmTDnehVqlxY4ncoD6/CNbholWm0WiRl
         /klmLexZ6ygH/J+yVDwb5XSLCTW6wzxIBQbFfJ+nk19eIuVd+3h2RE1hViooxxGXKOx/
         CKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038104; x=1722642904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+Ar7T6On16alzy9M8c5sPTmukkBuZuZUdMs6MViY54=;
        b=vfGHlnoMrmbwZa02dV0SNM23XAV/uC1LQgRGkFTw/nrvRNXriEUV+MjMz0NgTfgqRa
         WLXv5z3XHLNs3ei32zeSG6xTD8aRgczJ3SK0hW/vKHBmhTh1lg8zCG4+rg+2Suvrd148
         weHeafqo+lnmtLFdUO3xLELOgM5INTrduKLA6G7lV/rKGgyNNlBiAPLkt7OVav79Q/4J
         1IGCpJAFCxkdXme9w37DTr+yEXk65hv/Ch3gC6XlAe7+yiLreynAbbVfxDLPikzCbMsF
         OBG5Fzfn1n3t+aByBsNfmjACprhD8pnofxN98KNJIoVaCkEh3OJkmA7J90ATV5lAB2Cn
         KRyw==
X-Forwarded-Encrypted: i=1; AJvYcCU5wmCXbA4j2RBzTGJKiPW95VJHmZbbETxdcGrDnQ7hsVqiCcfcxBg4btOdyl+68oI4qJD8I7WDx0NXu1C++qQ35zc21qrTgZR/fA==
X-Gm-Message-State: AOJu0YxsoNxzthpgvoEvFa6xtJDabOMtZz+Lf+p6NI40REpvyjQuqwJo
	d4dJ5zWsRfNj266V4Jf9Y2N4hV3zSrRo52VmMUgeJVKC84o2ahNScZRU9+g0oceT9wnI9jy/+fj
	53Q==
X-Google-Smtp-Source: AGHT+IFnr9ua4KoyN+kf9dgXRrvt4SVsbQldBEs2PtVQEhle6Kqivs/NJk7PeSFySHT1lFiCWuBu3lKqAis=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:50a:b0:740:2b12:8780 with SMTP id
 41be03b00d2f7-7ac8fd30684mr3158a12.5.1722038103410; Fri, 26 Jul 2024 16:55:03
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:19 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-71-seanjc@google.com>
Subject: [PATCH v12 70/84] KVM: MIPS: Mark "struct page" pfns accessed prior
 to dropping mmu_lock
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that MIPS can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index f1e4b618ec6d..69463ab24d97 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -634,10 +634,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-
-	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
-	kvm_set_pfn_accessed(pfn);
+
+	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.46.0.rc1.232.g9752f9e123-goog


