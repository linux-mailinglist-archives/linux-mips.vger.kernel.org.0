Return-Path: <linux-mips+bounces-4768-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2160C949458
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 17:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7FE12885AF
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 15:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FDC182B4;
	Tue,  6 Aug 2024 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gKgFYuFI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466A815E88
	for <linux-mips@vger.kernel.org>; Tue,  6 Aug 2024 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722957573; cv=none; b=BqumUNNjfE9PZTrqNz4se60ucoQcQeMO6+m1zl2Fgk5vthPn7OH8jB+CRRH/qQLKWeqn5LuETrpqQGuj4t70DWU1BqC+6TANogETrqKJCTNh8GctgtywCCaEUl04LvRoEwI4it27p4OI7jrrNg70e/TPed3FtP8jl5n3kUFdtrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722957573; c=relaxed/simple;
	bh=507JunshFPL0z45Z3MTpxjvv85WUDf3XTVoh4ip9AK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U32WoAMWCv54ICzIvpjLq+NnSZY6A5zs63efJifh3D7q89MuitDEfBlLUgvFbtAXVvuo4R5i/uT2/hTDiKXZWMzcSBS+FeDXeI+R+W6LfG9mG43i+lNTPkb6h+iJsAWl7B48wbpllexqErtXwcCFPZxi0HuVrpMFn97cWLBKdPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gKgFYuFI; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fc4e03a885so6795955ad.2
        for <linux-mips@vger.kernel.org>; Tue, 06 Aug 2024 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722957572; x=1723562372; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfDlFqosrXLKfrNosA2JBe6CUch6c/VqYqOk4CYX594=;
        b=gKgFYuFIJmlGpx7e7aLV60QPi4QjeR+aw6XSVOZyHIVc1JrcyAG5rMqZuF4TjF5oKg
         m11dzUoipw3+LwoZqR8IFZgHJdGdARAcnIH3P/9TUk0c+Py7zrNCT7SbZBu06F1ZBCqM
         K2T4xprWctmdqbQg0AxLhO8+kNCDd13RiLKJoxzJsJD/pOdv5m9GYNI+ccg06MPCGCSJ
         +origpV28ktEzT7wEETxR2MfE7PF68lUSq0DYRkuF+sIB8rviknWI4tB/NG42QL63fVh
         vZdtbshbtZExP2SI07+SFNu5CyAPdHI3n1PjuBTh2jPpgLQoGTgdNwNQD5rSf2aTjhaU
         OyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722957572; x=1723562372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfDlFqosrXLKfrNosA2JBe6CUch6c/VqYqOk4CYX594=;
        b=cfhbLPlpXdMJoere09le46vufk/dpBE8eAhSc+pDgwYWAnRq2wglI2Q8M12PiO6CYh
         XIVbR41R6LAyqWV0i9xIrwBMGXDqBz/HSWnb8Ah25WJn0H0fQfnvQ7wANy1cpgwb3zZc
         d3rq0Orop3do9iOAB1x4XBz46v8NRMMz1Kr94RNx3Yhtx3az0Ag/5Y3EDNXlH7/8NpPQ
         vdRlS+SFTbmYoTt/yqczcf4moLF8gYWFd3GFIaS2PtJZi+SLL2/OhC6uyF9PaSIkdb6L
         qIhRyGzSj8rhulXU44WmYb1ZuUmE+SRUh72QjA3BbeIajWjAitlp6zF1QAl6Sxgknp9z
         TnEw==
X-Forwarded-Encrypted: i=1; AJvYcCWhH6vbabWqoTip6ZFcFPCiHXR1s81uE7kxBsh5Elz2YjLX/XhiJ62xZVvhcU5x+Ij93aOCmQ4yUV53Lj00nTWkDoYL4B+ZLbRKyg==
X-Gm-Message-State: AOJu0YyOw6Xe/1/twrbPVof3P5uwfuC4BIjoteq4LYryvOvLmzcsVOdK
	AxvWQJDWVk+fds47/fCZeWtCkit0orRx2dDUCe7afvcE0FV5StcF9UlsqBUenOU9DuecWqrduNx
	AdQ==
X-Google-Smtp-Source: AGHT+IG+kq4xSCmsszhC87T6ezpGfclhL8SLo9v6dzemvAwTfI9EBqVt37Vs+G2GK8dBxj5hzSimY+F6XI8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e743:b0:1fb:54d9:ebb3 with SMTP id
 d9443c01a7336-1ff57309939mr9499665ad.6.1722957571476; Tue, 06 Aug 2024
 08:19:31 -0700 (PDT)
Date: Tue, 6 Aug 2024 08:19:29 -0700
In-Reply-To: <86ikwe2fph.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev> <ZrFfvjy_-Tyx4xUV@linux.dev> <86ikwe2fph.wl-maz@kernel.org>
Message-ID: <ZrI_AdLhWZqNKC4z@google.com>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 06, 2024, Marc Zyngier wrote:
> On Tue, 06 Aug 2024 00:26:54 +0100,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > On Mon, Aug 05, 2024 at 11:26:03PM +0000, Oliver Upton wrote:
> > > [+cc Fuad]
> > 
> > Take 2!
> > 
> > > Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
> > > the page as dirty out of the critical section") that restructuring
> > > around the MMU lock was helpful for reuse (presumably for pKVM), but I
> > > lack the context there.
> > > 
> > > On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> > > > Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> > > > page/folio dirty after it has been written back can make some filesystems
> > > > unhappy (backing KVM guests will such filesystem files is uncommon, and
> > > 
> > > typo: s/will/with/
> > > 
> > > > the race is minuscule, hence the lack of complaints).  See the link below
> > > > for details.
> 
> Should we consider reverting 9c30fc615daa then?

Aha!  After thinking through things more, I don't think a revert is necessary.
I _think_ the worst case scenario is that KVM would trigger this WARN in
filemap_unaccount_folio():

	/*
	 * At this point folio must be either written or cleaned by
	 * truncate.  Dirty folio here signals a bug and loss of
	 * unwritten data - on ordinary filesystems.
	 *
	 * But it's harmless on in-memory filesystems like tmpfs; and can
	 * occur when a driver which did get_user_pages() sets page dirty
	 * before putting it, while the inode is being finally evicted.
	 *
	 * Below fixes dirty accounting after removing the folio entirely
	 * but leaves the dirty flag set: it has no effect for truncated
	 * folio and anyway will be cleared before returning folio to
	 * buddy allocator.
	 */
	if (WARN_ON_ONCE(folio_test_dirty(folio) &&
			 mapping_can_writeback(mapping)))
		folio_account_cleaned(folio, inode_to_wb(mapping->host));

KVM won't actually write memory because the stage-2 mappings are protected by the
mmu_notifier, i.e. there is no risk of loss of data, even if the VM were backed
by memory that needs writeback.

And FWIW, given that multiple other KVM architectures mark folios dirty outside
of mmu_notifier protection and have never tripped over this, I think it's highly
unlikely the WARN will ever be triggered by a sane virtualization setup.

I can add something to that effect to the changelog, e.g. to document that this
isn't super urgent.  

