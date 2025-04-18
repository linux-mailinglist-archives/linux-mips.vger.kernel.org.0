Return-Path: <linux-mips+bounces-8652-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D166A93611
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 12:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6DF68E3FB7
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 10:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A288421505E;
	Fri, 18 Apr 2025 10:36:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428F7221F1A;
	Fri, 18 Apr 2025 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744972609; cv=none; b=fyMYnrqeRUX9l997FTI7W4JImNaiNcxKVk++pkJDoWILCPxK2t/o7u23z2ClgPyhLhto0SdFApk8gfVp1VPEwngNfFMPVSMRrU3lQtNHXBH9wZm7jxXfS6PJ65fgM4LV140JHvDd6ACNwxQj3bGR0b9vwi+LqeuQPQlKWiI/GGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744972609; c=relaxed/simple;
	bh=sw6r3R5Y6VvqVM7Pf5FIG4Rg5KdgiyqxVDqTGBpTQ8U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IWbRkDlVEBvU3cYvoYeT93ALDsnGi2BO3b8DW48xK4Z3gIS4NB63dR+Y0Pf3BOWEWdR3GsjsyWLvrZ5wWqstfIon7iiZ5k2KRbQUWHykUOfKAAvyZad4FZOXOWbkpR8TAFQlX/gkXCAGG91K+0r4kvXR7U74xktbuVtPAl9iCJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 70A1092009C; Fri, 18 Apr 2025 12:36:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6C06392009B;
	Fri, 18 Apr 2025 11:36:37 +0100 (BST)
Date: Fri, 18 Apr 2025 11:36:37 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length struct
 member
In-Reply-To: <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
Message-ID: <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
References: <20250417174712.69292-2-thorsten.blum@linux.dev> <aAIF_kEFlOOVNDaE@alpha.franken.de> <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Apr 2025, Thorsten Blum wrote:

> >> Remove the unnecessary zero-length struct member '__last' and fix
> >> MAX_REG_OFFSET to point to the last register in 'pt_regs'.
> >> 
> >> Fixes: 40e084a506eba ("MIPS: Add uprobes support.")
> > 
> > what does it fix ?
> 
> The value of MAX_REG_OFFSET and thus how regs_get_register() behaves.
> 
> From my understanding, MAX_REG_OFFSET points to the marker '__last[0]'
> instead of the actual last register in 'pt_regs', which could allow
> regs_get_register() to return an invalid offset.

 Or actually it permits an out-of-range access beyond the end of `struct 
pt_regs': if you call `regs_get_register(pt_regs, MAX_REG_OFFSET)', it'll 
read memory beyond `pt_regs' rather than returning 0 right away.  It may 
not happen in reality (I haven't checked), but it's a QoI issue we should 
address IMO.  Other platforms that I've checked (riscv, x86) get it right.

 Though the fix is incorrect for CPU_CAVIUM_OCTEON, because it doesn't 
allow one to access the second half of the last register, and I find it 
exceedingly complex anyway.  Just:

#define MAX_REG_OFFSET							\
	(offsetof(struct pt_regs, __last) - sizeof(unsigned long))

will do (as `regs_get_register' operates on `unsigned long' quantities).  

 Using `sizeof(struct pt_regs)' is problematic, as there might be padding 
at the end of the structure, depending on the configuration (which is also 
surely why Ralf chose to add this extra `__last' member instead), and we 
don't want let one access that padding area either.

  Maciej

