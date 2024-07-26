Return-Path: <linux-mips+bounces-4536-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDA593DC22
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98DB1B296DA
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4021018D4B6;
	Fri, 26 Jul 2024 23:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a+5qY/gj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B11F158A37
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038097; cv=none; b=MMIR64avGNjCZk/SS6LuvoCD97EpLU35JlfxyYKnaTd3LLSMSxy7yMeJXpfUMxfzNgAk/Fye75sZhy+wrvRhAelrdKiwlVcqQa/z/LoNml1gVS9Janp+YJVBq1eDjRg7kv72jOX8wB0Yoezkq8h4s/u3lZvzJ2QFLLhuqt9ikF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038097; c=relaxed/simple;
	bh=p4k5vgBtys8Iq9l8Spp/J/Js17wYLPMbdqXjO7cF1ww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gHHtnRS+XmQLVwpNhTsEFfFsn2Ud0ctqSm2rIrNHeeDLm3o0MVygu+je8ukwtmFMU5uPnS6H16VsfiCU7EonytFzRvUm48S2bFMIux4SvnSxSiWn4IjeNov+5xkKxsnOonWG3musqR/yMetdeZGuDtnpvQ1Gu8GVGMYhMyAi6gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a+5qY/gj; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-665a6dd38c8so7226457b3.1
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038094; x=1722642894; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=r/0kdPmZ+ClWir3sWShoQK9y6l+vrSl7wHPcCrpa8dU=;
        b=a+5qY/gjEV973BT94wElPBxbqo2mZwcW6/G8h18rjsmsRzjd/TYQ0jt4Jx8isfadUg
         aRRe1GI6hNq/VCbCOddH1pptcuY0Ttru3r//wzksv7XTDeWAS7iWjPJhfw4EGL13QdrV
         wIRHozBkviUEVPsfnuc1XgYbfaAGequWB+XOBpDW2ym2S9Nhqqu+GbLtQL+RFmQCu4x1
         q9IE5D1G9Ze6cIMqkUXVtt+4Jj5SEy5h6E2m+pwBULA06K5fugm2zMsN+BmnBG+RJ323
         0v2Vd3+Y1G8iwUC65Q8yj1LGzI7XLysrlaq0l30Mjx3bnNSV8v+rkN1loMcqtnEUnTpY
         LuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038094; x=1722642894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/0kdPmZ+ClWir3sWShoQK9y6l+vrSl7wHPcCrpa8dU=;
        b=BYxAGuj9gBA8wFkgOgjSpsSwftMJf0GNZEby5LQNlirMgpsDrPTh1yndRZ6ry4p4tB
         mhWqX2udhb1es+UPlde8ekkrDv3ZBiiQX7c60aFHNWmHe4Nx78Uqu9vxMRoWtkNUN/mw
         3H/FegyZ6YVBX+GcecqUuK9S8+sal5BNggWYs55ewd1P/HFby3eHHDm87rpjcUXnRtPf
         0VojhCYxbCtQ32nIoQcBN2SsYiqLGAEasOdallJQ1C4E/uN+1mvsxDCa7Xt4RzOLA2CF
         bIxFWno9A6UFHq2Ht8MzZx1rOdld/0SHJCPZ19JTDnRDMap9MobFkc8gmHgOuKkN38cp
         MvKw==
X-Forwarded-Encrypted: i=1; AJvYcCVEMyIlmhggNwiPU/sLQ2DkeBLd5VGYMb5tIlSfhI+mdQTqB/sFelUUOYODEfQqTuXp2Xpbhz39x8edP3se+b0wOd8B00+LBHbp8w==
X-Gm-Message-State: AOJu0YyTHEO+FmvqgLkWvibA33ihbg56aWvogsR2iKk8Gk3k45bXEkLa
	dS92X4ViUVqyXJE2A62wTKm3LsndHahcGbrvHO+ZkFQvFqM0l/RT5GTaRcVhEguLzGeHxGclQrD
	g4A==
X-Google-Smtp-Source: AGHT+IFfaCc2nH86ghdgf4dpmC6KBZ4LBEB5Lf4TmkgG+fOYVVXJfjBbiJJRrvW3lQJXVsfLzyeGSOH6WxY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:830:b0:61b:e103:804d with SMTP id
 00721157ae682-67a004a2a4amr37847b3.0.1722038094439; Fri, 26 Jul 2024 16:54:54
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:15 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-67-seanjc@google.com>
Subject: [PATCH v12 66/84] KVM: LoongArch: Mark "struct page" pfn accessed
 before dropping mmu_lock
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
so that LoongArch can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 52b5c16cf250..230cafa178d7 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -902,13 +902,13 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
+	kvm_release_pfn_clean(pfn);
 
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
-	kvm_release_pfn_clean(pfn);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.46.0.rc1.232.g9752f9e123-goog


