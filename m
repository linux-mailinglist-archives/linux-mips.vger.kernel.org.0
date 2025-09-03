Return-Path: <linux-mips+bounces-10978-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 419AAB411B7
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 03:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B1E2545FC3
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 01:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4638A1C862C;
	Wed,  3 Sep 2025 01:14:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA1D198A11;
	Wed,  3 Sep 2025 01:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756862067; cv=none; b=Q3N0bPZICfUhKHKc4lfFUvlvvtOBHDO7FtkeD4Y5GP5H8e9HsTwDomx9cYdt0Nfk15w7tmKwRuLWRuf2myXPR/TOJNXiwXIx2Gq6xdxo3KnMjJVZSvW6bYhCFFF2HZFAGULuuWOVtUKMNuCdLZeO3Yk1+TFt1ZaIIA/WFiRSu+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756862067; c=relaxed/simple;
	bh=YGy6FHj+0W6QmOiNNAP8isBYrAnLigXI05LyPGv38VI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eLHXzYxqdtjuAdoBs1cyIe6LvMmCs9PwxxLx9o5Uh7rQHyMKimDfrWvVWxdmjZIG5GuOJ0aL7zXut4recbjyAlfZ3I828ri8S1CucQc9yma44WWIuuG910LZ+B1HYB1seFZWKBX31m9bfuYiGhvrQi9fBud69LZ2XQHs7Y4nn2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 346F092009C; Wed,  3 Sep 2025 03:08:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 3201C92009B;
	Wed,  3 Sep 2025 02:08:37 +0100 (BST)
Date: Wed, 3 Sep 2025 02:08:37 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mips: math-emu: replace deprecated strcpy() in
 me-debugfs
In-Reply-To: <20250902132314.49374-1-osama.abdelkader@gmail.com>
Message-ID: <alpine.DEB.2.21.2509030204040.16010@angie.orcam.me.uk>
References: <20250902132314.49374-1-osama.abdelkader@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Sep 2025, Osama Abdelkader wrote:

> diff --git a/arch/mips/math-emu/me-debugfs.c b/arch/mips/math-emu/me-debugfs.c
> index d5ad76b2bb67..49bf2b827ce2 100644
> --- a/arch/mips/math-emu/me-debugfs.c
> +++ b/arch/mips/math-emu/me-debugfs.c
> @@ -37,11 +37,11 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_fpuemu_stat, fpuemu_stat_get, NULL, "%llu\n");
>   * used in debugfs item names to be clearly associated to corresponding
>   * MIPS FPU instructions.
>   */
> -static void adjust_instruction_counter_name(char *out_name, char *in_name)
> +static void adjust_instruction_counter_name(char *out_name, size_t len, char *in_name)
>  {
>  	int i = 0;
>  
> -	strcpy(out_name, in_name);
> +	strscpy(out_name, in_name, len);

 It'd make sense to keep the order of the incoming parameters the same as 
the arguments here so as to avoid the need for register shuffling.

  Maciej

