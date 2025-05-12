Return-Path: <linux-mips+bounces-8987-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381EAB3A9C
	for <lists+linux-mips@lfdr.de>; Mon, 12 May 2025 16:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E46017A5383
	for <lists+linux-mips@lfdr.de>; Mon, 12 May 2025 14:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64AD21767D;
	Mon, 12 May 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YI3VWCo7"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2391DDC1D;
	Mon, 12 May 2025 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060150; cv=none; b=DGu9ECVIYJGslZtYU6v6+hp/Z3WdElfnO91DQstJTvPnTZMf51ss68bQoCxQ1CVwBfjsh6Ep1OE4DV/NoKB/J9XTWJFKyaP6NLwbbwzHvEHqHykFF0J9+DczO/q9kZlO/HZIJcPRyrIE8+ugWLM+0g6FbjxDbQPppOrcN2fphvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060150; c=relaxed/simple;
	bh=EQWcS/1Q2TOvvOEH86bpJ/ZsO96dP1E/OzBIFXJkn3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dZkvXq1NnHHQbAoCpyMmJgz8bcDGoKbwM4SyJw8FMPMrP2bdKJpc5/nsP9Qj1JkJ+RepOgN8OUZTWunsmGbZP1fdi8NnTHMYX8aekrrjTm4bEilPT1JXeyieoiAIPKL/0owBrRB7nlBPn93P3QDulPbI06O8Gwy4zhkrERVnenY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YI3VWCo7; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23FA61FD4B;
	Mon, 12 May 2025 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747060146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iBPnSaiAJcr5gZIUPTcjGQ3VrRVsTSrjfazWik3ev0=;
	b=YI3VWCo7+gQZloxiq6EKTwvO+3/EHIZaNmTOJ9q8IwMbnu+JK02AqiM4lxyIo2dtLY6CR5
	/OSwjW+tj6c9jnwLKf0DIQ6/9AMi8QW0linycY2Xu5Iti5PFaOwWMjxNKizXOEnfMvPc2i
	ha48eoBK12uHadB4bNAYsiXe3IbanqEQfxpjW6BkFHGaleHjxjrbJo4zZKkDuR45YCEC16
	ulhu259LARrYR9HD0i/175U3zoXPYayIwydD2NiPuFww3PCK8o2Mm3Db8BqAjZdWKX+x5y
	oAN8hM1OCg7Ho2SmTrTaKMf0f2zuqT1szKu1pP9alUiPXOcbYGTEo3eHBF4YiA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250508-loongson1-nand-fix-v1-1-27b26234c62c@gmail.com>
References: <20250508-loongson1-nand-fix-v1-1-27b26234c62c@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: loongson1: Fix inconsistent refcounting
 in ls1x_nand_chip_init()
Message-Id: <174706014608.62075.16091315527360829377.b4-ty@bootlin.com>
Date: Mon, 12 May 2025 16:29:06 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On Thu, 08 May 2025 11:28:42 +0800, Keguang Zhang wrote:
> As reported by Dan,
> commit d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller
> Driver"), leads to the following Smatch static checker warning:
> 
> drivers/mtd/nand/raw/loongson1-nand-controller.c:730 ls1x_nand_chip_init()
> warn: inconsistent refcounting 'chip_np->kobj.kref.refcount.refs.counter':
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: loongson1: Fix inconsistent refcounting in ls1x_nand_chip_init()
      commit: 615f8f5077fc8d399818bda2a18bcc89debeb7a8

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


