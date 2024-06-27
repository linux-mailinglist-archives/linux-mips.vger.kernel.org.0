Return-Path: <linux-mips+bounces-3988-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC591A4F2
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 13:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00FFD1F21486
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 11:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D3F148833;
	Thu, 27 Jun 2024 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6H3p7IJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3535D13C9CA;
	Thu, 27 Jun 2024 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487166; cv=none; b=aWx4GGDvx24aBXlIem/xtCoy12oM8Dl20S/VXYt6T41wPRheJ+Is5DZRxqLHMhWtomBtvaKxub+cLykRZatEFTzobyie/NcNx25ICOrWSIcuk56hNSh2RSWYnPK1yRDULAtWYTXaNzghm3/Rm2AAsD7YBIwd1dh9hgoDEqSs6vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487166; c=relaxed/simple;
	bh=H+6JGVxtpgGD00UkpFNftvQvgc/mwsJG9lc8OkK8T88=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAaOwzIN7dZQWWX3HX0X7YN/1QEcYHLjD4c3XWhzgsz7eIqDXkA0S/98vwPDDAizMaLRrIx0+b2GyjmuLVriV4MXMGBDiu1WZ80C6LRIqmnlGNR+oRfdsQ0fKh3cDsbVVlqHQXdYvsvTX/TPcwXhG1+powPcTxYYc+W6s2aWflo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6H3p7IJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8870FC2BBFC;
	Thu, 27 Jun 2024 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719487166;
	bh=H+6JGVxtpgGD00UkpFNftvQvgc/mwsJG9lc8OkK8T88=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i6H3p7IJlZcQod0Na/20Vzrjp8tnU3M6Vk+Ye+BZp4lTcSEtn1RpHj+LoWTDPcYte
	 t/qNOxum1leyWn5zoDiOwk8+Bkqilvy6dDSIUF+09Yz0rsU2lPkeGLRO0GGobHiPd5
	 NgzkRtQX43kP7WoxQf8WUAQjmBXU40sFHcHzYsacihsHp/UTjOAjp8Xh8SF97DIwjT
	 KmDKdUMWaBeGSC9aD5ur3Mg2DZB08UQGSvbWghKVaHmoLHRK0MPfsbq/Spq0pnpYSU
	 lx34oKb3oKvP2xGdhn1Ar7KxZQQvW/aSHOFU94a9wm/dNdq77nNnPpFEgcWhnNvdlQ
	 teXRgGTB+OOZw==
Date: Thu, 27 Jun 2024 13:19:19 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 paulburton@kernel.org, peterz@infradead.org, mail@birger-koblitz.de,
 bert@biot.com, john@phrozen.org, sander@svanheule.net,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, ericwouds@gmail.com
Subject: Re: [PATCH v3 8/9] mips: generic: add fdt fixup for Realtek
 reference board
Message-ID: <20240627131919.09b31c03@dellmb>
In-Reply-To: <20240627043317.3751996-9-chris.packham@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
	<20240627043317.3751996-9-chris.packham@alliedtelesis.co.nz>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Jun 2024 16:33:16 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> +static __init int realtek_add_initrd(void *fdt)
> +{
> +	int node, err;
> +	u32 start, size;
> +
> +	node = fdt_path_offset(fdt, "/chosen");
> +	if (node < 0) {
> +		pr_err("/chosen node not found\n");

linux/printk.h

> +static const struct of_device_id realtek_of_match[] __initconst = {
> +	{
> +		.compatible = "realtek,rtl9302",
> +	},

One line instead of three?

Marek

