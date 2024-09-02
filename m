Return-Path: <linux-mips+bounces-5285-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A15EA968AF9
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2024 17:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13B17B225AC
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2024 15:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE401A263D;
	Mon,  2 Sep 2024 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="aLtRauBH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057641A262C
	for <linux-mips@vger.kernel.org>; Mon,  2 Sep 2024 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290778; cv=none; b=o1CKFndqahSwC4nZYMH0hZH3VFTo6+qFtG8RUoJCHfLjrzrJjuu0zH31vv4SMswWSeqVRS2El9/f9+CBnrGg5XJR171RtITPCtItEwEBjHIi8fYGoSNYLgsPlMoKTrIIrO7HMCx2uTYvaaaue9AC92uMDE14x28RInnq4va6U8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290778; c=relaxed/simple;
	bh=mdB6GDxg3I3eGF//Wyea67XTwdwtlijxajgQ92wG6d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lR+UCO2JP5xRPkGqXPRrniskbjMsqEFqXfsMhJ565xbvJ9MZPyoE95vDtmrY1sN9SKAY4R6/j9z+TCbTErSP8mTsqUdwRIy4nU4Cu6Sp82596RPmn4IhzAxWUBgV9K5vignwxnZhHTMRIWmQzRfl7eqQ3om+CFhPbTzAYY/VoBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=aLtRauBH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2022fea51fdso6079005ad.0
        for <linux-mips@vger.kernel.org>; Mon, 02 Sep 2024 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725290776; x=1725895576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQrdUk9Qs95YbYxvkhvXPIF077+rLJVqqSG6sH4DY10=;
        b=aLtRauBHycUX+ED4G1vz6Cnt9aJaAHcqKkdjjCT5XGqLQdqirY4WT8mdT18HwrxNk/
         UVticMtx58yxZGA0UleFGgzvDxeOxPpr36lNEpNU8BYW0+Gkpmgm6yUkGEpoWeKijxFP
         5B7Jkm159ryDpNt01XQZz+tSZKbsE+3/QLVlIn+5m26xUME/DgPKpWLFkdcXmfugeM90
         Z2WPkmRGQVdlrbPjaJFIqVWOLft+ViRbAoVlx9gzILGsrf3HirDl+ZbRjpxwDUCen8SQ
         8RS5ckdQmScHg8EFxYrbovGTnmwfJcdE/dtGXUweD+iGCW3+mZycJWYGsZSY9fDJ3EVd
         cd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290776; x=1725895576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQrdUk9Qs95YbYxvkhvXPIF077+rLJVqqSG6sH4DY10=;
        b=o1lg0FgqpEl/1JxdqgLnmot5Dj6txjuYb/AFQoLZ8Y+Rkp0iy4mYmybagVi/+XHqkW
         x3mIUWMfG1Kl/FkrDEqYSsMu2Ac7/2vW9eEI7vmuoV4cFKFZ9k0cN6DSigQPcrj3QgnH
         zVONiJmpS1taCLi86CqKS1fS/AB6yc7ucGVEYrqVb9HHhN9aPWo8Kn8bKX6e3/X1gJIp
         KN1bnUwLJcujyKg+X4nzaaI4H/0+7p7bUzbIRYOIih1G8pDqMyyMowayv6m5tvcng5xa
         B1nExJBzub4guWwrQW04gLggzEN8LD2nQ08LTGYpFDfBlddRU/wyTROEUNHwCShCQ0ZJ
         qdNw==
X-Forwarded-Encrypted: i=1; AJvYcCVUOxsq88B9Tj3bSmroJyX8LPExgHDlwD7iTWeMCQkADlui4diEeCUndobTQzYCuY8lX/MbgqGUT/ZH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fuAhw5C1tn+IrCsTtwTAaFMsZ+MJLqV0LX7pa1PXCf2QNte6
	rE4wGRhuTqy7ereQZlg+cJ9pT/KRIAYuN0/ab+7+P0ZP2uoDFFUC6vVhwOqw1kc=
