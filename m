Return-Path: <linux-mips+bounces-7062-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9C9F4900
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 11:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9C3616C929
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 10:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02691E260D;
	Tue, 17 Dec 2024 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JHyqdCnA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4F1DDC3F;
	Tue, 17 Dec 2024 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734431847; cv=none; b=XE5VpPFqZW5U2Cc9LLEhdQe9X17IqZn9LXxnfQY5vbHZrqrJzQSsUt11lq8V6HnqMTGDuRdreNTvVPs4WS4Tq7F0DYYdUdrKaaFL872AFnMdaVDFIzlGJuo7hv44NQl9//uCZpja6oy/VvqYFZ7HWA/2LoREoFmY4zpdDiywG8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734431847; c=relaxed/simple;
	bh=O8dKluOujhFZHtu4NC9kbCIEXTbQRJR5JMVk02v4L/I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/jwIWvUVUaTkLsiUrmv6OgEqJAXV6aCxckwf/qjRoUCbfjP6maqGhsXswQzweinkrwfx6sq9usiFZpw9J31MGMrzau2HRT8FD7bp9JnKpUOeQ8C5MNx/XnzfpwylqT+X1wEjhfFucDBeD6AZNyuUlGDvrrrkU5jCqIr7PbbCEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JHyqdCnA; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4pZxb025779;
	Tue, 17 Dec 2024 04:36:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=DncSMB8awaOalGRsmX
	KLNqehj2Q8AYTF94wrCAJZets=; b=JHyqdCnAmk49Rks7tVDdl3Y0WoutMvr9mB
	x3iG4Gih0mGgeaQ7b7y6YZuqiBWOeWqniSGkkhacOVcylwjh8Ais2tnzOBK/LMn4
	L0mw7++y/sEhaKUgqkptQ2STbN8qQslOWHFUNPyAGAbUW95HpYe45bEj6R2MacLE
	dr3Wr5bd/vBehFbMarGrAwhRCuKkSl17WHMrxdePJ6CkIqY7VVHogsI1yu/xu+jW
	Wa2jZzHOPe9mMk1J+kcKIRKz7s9P5ZOc7MRlf0NKePCETF34apari5BqsJ3qElvv
	wKRhesX/OXcQJ4j4tQh4kn7cFQdc5GKOyJmpynrAUNV3yzmMWYUg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a237vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 04:36:26 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 17 Dec
 2024 10:36:23 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 17 Dec 2024 10:36:23 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id B0265820248;
	Tue, 17 Dec 2024 10:36:23 +0000 (UTC)
Date: Tue, 17 Dec 2024 10:36:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <linux-rtc@vger.kernel.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Yiting Deng <yiting.deng@amlogic.com>,
        Xianwei Zhao <xianwei.zhao@amlogic.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Paul Cercueil
	<paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk
	<piotr.wojtaszczyk@timesys.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        "Jerome
 Brunet" <jbrunet@baylibre.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang
	<zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Vincent
 Shih" <vincent.sunplus@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>, <linux-mips@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
        <linux-tegra@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH] rtc: use boolean values with device_init_wakeup()
Message-ID: <Z2FUJhC1Iq5mmkEg@opensource.cirrus.com>
References: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
X-Proofpoint-ORIG-GUID: ZFiaGqpxjixZfdP0EJY2r8mb04vfd9VM
X-Proofpoint-GUID: ZFiaGqpxjixZfdP0EJY2r8mb04vfd9VM
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 17, 2024 at 08:13:26AM +0100, Wolfram Sang wrote:
> device_init_wakeup() second argument is a bool type. Use proper boolean
> values when calling it to match the type and to produce unambiguous code
> which is easier to understand.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

For the old Wolfson parts:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

