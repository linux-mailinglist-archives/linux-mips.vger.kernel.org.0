Return-Path: <linux-mips+bounces-13049-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hvbGBqtRfGmwLwIAu9opvQ
	(envelope-from <linux-mips+bounces-13049-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 07:37:31 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F3B7A5E
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 07:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C70F300EFB6
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 06:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769FB314B66;
	Fri, 30 Jan 2026 06:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEWlIz8/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CB8303CA0
	for <linux-mips@vger.kernel.org>; Fri, 30 Jan 2026 06:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769755048; cv=none; b=rK3VfwFIFSyS30pBLPH0aQL+UPs7GzjoBMfPQjk9+zTgqwbYwAg1J6C2s6ehBqJtuLnTUyXXLWlOx5qo05vDJONoOcl/g1c4TXCzq1uc1GWbafCD3lQlvdenDviHixuWbO9i1Dugbf2Hf5xrFuRvPzLhVRwvCVN4weoRA/qp/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769755048; c=relaxed/simple;
	bh=95v7NV8y8jvkm5MvFyZ3sn6LRDvHRfQIIUv1qPreNHc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=negVy+wwZLGXZ/48sHIHYZRERAYJaFv/2W5UQqxA2f/OEcxRX7qs4GMcqap+qkB2AVhdZB5upYOZeWjV80Cc3evIBjlDixymfXIlzkK1gxXEqaMkyxLbayASrUDA6nop4He9ymSIqxqgijggJQp7cUNPGjvInvKlFQz1Zx9QNq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEWlIz8/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so22842625e9.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Jan 2026 22:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769755045; x=1770359845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iaIL6hcZTlvS2jyO/4/sgFg+iA2PNPmH4knID0fBdVs=;
        b=CEWlIz8/Ey8JQ76cky6LMxI2C+nzQavRmqmYHrq30lmWQcVJP+LvIv/A1Vslie0Yny
         Ton3JKnUPImiUuMhoV0EPZ1ErfybmYB94YvV5OOZewvpZwBfNk+w4mLAOZpqM1vhV2GW
         CRBGt92dAW6St1lFYEDYibAU3f3azFDxGTZxswiqf7kl/OTmKPHoLDWMQArl6FwHiZLC
         v2MIqWkb+qPPhhTcs43Kxu6jda6lFhrf9DS3gtE1YBEmluzQ5KJkRQI5kmGOv28vgzjh
         BfECj+5ceHA5UqDsDDCE9zG4nQOCDjns/s2fdik5y8fnBiS0kjRcNOd6PqrfrdMseTRP
         ilaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769755045; x=1770359845;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaIL6hcZTlvS2jyO/4/sgFg+iA2PNPmH4knID0fBdVs=;
        b=nn6pZjnzpnWWBsIujg959VmMj8/ussMVoOczw8mtobBLIrLovtbc/pbsCLlX9Cb1UD
         gCd5odqdvOuMa9ToO+B4mfoGmUdya/lLgzj8EN3+3S5q1fK7I46tkNj5cD1uz4KMLuDb
         y4M0fPl/7NFNsxNBSk3LBQZQ/y0dVZIbGAql/cKuy+sOaZJYUXyKbdGyMCUL1KqKdcoH
         eLt3ALVzL0m20G+HVZkIauW5txY6gBEq8wn+Uh+59AxDdlv1MivLOq1C+K27dy9nyglM
         kv6IwoZU6GQapWiXJ5cCkVf+BhTqTW+tJU3ssNntegJscxWWuru0JmLml6TyhLtDLf0a
         S2wA==
X-Forwarded-Encrypted: i=1; AJvYcCWJYS9BKzms7klV5Wye69qz20SKIs8olH4itpWEtYLeX5ZoTv4tKn7M97ZD6FtD9fNYyXRCnghQRAYW@vger.kernel.org
X-Gm-Message-State: AOJu0YyJUezBnOV2QqlK17+fEObIv/qtbRUw1Wo7A2svJZaT6YEWW2pc
	5/jwiCwT8Zs7PTXkjyOaSUWboeiNAmYY46YoFIB8PqTX5pmARYQQn+ow
X-Gm-Gg: AZuq6aIYZm7u5Ac8x7bOwCK9h2wVGh6Py8Bb9GOaD4xtC1wgP9CqF0JxcDECrszNxyY
	DHPECabIpEY1gGD8BebGajzA/wiIhC9sy2hTBYmEytHRQ1eHDnnutaVombBaSb3OfogzfxPljg4
	IBXskRYeWuftsjXweHCJFzgFsmgTo7JCc/QbYG/yLxUJySRui3Q9u9iDhI/VtxOjwTuTrXNTYof
	LmhI2VNA3K2vAFFLY9TFQjDbgtigv8xGwM5kvq3+wjjNb8aJyLF/JptpOXg/lCmdRp/sQ0O76ud
	9nymJ84qMl/7WIEhZICUBQX21rLJW5WuPa9K18jC141u/IfiXJ1BZhLE+zlcdmYqia0zlZW3Ioa
	AZkBhjh9dMZzOPdakcH0D0waKucsP9DzSPMGQlwJUc44OUghaI3ZdOOzBKh7FST0sjkH8rjvTXV
	whyKLq7BvqqB+C3YqMlGFOPcRmjGn6GNraCiBkznQyg5lFwXtBsokuwMDg5XiUF0vvnfUT27mzU
	AtpQS/fZAyUunVZfsLyGx00WyrhduWM145JLBnCtyE/xZe9ysXjiA==
X-Received: by 2002:a05:600c:3e10:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-482db4922d1mr20017285e9.17.1769755045218;
        Thu, 29 Jan 2026 22:37:25 -0800 (PST)
Received: from ?IPV6:2003:ea:8f34:1500:a5ab:a2a5:28b0:fbf7? (p200300ea8f341500a5aba2a528b0fbf7.dip0.t-ipconnect.de. [2003:ea:8f34:1500:a5ab:a2a5:28b0:fbf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2543dcdsm5069745e9.9.2026.01.29.22.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 22:37:24 -0800 (PST)
Message-ID: <63ecf47d-6702-49d0-b063-f2f2510ef45b@gmail.com>
Date: Fri, 30 Jan 2026 07:37:23 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: lantiq_etop: remove driver
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 Daniel Golle <daniel@makrotopia.org>
References: <7b2b53b6-d230-47bb-98d9-b7acfbfdd8ca@gmail.com>
Content-Language: en-US
In-Reply-To: <7b2b53b6-d230-47bb-98d9-b7acfbfdd8ca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-13049-lists,linux-mips=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hkallweit1@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 669F3B7A5E
X-Rspamd-Action: no action

On 1/29/2026 6:18 PM, Heiner Kallweit wrote:
> This driver in mainline lost its in-tree user with commit cd93b4895ea5
> ("MIPS: lantiq: drop mips_machine support") in 2012. Since then it has
> had no in-tree user. Only user seems to be OpenWRT, with several changes
> to the in-tree driver version:
> target/linux/lantiq/patches-6.12/035-owrt-lantiq-wifi-and-ethernet-eeprom-handling.patch
> target/linux/lantiq/patches-6.12/028-NET-lantiq-various-etop-fixes.patch
> target/linux/lantiq/patches-6.12/701-NET-lantiq-etop-of-mido.patch
> So it seems the driver is maintained in OpenWrt only, except tree-wide
> in-tree changes. According to OpenWRT maintainers it would be ok to
> remove the driver in mainline and keep it downstream only (see linked
> conversation).
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Link: https://lore.kernel.org/netdev/d80fef86-ba14-4bd4-bce5-4d61a75d591b@hauke-m.de/T/#t
> ---
>  .../include/asm/mach-lantiq/lantiq_platform.h |  18 -
>  drivers/net/ethernet/Kconfig                  |   6 -
>  drivers/net/ethernet/Makefile                 |   1 -
>  drivers/net/ethernet/lantiq_etop.c            | 745 ------------------
>  4 files changed, 770 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-lantiq/lantiq_platform.h
>  delete mode 100644 drivers/net/ethernet/lantiq_etop.c
> 
> diff --git a/arch/mips/include/asm/mach-lantiq/lantiq_platform.h b/arch/mips/include/asm/mach-lantiq/lantiq_platform.h
> deleted file mode 100644
> index 70ebb4d6f05..00000000000
> --- a/arch/mips/include/asm/mach-lantiq/lantiq_platform.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - *
> - *  Copyright (C) 2010 John Crispin <john@phrozen.org>
> - */
> -
> -#ifndef _LANTIQ_PLATFORM_H__
> -#define _LANTIQ_PLATFORM_H__
> -
> -#include <linux/socket.h>
> -
> -/* struct used to pass info to network drivers */
> -struct ltq_eth_data {
> -	struct sockaddr mac;
> -	int mii_mode;
> -};
> -
> -#endif
> diff --git a/drivers/net/ethernet/Kconfig b/drivers/net/ethernet/Kconfig
> index aa7103e7f47..9775fd401b0 100644
> --- a/drivers/net/ethernet/Kconfig
> +++ b/drivers/net/ethernet/Kconfig
> @@ -93,12 +93,6 @@ config KORINA
>  	  If you have a Mikrotik RouterBoard 500 or IDT RC32434
>  	  based system say Y. Otherwise say N.
>  
> -config LANTIQ_ETOP
> -	tristate "Lantiq SoC ETOP driver"
> -	depends on SOC_TYPE_XWAY
> -	help
> -	  Support for the MII0 inside the Lantiq SoC
> -
AI review complained that setting this config symbol should be
removed from arch/mips/configs/xway_defconfig. So I'll submit a v2.

--
pw-bot: cr

