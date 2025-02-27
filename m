Return-Path: <linux-mips+bounces-8022-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07DBA47D5A
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 13:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB4A3AA1ED
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 12:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D05022AE42;
	Thu, 27 Feb 2025 12:14:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBA227005C;
	Thu, 27 Feb 2025 12:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658488; cv=none; b=dmMMMEMzZmt1SiVVCR19kr0O+/9xkUAgEZK3dwhj1DyE5fdm6S9YIIuI4o/c4GuJbQzQImoJ+tJFl9xuzbojzboqsylShmTqZcWqgfAMNiy0h/XjH5hC1bg9FsQCzB4Vhzx18wGjxFDvzU2x+frjjtyKl1ia5iBQp1ttWOQMPPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658488; c=relaxed/simple;
	bh=Gh7xmGWSgO6eYc0d7vBNoai2bHYo22KqAYJc7A1uFgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzGJNnWZOt7doblvj03V/jpqeb0bmSVmJZiF2k8qnDbWL4OsDvItf0UDhzgkLuHP9kqO+PJFieJWecx369Ysy2EVfGwP/5DqKKUlFDfQQvmOvkARTMpBZqQ1yXT424maAhVnjsXq4Furvlca51fo4C/vTWwwBr4KFf6lT5Qm514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tncmn-00016H-00; Thu, 27 Feb 2025 13:14:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 50FDAC0135; Thu, 27 Feb 2025 11:12:36 +0100 (CET)
Date: Thu, 27 Feb 2025 11:12:36 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Ignore relocs against __ex_table for relocatable
 kernel
Message-ID: <Z8A6lBXX8LZPyEDS@alpha.franken.de>
References: <20250226132841.381063-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226132841.381063-1-xry111@xry111.site>

On Wed, Feb 26, 2025 at 09:28:41PM +0800, Xi Ruoyao wrote:
> Since commit 6f2c2f93a190 ("scripts/sorttable: Remove unneeded
> Elf_Rel"), sorttable no longer clears relocs against __ex_table,
> claiming "it was never used."  But in fact MIPS relocatable kernel had
> been implicitly depending on this behavior, so after this commit the
> MIPS relocatable kernel has started to spit oops like:
> 
> 	CPU 1 Unable to handle kernel paging request at virtual address 000000fffbbdbff8, epc == ffffffff818f9a6c, ra == ffffffff813ad7d0
> 	... ...
> 	Call Trace:
> 	[<ffffffff818f9a6c>] __raw_copy_from_user+0x48/0x2fc
> 	[<ffffffff813ad7d0>] cp_statx+0x1a0/0x1e0
> 	[<ffffffff813ae528>] do_statx_fd+0xa8/0x118
> 	[<ffffffff813ae670>] sys_statx+0xd8/0xf8
> 	[<ffffffff81156cc8>] syscall_common+0x34/0x58
> 
> So ignore those relocs on our own to fix the issue.
> 
> Fixes: 6f2c2f93a190 ("scripts/sorttable: Remove unneeded Elf_Rel")
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/mips/boot/tools/relocs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/mips/boot/tools/relocs.c b/arch/mips/boot/tools/relocs.c
> index a88d66c46d7f..9863e1d5c62e 100644
> --- a/arch/mips/boot/tools/relocs.c
> +++ b/arch/mips/boot/tools/relocs.c
> @@ -468,6 +468,8 @@ static void walk_relocs(int (*process)(struct section *sec, Elf_Rel *rel,
>  			Elf_Sym *sym, const char *symname))
>  {
>  	int i;
> +	struct section *extab_sec = sec_lookup("__ex_table");
> +	int extab_index = extab_sec ? extab_sec - secs : -1;
>  
>  	/* Walk through the relocations */
>  	for (i = 0; i < ehdr.e_shnum; i++) {
> @@ -480,6 +482,9 @@ static void walk_relocs(int (*process)(struct section *sec, Elf_Rel *rel,
>  		if (sec->shdr.sh_type != SHT_REL_TYPE)
>  			continue;
>  
> +		if (sec->shdr.sh_info == extab_index)
> +			continue;
> +
>  		sec_symtab  = sec->link;
>  		sec_applies = &secs[sec->shdr.sh_info];
>  		if (!(sec_applies->shdr.sh_flags & SHF_ALLOC))
> -- 
> 2.48.1

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

