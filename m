Return-Path: <linux-mips+bounces-8228-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F3A689C0
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 11:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77AB319C3466
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 10:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C016253B45;
	Wed, 19 Mar 2025 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="5aReOAGq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7632512F5;
	Wed, 19 Mar 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742380549; cv=none; b=o+BjsiZdDuVnDNxVDqW3QLmXvRWNWZvkx2Sl8UIldLA4Fqm8oafzJplne4TDPtzICtqEPBb/9Jx3FYjm1BPUSSKKlkAibbZkbanvw0NLZOkfsB6G9Mh0prvDDaWNyl0GTgYec3TtIaiFBK45Z552ZLeg0kyGPf850qrrdj+hNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742380549; c=relaxed/simple;
	bh=RqFuZz63Z0ImK/Xp33t4bPUN4JwD2jEIzeGx3AgsiHM=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IUs9qIhKAPfoIdtM5NiA8tTRlvslr4Gr1B9I2o9j/hjcVmNavAAzfcyjbYk3TcC0lZ/khxg7AYadZ73i99wN4KMU/G9G/Mlfw+5xlkyniYK2UfMQ5cCKMXUQGuNtcbEBi58wKN0sM71jIqT08KhVNxwTLR5gc14FCLWPCOQfFS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=5aReOAGq; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J9SO6l032495;
	Wed, 19 Mar 2025 11:34:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	RqFuZz63Z0ImK/Xp33t4bPUN4JwD2jEIzeGx3AgsiHM=; b=5aReOAGqEuu0So7V
	SAQzjUOWvtgN07YbhV4I9rLlny5ac/TtdSBkjJViXoWFM4Xvm2910RucXUqBWhZk
	y0VyK6eV0mf04Z1NXvxLMPKvAxcs7O1yhwPZqZvMq8x92ZH9VVDo+AgEHqcXrFb1
	uVGlqleuj4OETGz5lP4qt76Cr/iVvd+aHseLrDiVmRTfyTL7ZVdiTlpo8p5Xiefr
	VGloWHc74hbhblyU2dvkdyUE9t2sCMj52XHIANWQxWs7x0R1b00yx8M071qlacwU
	EtsLIM7e/npVQvCgpG5vjz7sh7KcAPj/1jPwx8OQKjBu49e7Zxfal8Yhok/6Yt4e
	c3MeLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45fuaw0ccb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 11:34:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E486440048;
	Wed, 19 Mar 2025 11:31:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 068276C8A18;
	Wed, 19 Mar 2025 11:29:14 +0100 (CET)
Received: from [192.168.8.15] (10.48.86.14) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Mar
 2025 11:29:12 +0100
Message-ID: <45d5baa5a93fec388a75e91653439f7678d000ee.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/57] irqdomain: irqchip: Switch to
 of_fwnode_handle()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, <tglx@linutronix.de>
CC: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
        Herve Codina
	<herve.codina@bootlin.com>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>,
        "WANG
 Xuerui" <kernel@xen0n.name>, <linux-riscv@lists.infradead.org>,
        "Alyssa
 Rosenzweig" <alyssa@rosenzweig.io>,
        Jerome Brunet <jbrunet@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>,
        <asahi@lists.linux.dev>, <maz@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Huacai Chen
	<chenhuacai@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        "Janne
 Grunau" <j@jannau.net>, Kevin Hilman <khilman@baylibre.com>,
        "Sebastian
 Hesselbarth" <sebastian.hesselbarth@gmail.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>, Sven Peter <sven@svenpeter.dev>,
        "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
        <loongarch@lists.linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Tero Kristo <kristo@kernel.org>, Linus Walleij <linusw@kernel.org>,
        <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>,
        "Masami Hiramatsu" <mhiramat@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Anup Patel
	<anup@brainfault.org>, Imre Kaloz <kaloz@openwrt.org>,
        Antoine Tenart
	<atenart@kernel.org>
Date: Wed, 19 Mar 2025 11:29:10 +0100
In-Reply-To: <20250319092951.37667-7-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
	 <20250319092951.37667-7-jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01

On Wed, 2025-03-19 at 10:28 +0100, Jiri Slaby (SUSE) wrote:
> of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
> defined of_fwnode_handle(). The former is in the process of being
> removed, so use the latter instead.
>=20

... snip ...

> diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm=
32mp-exti.c
> index cb83d6cc6113..649b84f12efc 100644
> --- a/drivers/irqchip/irq-stm32mp-exti.c
> +++ b/drivers/irqchip/irq-stm32mp-exti.c
> @@ -531,7 +531,7 @@ static int stm32mp_exti_domain_alloc(struct irq_domai=
n *dm,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret=
urn ret;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* we only support one parent, so far */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (of_node_to_fwnode(out_irq.np) !=3D dm->parent->fwnode=
)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (of_fwnode_handle(out_irq.np) !=3D dm->parent->fwnode)
>=20

For drivers/irqchip/irq-stm32mp-exti.c
Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

