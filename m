Return-Path: <linux-mips+bounces-3735-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6390DE9B
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 23:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECDE51F24D81
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 21:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115D91741F5;
	Tue, 18 Jun 2024 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qPOc5JD6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6400F13DDD2
	for <linux-mips@vger.kernel.org>; Tue, 18 Jun 2024 21:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718746908; cv=none; b=p7tmrxjjWY/KN/C2Y0T+b83ZZjKU37wEB2VZO/U8EmsGOtYN69VW7Wu7hY/ZWm7XMKx6XYKz0F1L7wba1GUYMmTPxUZubzm5ZmOWOaGIkpqnoGJMeZl8OoYLVksDsVcqD1Cc9q90GrYxhoW/M9XUrFYQ+bsUjkBtdN247yqx49A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718746908; c=relaxed/simple;
	bh=43VvnWy8bJ3u6vF+ooepWW/K9kvnbb1owJCIeyrqbls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IPVk1GonISUvkClJAbvih2sg2TWMSH7tbuRaqLafkpKlXej8JL2WtfirHMonCxtj2Bn38ZAjP08MU8N7hq3mXfBKY4ZTW9SJMYAEuUTn8rNXd0PCjQo44KKh2mtA2QEeLTHwxLG/dtZ+P4WYkaV2ZvbzpmD/FrW9yI4leBCeYPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qPOc5JD6; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfb0e59ac7cso11844799276.0
        for <linux-mips@vger.kernel.org>; Tue, 18 Jun 2024 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718746904; x=1719351704; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMwIVse9Tqfg6lD3BDUhww1E0hJCsQTGAtbBvKYeBQ=;
        b=qPOc5JD6tjM65JmImi705bUnxuPEwy7D+GoXNjNCLoZAv7fRWQ87UpuLZd9DErYOUf
         rZVvZsnSWojoh+HLsxmtFvRx/nzVnvgZv4SPpBYW5GAXQHvHUzTFwVDORdu8cYVs68xT
         siIwnl7G2zUGI71XxVQktnraIA+1RMLoN/ycy8ddbyIEQPk9NRy9VDwfo4+xGsutJEad
         USSuQSsdapuIDmR2/MODRMNmQl6yCDfAkDW0PwsBvd+0BImpEQlHUoAYwkXhfkO4M3Z2
         5zN9qktgg72cm5yBN4n1x9Fij/TAYcSp8KsMQjkoyOrayEQ2MJFWkrivSDA++QKDOCXn
         LNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718746904; x=1719351704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMwIVse9Tqfg6lD3BDUhww1E0hJCsQTGAtbBvKYeBQ=;
        b=sdGG1QfPaOfNMnC45kWBUgY0xqDqOFA2otX7DCHvYPXbsdscv8Y20LjdSD3q24/Iya
         5q8M5LvKCpBkgBhCKJZR7FaHfHqDAsmsacdaTCpmgtt/CUogtl83ZQOYEmnSC3binyqe
         Tqcr0TFEAFJvv0TCOU3Afay7HAv1RG1HftDvTE2QBlHxy4CTBOpkN7pq5OM0yQX43Y6P
         jNFb4VtR0dhm/yET5uXeO8kbVbQBQF3a20GML+Bi1RePdbCvELk/lKrP2PhjgpdjqclX
         VSdXq3qYChGDBLCM4NMSbyvE/wf5DeY5x7Lfu3e+uNHFdcvau8eUIRczP2EnQ9QkIunk
         fgJA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ollQHHuVNKl0KTjMU0xCEgAqcs3XL50GFLC1cLJgj4YzGzooQ8Q7Bfb+3am4MCJ1xPiWeeyMjYpzc/z5eS7Mygoq8XctIg9+sw==
X-Gm-Message-State: AOJu0YzmQGarOJTtUL8qudypqGz1Xx7fjNfjNWo9+1z3Ocw+08CBKRse
	jYsMXGxOAQyLFRMQEar8pfMcR+tG4J5rYnbl7enidwo16vpAvPVjWRA1k8Kh9FyL6Co/42yx8v1
	BBA==
X-Google-Smtp-Source: AGHT+IEl94B6cPOfd/EKE0+8juuGqXNbimkkhvSQIWkIC7nhtL6RuCNxJoDH3on4HivHNvWvDQFbNJTKAmY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1003:b0:e02:bd4f:def2 with SMTP id
 3f1490d57ef6-e02be20b2ccmr339129276.11.1718746904451; Tue, 18 Jun 2024
 14:41:44 -0700 (PDT)
Date: Tue, 18 Jun 2024 14:41:24 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <171874683295.1901599.10170158200177384059.b4-ty@google.com>
Subject: Re: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Matlack <dmatlack@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"

On Fri, 03 May 2024 11:17:31 -0700, David Matlack wrote:
> This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
> it's scheduled out while running. i.e. Do not mark a vCPU
> preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
> when userspace is doing KVM_RUN with immediate_exit=true.
> 
> This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
> set st->preempted when going back to user space"), which  stopped
> marking a vCPU as preempted when returning to userspace. But if userspace
> invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
> preempted/ready. This is arguably incorrect behavior since the vCPU was
> not actually preempted while the guest was running, it was preempted
> while doing something on behalf of userspace.
> 
> [...]

Applied to kvm-x86 generic, with minor changelog tweaks (me thinks you've been
away from upstream too long ;-) ).  Thanks!

[1/3] KVM: Introduce vcpu->wants_to_run
      https://github.com/kvm-x86/linux/commit/a6816314af57
[2/3] KVM: Ensure new code that references immediate_exit gets extra scrutiny
      https://github.com/kvm-x86/linux/commit/4b23e0c199b2
[3/3] KVM: Mark a vCPU as preempted/ready iff it's scheduled out while running
      https://github.com/kvm-x86/linux/commit/118964562969

--
https://github.com/kvm-x86/linux/tree/next

