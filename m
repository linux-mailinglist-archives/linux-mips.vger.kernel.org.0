Return-Path: <linux-mips+bounces-5480-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE09724B9
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 23:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CC61F243BB
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 21:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA5418C358;
	Mon,  9 Sep 2024 21:59:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA388F5A;
	Mon,  9 Sep 2024 21:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725919156; cv=none; b=lqatT8N62N4qiypqWMyfO8Wt9leQNUPg8UVvch6iM6hyUAP1KF97yxYmUrkK3s6FIOt5o9tHHNwThKDeDXhFBIsW/CofA3WmNk9hn9ry9/iQytLIV9ZgrpB7C+xr0G/dmaH4ZeDnOisQlc++NNlXlonffme0C3m2dFL456ej6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725919156; c=relaxed/simple;
	bh=jByGLbh2GqBcqZ7FHhORlpa01vEbWbVw4J0VN8uBDNs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JywcwmTRDl3Wk+2qJiT8B/zsj+JqpYptgWRoncDji+BhNEE9MT4DZetBtzDnBcvF8T/Hks3GBkMjPOwWXeP3WJJgUVTZbGUfQwBTC9fkkfJ2SZnIBcIWpxDkzNd75fKAmvrQWfNfZIFaVTww31zS4qthibd+cAl7GiHsczz2HBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 18A0C92009C; Mon,  9 Sep 2024 23:59:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1553492009B;
	Mon,  9 Sep 2024 22:59:06 +0100 (BST)
Date: Mon, 9 Sep 2024 22:59:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: ftrace: Mark ftrace_get_parent_ra_addr as
 static
In-Reply-To: <20240908-mips-chore-v1-1-9239c783f233@flygoat.com>
Message-ID: <alpine.DEB.2.21.2409092258440.60835@angie.orcam.me.uk>
References: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com> <20240908-mips-chore-v1-1-9239c783f233@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 8 Sep 2024, Jiaxun Yang wrote:

> diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
> index 8c401e42301c..96016eb1c476 100644
> --- a/arch/mips/kernel/ftrace.c
> +++ b/arch/mips/kernel/ftrace.c
> @@ -248,8 +248,8 @@ int ftrace_disable_ftrace_graph_caller(void)
>  #define S_R_SP	(0xafb0 << 16)	/* s{d,w} R, offset(sp) */
>  #define OFFSET_MASK	0xffff	/* stack offset range: 0 ~ PT_SIZE */
>  
> -unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
> -		old_parent_ra, unsigned long parent_ra_addr, unsigned long fp)
> +static unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long old_parent_ra,
> +					       unsigned long parent_ra_addr, unsigned long fp)

 Overlong lines.

  Maciej

