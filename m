Return-Path: <linux-mips+bounces-9223-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F07AD4753
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 02:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12B1F189B7DE
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 00:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F07154BF0;
	Wed, 11 Jun 2025 00:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UONvifDn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A2B13AA2E
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600657; cv=none; b=l2N5JV6C/baGMXzpKzgQOs7XYFASMaORwUn3dBvvtNr3/RmXIsCNttYuGIn3I5uSjn/JXNbpWEP8dhTQZvd+xfrcWCfxSIBPd46RPM6TfkTU/C0p2BoPomX6Myv//TOjIc3Th7ydlF5OJGxyPqX3ug1ouSowK4Hfo5qScQ1wnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600657; c=relaxed/simple;
	bh=tIVAjv0R6pUZqeCBUMOqA6Hwa6RH3vUVAalxmKoMGQM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L9rDn1bNT44nBJDPevYF7PavbmN6CzxjYGFdupwoEN8B0OLAIj9Wm9ZJ1JFygIjIj8WvgCOC7nVTUDxdi8e+YHzn/FXr9zSHl3rofp/yZnWoiCQPr6+E3D7oWMUAQyLaP4lHKyYeqgCLwySwyojn0z+8WsotsrovxWgvxh6pu9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UONvifDn; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso5273452a91.1
        for <linux-mips@vger.kernel.org>; Tue, 10 Jun 2025 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600655; x=1750205455; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=;
        b=UONvifDnMtjMIaxMJh9oZe3DF6FlKFGr4F//EyCbLN7vQx4FcCJF4Qlri85UcuhXvN
         tnSFwmKBPwrC59Fb1j9s4s/w/YhzzG8XaSVUoFlNDxt/uFuDTD0J2ZR8t9Ka2xm7HouS
         NgjNwqiW06s3RHXtO8LaH2264N0zMv1Cb2Tmk6Z1Z4o/uei3djKB0nbb0DuunwHlOmDn
         GZaGChPglu3v/ihuijZJgDZbX80b69xDeWWakRHKiXFWfE/PYgQq0v0QWTja6ldPEdBD
         6I9n94e2xFImzSz8U085n3rggC0q/anXrqiGvsWEEJXtTd0vtnCh1jObNFz85PO3t4Vh
         7FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600655; x=1750205455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=;
        b=VOVfnVWtUI6Mv8u0ZZUHKNMI8waBx7GTEM9kqA0URZiMB8ZQAZrNv9nMhGCwyZ8Lkr
         bP3GALmuBbWxbAYt0SWUBhlZ4OWd/DsKFxo2dip03JB4mWkr+yN7/K0XCQmkFpUHrPov
         4wgDeMgjVO+xDnVdacVdoGYRhlehIYjS6F+NNCrfLX9L8CzRARz/mvZ3uvz6AkVi/ZcQ
         YbUJWDrjsSuWvgj5rW56UZyGcVWGsdOU1Kgwwqtaxg+P3pM5sSXO9E68146IW1hTPe59
         /gmEeeSZVcWhCla0ai1cL7kbCEWIZpiyH4AxcfY7SNrNn+Ue9gjNNeyXy9Xy8m4buWC3
         mvlg==
X-Forwarded-Encrypted: i=1; AJvYcCUaAmpUJns9gbIHh8JMracRZxfCfo9m4Rs2Z3IsURJLo+9GYPLFO/6BE2nave6r/XWjtvCynaQDA1im@vger.kernel.org
X-Gm-Message-State: AOJu0YyroxVY6f28KSPN6eBxL1oBZZ7q5QhInVczd0R6Yt7VSpZC4WAz
	jUA4GEbuPgrdfRSlOSAcgIfr+rSm2QTCxsivnI8iQQKVH1z/ixJMDHZRpYOh8lw+l5Rnbd9Zyl4
	Hih7//w==
X-Google-Smtp-Source: AGHT+IFPf4zAcxMmKYyJF/0q0QWOeyyNBeEfAEV8gqM1cGbYGy338sgO6izo7nZMoEiNEzX0yDZpDSCyFlg=
X-Received: from pjbpx2.prod.google.com ([2002:a17:90b:2702:b0:313:230:89ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:384d:b0:311:f30b:c21
 with SMTP id 98e67ed59e1d1-313af243a50mr1534626a91.26.1749600655513; Tue, 10
 Jun 2025 17:10:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:40 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-7-seanjc@google.com>
Subject: [PATCH 6/8] KVM: PPC: Stop adding virt/kvm to the arch include path
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

Don't add virt/kvm to KVM PPC's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that PPC *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when PPC support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 4bd9d1230869..1a575db2666e 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,7 +3,7 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
+ccflags-y := -Iarch/powerpc/kvm
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


