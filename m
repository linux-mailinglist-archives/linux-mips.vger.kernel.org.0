Return-Path: <linux-mips+bounces-5925-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60789990A7
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA3EC1C24B67
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A781FEFB3;
	Thu, 10 Oct 2024 18:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KeBY5py2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23581FCC47
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584762; cv=none; b=YeyXnlpUzOJC1lBdbk+wHpu0EuFbtk6Ym4TFoZ/POn+A8pSRfLSEbBMkE4qWXXZzrL7rpyCoDa4oIDbm1uHGfOAPqOvxpYm16MYA7VK71TeDJJHC5SJoFKJTjkAr+WF7l5PmtxsM5YpgP/K6Zagfy+0zeUtf1QXyLf4BRo0DW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584762; c=relaxed/simple;
	bh=6AchJ9iF2qZs5ZSAOBrdf0urgGqdHLpa0Cd8lTPRDhM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qtw93H/CluFdJZvwNOd92wJA1vW89SPv8IANMtWjPa0dWkm6aySO76E7neewkXBxpgzrAxwFMAwr1b/2EtKyiBe8ZKTVgdL3kTh7m68859qe+pkvH/mdzK/hwi3NYKw4MW7JqiD/Vw2WXH1r8bpgMUgzTOGppjPxGtLrh+MW4Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KeBY5py2; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7e6e98892e1so1287966a12.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584759; x=1729189559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VITkHk6wYCk30qmAXnWfpQxFdItqbxje0xl/TrLgm28=;
        b=KeBY5py261h3po2p7EcoPVpo67GiOj7+6dOP6EoAEriscYrzhTzO39NHb0NJsAW1jR
         n42KW4EwGgaUs3yx/oCZEuQvV/M1idASTdIADhBN6ON4GT5SGgjV1ooFQU62n4X7Qr84
         /fRWijapZZzZVKePZxyFZegIWlOsafg0wDZM5BHf4vXa9CU5WL9dY+OB5HyQ609h9s7e
         VPCG5daQbQMIE3NYESeghcC9iMjOQZxPTOapKpidLBB73TVQIpNb1Ze+j7LMk9Bx3x2i
         vO15GDeuHOJlaco62A9bG0UiqB8QoTlfPHg1Bpr7sbnSv5dMGej5HVQzlTOoDtu38Q9N
         6JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584759; x=1729189559;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VITkHk6wYCk30qmAXnWfpQxFdItqbxje0xl/TrLgm28=;
        b=YNOeuvQLQssEXYhUSHSak0rapgCv+OgqUJaNWKGT3foZUUFNu/97A6raPF0tW0zhtG
         QAGg/arrXXIxHMqffn8RxlSToa6e5Q7ciC0CSrXknYr9AACptpT572uGdqYBgr/ZX1Q1
         aCNekkVL+zBXOk7AHKXufbiBo1YXq5ZecejEGOTQNmncYy/vqt3RAms67tRgbYzgSm2Y
         UBZk4ygK9UQG/7iJjAM6P0ghGDo46dq/Zx9RxFg+C5UgwXAsgQ92MO+dnkrHG6DMvV2S
         7jEyoEgh21/o5UGHx9TNtBjRGFiFWokpaSlywhExDzc9wmE+9SZys7knxZRFtBE6J7tA
         ruHg==
X-Forwarded-Encrypted: i=1; AJvYcCWlH8Q92OlFArpB1JUor3g3Tf3ZYblFLpxxJlR9eXcr0Tnsd4wVbcubzdAchKHLDSEn5OfexHUqvrkW@vger.kernel.org
X-Gm-Message-State: AOJu0YxnJCxATuoB1u2lzB13zBCUfdOCwdM12CFb0wuC/WRJj33iYs59
	Q+edXvXLM9Bv9KWPdgPHKgDavnHPvsJ6ensMCxlUK145SiB3OfPMKApSKPTL3ZOSsVpXKcV/acM
	v5g==
X-Google-Smtp-Source: AGHT+IEekecUM0XVWoBmNjTczqp1a2/ixTMw1fOAmBrSm/Dp9XgHLEkyd54mJG+SlDPSB0szYk/zKOq5dxU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a65:678f:0:b0:7e9:f98c:e9f7 with SMTP id
 41be03b00d2f7-7ea5359ed14mr32a12.10.1728584759044; Thu, 10 Oct 2024 11:25:59
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:34 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-33-seanjc@google.com>
Subject: [PATCH v13 32/85] KVM: nVMX: Mark vmcs12's APIC access page dirty
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark the APIC access page as dirty when unmapping it from KVM.  The fact
that the page _shouldn't_ be written doesn't guarantee the page _won't_ be
written.  And while the contents are likely irrelevant, the values _are_
visible to the guest, i.e. dropping writes would be visible to the guest
(though obviously highly unlikely to be problematic in practice).

Marking the map dirty will allow specifying the write vs. read-only when
*mapping* the memory, which in turn will allow creating read-only maps.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 81865db18e12..ff83b56fe2fa 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -318,12 +318,7 @@ static void nested_put_vmcs12_pages(struct kvm_vcpu *v=
cpu)
 {
 	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
=20
-	/*
-	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
-	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
-	 * and if it is written, the contents are irrelevant.
-	 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
 	vmx->nested.pi_desc =3D NULL;
--=20
2.47.0.rc1.288.g06298d1525-goog


