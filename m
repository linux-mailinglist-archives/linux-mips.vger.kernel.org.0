Return-Path: <linux-mips+bounces-5966-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7849999130
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E4ABB266C0
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2742921503F;
	Thu, 10 Oct 2024 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DuDHV6yB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE091E5019
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584850; cv=none; b=mz9U+7uo1QPrOg+XDLpi5mJLiM+8JfKxA4JjWUju+0ISQwpl4PSzVWkhfZqvlFiPurjesJWkr8dvhOLsv2nQxHGK8bURif6K9kBWCYkDXWbR2APohZq06twT3Eu8pPJPuwUVANrbcMNEoyVvdlkG+WgXNTO0vglhDThxS1uGfhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584850; c=relaxed/simple;
	bh=hdvy6TBStdDo47jCImbsHkCH8/fTSGPuTNA399ptBEY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OFLFupt/j1io6JF+rgrlFaef8OmOg4fhnfXNyODRfr8oFQLv30+evLYwRTnSwHrUfGB3Va5X0whYD0sdzE0W7QRpzDE2b9krh29BR8o7DG6PkFliBBZ7LBqsD8fHFM2g3mjf4/igjLGf/RxlXZ2i7BBUl6vK8SjXrnfO0SXKJmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DuDHV6yB; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7c6a4d99dbdso298150a12.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584848; x=1729189648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t4DEWxyHdS8FH8bmPlxV35CavnLWtw4MDWneo+GIfaw=;
        b=DuDHV6yBR6R4IF/Tk4tYF2+2idGq/vVgsnDPd/mRNzisey/lK2BmHd3cUo9vBvOANi
         zkoGepVCuNujuKVT0SvZmDE0XvYHerpurUIIJMAeWc+b57hH47kC0QJ5wHtQEMfJHmPh
         PpaE4aHKRT1h6TbKpgXWXqnsnto2OGNq0fH2Ws2KY8/MbS7jjFY3wbSKnu7MIzTUrs1G
         et9W4d1rTvNIgRtfcukOUMCi85rcuo5kTXGS1TQ9auZ4CcSXEEnywcZI9uI5KSy/FVdZ
         YPQRO6b5YAteoGfO1rbMctMWpre/nlO8BdIZjHegGDTKR2Jshft+Hp1edSWuOGnxTxrC
         JmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584848; x=1729189648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4DEWxyHdS8FH8bmPlxV35CavnLWtw4MDWneo+GIfaw=;
        b=l/OAZ/kEtjuIzHZuFRwzTEs4EOsiue+hmUeKZ4xMueERuR6OJxeZJ7xqFqNNNDwwM8
         WgWUUVggRLqygQqqStq2xf62QyizFa3PNZxhOoESF6DbnbeJnkvP6QyUSVKnk/edXqsn
         SWN11ABfFXRrcQBbb0AFRlK8KnqUH1gb0B6GwLla+ZUVf/HMG1gxNMaw8RdDzK1/xD+X
         Gj3BNsAi349T02VhOZC3luDJZRKDXvG6i6tZ7ifhIGqB+gYeIjPLNBRaR4z7oJ+85HWy
         kdPjnAB1iVoOXZlx0j1mpsFSayBLBMBCkRpTpgAGK/L/EkhdFa0tNrPyGdQo/YHoqvCL
         dD/g==
X-Forwarded-Encrypted: i=1; AJvYcCVHy+rGHoUULTltXlirc5j+v0TMN/rQG9KGDafdYoRh1kDQhglBNfCARORpwwFVzztCt6OsLREDT8vd@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMf5s8uqbJwy6PSVE2XIJryu7xCwK3yH8WzhPZnzFZ+DCjE/h
	7RUiY3+Cq6cFtUZAl8jqnx5Vn9MXMYzUPWYbnveVkJn+cWhNp7UrbWxDKDjnI1VJjM+uYo3DGHw
	lmA==
X-Google-Smtp-Source: AGHT+IHU1NaHt28BJAfE9+Eihx21gIRaHWD3wJUzNDiwOfeaS4l1n7K6hdxyKTp49hAFCJqVbhS/fDDFwRQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:2545:0:b0:7e6:b4dd:fc0d with SMTP id
 41be03b00d2f7-7ea535b0baemr20a12.7.1728584846518; Thu, 10 Oct 2024 11:27:26
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:15 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-74-seanjc@google.com>
Subject: [PATCH v13 73/85] KVM: PPC: Remove extra get_page() to fix page
 refcount leak
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"

Don't manually do get_page() when patching dcbz, as gfn_to_page() gifts
the caller a reference.  I.e. doing get_page() will leak the page due to
not putting all references.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index d7721297b9b6..cd7ab6d85090 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -652,7 +652,6 @@ static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 	hpage_offset &= ~0xFFFULL;
 	hpage_offset /= 4;
 
-	get_page(hpage);
 	page = kmap_atomic(hpage);
 
 	/* patch dcbz into reserved instruction, so we trap */
-- 
2.47.0.rc1.288.g06298d1525-goog


