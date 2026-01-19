Return-Path: <linux-mips+bounces-12964-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6C9D3A4A0
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jan 2026 11:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DDB53071557
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jan 2026 10:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520DB357718;
	Mon, 19 Jan 2026 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xdlxh3Bq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF184357A28
	for <linux-mips@vger.kernel.org>; Mon, 19 Jan 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817677; cv=none; b=uLyYpBe5wwQrrKUdezYy9a2K3+iS7HjG7q+/23ZeTBH3Y9MwZd8ArKIso21X4eDqxmMw+3KGf1EbHYJP6ooiw59nk7njDVvYeotdYIFko+R9gI/E9h+iICBzoK0UWwCOuT8SKlArlgD4h89AlqArvACfWQNla2E7FiQyYNRBQhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817677; c=relaxed/simple;
	bh=ZJI8ArlDU/eYtlIeueTnh9Ianp8os31Z0KfUDC4OPww=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EeXFtwUDI+QWL5TmwRXcRmhc776zJFinAE8RliaoNrhRICMAropk5h17TYjYRgM/M0sKLI5S+aF3hZOh4XdHqo5MzbustQpPmCzqr+QLqCikr9Ap5HST2KULLZyIUSldM6JUVGkQA6sY5qq/N7HjNMGuOW5xNIQzlGMML7ZFPzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xdlxh3Bq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5ED564E420D8;
	Mon, 19 Jan 2026 10:14:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E46360731;
	Mon, 19 Jan 2026 10:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D74E710B68B1A;
	Mon, 19 Jan 2026 11:14:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768817672; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3UnNuPM8PDG65A1Frgdc8p6dUPTQ3lp3mLNODMiICsM=;
	b=Xdlxh3Bq1h6GBvIX4n3Yvs4iHC8lkrqMSQYK2u5RMaS9I01E2so4RVNOdDkpgC0hMHPQNO
	WNFTEfPDseO6NMZy9q6azN9mgPz4et6catVfbwlv/OIDSlRoaovIAI1GK7Erl7xd8fZApV
	36Niu9wgWYTqYiF2LXUdY/L2ZqnXgA8pvdFV6i8K9ATpAajmQuSEX7h9TyuiinGXAITPqZ
	5Z8WIX7OuSfYyiIzPTEFXiARIaI8CxX69/mVuweoWCZxSb5vb0cnn3/RxuJMXannXEHv3l
	Ta/W5yvh2szqE5cfn94DH7LGjI26av2zc2hmagfFPBHLUY0SlpffMeHkqzmsOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Manivannan Sadhasivam <mani@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] mtd: rawnand: brcm: Simplify with scoped for each
 OF child loop
Message-Id: <176881766762.2432692.2670018963471103183.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:14:27 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 02 Jan 2026 13:49:28 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied to nand/next, thanks!

[1/7] mtd: rawnand: brcm: Simplify with scoped for each OF child loop
      commit: f3701ba18069d2108d134271a5ad6d0a69d9ca36
[2/7] mtd: rawnand: denali: Simplify with scoped for each OF child loop
      commit: 758916e2201f4a318b8d29f28c487474b432cde0
[3/7] mtd: rawnand: ingenic: Simplify with scoped for each OF child loop
      commit: c522c198aa7af17d487179e271fbd57351bcb795
[4/7] mtd: rawnand: qcom: Simplify with scoped for each OF child loop
      commit: 42983837ef2bba8a3fb984055eac814bccab8a1e
[5/7] mtd: rawnand: vf610: Fix Wvoid-pointer-to-enum-cast warning
      commit: 3b9605987e602adc5d0f4b0d08ebb32ac13279e3
[6/7] mtd: rawnand: vf610: Simplify with scoped for each OF child loop
      commit: 8f51b6be269746d9a6abff4a5abc8b7aa680c659
[7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child loop
      commit: aa8cb72c2018c72b9c2fe5a8e55d530db3bc757e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


