Return-Path: <linux-mips+bounces-7877-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F4FA3C8CF
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 20:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFEB3189C873
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 19:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD1923E22B;
	Wed, 19 Feb 2025 19:30:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E0A23C8B6;
	Wed, 19 Feb 2025 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739993410; cv=none; b=f+QUon53YmTPiN5GLRIpzpEt6kgwQ9dkRkkUneg7lcOfLy3W2EKu7Wu5cHD9aVok5osoZwhNz+S7UJA9OpuiX21N/Ro7iq+6+nDnUmaibJYukMArayqowNN+phRow5eDqxVl48oFZ+raSNv/PY9hSH90Z4uq4zRtOAvfCHWx7yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739993410; c=relaxed/simple;
	bh=fJsCC2NL/xwIi/2rud+kkCDcnUwipGg+cvuProNL+PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uM0YxOR9zqM4vt279GRwz/R1tTp8zUzvNpGt+fNpgY/mloEhTMlKiF4E35wuEmhBdeeWe8iThv4ovmpKgmhZ/LT8XgxTrPjK06QyC23ECe0uAM6zv78KzpbaCqA63M6XaW2JM42KQUNvyXLInKhJkNb8FW+rZ8OFi2hub5e1R80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 94F6572C8F5;
	Wed, 19 Feb 2025 22:30:07 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 84CBD7CCB3A; Wed, 19 Feb 2025 21:30:07 +0200 (IST)
Date: Wed, 19 Feb 2025 21:30:07 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	strace-devel@lists.strace.io, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] syscall.h: introduce syscall_set_nr()
Message-ID: <20250219193007.GC14216@strace.io>
References: <20250217091034.GD18175@strace.io>
 <alpine.DEB.2.21.2502191658530.65342@angie.orcam.me.uk>
 <20250219182451.GA14216@strace.io>
 <alpine.DEB.2.21.2502191917420.65342@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2502191917420.65342@angie.orcam.me.uk>

On Wed, Feb 19, 2025 at 07:20:33PM +0000, Maciej W. Rozycki wrote:
> On Wed, 19 Feb 2025, Dmitry V. Levin wrote:
[...]
> > Would you be OK with the following wording:
> > 	/*
> > 	 * New syscall number has to be assigned to regs[2] because it is
> > 	 * loaded from there unconditionally after syscall_trace_enter()
> > 	 * invocation.
> 
>  May I suggest "[...] after return from syscall_trace_enter() invocation." 
> instead?  Minor reformatting might be required for better visual alignment 
> though.

Like this:
	/*
	 * New syscall number has to be assigned to regs[2] because
	 * it is loaded from there unconditionally after return from
	 * syscall_trace_enter() invocation.
	 *
	 * Consequently, if the syscall was indirect and nr != __NR_syscall,
	 * then after this assignment the syscall will cease to be indirect.
	 */
?

-- 
ldv

