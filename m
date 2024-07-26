Return-Path: <linux-mips+bounces-4483-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC793DB63
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 01:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15310280E66
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2024 23:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EBD16C686;
	Fri, 26 Jul 2024 23:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cpZRhfLd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C713F167D83
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037986; cv=none; b=r+juiCxH2XqIqIk7cSmS5zj5AMeXmfV8kYqXPsy61yfT6Xl2ItRuk1JGXy84oJAOsnJysQipCLWIRHgUk4T4e7eyLv7jpK6XdKOR+2EjXhOXw4vXNeD6K2Hd81AdJACXoReyyWmx4fDi4IXQLsymH4m/6TtGrr2DG6G57DQIOeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037986; c=relaxed/simple;
	bh=izT0ZHXrcrHipMlKscBt522ZpbrYe6ZS+CksnjxIp6E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JpCPQIHbf/0wkobPohwcGOre2OxZvRlqWjhYHK29dKY77BGtUL7gHHXiTRwlo1qQWUcEXBU1NeHF0LeTs9hrkU4Gmgz9r9rXe4oKNl3JU4vT50YJ8fQnqyP95gdPMvC4MR3PX/cSSv8ZChMFRy0eRh7ORcq3ek99pE7L+r3pM44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cpZRhfLd; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fb116ff8bfso14436265ad.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037984; x=1722642784; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G8vTlhvtYFVN9mhfz5x+cQCHJ6x1sNjhm2Vdu8bZ6Vo=;
        b=cpZRhfLd+3Ycs0GZk2KtEJ2X+UfQgIiXNHCsUGYj8voK7P1x4QTfARQbypDB6ymh3w
         lt59ko/N7fug9ZcvjZE2ygnMPn6qVbp79QUvelIIRVTuJPACyO18/0QP6hFlRp616C9Z
         DzXzOf3OG0oqBOCOTeDRqTRhpBghqwOiLzD+VIe1q7OqTbE1+gHjHigBFsVMDzU0mVQJ
         gILPZpDPfLv+jecLk78p4QxjM3IYDC/OAB5F0pOzPp9Yov0UpufcSagEZdp2LFJBZJkw
         YejtYmgMRK5vqtbZ7msWVLkE+HVYZILqb7ldtqtuGovSCoCd+VRTUnQ4meAn6p0LdH41
         +oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037984; x=1722642784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8vTlhvtYFVN9mhfz5x+cQCHJ6x1sNjhm2Vdu8bZ6Vo=;
        b=U3HUh8lObRq5T68Z6SKwskNuDGYLBoOKldY73T6I2eJYYR31KvMZGd096OrjM21fAJ
         DwvEMBU40JMF5fdi8noaq8ZUOYYGLMVHeVP2a06LQ3grJtTnAut8ECOeeDti+347hiOw
         b/9D10O1R8WGm6lsL6N59WBiFrDXfqtvs+51BCJHUt979sotWwuK61RD4rS9gzSv0ZwS
         QWs1ftvJQDDX9/ORT+txr8seu7h0fza7PychZsNxYR8KqXqfWJZBnTdttr4eGVcysJK0
         0uIo0/1kiMF32pLInHi0xeHjaKggxQr8G6o/OWm91m6DYtrh7fTp0/bKf8OvWYQjagr/
         TFyw==
X-Forwarded-Encrypted: i=1; AJvYcCUThHfm3xTvMhAzI5kQ3QFUqg8pYHRsXOmNVm3wrQfMf3ewiTa8S2pem4nTp6nxu3BftI/DxvwtEL2uB5jT1wPhjCDtmqVbgejrPQ==
X-Gm-Message-State: AOJu0YxEc/Tn2MApfOI+K4uWDfoynPtpjS37J16rqP410Idc2datJ2LR
	igI3o1TDwxTH9QG5fDg6OQFOxsKEWN7BhyILK+/Hs/B5UDgN2rkBNzt32/VEnIXrdE0JATQ0AL8
	rOw==
X-Google-Smtp-Source: AGHT+IGcvEjw3oRLgbDLJZa9I5d4JQMYDdZeA/FUbXpEzYyt5G6Xd+JdRMAKGNKsfMlLtXc62VqHMV40c8I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:234e:b0:1f6:2964:17b8 with SMTP id
 d9443c01a7336-1ff0492c71fmr137005ad.10.1722037983933; Fri, 26 Jul 2024
 16:53:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:22 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-14-seanjc@google.com>
Subject: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn() might sleep
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

Now that hva_to_pfn() no longer supports being called in atomic context,
move the might_sleep() annotation from hva_to_pfn_slow() to hva_to_pfn().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 84c73b4fc804..03af1a0090b1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2807,8 +2807,6 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 	struct page *page;
 	int npages;
 
-	might_sleep();
-
 	if (writable)
 		*writable = write_fault;
 
@@ -2947,6 +2945,8 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 	kvm_pfn_t pfn;
 	int npages, r;
 
+	might_sleep();
+
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


