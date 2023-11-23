Return-Path: <linux-mips+bounces-203-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3067F5BE3
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 11:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7C702818CC
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 10:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26187224C6;
	Thu, 23 Nov 2023 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOskhRie"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070BE224C4
	for <linux-mips@vger.kernel.org>; Thu, 23 Nov 2023 10:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2358DC433C8;
	Thu, 23 Nov 2023 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700734013;
	bh=hHlmaaenY3K3RyRqebqvCpM/Pdx7EFiDr57xLbhkwmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VOskhRiejjbd78wVpvIEcuUhnWfPA/pMYa8JaotvzigQozPtoR53EOFVp27EIjpJo
	 5NxxIBE0GcNP1T0HnntGtFY3PF4Ap0FNWwrKkqOr4kfGfMvhpnkcwWHVHH+hPHVfaO
	 kB3uLYjpi6SzP/SH56dNJFAaM26cXAYy1kDjNJftAZRqetJDs/ZoY5Q3ikskMdSRQE
	 GfR2ZbRFSW29XywgSoZH9cQJH0NWqBYwmBsxDSsboP2pwk0Ty49hLlCxYofICXQGUd
	 0Tz92uuuOIG7VDOYgkAHIs8lMY24XAR++o6Dcv6mXkoVjP2cob+/+CR401JTNq5S/2
	 QzGJOhC/pHYFA==
Date: Thu, 23 Nov 2023 12:06:38 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yinglu Yang <yangyinglu@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] mm/mm_init.c: Append '\n' to the unavailable ranges
 log-message
Message-ID: <20231123100638.GE636165@kernel.org>
References: <20231122182419.30633-1-fancer.lancer@gmail.com>
 <20231122182419.30633-7-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122182419.30633-7-fancer.lancer@gmail.com>

On Wed, Nov 22, 2023 at 09:24:04PM +0300, Serge Semin wrote:
> Based on the init_unavailable_range() method and it's callee semantics no
> multi-line info messages are intended to be printed to the console. Thus
> append the '\n' symbol to the respective info string.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  mm/mm_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 3fa33e2d32ba..db8b91175834 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -827,7 +827,7 @@ static void __init init_unavailable_range(unsigned long spfn,
>  	}
>  
>  	if (pgcnt)
> -		pr_info("On node %d, zone %s: %lld pages in unavailable ranges",
> +		pr_info("On node %d, zone %s: %lld pages in unavailable ranges\n",
>  			node, zone_names[zone], pgcnt);
>  }
>  
> -- 
> 2.42.1
> 

-- 
Sincerely yours,
Mike.

