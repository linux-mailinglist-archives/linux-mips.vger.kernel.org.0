Return-Path: <linux-mips+bounces-12886-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E635D16BB9
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 06:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93339300A7A1
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 05:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADFC3624D8;
	Tue, 13 Jan 2026 05:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ro92BfaD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DCC3624D1;
	Tue, 13 Jan 2026 05:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768283291; cv=none; b=HsQX7hIPTh/r8QAQP0nTCZAh4Wm0glWMHy5BTiLjQzvi74L5P7rVmXORz5ZK+jNL8n3l5cl1LCqhapoFVEWHv3ZR/TIEqdBn3fdGD7DJXtFVbfm/I5czV05hzN4GfKxSmI/bFQHqCfQsP6WiLmqpOzGVNEBPXtfvbOMzZsFnaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768283291; c=relaxed/simple;
	bh=zz0pkRd2L6te/psZRBm1AB7/etjwcUmL1ixtZQ+ZJ6s=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cNYx4/tnWoWnMqjX7eQoMytwDFznkntRZ7h8ELXni35aCCMnBype9Na5U6jzm6pcWk8arr9Y0T/mFcMkmfQcrmN2OV0mbU8ag859u81BbbdJDqVmQagFNI3RNC2fAG6WniqI6FoJ/2xdjoNfbzrQAfJxFLkJxTFyEnKdMYwe1fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ro92BfaD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E11C116C6;
	Tue, 13 Jan 2026 05:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768283290;
	bh=zz0pkRd2L6te/psZRBm1AB7/etjwcUmL1ixtZQ+ZJ6s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ro92BfaD337jFdowNFOfSGZxG5Zp6AsCEK4k5YEJmqUjBF+AwG9C/cR0Sp4F0F7Cg
	 aa/uWHnd78K9PCR0z1jzJuw2NBujQWaIDKV8StrzfwdkSFsLkZh1oRIjrMGpCquvRh
	 GQpoxVsqAeye83TpLVgt30TaOWhhw5B90JsrucBVCn/bwAbQdicSGshbn2e+/eGah4
	 Y91v56FS9/YTb6qrc/1eBlwu9mxbLA7/z3T9NrB0JGadBs1OJLiRvR6r6FMJQxLUrI
	 hdlq/IydwRb2naeGtD10cqleZkioBhDJeNxQIVX3+TkWI1/SSsQLxi1NGLKgU5uV+t
	 p8vY+4LWnJd+Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260112-mips-pic32-header-move-v2-16-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com> <20260112-mips-pic32-header-move-v2-16-927d516b1ff9@redhat.com>
Subject: Re: [PATCH v2 16/16] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
To: Brian Masney <bmasney@redhat.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Mon, 12 Jan 2026 22:48:07 -0700
Message-ID: <176828328795.4027.16644210192638742005@lazor>
User-Agent: alot/0.11

Quoting Brian Masney (2026-01-12 15:48:10)
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> index 1b9e43eb54976b219a0277cc971f353fd6af226a..1e56a057319d97e20440fe4e1=
07d26fa85c95ab1 100644
> --- a/drivers/clk/microchip/Kconfig
> +++ b/drivers/clk/microchip/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
>  config COMMON_CLK_PIC32
> -       def_bool COMMON_CLK && MACH_PIC32
> +       def_bool (COMMON_CLK && MACH_PIC32) || COMPILE_TEST
> =20
>  config MCHP_CLK_MPFS
>         bool "Clk driver for PolarFire SoC"
> diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk=
-core.c
> index 891bec5fe1bedea826ff9c3bd4099c90e2528ff9..ce3a24e061d145934c8484300=
8efadc3b0e2cffa 100644
> --- a/drivers/clk/microchip/clk-core.c
> +++ b/drivers/clk/microchip/clk-core.c
> @@ -75,6 +75,7 @@
>  /* SoC specific clock needed during SPLL clock rate switch */
>  static struct clk_hw *pic32_sclk_hw;
> =20
> +#ifdef CONFIG_MATCH_PIC32

CONFIG_MACH_PIC32?

>  /* add instruction pipeline delay while CPU clock is in-transition. */
>  #define cpu_nop5()                     \
>  do {                                   \

