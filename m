Return-Path: <linux-mips+bounces-7445-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4379A11076
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 19:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1B1016667C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 18:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C89E1FC107;
	Tue, 14 Jan 2025 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="1vRBYHlI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D303E1FA8DE
	for <linux-mips@vger.kernel.org>; Tue, 14 Jan 2025 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880571; cv=none; b=YQdxtHQIXrQPkbGvgkUUvg4/io0cRMFk098JQtmkP8PlqptLOv5tzmtDV3ew2N/8tqLsGypJxtRpgAMIrI42WnVgwNHnqBRiyOa0g71TP2l6ZcuG56bIQO3yTvFAIZR9temvY/gHI7FP5J32hlZbwQ0gLe88tnwzWgNK/5WXFNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880571; c=relaxed/simple;
	bh=Ao/qbCvPFAimw5H7HrudebGMal2oKzqP4DCd7hDejYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPyp8bdRJa6bQ8stkpE1E00N22S0EnFhERT3naP1GZQCyKupviDnzHs8dO7dQh7TpSmCi4IipI7gA8QdEN14GAyoZRErvOjFruxpKWLpGCHe1z9KsXj6j5AwgUCoCw1YrtwF1wrNC0ZPRsoNqghC1bnHOV7oh+EnbPiyvH0+XFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=1vRBYHlI; arc=none smtp.client-ip=193.222.135.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 31731 invoked from network); 14 Jan 2025 19:42:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1736880166; bh=B61v/e0Xw2LpP12l67OGsE6kgXCp+YEwnnxVBpRXJPk=;
          h=Subject:To:Cc:From;
          b=1vRBYHlI2idMYe1/mcJVRMK2eN8Sg9N97rzAr7SvAVaw9ecoX3D9R/6d8v1bQcEg/
           FlChH8Porj/skFhEh7OgM0YA14vEy8Dmse3WFhJ43YMCwuss+dR2izhOnTg8+Kdrmb
           7Fizc3XyDvCZodIwSWXT0h9AEG5bkGZHIc10wd5Ue5n4PNuaQME6RirVRMcPWxaMW5
           FEo9D2yp0EvwUf2tzedY4jhCISQvBcszyDQHHVOLthCDeDlywc9kD79QwfuAKYrq+k
           WpouAkATAKHCgMw2FSAl31zHlrrvrVPa39dpWOQ5IgXLkMltfUOhBI0P9LXMs+1AoX
           dcu6z0pLUYpyQ==
Received: from apn-78-30-73-117.dynamic.gprs.plus.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[78.30.73.117])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jiaxun.yang@flygoat.com>; 14 Jan 2025 19:42:45 +0100
Message-ID: <6946ae6b-814c-4916-9428-e823c83aed3d@o2.pl>
Date: Tue, 14 Jan 2025 19:42:42 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
Content-Language: en-GB, pl
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 5976697cab9f0e7e5aa619c2cfc0033e
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [wSNE]                               

W dniu 14.01.2025 o 19:11, Jiaxun Yang pisze:
> pci-legacy systems are not using logic_pio to managed PIO
> allocations, thus the generic pci_address_to_pio won't work
> when PCI_IOBASE is defined.
>
> Override the function to use architecture implementation to
> fix the problem.
>
> Cc: stable@vger.kernel.org
> Fixes: 4bfb53e7d317 ("mips: add <asm-generic/io.h> including")
> Reported-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Closes: https://lore.kernel.org/r/99f75c66-4c2d-45dc-a808-b5ba440c7551@app.fastmail.com/
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> This is a quick fix for fixes tree and stable backporting.
> In long term, we should get logic_pio accept fixed mapping,
> and make PCI core code aware of platforms not using vmap
> for PCI_IOBASE.
> ---
>   arch/mips/pci/pci-legacy.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
> index ec2567f8efd83bff7b106cbbd9ec7a6de0308c4c..66898fd182dc1fec1d1e9ae4c908873d59777182 100644
> --- a/arch/mips/pci/pci-legacy.c
> +++ b/arch/mips/pci/pci-legacy.c
> @@ -29,6 +29,14 @@ static LIST_HEAD(controllers);
>   
>   static int pci_initialized;
>   
> +unsigned long pci_address_to_pio(phys_addr_t address)
> +{
> +	if (address > IO_SPACE_LIMIT)
> +		return (unsigned long)-1;
> +
> +	return (unsigned long) address;
> +}
> +

Hello,

Thank you for this patch, I'm testing it right now.

Shouldn't this be #ifndef-ed CONFIG_MACH_LOONGSON64 and perhaps 
CONFIG_RALINK?

Loongson64 explicitly calls logic_pio_register_range(), so seems not to 
need this. Ralink also
defined PCI_IOBASE a long time ago.

Greetings,

Mateusz


