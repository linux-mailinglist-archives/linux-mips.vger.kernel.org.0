Return-Path: <linux-mips+bounces-4488-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091A193DB78
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 01:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A54811F210AF
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2024 23:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C367172799;
	Fri, 26 Jul 2024 23:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P8nc3QSi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2217166F
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037996; cv=none; b=m+omIcdzkQZV95pJkqEaKEa3a+cpV6ylNMLVNUzIZj/brakVnjE/ewCEic5fK3TiQ8wpQlmaOpvhVADRqSP6jGZhUV6acfD+Oz7fZiiQB/bev0wXXtNmFqBX2C6BSiaCwPNFanUa3NUVEPZRtfEfASRRDHPbMBXEEmCsJK6eR/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037996; c=relaxed/simple;
	bh=ew26wDO2OFK9/ZL4S01JfkaAnmh//qDEW5lL4oKuI6U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fsQZ5sgD9Ami846PRq0UonOmFf+ZSuHqSnLzmQtS0A5fF3kWGmthxf9OTvpxxvEdlt3pqPHg5IdDQvn5ClN72ZwWGR7GgwIQWj/geTgDhKLonuVqervK7kzo1qxVN0ceWgiVRk+hw2A4Zv7aeIR8CihIahi1CMxqA12gFXx0mxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P8nc3QSi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2cb639aa911so1507716a91.3
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037994; x=1722642794; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YtgPpIjPSqL3TzmlwlpLZvvahtPd8ef2dtbW1LnZzVw=;
        b=P8nc3QSilOdFQme/xrj8NlBR5omdDMecY1PdOWRIgdd8geUHUUKBoqEbTpw1FmTv4z
         NILu6gs57GoP7AdtkwfKaVPwl+z4kkkCyrJPilFEEpeiSbE+bX1ajcgKtKYvRTFxsXLs
         ivjlYWzKuEEk/OtMsSIKk/SDIbd9aYIGRS8dpYc0i+d4dxisI1z44yElUBrrxWaWPvWZ
         HbbtxC6XgmMfT1IEdCcri3fMV0BjHKJlU559MMIHbN8gw7V3+ubYtz7VyDfru/DFCuB7
         NAFK8AyKqipY+SEBGZFA1+4GR8IgM1OqN/jthabYT5AlAQfR3o87MoKtp8pAjm8XdRU8
         9ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037994; x=1722642794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtgPpIjPSqL3TzmlwlpLZvvahtPd8ef2dtbW1LnZzVw=;
        b=A+vNM21NSgcKWrcWKh/MAbTyE5GPmNaheV4njA707a56A8S7l1OCZeolxhy+fl7P8j
         NKz8PlP8gnZg57nh5pP68pcTb7uNL1E5ywyLpqNtrF5CP6ezJa/r9rwA9d+myupCOC7E
         Nes2NixZZjAytB8zPj4/J7y/9eJIB/Nxtq3qhwd0AWrxsSFIPGwTgusg4g7lwHG6gWXJ
         bTxAu3rGiME2Dpcl0E1PZVbVEEepXV56+RboS3olmBug83g0yoXcCBfgs2OyBvtQJJ7t
         WSQgNdElitgCA4slYC5K8ctk686Jb4786d0UmAHLX11Denysxbjt7LDiuuuiyGi7TEMO
         j6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVOtJLP+9gPPiwnk/PqyL2W/e9sQAQB9sc0hkmBPoWezJPJr6Mr2vQ0Ylz6kEVGEMX0bGSD4ILI3hVQk/jZitS8SzVr1uOFlYqm7Q==
X-Gm-Message-State: AOJu0YydQNWCTF5TbUlOdtvhKnW6ABkaDF5hrF6vLGCHMFsY/Dp796N1
	RarFEMBiTQXp55KZP1YXjrznvJQi/5dwoT9U3fPuQWRYxSzZTjoWynLczHf5K1Mr8F+ENb7YqW+
	Xxg==
X-Google-Smtp-Source: AGHT+IHmoajaYWuB/CstqlwF+EMvaWyxqBn3H/lV1e3JQu2uS0IU9winjnCx9o/cN/zsyEDP3UE3pPbYXjw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e744:b0:1fe:d72d:13bc with SMTP id
 d9443c01a7336-1ff04822069mr906395ad.5.1722037993928; Fri, 26 Jul 2024
 16:53:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:27 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-19-seanjc@google.com>
Subject: [PATCH v12 18/84] KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
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

Drop kvm_vcpu_{,un}map()'s useless checks on @map being non-NULL.  The map
is 100% kernel controlled, any caller that passes a NULL pointer is broken
and needs to be fixed, i.e. a crash due to a NULL pointer dereference is
desirable (though obviously not as desirable as not having a bug in the
first place).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 56c2d11761e0..21ff0f4fa02c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3092,9 +3092,6 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 	void *hva = NULL;
 	struct page *page = KVM_UNMAPPED_PAGE;
 
-	if (!map)
-		return -EINVAL;
-
 	pfn = gfn_to_pfn(vcpu->kvm, gfn);
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
@@ -3122,9 +3119,6 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_map);
 
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 {
-	if (!map)
-		return;
-
 	if (!map->hva)
 		return;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


