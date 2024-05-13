Return-Path: <linux-mips+bounces-3255-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A88C418E
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 15:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87E1D2814CA
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 13:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079E315217E;
	Mon, 13 May 2024 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="wP4V4wRD"
X-Original-To: linux-mips@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23D1514E5;
	Mon, 13 May 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715605938; cv=none; b=JRvY15dQqrRrbqB++ekMmfyXG61yF3wbOgytU+RnV/efVsZj1W58dNLGsbO0emfKx3H9lStp0TgkitarXxFebOgDf4S68qJP/FVI38UYZ32xgfPVoU5pMgOeIVE8iti2qaRSz+VwCqLUmPmDkYjBJc38ZIL7xeOo+toHZFzVx2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715605938; c=relaxed/simple;
	bh=iGwqCXIPo5Sz/mVwtdsEoVu5uuBlckkioU0/F3+rFJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zr8VRhpKU08Z5CLgw+EqFoNohjPOzWXT0ZzCLu1bF0PNDN/7CFugp9eBgS28bYt06ktMWwWyuLrvp8w1rr1lUyszWEax4j/JE9oVQlKXZazbjqyxvEtpJaM0X4QRAQvpIH92g95FOk6wcGU5lhz7/Wtq32s17TVSrhcyqlvcLoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=wP4V4wRD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715605935;
	bh=iGwqCXIPo5Sz/mVwtdsEoVu5uuBlckkioU0/F3+rFJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wP4V4wRD3bgtkqQVaTg10pjSetuDkdLdu8u+Xm46+KGCWbUbEeETjSVCBADEVn3fH
	 5ONQmZ70MG6ygHnm46zi/Pi8HOrdgBWGe0HomQUvnqwcRJO38IxFF8GkkZrecDGHsc
	 FN/NQHFV1WRuXQkLBQDdb5RAENk/TVRsH7RZLLwN+DLcgi8rTAmHcONOb35dybZdfE
	 /79ktkbLNe4UW7oxoVgeFqQcoNtrnyw6zll/ILwHuotrt4/gSQTc8Ya/N/37Lue3Zk
	 jOzF4liFus2SVMYo5aqP3RWGFt+aqquKqsOro4PyXJexL3+2zxSHex5q91CHHwjLMr
	 34XuAB1Rl0PoA==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7867A3782167;
	Mon, 13 May 2024 13:12:13 +0000 (UTC)
Message-ID: <debde564-eac8-4d07-8e25-75e321150df7@collabora.com>
Date: Mon, 13 May 2024 15:12:12 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 UNGLinuxDriver@microchip.com, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta
 <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240510123018.3902184-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/05/24 14:30, Rob Herring (Arm) ha scritto:
> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For MediaTek

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



