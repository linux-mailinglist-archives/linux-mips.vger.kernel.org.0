Return-Path: <linux-mips+bounces-12594-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D322CDCDCC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 17:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 197B530072B0
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 16:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AB231A81F;
	Wed, 24 Dec 2025 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="D+OgRvDO"
X-Original-To: linux-mips@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3F132863C;
	Wed, 24 Dec 2025 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766593799; cv=none; b=ez4P+QgfUiCsfXweZcOcT2GZLbrGZBwem4Mzj8D/n+fMsE9EiHPms9pSQxS2b3xg562vwL2MsGWkr/Blx14x1edlU4DfgPGaJNySJokUciCf1wXoaCxZ/CkECYuTM/dhx3c66B8N/RxU1wvNMD4n34cbrCZ5FzIxR6MvKJej98M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766593799; c=relaxed/simple;
	bh=xnT+EvR0s5oIZp/3XXt4XA68h5snb9BsA7e9vL/N/vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oRVwG3ZO08jS3lhaoV+DqhSYL9Y4GMq9xObZ4ErotgEOZo1btY4eCrr9sJm1yx8Bd4kTcIwZhdN3JcMKf4DTyeWSWDA5Sg1wKPhzMALcHw7cgewYleAWOO5/ckPGq86X0a4A3cm67ro1cc9rlevmBalQBlpSGKDRtjlhGr45jZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=D+OgRvDO; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766593796; x=1798129796;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=xnT+EvR0s5oIZp/3XXt4XA68h5snb9BsA7e9vL/N/vM=;
  b=D+OgRvDOSFxUZW3xGPuf0uqDQGlYJAs6OQjkwPNspoIsEddO3K0zN9jh
   yMQY4jZ4VMYsbYNdsqv5SyM1Swg3Vqqwsed3/87K8X8EU817d3fytOc/0
   ecFVoI7VuXSw6U5GJtnh8od/ly6z6s0CY8jB/kHzbOacpDKn/vRdBKWWV
   47p6mHEDrr0UXZxzknomMojFozSP7eYxCWgkpAYWUVy9NrfEgJRPvMfHB
   TOu+fjCXVy7GX3CY4JcTRj/k4wewOgzQiOup7mrqt0fCP4bn85PXSRRHE
   h77KuMLBs80ALOlfe7YHy3SBVG+UnUX88nRhNnPEe0eEBW36Z0gICGFo8
   A==;
X-CSE-ConnectionGUID: 1mpAtqqvTWKDWP3ouM+OuA==
X-CSE-MsgGUID: bJulCPQ/SGmZ0iD/Mn03NA==
X-IronPort-AV: E=Sophos;i="6.21,174,1763449200"; 
   d="scan'208";a="51495333"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Dec 2025 09:29:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 24 Dec 2025 09:29:25 -0700
Received: from [10.171.248.28] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 24 Dec 2025 09:29:20 -0700
Message-ID: <9faff0a3-0f3d-4e51-ab5b-0cf0204ee4fd@microchip.com>
Date: Wed, 24 Dec 2025 17:29:19 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mmc: atmel-mci: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Aubin Constans
	<aubin.constans@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Robert Richter <rric@kernel.org>, Paul Cercueil
	<paul@crapouillou.net>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Adrian
 Hunter" <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, <linux-mmc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <llvm@lists.linux.dev>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2025 at 13:44, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Krzysztof, best regards,
   Nicolas

> ---
>   drivers/mmc/host/atmel-mci.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index fdf6926ea468..3b4928f5b9b2 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -629,14 +629,13 @@ static int atmci_of_init(struct atmel_mci *host)
>   {
>          struct device *dev = host->dev;
>          struct device_node *np = dev->of_node;
> -       struct device_node *cnp;
>          u32 slot_id;
>          int err;
> 
>          if (!np)
>                  return dev_err_probe(dev, -EINVAL, "device node not found\n");
> 
> -       for_each_child_of_node(np, cnp) {
> +       for_each_child_of_node_scoped(np, cnp) {
>                  if (of_property_read_u32(cnp, "reg", &slot_id)) {
>                          dev_warn(dev, "reg property is missing for %pOF\n", cnp);
>                          continue;
> @@ -645,7 +644,6 @@ static int atmci_of_init(struct atmel_mci *host)
>                  if (slot_id >= ATMCI_MAX_NR_SLOTS) {
>                          dev_warn(dev, "can't have more than %d slots\n",
>                                   ATMCI_MAX_NR_SLOTS);
> -                       of_node_put(cnp);
>                          break;
>                  }
> 
> @@ -658,10 +656,8 @@ static int atmci_of_init(struct atmel_mci *host)
>                                                "cd", GPIOD_IN, "cd-gpios");
>                  err = PTR_ERR_OR_ZERO(host->pdata[slot_id].detect_pin);
>                  if (err) {
> -                       if (err != -ENOENT) {
> -                               of_node_put(cnp);
> +                       if (err != -ENOENT)
>                                  return err;
> -                       }
>                          host->pdata[slot_id].detect_pin = NULL;
>                  }
> 
> @@ -673,10 +669,8 @@ static int atmci_of_init(struct atmel_mci *host)
>                                                "wp", GPIOD_IN, "wp-gpios");
>                  err = PTR_ERR_OR_ZERO(host->pdata[slot_id].wp_pin);
>                  if (err) {
> -                       if (err != -ENOENT) {
> -                               of_node_put(cnp);
> +                       if (err != -ENOENT)
>                                  return err;
> -                       }
>                          host->pdata[slot_id].wp_pin = NULL;
>                  }
>          }
> --
> 2.51.0
> 


