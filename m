Return-Path: <linux-mips+bounces-7875-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B56A3C85B
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 20:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD83C3B63D8
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 19:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF6022A4EF;
	Wed, 19 Feb 2025 19:16:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE12922A4E0;
	Wed, 19 Feb 2025 19:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992568; cv=none; b=jwuEHjqkFC3EpIW3ZuV86+kMUiTWRmwIOarTgGdtdoCmLzA/HJT4eJApI/zHY/AIqyceL/OFNlInw2Ws1FOdW4I5aOlc/cMEurv0ba4ryWNJnng96POXlQleVxrOc7ai3i+tyAKk0F71Aj3U1lXFRblvGZit+ONHVVTjo7BDeBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992568; c=relaxed/simple;
	bh=mKvCNIT+ibSxfEwKXH5CvEfHloKAbhX7isPwSRQQc8U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b6Kn7Wup7z4UAQ1K3Ior+s7NFug0ZceyJ2TuZT33BBjw7cZ5AybqJFc0nOAJysEBmYMLr2q4K/u9P2Ub1786W4p1igORPs/Yvn7AAXe+ggfdbzgiRO3uETByzSx1iyfxeUWl2he6Z8VV3RJbGD41trC4r82/IIU5SCzOwpQY3Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3060B92009C; Wed, 19 Feb 2025 20:16:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2936D92009B;
	Wed, 19 Feb 2025 19:16:04 +0000 (GMT)
Date: Wed, 19 Feb 2025 19:16:04 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Dmitry V. Levin" <ldv@strace.io>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
    Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>, 
    Eugene Syromyatnikov <evgsyr@gmail.com>, strace-devel@lists.strace.io, 
    linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] syscall.h: add syscall_set_arguments()
In-Reply-To: <20250219184852.GB14216@strace.io>
Message-ID: <alpine.DEB.2.21.2502191855130.65342@angie.orcam.me.uk>
References: <20250217091020.GC18175@strace.io> <alpine.DEB.2.21.2502191642590.65342@angie.orcam.me.uk> <20250219184852.GB14216@strace.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Feb 2025, Dmitry V. Levin wrote:

> > -- given MIPS syscall_set_nr() implementation in 3/6 this conditional is 
> > supposed to never be true.  Should it be BUG_ON() or discarded entirely?
> 
> I agree it should be discarded: given that the syscall number read from
> regs[2] after syscall_trace_enter() invocation is not treated in any
> special way with regards to __NR_syscall, it would be incorrect to do
> it here either.  In fact, user space is allowed to set regs[2] to
> __NR_syscall, even though it's pointless, but it's definitely not a
> BUG_ON() situation.

 Right, good point, the conditional indeed can do harm even.  Thanks for 
double-checking.

  Maciej

