Return-Path: <linux-mips+bounces-5906-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF1E999039
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC1131C24B2F
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E40C1EF084;
	Thu, 10 Oct 2024 18:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OrSuHW3L"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433241EBA09
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584722; cv=none; b=GrTKTMmRjXWviJRqsWoEB1sXlisLtf45tgZVnZQDy5/1PPRwO3UdJn+wA+XL3QGXYJNXPXQwHWUehmklZhROaUBpQYNy+HeFw4i1bBIOPWW3gXgREhlmtxtXn/NvyD/aYsnOaRKQh9CB+XFxU+o4T5piX8CQWzCa4PjwBsBGwok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584722; c=relaxed/simple;
	bh=IF5BVNwy5lfsZS2zGuSAAv+TGmQDGgo7CuXbuO4ZMc4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OgtgR/nEnrelRHzkHRCS+417MJ3QnWBFr6P/dTedOHes1KXBK/zG/58Vyzm1u7DdZzerEy8IlNCmnOpdfKWlrU4fDTXVX5r/RY/vx9+11AJedIxViCl7WsF05hHmU+X32baX65P8E7HZAylKa0dxGIo3IsC4CT+l7hLiPnKqkug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OrSuHW3L; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e3245ed6b8so23826767b3.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584719; x=1729189519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0+KYw/6HzWsmGATvSxbQuKdqCcRS3waqcwxHrAen8Y=;
        b=OrSuHW3LuAFGFcLFdBetAruGipimy71Kdd23mnkCvSb3kzL/ihIej8uTFHbxMiLtnA
         6YXSI2J+unla/LKg7JIEqX4mCyvrr3VQ406BwPbBG3PiTMk+2hz8bnoRevRPodlhpmMn
         aYJOYXJWz/3t+SqCWv1rhWrcN4c2Ngbiu7CrMUkXV7A/egH9oRwfDsMuE+3yorA8VAOz
         djCQlkkb9mc9WG+6oBsuPymdYZpYY26x8ENW3hOt+jiqZzezffl3p0vFDG1wHBHrBrbq
         D5swTKZ9IT9IBSz41WC4R7QS/s7rDjGVXDZH7rNvgqH9bS1bMtz43t3X2ef5ejrnse9y
         5+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584719; x=1729189519;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F0+KYw/6HzWsmGATvSxbQuKdqCcRS3waqcwxHrAen8Y=;
        b=TJU4InK/uSAe/naoDtIbPvSrG5/VGYZUbbxgeEiO0A0LGG4GXM8X7U6EeohzgNwomA
         I9+H0xl7eptjZhHJGelauRJnBJSIJij8yUWhSGnGRMJ1swuE25A13e/Wiu/fRsHEHowz
         deXbZg7wcJUzdWy8w/pzW/pXKtQYjuobfclOnu8jgqeH6zaIzRzZ/AlRluZZq2WRqKub
         9K2uk6KeAHiL+YCkOPwkatVZBJcLvZmWU4xfzjMDx0JqD47W/LkvSibuMCPCKy+mWIsF
         EmAdzE5wtH3JEWtM7vePe0G22dThEPy/IaKAshkfpqgywIdO/+vEuqZ0LRhjID8M4k2V
         xpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0/EQO7uH/3Vy4yamfPs72zThOpwG11S7p8OI72V0sAYwBYe+HXFMu47HzL7UoWOpSVS5YuPKAfPeQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3UpuX6skrBYZFTe84FuFGS2cBfFp0RsIe3OUrh3FL03U3cuc/
	u+cnbhyJWSZU1FpI5FTusBRnPrncbVpadDj91BprPjPvv5tqsZUmCPTR/XcrXfQRoRv1+J975ud
	yaQ==
X-Google-Smtp-Source: AGHT+IEeBu92qjGJ6/8zutZUBi8WOanw4UupdtztXpUfLE+vAeLHZHNkVuFOksmpHMU427MoGYN+Q9YZlwU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:3204:b0:62c:f976:a763 with SMTP id
 00721157ae682-6e322185b22mr897567b3.1.1728584719334; Thu, 10 Oct 2024
 11:25:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:15 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-14-seanjc@google.com>
Subject: [PATCH v13 13/85] KVM: Annotate that all paths in hva_to_pfn() might sleep
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

Now that hva_to_pfn() no longer supports being called in atomic context,
move the might_sleep() annotation from hva_to_pfn_slow() to hva_to_pfn().

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0bc077213d3e..17acc75990a5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2804,8 +2804,6 @@ static int hva_to_pfn_slow(unsigned long addr, bool *=
async, bool write_fault,
 	struct page *page;
 	int npages;
=20
-	might_sleep();
-
 	if (writable)
 		*writable =3D write_fault;
=20
@@ -2939,6 +2937,8 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interru=
ptible, bool *async,
 	kvm_pfn_t pfn;
 	int npages, r;
=20
+	might_sleep();
+
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


