Return-Path: <linux-mips+bounces-4598-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A56942183
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 22:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D6F01F24798
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 20:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2F818DF60;
	Tue, 30 Jul 2024 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ehTrVYl7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426918CC10
	for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722370910; cv=none; b=eJpslc/0BrjhRYvFvEhUJogMB3+u1BTe66uYCx5V/TwPnGUDcltuPYdVLzGIswk0XAaz0oVbS9Q3hJsxIsITHISCj2zpD/c8524kFkqE0+DqWkbPFAGrpLu9K+PRYmGRO+B43AFT6S1x16DTmUkbZ3G+yVeW7K8c5Sa0JJNqL84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722370910; c=relaxed/simple;
	bh=HxOBAEamRc5o/YLmQaHET0I/Gtrys86BlZ/DJ9hLc6w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hMFWR3LoNNgmteh4V8LXxt72gocHRXZdvQlcW8H/vu6F7OTpoxmY5xp2zRa6cRUal57jETEkMchMq59gmXq02ujRAHPu0TTs6mz4JInRTG+/KQSA4f0yB0GG8+WoB7EC6qB5UJueNO/5glDlHL0qdajtr0hA252ftiTDMeOQ8wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ehTrVYl7; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso197181a12.0
        for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722370908; x=1722975708; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lo0MEBygX1JypWEaHf/k6xfxdkehMYQ1A9Hdq1FNmkM=;
        b=ehTrVYl7ugsY3JYZO9kauqgaXCi5Yu8YAv+l7pKP0TmcYiOx0XWELMAB7fIpsoD11p
         YMhfj1hr1m9UQ91+UCdXj4PaZXPzMOIeZXLdqI3SxWXrQ511zgMEpkVnTTUVmtcZVJzE
         7ngnSB7TH68MCxRhQpadZVY1l2t/bxixdfXd4n6UiRtFsaHwAKVcPAydTGe0NdjffHGB
         PLPy1PyzzS3ATtrLnCZEixHHRZtZn8h6nWfWB5TUglzgSDVOI9ogDS0SGq90tQ6l1Uat
         77P9xsqtCIhXCKjby9msZnX80QBPk7n/dfYjROGqqJaTj6SQ70N68/dUJO2+9yNFfhEa
         LdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722370908; x=1722975708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lo0MEBygX1JypWEaHf/k6xfxdkehMYQ1A9Hdq1FNmkM=;
        b=gpsXQ5G3FBbPjJD+pr5cyWwcv0csM02BzOgrIJNmAGYh9GuZFwWrZF0RRb70aCpa+y
         yBljViFW3YrXIJ/A0GFsYORv2kN2RySJLEjHgDPF0KmbB0q9NT/Hb2Dh5Zcx4WM+8sG3
         JdFGag89CjRf+bTBqfG2Gbf0tBdp2MnrjnewLU36HMqyMu6ZJTcNs8FK60/GbAduQDYr
         /z4/VuG1VR2SBJbnvXEK7S5S6jUW/vB7dLh19movxmsK7XDwp3k9Yj0JvmBMIzZvmdP1
         BfK3jGTBbDbhk06Dj147L3xCh9fweFxF16/L+whxgBQKS7eBUfXtcLOuFuX70qVtiK4J
         Z7tw==
X-Forwarded-Encrypted: i=1; AJvYcCWX2ajhbvShkNvtmkfJVAOtcpV4vQkkIH35Nv+5RwlMvNdWKqT3KSb0lgc0MZd3eQx6knSLWFNMiqDSlaYnZOQB9ekyxwcJm6hlvw==
X-Gm-Message-State: AOJu0YztLit/jTL+NoXO0hxtd9cuqfkNyuYuz2PrYGyUA+amGZDMusMr
	BVZW3oToSIlCoLTd06dHgZ1q3rj9A0AULxoeZJhhbMAcfQNtjoZFi8wvXLnqfJdDyV/3xT+q554
	xRQ==
X-Google-Smtp-Source: AGHT+IFRxL1KATidTTKhi0tYZI3Y5cQGXURHMsVQzSWYAdVw9bcIrYssZFg0WYN1ZfdRJ6uqRn8d2puX7Kc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ca8b:b0:2cf:93dc:112d with SMTP id
 98e67ed59e1d1-2cfcab4fa5emr42966a91.4.1722370907896; Tue, 30 Jul 2024
 13:21:47 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:21:46 -0700
In-Reply-To: <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-85-seanjc@google.com>
 <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
Message-ID: <ZqlLWl0R1p41CS0O@google.com>
Subject: Re: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns
 that have a "struct page"
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:52, Sean Christopherson wrote:
> > Now that KVM no longer relies on an ugly heuristic to find its struct page
> > references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
> > pfns, remove KVM's hack to elevate the refcount for pfns that happen to
> > have a valid struct page.  In addition to removing a long-standing wart
> > in KVM, this allows KVM to map non-refcounted struct page memory into the
> > guest, e.g. for exposing GPU TTM buffers to KVM guests.
> 
> Feel free to leave it to me for later, but there are more cleanups that
> can be made, given how simple kvm_resolve_pfn() is now:

I'll revisit kvm_resolve_pfn(), Maxim also wasn't a fan of a similar helper that
existed in v11.

> Also, check_user_page_hwpoison() should not be needed anymore, probably
> not since commit 234b239bea39 ("kvm: Faults which trigger IO release the
> mmap_sem", 2014-09-24) removed get_user_pages_fast() from hva_to_pfn_slow().

Ha, I *knew* this sounded familiar.  Past me apparently came to the same
conclusion[*], though I wrongly suspected a memory leak and promptly forgot to
ever send a patch.  I'll tack one on this time around.

[*] https://lore.kernel.org/all/ZGKC9fHoE+kDs0ar@google.com

> The only way that you could get a poisoned page without returning -EHWPOISON,
> is if FOLL_HWPOISON was not passed.  But even without these patches,
> the cases are:
> - npages == 0, then you must have FOLL_NOWAIT and you'd not use
>   check_user_page_hwpoison()
> - npages == 1 or npages == -EHWPOISON, all good
> - npages == -EAGAIN from mmap_read_lock_killable() - should handle that like -EINTR
> - everything else including -EFAULT can go downt the vma_lookup() path, because
> npages < 0 means we went through hva_to_pfn_slow() which uses FOLL_HWPOISON
> 
> This means that you can simply have
> 
> 	if (npages == -EHWPOISON)
> 		return KVM_PFN_ERR_HWPOISON;
> 
> before the mmap_read_lock() line.  You may either sneak this at the beginning
> of the series or leave it for later.
> 
> Paolo
> 

