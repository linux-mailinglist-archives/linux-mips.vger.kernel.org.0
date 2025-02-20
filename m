Return-Path: <linux-mips+bounces-7882-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6DA3E840
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 00:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5689616FECB
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2025 23:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60348266B72;
	Thu, 20 Feb 2025 23:19:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E05265CBA;
	Thu, 20 Feb 2025 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740093567; cv=none; b=K8DOLb2+VNrKwB2WLJTnHDOfNtcZgVae9R7LNGBCucoWASZIuMrGvT3wfbCUn2BNIakdxH7mkqOJE2RpFIVsv+GWwT8crbuDtVyw31kqMpWyJlaipfqsklszKp8mpThMz9bCb1nB1QNuJBw3qprz8HypM9OKsrSQU+1fMEKYyoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740093567; c=relaxed/simple;
	bh=68PBS0QX7ubIHdSsKS/WkkEXeXZcPi+QHsTsllQCDWg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NsV7JjQ7flnFeMaWsRgBB1RDSlyw4Bg+JtSdv9YxhJg8g8tXBEdsCG1Rrrs4EC8F5lcOoIuCeD6UE9rwX/3jJyw2sSQZj/f5NuRrnCp1qk+BDDPakyzTJa7KbxbAjFVRnSg93E5W6I2enNcCX/XttQZbLBTzuyQTMo8vS53bVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3619792009C; Fri, 21 Feb 2025 00:19:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2F21C92009B;
	Thu, 20 Feb 2025 23:19:23 +0000 (GMT)
Date: Thu, 20 Feb 2025 23:19:23 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Dmitry V. Levin" <ldv@strace.io>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>, 
    Alexey Gladkov <legion@kernel.org>, 
    Eugene Syromyatnikov <evgsyr@gmail.com>, strace-devel@lists.strace.io, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] syscall.h: introduce syscall_set_nr()
In-Reply-To: <20250219193007.GC14216@strace.io>
Message-ID: <alpine.DEB.2.21.2502202247420.65342@angie.orcam.me.uk>
References: <20250217091034.GD18175@strace.io> <alpine.DEB.2.21.2502191658530.65342@angie.orcam.me.uk> <20250219182451.GA14216@strace.io> <alpine.DEB.2.21.2502191917420.65342@angie.orcam.me.uk> <20250219193007.GC14216@strace.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Feb 2025, Dmitry V. Levin wrote:

> >  May I suggest "[...] after return from syscall_trace_enter() invocation." 
> > instead?  Minor reformatting might be required for better visual alignment 
> > though.
> 
> Like this:
> 	/*
> 	 * New syscall number has to be assigned to regs[2] because
> 	 * it is loaded from there unconditionally after return from
> 	 * syscall_trace_enter() invocation.
> 	 *
> 	 * Consequently, if the syscall was indirect and nr != __NR_syscall,
> 	 * then after this assignment the syscall will cease to be indirect.
> 	 */

 Perfect, thank you!

  Maciej

