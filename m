Return-Path: <linux-mips+bounces-5481-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BCF9724E7
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 00:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA97C28581D
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 22:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4030A18C035;
	Mon,  9 Sep 2024 22:02:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EEE20DC4;
	Mon,  9 Sep 2024 22:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725919378; cv=none; b=q9TmwTRZVwI74HDwOWfErzZYaW3Ite1t/OwMIzfQ1UhBayoiU8oK2LVkd00qddf+5wiCKx28Q+Fpfjg8rPbmMfwhEYjiTaF8o9vg9IP08QQtEf+HH+//lRBOrSQlWdrk6WrdVg2fePxIbpanzffIyG6/Z/JAEa/S5bv2RXrfTX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725919378; c=relaxed/simple;
	bh=NL2lwh6OhJuuIMqnWWsMzVHb4/X/BStI/j9zVfXjIOE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qrwoICcAumC5MPY7ghzXy/pZ3+lvAjd/fDfNFDTDxRF7f0U4bGy7BlXDLkWTRpYev2mjljJ+p4ulXrgKrH+tqhPs+e271g+33wijToA7EQ4AtZ9FOZhK7lGMOicF8LL5Tbzyn0Nq0/indTmXJyUHKMtKOX9nR9mMnajqw6WzZX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1512392009C; Tue, 10 Sep 2024 00:02:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0F2E992009B;
	Mon,  9 Sep 2024 23:02:54 +0100 (BST)
Date: Mon, 9 Sep 2024 23:02:53 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: kprobes: Massage previous delay slot
 detection
In-Reply-To: <20240908-mips-chore-v1-2-9239c783f233@flygoat.com>
Message-ID: <alpine.DEB.2.21.2409092259110.60835@angie.orcam.me.uk>
References: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com> <20240908-mips-chore-v1-2-9239c783f233@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 8 Sep 2024, Jiaxun Yang wrote:

> Expand the if condition into cascaded ifs to make code
> readable.

 Apart from broken formatting what's making original code unreadable?

> Also use sizeof(union mips_instruction) instead of
> sizeof(mips_instruction) to match the code context.

 That has to be a separate change.

> diff --git a/arch/mips/kernel/kprobes.c b/arch/mips/kernel/kprobes.c
> index dc39f5b3fb83..96139adefad2 100644
> --- a/arch/mips/kernel/kprobes.c
> +++ b/arch/mips/kernel/kprobes.c
> @@ -89,12 +89,12 @@ int arch_prepare_kprobe(struct kprobe *p)
>  		goto out;
>  	}
>  
> -	if (copy_from_kernel_nofault(&prev_insn, p->addr - 1,
> -			sizeof(mips_instruction)) == 0 &&
> -	    insn_has_delayslot(prev_insn)) {
> -		pr_notice("Kprobes for branch delayslot are not supported\n");
> -		ret = -EINVAL;
> -		goto out;
> +	if (!copy_from_kernel_nofault(&prev_insn, p->addr - 1, sizeof(union mips_instruction))) {

 Overlong line.

> +		if (insn_has_delayslot(prev_insn)) {
> +			pr_notice("Kprobes for branch delayslot are not supported\n");

 This now overruns 80 columns making code *less* readable.

  Maciej

