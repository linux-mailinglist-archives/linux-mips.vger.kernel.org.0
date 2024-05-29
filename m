Return-Path: <linux-mips+bounces-3374-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33B8D3149
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 10:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 788D5B2BAD5
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 08:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB03D172BB1;
	Wed, 29 May 2024 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ERMZTvdf"
X-Original-To: linux-mips@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF7177998;
	Wed, 29 May 2024 08:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971052; cv=none; b=qP5BCXQh3giAUWS1T0rNa2cm4bbkSdSXdHxwPhiStE+z9yhQ4/7oK1I9HqqsVfOGQmfX00mJjl1Ib6T//jdpjb5XQr09Mo1fGgsLAROR3NxNhSQg5BchU48IuhFPIcnenxVig5X0U4+djAquLoiQV2qsrgAUYlHQuhBxnHZr9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971052; c=relaxed/simple;
	bh=T0goSHfjzYTHwb4NAbEKcB9/JQYf1677w+bj+dFoZLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOWbLfbkSbiqOBH/DB8XV7oMB1WGb5nwVtxAb4PlgNKFf6WaO7svsBkoEnikS2PpHadzPM1mgb9I/z11YjCKXosEOtgK463LYZxhAjK55BF+E8IERL5RZTkqvz0Y88IknDeaWD1KjmKpcJPzC1rTwoBti2KvNAwO5wU4IvH2Gsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ERMZTvdf; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716971049;
	bh=T0goSHfjzYTHwb4NAbEKcB9/JQYf1677w+bj+dFoZLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ERMZTvdfimF8/X3wkcB15TuUxOemNHd321eP/duA9X49MSdM90SrYu59NOtRQBhx/
	 h+5YEpmcgLp/iXxCmGynv1TQt0lswL3P6bUOqzTXjwBOQ2ZCnPpgQifCcVI48nUvFp
	 gLNZtshghS/uILvED+9tC8OlEPAKOBzpnl+eYYkRiXSF4jERAUr/8RXxl2XFxbSxpn
	 LRfUC4wzm+vsrCojZOUpVobBVP7hJK1dMRgcTplffdtdPfxokDsULMew9eUwKmObrI
	 tvzenzUjK69rQm64YqcGQDIFgDasUxecKSSzlB+qfpMo2sk4wIhzA1sYdnEu652CxY
	 6lUfmNPUK1YEA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8472B378000A;
	Wed, 29 May 2024 08:24:08 +0000 (UTC)
Message-ID: <358b6488-3f7c-4378-a811-175b6c77290f@collabora.com>
Date: Wed, 29 May 2024 10:24:07 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] pinctrl: mediatek: Convert to use func member
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
 <20240528194951.1489887-11-andy.shevchenko@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240528194951.1489887-11-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 28/05/24 21:45, Andy Shevchenko ha scritto:
> Convert drivers to use func member embedded in struct function_desc,
> because other members will be removed to avoid duplication and
> desynchronisation of the generic pin function description.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

pinctrl: mediatek: moore: Convert to use func member

Then,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



