Return-Path: <linux-mips+bounces-12810-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D954BD0BBC7
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 18:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30BF53027E46
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 17:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEE036827D;
	Fri,  9 Jan 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qMb1tCHt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B733BBC6;
	Fri,  9 Jan 2026 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767980574; cv=none; b=jDC+Yw8STRQJadjTFgXZgqbcHbUM/Mmg0E41yIH7o+TCGaFpGid1fAlIOSssxPgVLKgNqh8Xttj8AqPk+gBr5csnatSb2e37a7NgIOaLEgM7xrCpia//Ge+3dwAG8bcPot6WGhtJQuNFu48uluP2WqXUVbV1Ky9Xnyt3kCMsa4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767980574; c=relaxed/simple;
	bh=ic6EDXpmUjCyEI6E+CG5YHI0W7SVuO5LA745UKnr61s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcxLg77HrSrHJgT1AUhrzQbLQOQLdzQC5M6+8vSp33F2Op2YEoCDQEFVSkXQDaI1YEBtEzZKHnhXHB8LBNFhPnSF2hBh/hMJMDI01b07L1Wk80tJFqUUnCJbB303R8J0uesMhUBsVb6yKYDpsWck6UGOxoygJemaoj0ThPJ/5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qMb1tCHt; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 647E9C1F6E5;
	Fri,  9 Jan 2026 17:42:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87C2D606C6;
	Fri,  9 Jan 2026 17:42:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55B7F103C8391;
	Fri,  9 Jan 2026 18:42:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767980568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=j3+36SqlAdoTXfnOikW9AxHAeQAxubUzzHG6ENlZxfQ=;
	b=qMb1tCHtSAjyRGDPMK+PCqOhxKW33w/uMWOsp6n0JuSnWUHzlRjTbNdd0A28tDwp/kSwPB
	zhUoS+gJ2tIzwRCnJ11NLwfZKARsx21QLXiY0t+qpBqTVUwbE7/2kblnOvQhxK9GIztLcJ
	pIykdeNgYWi0C/+InGONKwNokiF1xozNofkGzECKMOBEvuLKb+IeSlwFw2T3LIqvDTgHDG
	zd9Qrakwgy7waroN3e8UzH5aYw3Cv6pIKk0wicNEcNwvpxXKQR9fYQ3qEvarYwhZFNzPCs
	YX5FpQKmgVCfRLBMfXvr7VpBAtfsQ0NSoR4aQZKW0s6KiwgkSZ30XZRngUemLQ==
Date: Fri, 9 Jan 2026 18:42:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 08/13] rtc: pic32: update include to use pic32.h from
 platform_data
Message-ID: <202601091742469d5013f7@mail.local>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-8-99859c55783d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-mips-pic32-header-move-v1-8-99859c55783d@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3

On 09/01/2026 11:41:21-0500, Brian Masney wrote:
> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> 
> ---
> To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/rtc/rtc-pic32.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
> index 52c11532bc3a3696359ca56349b42860aa90c966..3c7a38a4ac08eb0f5a44ae4e470c208a9d1dd599 100644
> --- a/drivers/rtc/rtc-pic32.c
> +++ b/drivers/rtc/rtc-pic32.c
> @@ -15,8 +15,7 @@
>  #include <linux/clk.h>
>  #include <linux/rtc.h>
>  #include <linux/bcd.h>
> -
> -#include <asm/mach-pic32/pic32.h>
> +#include <linux/platform_data/pic32.h>
>  
>  #define PIC32_RTCCON		0x00
>  #define PIC32_RTCCON_ON		BIT(15)
> 
> -- 
> 2.52.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

