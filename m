Return-Path: <linux-mips+bounces-9099-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED43AC3353
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 11:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82DC81726D5
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71DC19E7D0;
	Sun, 25 May 2025 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CYudsmtO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wXiirkR9"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580456FC3;
	Sun, 25 May 2025 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748164223; cv=none; b=igG2JWUf7IL/wMT9gAE1CB/GGRdh8zshZX1/xRmQwwAgGRysvrGIPXCycf5dPAgdIteVyw/v7AFKOQa4SuJXkXh41pvbPqLuORxGNFsyzyM/0Obf3arGQ6KDQcOfvJdmilG8OsUbCKmxTRMvwbJGTLoxPLOoVqt7ZlCFtLrJZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748164223; c=relaxed/simple;
	bh=QRuaoCtlO2P0pS7B8Ua45WZbERtO2cz6gZIFrJ9hjuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YZ4rWEYMOC94GNM4l80en7F+mz2lgENz7SAGxj/C/dP6VV3fBkS5cskVCuRC1PTpNvwaI8PV4V7ujCs5FTLs44t47pzZLyLMmnR8KuvJEoTb6z9D44byHvrQ/PIppz3DYq1Q61PetGShtBO1BD820IKzfd/e8FAfzv4nbx1G59U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CYudsmtO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wXiirkR9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748164220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PA1nNfiCckNRb/TlfchDpOkUncHXQgZIdr5SpbxoUlc=;
	b=CYudsmtOymWdUwkrxUzPdnDdz6qQ6JVrNcbZTCyjYYAY6QldJfq+fx4g/0h9yUz94vC79+
	vJTqdNTDcJoqikApQ8cQjPyj2ydVo99DW0ISnwKDft0F/eaRkKuwCwmtgMCSk1rVj+rGZA
	NTg0H8K+xklRaTrtCm1zTjplJwTdqONVJjj4I+TgRq6PJYCAoa18/qEi5wSJ1F/gs3zSh2
	kPdCfdrp/ouD0ZMNeqz3YNuxdqPm5c2VTc1BKyqbwZlMixHZlh3Tr0HMRLj3kV0KbMKFfY
	CcL5xsz7HtqJAdniSD6YkRaEFoKxvvMyj/Ju7HtnqZCOlO6ShtClOupwdeN8Pg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748164220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PA1nNfiCckNRb/TlfchDpOkUncHXQgZIdr5SpbxoUlc=;
	b=wXiirkR9aohDq2RQj+pZ1vWwaV58Ke/WH22qZylwHr2qwWhHyruAQigWR9A0JX9+vEIBb2
	ke/eQgN3GNZWLoBQ==
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, s.gottschall@dd-wrt.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH] irqchip/mips-gic: allow forced affinity for current cpu
 during hotplug
In-Reply-To: <20250523151542.3903598-1-markus.stockhausen@gmx.de>
References: <20250523151542.3903598-1-markus.stockhausen@gmx.de>
Date: Sun, 25 May 2025 11:10:19 +0200
Message-ID: <87bjrhqcn8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 23 2025 at 11:15, Markus Stockhausen wrote:
> +
> +	if ((cpu >= NR_CPUS) && !force)
> +		/* In normal mode allow only online CPUs. */
>  		return -EINVAL;
>  
> +	if (cpu >= NR_CPUS) {
> +		/* In force mode allow current not yet online CPU for hotplug handlers. */
> +		cpu = cpumask_first(cpumask);
> +		if (cpu != get_cpu())
> +			return -EINVAL;
> +	}

This logic really makes my brain hurt. Why not doing the obvious:

	if (cpu >= NR_CPUS) {
        	/* Sensible comment */	
        	if (!force)
                	return -EINVAL;
                ...
        }

Hmm?

Thanks

        tglx