X-Google-Smtp-Source: AGHT+IEIj7UpxJT8a0mIACuZXNoTi9evmUotnGeb8wHYPTVQQPCrd38PWufROqKQIhaL5lvUsVlKgg==
X-Received: by 2002:a17:902:e549:b0:205:8948:3578 with SMTP id d9443c01a7336-20589483694mr10763885ad.2.1725290776144;
        Mon, 02 Sep 2024 08:26:16 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152d04a3sm67470855ad.110.2024.09.02.08.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:26:14 -0700 (PDT)
Date: Mon, 2 Sep 2024 08:26:13 -0700
From: Omar Sandoval <osandov@osandov.com>
To: David Hildenbrand <david@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
Message-ID: <ZtXZFc9kZAUMD4e0@telecaster>
References: <cover.1725223574.git.osandov@fb.com>
 <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
 <ZtVbrM4rQsGFJo_t@telecaster>
 <861d448c-ce1d-4b74-87eb-9b211dfebbb1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <861d448c-ce1d-4b74-87eb-9b211dfebbb1@redhat.com>

On Mon, Sep 02, 2024 at 10:56:27AM +0200, David Hildenbrand wrote:
> On 02.09.24 08:31, Omar Sandoval wrote:
> > On Mon, Sep 02, 2024 at 08:19:33AM +0200, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> > > > [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > > > 
> > > > From: Omar Sandoval <osandov@fb.com>
> > > > 
> > > > Hi,
> > > > 
> > > > I hit a case where copy_to_kernel_nofault() will fault (lol): if the
> > > > destination address is in userspace and x86 Supervisor Mode Access
> > > > Prevention is enabled. Patch 2 has the details and the fix. Patch 1
> > > > renames a helper function so that its use in patch 2 makes more sense.
> > > > If the rename is too intrusive, I can drop it.
> > > 
> > > The name of the function is "copy_to_kernel". If the destination is a user
> > > address, it is not a copy to kernel but a copy to user and you already have
> > > the function copy_to_user() for that. copy_to_user() properly handles SMAP.
> > 
> > I'm not trying to copy to user. I am (well, KDB is) trying to copy to an
> > arbitrary address, and I want it to return an error instead of crashing
> > if the address is not a valid kernel address. As far as I can tell, that
> > is the whole point of copy_to_kernel_nofault().
> 
> The thing is that you (well, KDB) triggers something that would be
> considered a real BUG when triggered from "ordinary" (non-debugging) code.

If that's the case, then it's a really weird inconsistency that it's OK
to call copy_from_kernel_nofault() with an invalid address but a bug to
call copy_to_kernel_nofault() on the same address. Again, isn't the
whole point of these functions to fail gracefully instead of crashing on
invalid addresses? (Modulo the offline and hwpoison cases you mention
for /proc/kcore.)

> But now I am confused: "if the destination address is in userspace" does not
> really make sense in the context of KDB, no?
> 
>   [15]kdb> mm 0 1234
>   [   94.652476] BUG: kernel NULL pointer dereference, address:
> 0000000000000000
> 
> Why is address 0 in "user space"? "Which" user space?

Sure, it's not really user space, but it's below TASK_SIZE_MAX, so
things like handle_page_fault() and fault_in_kernel_space() treat it as
if it were a user address. I could
s/userspace address/address that is less than TASK_SIZE_MAX or is_vsyscall_vaddr(address)/.

> Isn't the problem here that KDB lets you blindly write to any non-existing
> memory address?
> 
> 
> Likely it should do some proper filtering like we do in fs/proc/kcore.c:
> 
> Take a look at the KCORE_RAM case where we make sure the page exists, is
> online and may be accessed. Only then, we trigger a
> copy_from_kernel_nofault(). Note that the KCORE_USER is a corner case only
> for some special thingies on x86 (vsyscall), and can be ignored for our case
> here.

Sure, it would be better to harden KDB against all of these special
cases. But you can break things in all sorts of fun ways with a
debugger, anyways. The point of this patch is that it's nonsense that a
function named copy_to_kernel_nofault() does indeed fault in a trivial
case like address < TASK_SIZE_MAX.

Thanks,
Omar

