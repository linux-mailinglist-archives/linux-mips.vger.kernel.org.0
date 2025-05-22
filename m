Return-Path: <linux-mips+bounces-9065-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 450CAAC056B
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 09:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 718EF1BA82B6
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 07:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87ED92222AF;
	Thu, 22 May 2025 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="b31vgQ+3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238F61D7999;
	Thu, 22 May 2025 07:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898146; cv=none; b=GbUg3jOCgufCb9hP6ye/RHg9lSw+oDuiJVIdWPtxkwudIKrfgDU9Or2KLQyA/BMan2HPT/SQgrSSMRWRxl2FBTkTBIPXbBRemrzyjqygVpA2yhnO68NzarB2ucn4tfvLngDzHbYcWE/+Wi/ondFI3azCDEtSv2vKbhjqcek6KOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898146; c=relaxed/simple;
	bh=d0fndLdx/ZzKCl6WajMJS8z0G6j+Uy6UPvyNnCznuUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+Chsi71pv8LAlxlOIptLdvGzcG+nbFhCcnBPUgIxvxw+Yc7t9zWH1DEQjocAEcr85GAbwMxBn9YM5W72xsuJkYDfSATkJG2VXd620VqZRfHSRNhHmV7zV7aZhhp7bb7xBRVxApWA6pBCQ48M+Ucsv/147J4OXSfmUB5KC91hio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=b31vgQ+3; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747898140; x=1748502940; i=deller@gmx.de;
	bh=E6tqLN8PiFPAxwEdl8rGSxdMoJwbt5o6GzbLGsGHumA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=b31vgQ+3NQLbEZ5R5MWqfqfy7hGYwskqTiSZU7HSx8UGPxoGgt9bL1HT4EKBgYfB
	 quZ1McZUuQaPdOza5WQsdy249WH4wMsPTCWj7EGJDD2UITiYcnKaUur8bntgvCoz0
	 +S8cBd9PPonBl7T3XDv2drNGcyLDjI3kLJR74devJzYfJNytIRseU+MNsTJzHBleM
	 SaxM/j5JRt6mJiCvY1ExE+AYYDn5ljCU7lTFzYVUJ+6TakeWRMB5hPiMujxHGOVp7
	 Jd5uUrW+2nWDkvChRb8D32jaJ8Bg9IYZBuQRrurmZyqqINS106rNjAzK2YOOBKdnD
	 1YEVxFQ6OnbGCKv1FQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.249]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1ueDrZ0lZR-00JvSN; Thu, 22
 May 2025 09:15:40 +0200
Message-ID: <377d444d-4163-4308-abcd-bbdf55c44be7@gmx.de>
Date: Thu, 22 May 2025 09:15:30 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] floppy: Remove unused CROSS_64K() macro from arch/
 code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andreas Larsson <andreas@gaisler.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
 Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Denis Efremov <efremov@linux.com>
References: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rRgMcf2JCnoDGJ6Tie6J4Qu2uzlzfwbeOOTAQbxVD3TSaj7TJMW
 4CruRG5IbRS1RTjyBZon9L6jFB2EtQOqLb6xyl9e66yTQeH+MUt+JrwVQYAyzhDigjzMlbx
 eql21HRqa8D6zdQaAbOQJYTTyaqxEbw8EwimC76fnIN1GlM2g3JgmYMjh1eJmBTlB0VR6t3
 7pZQvQyymrfOupghEQJ/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:feneFeM7Fro=;kzRb6i5tqIy8L7mVWRuBofRys8W
 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

On 5/21/25 19:41, Andy Shevchenko wrote:
> Since the commit 3d86739c6343 ("floppy: always use the track buffer")
> the CROSS_64K() is not used by the driver, remove the leftovers.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   arch/alpha/include/asm/floppy.h    | 19 -------------------
>   arch/arm/include/asm/floppy.h      |  2 --
>   arch/m68k/include/asm/floppy.h     |  4 ----
>   arch/mips/include/asm/floppy.h     | 15 ---------------
>   arch/parisc/include/asm/floppy.h   |  6 +-----
>   arch/powerpc/include/asm/floppy.h  |  5 -----
>   arch/sparc/include/asm/floppy_32.h |  3 ---
>   arch/sparc/include/asm/floppy_64.h |  3 ---
>   arch/x86/include/asm/floppy.h      |  5 +----
>   9 files changed, 2 insertions(+), 60 deletions(-)

Acked-by: Helge Deller <deller@gmx.de> #parisc


