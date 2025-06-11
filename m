Return-Path: <linux-mips+bounces-9222-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB0AD4750
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 02:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92325189BEE5
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 00:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3684F2E403;
	Wed, 11 Jun 2025 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FBdYXLxU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D17262C
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 00:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600656; cv=none; b=qAxl/fWWipj8XZP7JZLzC/f6EZLCXJWoktPUCuIpBxHxvo5WIgcjGYbfTQ9wk8r8ZYc3svnLg/KqZwwF+PtGYS2RAAOWxx3PQf6T4zV49l0EtQkenZ2iNCtwn5UoX7aWgVv0Yyo3e17esFbjqafSrkGPURZ5IIAnnquXfuxAcAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600656; c=relaxed/simple;
	bh=fi0POvxipHtqzuBmBtdO+vOuVF1CdKjDHYYgzms+PmI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OXrkaM0Jnfb0RK78J/k3x54fdajhMAc9LG5HQ4HbE4qARdzNgH+cEcgRwVBtct268A62NT8D16Q3JJIn2NBFjLASfil4GcHycRIxNZu2GC/9QxXZ3SaoXMaBB+DxLSFggjetYPg/Fri9nInFeGgWIvUwu9+RmHUV3Fkb0v8PruA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FBdYXLxU; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so2369246a91.3
        for <linux-mips@vger.kernel.org>; Tue, 10 Jun 2025 17:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600654; x=1750205454; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=;
        b=FBdYXLxUjexGN9WeKSZ2ecIhfrizQ6wveOJNH+ZsAaIruwbgxCgjpsI0flq2xKfa98
         11YaX4jgJfHh8uJMrMsyNQHFsguJvECRAOPURFonmQJOzrdqGH7IbAUN3c1UV5p4xGbF
         YyiYr5Pwb2S8XRcEHx5JjCk6sezF8NekBnj0Iu+KzCpULI2FnN0HuOfJaXNvYMIjepqF
         wh2EEpzu2IFPwVaFYTHP3l1QmLdszH/S7jMlItgsL8dWe917fSFxrYXJ6DKB6Ci/TkEh
         FxbREDhH/swhMb1LhQdHhjUYvmScvms3rSJz+YBCQ4+FZWCnHmSLLKe85WFCRT6Z0yia
         j4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600654; x=1750205454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=;
        b=PimhfGoOio18wdNIT+8U0xALcZiInXkg/n/CeeQPkJSA/nKoV98pYokjMHtVR1xwFk
         zhZQo8guMyOnwMyvJ+xj0bDU6s4yV9G4gMYHIol6J8fyuKkGhB7yikua6PMf5k2zxaGB
         2BULAWrHxpST2gVa+swj5Wh+G54+XUL/Zut1KR4+XqAbPkLHSIs0AJbrT174fUt5TxtK
         /JnWHQWjtHby0J+G0xlIOdhDAcWQjF9KOmJjs+56Kz79NVB8ceA5geRLSNOBTphkxDIQ
         uD9h76LES/Gf3JfU0qORQUFi+DTIEEcJZrN9qqaHXITarzlHEmoMSVVl58KTHKp9v/vC
         QAWA==
X-Forwarded-Encrypted: i=1; AJvYcCVV9gEtI7X+AY9kHPJtHmUt0vcHjJ6D+TiO3u0ewoVWNbn7KbQKAcgEfVNNaSsdGV7GOzPWozfByp+C@vger.kernel.org
X-Gm-Message-State: AOJu0YwfLjzjKb2H+3BIqJZoWXF28Vjm7rPTIlsL3m6OuaHnCElLUwsZ
	dQ0h5I9QWaOJEdQ7gOGshnC3ITOVB+ZXLfjgj0+taAPaVchLnqi+KNeHbRgTUmjBZTYSHwL3ZfE
	76U0FTw==
X-Google-Smtp-Source: AGHT+IED4B4s7Ytoor8mnhgXxSS0ZKiCE28nENLHgtxurTVkQjPNLlNungxBpASYaT+z3Y4fvBlDrrKUUDc=
X-Received: from pjh3.prod.google.com ([2002:a17:90b:3f83:b0:2fc:2c9c:880])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cc4:b0:312:26d9:d5b2
 with SMTP id 98e67ed59e1d1-313b1d9c310mr956755a91.0.1749600653718; Tue, 10
 Jun 2025 17:10:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:39 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-6-seanjc@google.com>
Subject: [PATCH 5/8] KVM: MIPS: Stop adding virt/kvm to the arch include path
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
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Don't add virt/kvm to KVM MIPS' include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that MIPS *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when MIPS support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 805aeea2166e..96a7cd21b140 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,7 +4,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y += -Ivirt/kvm -Iarch/mips/kvm
+ccflags-y += -Iarch/mips/kvm
 
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


