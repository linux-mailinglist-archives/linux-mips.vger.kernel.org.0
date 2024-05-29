Return-Path: <linux-mips+bounces-3375-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE68D313C
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 10:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 805F21C20EB3
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 08:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6C6178385;
	Wed, 29 May 2024 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TbvIX/2Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E41779BB;
	Wed, 29 May 2024 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971054; cv=none; b=QOoJnhpxuKPLd5qpZxjzy5vvj1VZCxz5sBoLuhfHWezC8NXkIHcR1y40xHAMBfys+63OKD7ERpoyPdJu9YoMiwQ/6hJUMwvnQmagszIlFs1y4Af0w2YJ0KsM6mubyw5rK4bHSykOL8t4P0vnfZ6i1jRATWJrrUPtIB/cIjTebc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971054; c=relaxed/simple;
	bh=dMgf18OgYORvs3EofUsQ2AJDwY1b9mO7EdNTn7eb62Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdHvAlC9SNHbdnZSyM9CmW+sVFEqC+B73a/kLXzCMj/ZuyoddC0EqGwtalN9qXx4V0eYR0zjLo1WD0+3mzEJvzojhuoZoirru3V6I8jPA5aBm6s0G9s34ZucSxrwqH1o6kStBSYD5ySRYeshf/6RT33TvI09Qz4Clr3oYHcokqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TbvIX/2Q; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716971051;
	bh=dMgf18OgYORvs3EofUsQ2AJDwY1b9mO7EdNTn7eb62Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TbvIX/2QMAVx9qpdB03VWNWhi+dyLQFE2rNdKE/0k25xRW35xRolMACdAu2PfhfXG
	 K5n8NkV/w4PKQXDC4l2rIqxCU3+Ud8PciDD5C1QriMxJaiAew4HzAlRs/T/kSrDTz9
	 yqGudgsDd3jeUvC4505hVU+eMCYXkkPGGDK+9Fg+QoS2XzJiSGfbqaPS3nmBZ/WaEC
	 S1S9KcgyFDTZygL8aA0eaHXr42IDKvEi1kJ+MVegZMlkFa0vlc1626Ns2SeS8Q6wNb
	 RrRhZZZrv9i4spdDVcZYIC6Ejkgkf+cDKL6ypalCIjzLk4qorGMIbkRm/wwZFBjX7z
	 qQnQ3Ph5rbaSw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F681378215E;
	Wed, 29 May 2024 08:24:10 +0000 (UTC)
Message-ID: <c52ff392-703c-482c-a297-c12d4e0dbd38@collabora.com>
Date: Wed, 29 May 2024 10:24:10 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] pinctrl: mediatek: Provide a helper macro
 PINCTRL_PIN_FUNCTION()
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
 <20240528194951.1489887-5-andy.shevchenko@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240528194951.1489887-5-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 28/05/24 21:44, Andy Shevchenko ha scritto:
> Provide a helper macro to assign the struct function_desc entries.
> This helps further refactoring.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Not a strong opinion but, for commodity, I'd like to see "moore" mentioned in the
title, as only the Moore pinctrl IPs are being touched here (where MTK has two
different IPs: Moore and Paris).

In any case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



