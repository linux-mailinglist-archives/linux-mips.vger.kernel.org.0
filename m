Return-Path: <linux-mips+bounces-8890-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63CAA5351
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 20:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F73B166FA8
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 18:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6505213236;
	Wed, 30 Apr 2025 18:08:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8154419F12D;
	Wed, 30 Apr 2025 18:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036521; cv=none; b=VNCiEpbNaiE9HmDRxtYejbAMURY8QEuPc8gNLqgixjzfACbWhUc8HbylLRcUOITq8wj08drOuGGKnsGRH2j1TiSzxTMjUXPezqc3SrEqC0fUQfaTL14MyzsaQEe5bTgGli4PX5Nt8zysaelMefy7mcwwcxCQ2w1eZ+eHMKzRmC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036521; c=relaxed/simple;
	bh=jH+ZCBEn9F/QUZhg04QvPxAeiqE8vcukpm0W0ApPd7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gfnk47OFuism34uVg/gwSI+2A4Q2kda9LNhqnpiXW5HaCpeOmq/+niGWqf/b6R/cqspdDsNSBjAtMyGgfCxDjoF7rGvWdEdvS+dladh4s+Haj0aDeoGV9jG5GCB9MRbmQtzqu+Vr0MGsqaIanl1lpBgXBpHxGa5E6TvWUjF0s08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uABr9-0006WF-00; Wed, 30 Apr 2025 20:08:27 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3822BC01A2; Wed, 30 Apr 2025 20:07:59 +0200 (CEST)
Date: Wed, 30 Apr 2025 20:07:59 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Oleg Nesterov <oleg@redhat.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: Fix MAX_REG_OFFSET
Message-ID: <aBJm_31-FwCKIq3_@alpha.franken.de>
References: <20250427113423.67040-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427113423.67040-2-thorsten.blum@linux.dev>

On Sun, Apr 27, 2025 at 01:34:24PM +0200, Thorsten Blum wrote:
> Fix MAX_REG_OFFSET to point to the last register in 'pt_regs' and not to
> the marker itself, which could allow regs_get_register() to return an
> invalid offset.
> 
> Fixes: 40e084a506eb ("MIPS: Add uprobes support.")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Compile-tested only.
> 
> Changes in v2:
> - Fix MAX_REG_OFFSET as suggested by Maciej (thanks!)
> - Link to v1: https://lore.kernel.org/lkml/20250411090032.7844-1-thorsten.blum@linux.dev/
> 
> Changes in v3:
> - Keep the marker and avoid using #ifdef by adjusting MAX_REG_OFFSET as
>   suggested by Thomas and Maciej
> - Link to v2: https://lore.kernel.org/lkml/20250417174712.69292-2-thorsten.blum@linux.dev/
> ---
>  arch/mips/include/asm/ptrace.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
> index 85fa9962266a..ef72c46b5568 100644
> --- a/arch/mips/include/asm/ptrace.h
> +++ b/arch/mips/include/asm/ptrace.h
> @@ -65,7 +65,8 @@ static inline void instruction_pointer_set(struct pt_regs *regs,
>  
>  /* Query offset/name of register from its name/offset */
>  extern int regs_query_register_offset(const char *name);
> -#define MAX_REG_OFFSET (offsetof(struct pt_regs, __last))
> +#define MAX_REG_OFFSET \
> +	(offsetof(struct pt_regs, __last) - sizeof(unsigned long))
>  
>  /**
>   * regs_get_register() - get register value from its offset
> -- 
> 2.49.0

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

