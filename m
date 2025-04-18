Return-Path: <linux-mips+bounces-8654-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3555A93753
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 14:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D42A84642D7
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 12:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDC3270ECF;
	Fri, 18 Apr 2025 12:44:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F14578F3B;
	Fri, 18 Apr 2025 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980277; cv=none; b=ZtT7gWwivBbEtLoYCfd/F2O2ljlxyCAmfuDTfxdR8OYRzvtIgNhpp5LacRFBquE907jYx5Bna0h8IJOcXvq36NjXgkT91Ukv4BYxbfOzMP8XQz8SnLizR6rfJKtxF/lHknnn5ssBUNTYIwDy5ky1qFwBYCrEqu1LF7x8Rzpwyho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980277; c=relaxed/simple;
	bh=Yx/Erk4kjCy5/yX09htdpPXarUGHqEbNGROVMZAD8AU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sIzowKw4ss8YaWAoOtqV/8tHUUs45YJ3U1mQ13YE7frMdXiyIm8V+zNHQ+4I+G25vfPJYQwC0W+fhjtgJLXYa1Y9ndTTPoO4BzEK+9o36bTRycsNx2pUE832GccA8hqn6yTFcBML4MxlqSjQrQQj1iOEFXQYgD+F0XHJh4AYWtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7D36C92009C; Fri, 18 Apr 2025 14:44:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6E64492009B;
	Fri, 18 Apr 2025 13:44:32 +0100 (BST)
Date: Fri, 18 Apr 2025 13:44:32 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length struct
 member
In-Reply-To: <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
Message-ID: <alpine.DEB.2.21.2504181337350.18253@angie.orcam.me.uk>
References: <20250417174712.69292-2-thorsten.blum@linux.dev> <aAIF_kEFlOOVNDaE@alpha.franken.de> <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev> <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk> <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Apr 2025, Thorsten Blum wrote:

> > Though the fix is incorrect for CPU_CAVIUM_OCTEON, because it doesn't 
> > allow one to access the second half of the last register, and I find it 
> > exceedingly complex anyway.  Just:
> > 
> > #define MAX_REG_OFFSET \
> > (offsetof(struct pt_regs, __last) - sizeof(unsigned long))
> > 
> > will do (as `regs_get_register' operates on `unsigned long' quantities).
> 
> Does regs_get_register() even work for CPU_CAVIUM_OCTEON when accessing
> the last two registers because they're both ULL, not UL? (independent of
> my patch)

 Or rather two arrays of registers.  With 32-bit configurations their 
contents have to be retrieved by pieces.  I don't know if it's handled by 
the caller(s) though as I'm not familiar with this interface.

  Maciej

