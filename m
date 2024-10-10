Return-Path: <linux-mips+bounces-5913-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A599906B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D801C214E5
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793C01F7094;
	Thu, 10 Oct 2024 18:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aZapr+Qp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE751F4FDB
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584738; cv=none; b=ucYtTRoqSr0xByBU55bdFZmY4Lu7TwgFDcXPxKuUkRkULQ9G7ywLVBmUvs030HppnChGEQHl7UU8i/9NX6c+3zEt/+JZ8f55htAFLFibPXU/w/nR8NpjsydC8stNCSV3sp8IGwwicNnsFR1CMNJHGytnaUd6i+D65ydWNVkUbuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584738; c=relaxed/simple;
	bh=KvCWyyHWjrlulYIoOxtt/Dqt8bcDl+mOtHXiCiz5pRo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cxJe2hn0rBP+9cESM8Mpr1ufg5X93mjXOtOnXhWj0J+n/kqxfoLKBEN5FItjfcerWaFINajVUKFQfc2IDIGqPaRx5GfdnpFA7RTliOa7Z+BMgGJpMuBpltyG7AIoovu5OXPsTXAkgD1aT2Yv2DPKTdHNILu06Igs84vYcSARBD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aZapr+Qp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e18d5b9a25so1639313a91.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584735; x=1729189535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNPEWcjaz+dEwpcBQF1ZcKP3HAxUc/LzxURpjzN7wyY=;
        b=aZapr+QpZhS7r/MQaYKqDvjfYRBORnxInsXEL92L+scGg5hKtUtQE7o8nOHIrYusqm
         5EmvoFkDqXFzl2HpKgkfAiP5lENBwGYDxj5waWmwhFK3gp6/VX/zM/witRAv91QhuvDh
         hk9MOt+wYPDWmF57nqd7mgAbHZd24J/E0TKSFO7QbNz5i+Ba9ZoHcPZ0IONz8KHYSAGl
         5BXGeZ4jCqP2voRrg95+ZwUWfHnXmR2Cq5/ywlxqLxLBk2lAB2BuSmj2RKdIIYKnlJk1
         iEfZhsO1MnnSNipUT/G2uAr44IdPub7PgGYmTru8gHSf1ad+5Bp4aUAXkTFpHx/6ALns
         SViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584735; x=1729189535;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LNPEWcjaz+dEwpcBQF1ZcKP3HAxUc/LzxURpjzN7wyY=;
        b=H6jgNlRUE28Ns0EeJqccKQfGmRWNhrlslVizoMbt9a499d/tsrlibC6mHL8G2Q3ti8
         QF1fBtn9yQf5kBRkBLxtJHyccu245GYfilzFMOhOIqTi9ZF9FsVgn74ZKvnvrbgmiQPJ
         mz3BjXDPlqaptdisNyy33QQ35nawohGR6rhD0o7PYtmtdihgkohtzh9h2K1xkBWgW2Fu
         KdrudpX7kVSP9L9EuXo3j/w1g/QK4smdBGV0W0sWWF3KOuRw5yQRR8VsxrfTlnB2MebU
         yGXXXFlryZJ1bxx8oWnEne+wdh35zfIJ7B0zJU/dbiYNfe6k0uM2m1dxfgwmbULzjU4r
         Pm0g==
X-Forwarded-Encrypted: i=1; AJvYcCXaZOcBOIpz3iVkmqAf+TQu6c4Tb5xg99S1fKF59UJGvZVwxexUrW0Tw6LbHTTtzrvLfEKNOVCAwXTF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj8hOQWAiyoIExAuRNIq9CAOgBEWCFkYwbNNcuB83lB0GDJRI5
	eWnBC1UJkhaSiYmNFG9wtroiW0/0prd8+lV/wM1MiAAuYUBqueNvBJ4CwjZcL/Tl8hRFI/aYICR
	gEw==
X-Google-Smtp-Source: AGHT+IEnZEGZphhdHlQgb0iOcJfNRdGKMtxwSRuFd5MkDGpZIOhDcg8ohYIeF4ySSwO5bqKUu8yK4lYjZ+4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:8595:b0:2e2:d600:3862 with SMTP id
 98e67ed59e1d1-2e2f0d9dbfemr89a91.8.1728584735013; Thu, 10 Oct 2024 11:25:35
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:22 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-21-seanjc@google.com>
Subject: [PATCH v13 20/85] KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
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
Content-Transfer-Encoding: quoted-printable

Drop kvm_vcpu_{,un}map()'s useless checks on @map being non-NULL.  The map
is 100% kernel controlled, any caller that passes a NULL pointer is broken
and needs to be fixed, i.e. a crash due to a NULL pointer dereference is
desirable (though obviously not as desirable as not having a bug in the
first place).

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 52629ac26119..c7691bc40389 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3071,9 +3071,6 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, st=
ruct kvm_host_map *map)
 	void *hva =3D NULL;
 	struct page *page =3D KVM_UNMAPPED_PAGE;
=20
-	if (!map)
-		return -EINVAL;
-
 	pfn =3D gfn_to_pfn(vcpu->kvm, gfn);
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
@@ -3101,9 +3098,6 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_map);
=20
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool =
dirty)
 {
-	if (!map)
-		return;
-
 	if (!map->hva)
 		return;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


