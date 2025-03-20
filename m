Return-Path: <linux-mips+bounces-8250-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 732FBA6ABC3
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 18:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E87C9189B798
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 17:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5141E2307;
	Thu, 20 Mar 2025 17:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J9IJpfJx"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A84042A80;
	Thu, 20 Mar 2025 17:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490925; cv=none; b=mVTrhVxnKcSXy/FDSNp0oxpsfcx+f+NWPfSnVT4hmxZv/CH4aguUpi44T1sIN4VdUxvWtl/XvYNcV4CgywW9aetUpDsgfDiD7U8dkh5XMABfxLfLRIRA9v8ZcSajUJbuCMvbkcHxQ+C4JRzBbAyXyFIO8NnnYPnd8S2fWGWku6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490925; c=relaxed/simple;
	bh=hOqyTiYO4SAvCtYtejWnWK1GKbOLHYL+G0pZHLC9R1w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wke0ZzF3c8kux3xr7Sk58riTh7Mo6/Gx5wru/nl4P1fIS/bHoh6CbM5+QV3YUpFuRPJMor5+KdRIwhAN9yAWBmuIL6eCNEGbEJZpan4SQC/Px6bxKpkrFQMdifcHq+0OmH0jDPr4jE5j/z/dwARJgZfOK1KzBTwMlEUYEG+wJUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J9IJpfJx; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8861443AB;
	Thu, 20 Mar 2025 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742490914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxcpHL6JN0oeezTkg7NVy58dIuvVNMDJ2U1SuOSdwYU=;
	b=J9IJpfJxCUQy4Nmv3ICqgxXGSZ6zv41jNmXAdsbdKwqXzLaMoy2ew7RCtXu5kef/Qj3UaF
	2+zElCQGrOuVLtFPPGpzcf0ORi6zbAgThOr3jt8MSGqTewV8LkyAcFrOub33cnTGhHm4ar
	+Yjt05/rZBHpbLjzJ0yMU4mJPyS1sVB0JlyPwtCLy0Rek9OG/1w4yvPoe0lqnNZN7Hy4ZH
	iDkGER6Agr4nUeyy4ujo3PCO0lt28Nff7uJGFke26TRdk+V2mG5xX4NQNx6whIo35RVIvA
	mOBc/Tkse0yiIsQ/+2DTBIftNn2i5pBmRhc9cRmwADMAw5PcFX20fwBKo1+lIA==
Date: Thu, 20 Mar 2025 18:15:08 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
 Antoine Tenart <atenart@kernel.org>, Sven Peter <sven@svenpeter.dev>, Janne
 Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij
 <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Nishanth Menon
 <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 06/57] irqdomain: irqchip: Switch to
 of_fwnode_handle()
Message-ID: <20250320181508.132c4636@bootlin.com>
In-Reply-To: <20250319092951.37667-7-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
	<20250319092951.37667-7-jirislaby@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefledprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrthgvnhgrrhhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhioh
X-GND-Sasl: herve.codina@bootlin.com

Hi Jiri,

On Wed, 19 Mar 2025 10:28:59 +0100
"Jiri Slaby (SUSE)" <jirislaby@kernel.org> wrote:

> of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
> defined of_fwnode_handle(). The former is in the process of being
> removed, so use the latter instead.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Herve Codina <herve.codina@bootlin.com> # irq-lan966x-oic

Best regards,
Hervé

