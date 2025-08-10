Return-Path: <linux-mips+bounces-10046-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E080DB1FC1C
	for <lists+linux-mips@lfdr.de>; Sun, 10 Aug 2025 23:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B18A173D29
	for <lists+linux-mips@lfdr.de>; Sun, 10 Aug 2025 21:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F6621D5AA;
	Sun, 10 Aug 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gwjn8bTb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF17E0E8;
	Sun, 10 Aug 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754860323; cv=none; b=SZNfJBlPZ7pFbGAMR+GLsuVyJOxzc3gAed0YwoirUVr3OIhoARDBT5ywDFk+2feom//RQT1phtGsEfITj4fAwl49XacwptPCsaoDKU6UNlalMyHTkXTiSMZCMyQa0/jFi17epQRmthHvSc9Pl10uBTxCk4ogGgR47kvdLYQsprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754860323; c=relaxed/simple;
	bh=XrfQgl5l4McAsqhy747liDQB2Wk7PKkiU9eU9e0wRRM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OYdmxN84gKsklqX1Oq9/g5TA05Yf/CW5nJZG0MxU++qUmmjSqy7zUCKa5Jg+FvAbG2/v61gDByMCVVQqWn3ZZTF1Vl8SQxwwo2hAWkkjvF5xr+sJ6BYizVPdTsj/YsxKXEd0+E+JxFxrawIwvksL2slW06R0cCtjNp+Rez0Awq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gwjn8bTb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED3CC4CEEB;
	Sun, 10 Aug 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860322;
	bh=XrfQgl5l4McAsqhy747liDQB2Wk7PKkiU9eU9e0wRRM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Gwjn8bTbzGhzzolmVUPo9n7gcBleM2ZVFGDflhWOkdwNBJ0e6wotBLuXD0buvnF7g
	 aXoNaKfXoEDoNj4lZ/8pa6odo8DFWObVF3OfZG3lrpWmvwF9AJmOUqEzkaWzOeq7Yd
	 DpcJnBQo9Z4JNU1FE++ilb7nhN/t2KWXk7okkwr6WQvrfPpvZrLhMXDkZ6HQcXTy6q
	 oJdFW6I2y1cQ+XGdnxUPHqxnZ8SZfN7pdNeHUDKckOniwED43a0ZbSyUveH+xY3V9p
	 M3Gg6vutVvVco0CLG4wUKYmINApUE8HUs9Uyk6Lbw9URsrzxtpmDb+/V1rKT1fuakD
	 n8BmE1Qp9O4Dg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE7439D0C2B;
	Sun, 10 Aug 2025 21:12:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/12] irqchip: MSI cleanup and conversion to MSI parent
 domain
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175486033550.1221929.7725164280675452092.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:15 +0000
References: <cover.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, tglx@linutronix.de,
 atenart@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-mips@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Thu, 26 Jun 2025 16:48:57 +0200 you wrote:
> The initial implementation of PCI/MSI interrupt domains in the hierarchical
> interrupt domain model used a shortcut by providing a global PCI/MSI
> domain.
> 
> This works because the PCI/MSI[X] hardware is standardized and uniform, but
> it violates the basic design principle of hierarchical interrupt domains:
> Each hardware block involved in the interrupt delivery chain should have a
> separate interrupt domain.
> 
> [...]

Here is the summary with links:
  - [01/12] irqdomain: Add device pointer to irq_domain_info and msi_domain_info
    https://git.kernel.org/riscv/c/858e65af9135
  - [02/12] irqchip/bcm2712-mip: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/91650ca5efcf
  - [03/12] irqchip/riscv-imsic: Convert to msi_create_parent_irq_domain() helper
    https://git.kernel.org/riscv/c/59422904dd98
  - [04/12] irqchip/imx-mu-msi: Convert to msi_create_parent_irq_domain() helper
    https://git.kernel.org/riscv/c/c7cc7b122a4c
  - [05/12] irqchip/loongson-pch-msi.c: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/7f91d608cc43
  - [06/12] irqchip/sg2042-msi: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/7c0dbd80de03
  - [07/12] irqchip/alpine-msi: Clean up whitespace style
    https://git.kernel.org/riscv/c/6e44ac411255
  - [08/12] irqchip/alpine-msi: Convert to lock guards
    https://git.kernel.org/riscv/c/71476f915f92
  - [09/12] irqchip/alpine-msi: Convert to __free
    https://git.kernel.org/riscv/c/f7c2dd9f4c2d
  - [10/12] irqchip/alpine-msi: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/7a91ad7ebd61
  - [11/12] irqchip/armada-370-xp: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/bafb2901317f
  - [12/12] irqchip/ls-scfg-msi: Switch to use msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/94b59d5f567a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



