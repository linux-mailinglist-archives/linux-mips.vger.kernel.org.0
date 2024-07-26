Return-Path: <linux-mips+bounces-4500-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DEB93DBA7
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C426E1C21057
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC5815572A;
	Fri, 26 Jul 2024 23:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JrAf4hub"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B9417E8E0
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038022; cv=none; b=bDtZ4iJZnjCCurEcKRZkFUdTiEPNdQhWfjq9EmUUFgCOMgon3/RYb4LuAAF9sR2R3FX3bLqdU8+Y6rp5Ei1t6MFhq4GGcmyUIOICx25VHzojuW9+hX0vfahX7lUWicc78WCDmokNpy21jpZD5C5mi6SJU6Nk0nVXo6US5ZzBAFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038022; c=relaxed/simple;
	bh=Ha3QOJ9ztlbiDtlpfFA1Gmi3O5m4m+UNE8dfT+rqtiE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O1E0uKQEasSScHlaCNlktsztNCk+H+VjLeq0UVYY00OA+fNWaAVJX6FawOb72xrE9LP27pPkHmI93hquE1wZz4EOvGQKYIcMEXVuPvyuaJo8kmsak4cap7atsU8vyNObg0jxCigtFl9WH7+5tzYWbJri2gRt4aSWFKMYTpIHneo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JrAf4hub; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e03623b24ddso435592276.1
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038020; x=1722642820; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ABkrzr1cGSxzpfOXTkcnfxpngM7W7Byv3yxUL9/Xpog=;
        b=JrAf4hubNKIiaxx/ovvpXCVpeOcJqnNWLqc+QKkTWEry7wOuil+7GqrohfIib3Qzyl
         6tN4g4q7+0d+V9SfuPlG/b2ntzfTQ+M/vyap5T8mOfC/c6fngwUzdjRmSmS41JdKiZRe
         HgXUh6FifCzog+96gM2J57qcJTZQVLAVeBaABXV0Ol9lh9V9mH1VAIrOeQte1Y4P8KAi
         Vjk0Va9QpKCn0U8SwEjBcvGt+Z1DR6/4AXqtqXz/AZM7gu2NX3+LXLtWK+JpHHgJMesR
         Q+ntA+r9QQms+c/J/ZpO0v1hukChvxogIgS7MRFZ0ww0TzrleFIf/2LSVSHAzEaiXrFQ
         aX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038020; x=1722642820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABkrzr1cGSxzpfOXTkcnfxpngM7W7Byv3yxUL9/Xpog=;
        b=NmhR8ng6mXDFc0nbUtnCCdGGECIpmnVnTGTrmt36XPBT3eDOOQA3Q3wkQvARQgD3P3
         MJZpdhoMfKGyEjDuc+lN+df0uMnsxbWbLFOopiwoDqvUJZfHOHZA7gkKvieuS8Mq+nuu
         v3AU+SABpHsLIGqxGRQpA0cTz2TiGKkpUJknYWpzEhzNQJjFnxKYpXfSO45V7HG/1RRt
         ceEEJOgm8De9keCQ0A860WBJnpTt7mXXinSnUrdnYRk+3IEvETOZ2JB8x4mL+bzoORt5
         s6gJnO/8Z6Kvip+xeDyR6keTgBaBCzc1FAnnyzKRqJZx+G9skN4J42rp3zV7kits0f9a
         Eugg==
X-Forwarded-Encrypted: i=1; AJvYcCXo0jnkCa/1oCsvNSYAPpowJrOn95we8BzJG0GdDz/kCsGJr9PeJvBW6iT8pcgZ1gAbagLZIXIUrTHIzVbAejWVKbXu7sM9PGUcyQ==
X-Gm-Message-State: AOJu0YyYamcnJ+by7jbyf/5qgXt51jq7mpBzsQhNsuVl3t8zIece89Z9
	HaX15BRaciVOFrpkyCnUJxyoYCurf0FI2vUGuPCeagSToR/v7pP53o0JW2SYwJIc4y/hFwRe2rk
	91g==
X-Google-Smtp-Source: AGHT+IF9e10ucuu5PEDYEm2t1VHH57SvniduNcr3PDVCEbnd2uQ/527xnsEGixiu/Fx7KhH32OKutuDbjT0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:9004:0:b0:e03:b9df:aa13 with SMTP id
 3f1490d57ef6-e0b5455eafcmr36206276.8.1722038019655; Fri, 26 Jul 2024 16:53:39
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:39 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-31-seanjc@google.com>
Subject: [PATCH v12 30/84] KVM: nVMX: Mark vmcs12's APIC access page dirty
 when unmapping
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

Mark the APIC access page as dirty when unmapping it from KVM.  The fact
that the page _shouldn't_ be written doesn't guarantee the page _won't_ be
written.  And while the contents are likely irrelevant, the values _are_
visible to the guest, i.e. dropping writes would be visible to the guest
(though obviously highly unlikely to be problematic in practice).

Marking the map dirty will allow specifying the write vs. read-only when
*mapping* the memory, which in turn will allow creating read-only maps.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 8d05d1d9f544..3096f6f5ecdb 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -318,12 +318,7 @@ static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
-	/*
-	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
-	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
-	 * and if it is written, the contents are irrelevant.
-	 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
 	vmx->nested.pi_desc = NULL;
-- 
2.46.0.rc1.232.g9752f9e123-goog


