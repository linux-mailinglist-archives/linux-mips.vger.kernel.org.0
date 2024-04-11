Return-Path: <linux-mips+bounces-2725-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F69A8A1D41
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 20:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 903631C24482
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 18:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71631635BF;
	Thu, 11 Apr 2024 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CEmduPtL"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD03502BE
	for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712854562; cv=none; b=P6uTNsh59xnMESbqXUJzdfd4kl2EF5CcoqQveT9nACKkxbYfPVUDk4v1xoIzoC851Tv2+WJ1P662I6pEfmS5BTq7KcW4KXEq2AVGhjxoVDx1oFJaS8/bdiAp93V+i4K+dVG7bZCMXvCCs4pxiEQqfSllfYy33GGUP0PFtSoam40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712854562; c=relaxed/simple;
	bh=mdyviDc2SZiHERUxq8FwGAUG2lksvejg1L3R6/TQq04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtDtQCcW8mL9j7E12zPORBPTtFDS8G+kizLtnm9ta1vfDouucSoXyUYI/p4+LoNxwgxpF2z/PVAEM1iEUTJTF578e+nR5OpQ6JUu3f/1tBQc1g1AjQ/Gd4lbHgWiL9IPi4nKBNuTscEDtUskLSFOmXMeE8jmNCIKT8o94tvNebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CEmduPtL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712854559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zMWXkXzR0H7lOgn05ANda8bjR25lnib+pFQqcdAFtGw=;
	b=CEmduPtL3NP5XNR+oFsDnVOJaZoVwlx7dy2SpDMkrYd+ByLjBPDNySLL9ouFDlwrBxagu3
	BJkyt5CIUk3SQVwtjYimIGEWuF/N7Omn/wmbfHopdQCiAeWPKGQeIWT7U9sxB+ZjvYoz0W
	M/50ajYZgsI8RUEvSFEfgE31ub9wAJI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-NCOD0sbVMdGJfN1giPDLrA-1; Thu, 11 Apr 2024 12:55:57 -0400
X-MC-Unique: NCOD0sbVMdGJfN1giPDLrA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-343ee356227so3493603f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 09:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712854557; x=1713459357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMWXkXzR0H7lOgn05ANda8bjR25lnib+pFQqcdAFtGw=;
        b=h0YtBOGn3bsLGUMZmRKN24Gjt6VDhAc1uHMFSpVzXUnj6vlOzKUGtLRoLEJB/ysVn4
         7XUWDfU3Xt7QgML1kXAqoVl4kH80WtWXokqqcxqvYVgOylGY68SSsV7d9yrTbVcIbkqR
         wK+oL8suUCQycmlT+JC9dphOfDXHT1VT1Z6Xr9KXvNSFzGB57JMvbpys9xUTzi147m3R
         yW5GTXQKGvJT9DkQwN2fEh5Eb9okx6C/gETQQCuFi8LlkGnlG6/a4d1xl5JFxpNJJbFr
         QkPtJP5wurv25VY+tCBPmgcH3kg5RCsPo2aOjN47DDrf1PDRY0h4VyIPjuKZBaZOrIEf
         mo0A==
X-Forwarded-Encrypted: i=1; AJvYcCUSoDtMCNFc8cGhCkx9qwejPoDhwLh9lfTTyOI8pc7+SuyRt20NK8svej90FzBLAPd6gFCjcl1Aem3HB22Zi9ESSL0kvALkZIaRjQ==
X-Gm-Message-State: AOJu0YwcLifVebMMfslvPdSTGs8ZEWG53n+Pk4te63wKffCrdNqcLn26
	DLvpee4UXrR0gYm/x6Aw9faHXNPiieGpaqumEzAmLlKrs2Zv7vYC9XEHuruKZ1pQ74BFEdYXAoa
	kMHNV4o33HCKnHxb/H0HXGlDGi/KPbjA6m+2TFAxqModIx4kDwCqiZcL1QcOdjb1XIyK9xeJfUc
	zPPwr+VvQ/IZkP0ocvv2hhZhcznO5BB5UdyQ==
X-Received: by 2002:a5d:5143:0:b0:346:67fd:beeb with SMTP id u3-20020a5d5143000000b0034667fdbeebmr125064wrt.13.1712854556788;
        Thu, 11 Apr 2024 09:55:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD8Twrk+pSap7dr/hOyNv9dE7sPb5xWfugil3Ej7FN6UJvArBpNQmyBrQbHxp3h5Btn4P+dbeRSa2EBSrKO98=
X-Received: by 2002:a5d:5143:0:b0:346:67fd:beeb with SMTP id
 u3-20020a5d5143000000b0034667fdbeebmr125049wrt.13.1712854556481; Thu, 11 Apr
 2024 09:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <ZhP3hDhe2Qwo9oCL@x1n>
In-Reply-To: <ZhP3hDhe2Qwo9oCL@x1n>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 11 Apr 2024 18:55:44 +0200
Message-ID: <CABgObfYwwXy9gQap-PJyOrVCcUr-VfK90AKNaRe0VO-G00G8SQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 3:56=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
> Paolo,
>
> I may miss a bunch of details here (as I still remember some change_pte
> patches previously on the list..), however not sure whether we considered
> enable it?  Asked because I remember Andrea used to have a custom tree
> maintaining that part:
>
> https://github.com/aagit/aa/commit/c761078df7a77d13ddfaeebe56a0f4bc128b19=
68

The patch enables it only for KSM, so it would still require a bunch
of cleanups, for example I also would still use set_pte_at() in all
the places that are not KSM. This would at least fix the issue with
the poor documentation of where to use set_pte_at_notify() vs
set_pte_at().

With regard to the implementation, I like the idea of disabling the
invalidation on the MMU notifier side, but I would rather have
MMU_NOTIFIER_CHANGE_PTE as a separate field in the range instead of
overloading the event field.

> Maybe it can't be enabled for some reason that I overlooked in the curren=
t
> tree, or we just decided to not to?

I have just learnt about the patch, nobody had ever mentioned it even
though it's almost 2 years old... It's a lot of code though and no one
has ever reported an issue for over 10 years, so I think it's easiest
to just rip the code out.

Paolo

> Thanks,
>
> --
> Peter Xu
>


