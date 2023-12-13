Return-Path: <linux-mips+bounces-710-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A381082A
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 03:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4823B1C20DB9
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 02:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A7117F4;
	Wed, 13 Dec 2023 02:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JgIXZoDt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD96197
	for <linux-mips@vger.kernel.org>; Tue, 12 Dec 2023 18:22:02 -0800 (PST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-28a30542c37so2284269a91.1
        for <linux-mips@vger.kernel.org>; Tue, 12 Dec 2023 18:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702434121; x=1703038921; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H3dbLwG3pwrVNc+flPqWL0ROEahdeYkxOItBObS2igQ=;
        b=JgIXZoDtL3tsFLv7qXcdYmyIY4JX6Us/RJNjjPcsYQgoVqqPtWXuTdGM9ZM9epPRzL
         JCF0opJNtwOo9BeYMrPCVpoqRclCy0FykrgMtLYWTLnC0vAy7WAqSkqYF3O5Tg2Kqusi
         O/7Vsng5r+NqZ2Yi0yT3nnOnRWRUXV9P7P2qtPvOKmkgB0r2mik7SMgBkA7wFkvq4w1G
         h4EvY4rkTAzycB9gODo5QcqoH3NBJXYU/Kq0orHH9ATUmJFQoJOeg1H4zO3r32R1vVxM
         deZJfzg/fgVegdjMrBmw3nfKcNZOZ+UXuq81MVLAWMM0wVyCl94UDcWbT0lC4dcX+OtN
         98Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702434121; x=1703038921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3dbLwG3pwrVNc+flPqWL0ROEahdeYkxOItBObS2igQ=;
        b=ETQpjshsWJT4drIV0Hsxu2VCNaAZR95wgPKUmz3wXJuOZtsfi3AcD8Yn8i2ikq66Vh
         tIyYjTEsB1czj6Suywj3Tz46LBOl6jvO+SpnCfgb91JIs7uEvjoyL7I3YRAIXwGjh4w5
         cJ+uLhCUq/Lu5knzr/Dsj/Bfv8drD0qLHwD5L1td+DRG6Xk2ZptMUGqHK0AiAdLZa38J
         vGNZPg1ezO5Nb/X88hyhuts+rGnEVXuMS2R1uB80Irg8GQlBB3wjorOk6VNI7i2QFbRV
         1PWHCvzTktL/J+ZhoidV/buQrYAtHQIq67kAfWU1vlnJsTLD0W9dHyTh6RpUanesVzjt
         NQ8A==
X-Gm-Message-State: AOJu0YwaqJWGSR8lcZQJWtCUJiodDtvs7YjXCRmx8QOkD/cBMDG2szkU
	qfh2MVh9jEq+Lcm643PVqbdo4tgqylk=
X-Google-Smtp-Source: AGHT+IEMdNbXZWy9ISUMeWXjYiRzXRSqXuBEtLtB2quA6rPLGk41btEuk2vriof3H/B+MEphfzV6B3hdgbQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c9:b0:1d0:cd87:64dd with SMTP id
 u9-20020a17090341c900b001d0cd8764ddmr52067ple.3.1702434121579; Tue, 12 Dec
 2023 18:22:01 -0800 (PST)
Date: Tue, 12 Dec 2023 18:22:00 -0800
In-Reply-To: <20231203140756.GI1489931@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca> <ZQhxpesyXeG+qbS6@google.com>
 <20230918160258.GL13795@ziepe.ca> <ZWp_q1w01NCZi8KX@google.com> <20231203140756.GI1489931@ziepe.ca>
Message-ID: <ZXkVSKULLivrMkBl@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
Content-Type: text/plain; charset="us-ascii"

On Sun, Dec 03, 2023, Jason Gunthorpe wrote:
> On Fri, Dec 01, 2023 at 04:51:55PM -0800, Sean Christopherson wrote:
> 
> > There's one more wrinkle: this patch is buggy in that it doesn't ensure the liveliness
> > of KVM-the-module, i.e. nothing prevents userspace from unloading kvm.ko while VFIO
> > still holds a reference to a kvm structure, and so invoking ->put_kvm() could jump
> > into freed code.  To fix that, KVM would also need to pass along a module pointer :-(
> 
> Maybe we should be refcounting the struct file not the struct kvm?
> 
> Then we don't need special helpers and it keeps the module alive correctly.

Huh.  It took my brain a while to catch up, but this seems comically obvious in
hindsight.  I *love* this approach, both conceptually and from a code perspective.

Handing VFIO (and any other external entities) a file makes it so that KVM effectively
interacts with users via files, regardless of whether the user lives in userspace
or the kernel.  That makes it easier to reason about the safety of operations,
e.g. in addition to ensuring KVM-the-module is pinned, having a file pointer allows
KVM to verify that the incoming pointer does indeed represent a VM.  Which isn't
necessary by any means, but it's a nice sanity check.

From a code perspective, it's far cleaner than manually grabbing module references,
and having only a file pointers makes it a wee bit harder for non-KVM code to
poke into KVM, e.g. keeps us honest.

Assuming nothing blows up in testing, I'll go this route for v2.

Thanks!

