Return-Path: <linux-mips+bounces-12863-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC4ED1471F
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 18:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63F5B301C578
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 17:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA2437E2FD;
	Mon, 12 Jan 2026 17:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kHbzdGMl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6D29BDAB
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239591; cv=none; b=plK2BZcQBFiG8YmFfTkI1yRr9FzjN8cRoz+mxeYgfnWgiShiNL56+NIKHK1kAcIzvHJ/jpi9E52/OMpyO5zELSTbh2sYTTJimdZaQNNJpkIrGi3xw1WIMdHeSUsD/rTXx4YX57BICbOYBUQAlMWWfEWr6BPxowT41MSYy8GXMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239591; c=relaxed/simple;
	bh=5WOjJJi9GshJrzbNszTXOCjQ/WC3CHWW6Rm24QuGEGg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YFWRVkbTDvyoQaKrF5/pcHEcFARqt4R+TDSbuvOrNHFSLmN9R5/tF7eFtSLag1PVUo9at93T7IBCnwaBskYuIFMy5uHdBAYAgiOB6gihv0U+OdQWBAbLhO82UHpnAmwOhP3//wLN10xixLLYN9CTCsJZ81e28xVvV8SKSOPPbvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kHbzdGMl; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c52ebdd2d43so2370291a12.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768239589; x=1768844389; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=kHbzdGMlyTjsX1hA7hobxNse43C70DQ8vJR+f/0PqsaVlk5DjGoZIbvLo9+k9F+jpW
         SNV9o4dyJV7w1jCWy2ZIux+kxfWPsiZ6rmTNSUmLJLd3VBB92jLYAKOGAwQZSOwDpZsw
         DFKbAcdAM0FJsFNhOzNawApO8ds3PaHDr4IVl+71b8S26lzYx83rq6q60rqo7wLpJjrP
         J38A+9VLkQjYzdfJCmhWngXGsPKcky5kB1ehukTnH6Zele/+o2Ewk1IsGG2yFegVEZ8q
         BemeJJBIWwAU5JfOkiPUjMuOeEM+NFbM7np0W2+LyG+LGSwxSPFgM/6SY+0cEOK9QieG
         vSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239589; x=1768844389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=GDTrH+rzYamCiMqPKqWYrsr/Q3SWoGCraVzC0Qsy1FMKRnSlsGAqR8Yys42FJH/vmy
         MMpamB5SbVHx3T/gMqnEWHwXniJ7LZVOX+thzNkLNxdEn+oWGBiGDiE28rrzHNhbiuPL
         TzTdSNAlkQjgKBGK4xB5wGzxawJzs/8X5jz/J3nSQWX3s/uopjLhbroneZx5bvZHt3SS
         ZkVmChYkfO6rgAFuWLdD2XWnRhOSrKNs/3hPalBg/03JnbFFASlSkLOcUriTGidnXGjb
         HFe1flJ/LLgfEZwWnHjHlx2bChElDesJzafKESkvU9XXtCT+w7obVg5QQ8S6Wm69Hd6Z
         XoYg==
X-Forwarded-Encrypted: i=1; AJvYcCX6x76xSaZ9AfV51G6FCu3j+P4n7qjPK/KazKU7v9Q91Q5eRCxt+lqZ8dwByGs7SP2xOa7y30h3T0wF@vger.kernel.org
X-Gm-Message-State: AOJu0YzyzVpMN935ft1yWnOZWt5qbW77DQib2AEIGdYLwX+tr+dzWv99
	MeOmfwIaTqnqoiyBJLz13YsryU+uqEG3oWx9Nj+GVQG3iiRni9l110rpHXmurnq6uaMOebGIQ07
	2v6Ha3g==
X-Google-Smtp-Source: AGHT+IF668cUxxhKhGHv90tNvsIeTkhAR6ns6JG1hxt5u/yIlrpHwYKq8uhAaCwc/umnpMOixfg8y4oIB3A=
X-Received: from pjbgk17.prod.google.com ([2002:a17:90b:1191:b0:34c:489a:f4c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2251:b0:33e:30e8:81cb
 with SMTP id 98e67ed59e1d1-34f68b65ff0mr15047069a91.13.1768239588965; Mon, 12
 Jan 2026 09:39:48 -0800 (PST)
Date: Mon, 12 Jan 2026 09:38:38 -0800
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251205232655.445294-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <176823927133.1374677.16641795988105461817.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, 05 Dec 2025 15:26:55 -0800, Sean Christopherson wrote:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/1] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
      https://github.com/kvm-x86/linux/commit/da142f3d373a

--
https://github.com/kvm-x86/linux/tree/next

