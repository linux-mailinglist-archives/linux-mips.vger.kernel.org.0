Return-Path: <linux-mips+bounces-6628-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC69BA7A8
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2024 20:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 850DC28178B
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2024 19:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7A3187877;
	Sun,  3 Nov 2024 19:29:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AACF33FE;
	Sun,  3 Nov 2024 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730662155; cv=none; b=LwvV10la0qOEwA5DDMI7ACZeDI0pNxtXDidI88n2haMwKBB0FnBWIjhNvuBjWkCkpg469RNIhVN+/tnAFVHzQOUewVhJGBtQ8iA8mjmK+q4MYVccchpi50hkt4eLe3L4LKJvm08cYJJGFpWbQPpwzqtY4k/RZAObZUxHeE8uXHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730662155; c=relaxed/simple;
	bh=Nlm0TxffIpouVwZtrr7mCEB1yb3vjJXPEeMdCZjtu6o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nFoMcJIklqvF0JqkM1YWwnQJR4HCEfOOFciyfxNBNPC73vuAkKj3X/56C4Udo9p1Eq20gRhTCQQ+XztOOYZqjT5gm3/lJlBam98KOODz3yaGdczJGhFi0awv3k6qaP3SF3grKQ9UFpyTvJuirjUc+KLAxUJgexI89I4wxd+9GtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id DD37492009C; Sun,  3 Nov 2024 20:29:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D74B392009B;
	Sun,  3 Nov 2024 19:29:03 +0000 (GMT)
Date: Sun, 3 Nov 2024 19:29:03 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: proc: Use str_yes_no() helper function
In-Reply-To: <20241102220437.22480-2-thorsten.blum@linux.dev>
Message-ID: <alpine.DEB.2.21.2411031921020.9262@angie.orcam.me.uk>
References: <20241102220437.22480-2-thorsten.blum@linux.dev>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Nov 2024, Thorsten Blum wrote:

> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 8eba5a1ed664..3e4be48bab02 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -66,12 +66,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  	seq_printf(m, "BogoMIPS\t\t: %u.%02u\n",
>  		      cpu_data[n].udelay_val / (500000/HZ),
>  		      (cpu_data[n].udelay_val / (5000/HZ)) % 100);
> -	seq_printf(m, "wait instruction\t: %s\n", cpu_wait ? "yes" : "no");
> +	seq_printf(m, "wait instruction\t: %s\n", str_yes_no(cpu_wait));
>  	seq_printf(m, "microsecond timers\t: %s\n",
> -		      cpu_has_counter ? "yes" : "no");
> +		      str_yes_no(cpu_has_counter));
>  	seq_printf(m, "tlb_entries\t\t: %d\n", cpu_data[n].tlbsize);
>  	seq_printf(m, "extra interrupt vector\t: %s\n",
> -		      cpu_has_divec ? "yes" : "no");
> +		      str_yes_no(cpu_has_divec));
>  	seq_printf(m, "hardware watchpoint\t: %s",
>  		      cpu_has_watch ? "yes, " : "no\n");
>  	if (cpu_has_watch) {

 I like this cleanup, but now that it matters I suggest restructuring code 
such that the latter `seq_printf' is converted as well.

 NB I think there is no need to split the patch into two for such a minor 
change, even though technically these would be two independent updates.

  Maciej

