Return-Path: <linux-mips+bounces-14302-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJzMNgIt62nNJgAAu9opvQ
	(envelope-from <linux-mips+bounces-14302-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:42:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B64C45BA5A
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48654300CE5B
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 08:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB858358D3D;
	Fri, 24 Apr 2026 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mHfowSX4"
X-Original-To: linux-mips@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD8345CBD;
	Fri, 24 Apr 2026 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020155; cv=fail; b=sDfAdbdW+ViLPR2dsIgBnftru/ULMfFo0PCjftA7BVoRnghJRSSO54kf2vEdpwHlnshjCpbgOEPNnfLnoI4WsXyEeOULolnIqBVs/Q4JZ5PMFtEISijjRo1fM4iUh+MlVGA3z3EM7TPw3+Bk7CTD2C/aIoDrtaAsS0UhdHfSgEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020155; c=relaxed/simple;
	bh=+wJjsf/anvYo50AdPO34dd21s+fgnlT6QdME+TXBaGQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O8A0kvdx9Wrdg73JIqfZclkHaYqujCTKpmM3LHpS5n9B4jruZoHBHtwJPZ0rl/dp7ZgC/bwLtEs9/c+TSX26vrmj9WsLR/WgiWdkSEGWIACvnOyCJQs6jtfCQtTDLLlaPKaJ2+hIIuqjOkZCuDYqJmGiN08foMa64T1oQPjnseg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mHfowSX4; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC8j0wmpzfz8cS/86QP9uq5wiLDWG5rJfkZMM+scbYSQ/ahChTPNuGd2eA4SqyRCvxHQ4IN0Efz9/r7ylJoQfJeAsITxfa7+9lpdg2kcUa+Bz8UDvB5z/lMAttFX4qDr/sRypmh/rvS5RZh9blA5dUDXzxWXDEcN4NWur+H60TEeL2+b3P6iCx3tk3MAOcQqHHzSwLfAlCKEg27BpsciKZKAGaHoj3IqAvwGwCCo0lcHZ/y8UEUcgZQB+i1fyCgXjHmCUuqJ51PSpvC7DlRrNxjBToMSf55VpJFjUcrgrPRHpnC4L03boQMfJ45RQASM68IGRssJ1wF1IEfkHX5kSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wJjsf/anvYo50AdPO34dd21s+fgnlT6QdME+TXBaGQ=;
 b=cf67Ak+VnQnxJzWbBFr9mduXA5KdMTL6ltAvQI3fHf7Vrw6XArodw9om4iZ7aGYiOjbIMSOyUi0BtwJ8RNLIR+XOLB4rYu7MZsUtJzK06v8whYckZ7YIkFtWk6gPXgE4sKjj9G9que3aFCO508wWkiH60lEfobO1hUeDYYkejj8dVCBrCrpulDg/P5VF2wBvLXtFCe3Ohxc0JO9co6gbBTrEeYSfsLXLNJqLL+iqEE4HkPQLtTSjMTe6MQ9bwPAOY+atckX/jd/JSh95GpFiFfYwzZVy8lSy56DAik5n8HA10G46Aw7Fcj1UYTqA87M3HvqnFkYA9+PMMLmUbW94hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wJjsf/anvYo50AdPO34dd21s+fgnlT6QdME+TXBaGQ=;
 b=mHfowSX4WseAf37ZPMQgFb+FyKHaCtLgX/n9mHFkgWnD3KxmOkot6PYejY+wDFqTGLJfAHo8JwixZZ/kZl+FarnLY7pjstq6T56WEkuCqOtVNM7Rv1YRfdSaAiRf0L+ctZ0DvlNkvpYBFQavgZdeY1blJd9x3oixe1cCYQN4XyM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB16167.jpnprd01.prod.outlook.com (2603:1096:604:3e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 08:42:27 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 08:42:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sasha Finkelstein
	<fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, Liu Ying
	<victor.liu@nxp.com>, Douglas Anderson <dianders@chromium.org>, Laurentiu
 Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Cercueil
	<paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
	tomi.valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang
	<hjc@rock-chips.com>, =?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding
	<thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Marek Vasut
	<marex@denx.de>, Stefan Agner <stefan@agner.ch>, Jyri Sarha
	<jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>
CC: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
	<freedreno@lists.freedesktop.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 27/41] drm: renesas: rz-du: rzg2l_du_encoder: remove
 now-redundant call to drm_connector_attach_encoder()
Thread-Topic: [PATCH v2 27/41] drm: renesas: rz-du: rzg2l_du_encoder: remove
 now-redundant call to drm_connector_attach_encoder()
Thread-Index: AQHc0wMPn6eeb3cH2UKy8pfL3ClHULXt4txQ
Date: Fri, 24 Apr 2026 08:42:26 +0000
Message-ID:
 <TY3PR01MB113468611B69713E9DE33644F862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423-drm-bridge-connector-attach_encoder-v2-27-2ae6ca69b390@bootlin.com>
In-Reply-To:
 <20260423-drm-bridge-connector-attach_encoder-v2-27-2ae6ca69b390@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB16167:EE_
x-ms-office365-filtering-correlation-id: 0449fc4a-002a-41fc-50da-08dea1dd69e5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003|921020|38070700021;
x-microsoft-antispam-message-info:
 RTF8aGeT5JQ/M/d2/Y5WwzWGiOhBLy0BQg3LMZk3eL3d/Gw6uqspsMHmpqgwCe2t7XkOy6C/t69Fl76+NfspOi2I9CthnreHMA7auFoVg9kW1xtgNR4EwTt7KnMYdAFXgZ0j+mHl0+gFed6rKSdEhC81hOAtu4NCHMWXF7HfIvTFx01Rpm6H/HA5JLaq/P7IhlhnuMF5oTXG4KIiUo7Hl5AqLGrop5dzfQR2IhsD+bNMWMmMSdOU3XlVkEsDty47NfHF1Pt2Hyj3CUaFK8WrMeedOlR2HkIWwOZCeeVdxrMuP++4PrrxpBitbgZd4n63k+BM2Cupf5qi7UtFWSmYUeodHm+u39zWvbEmB21vohh1QLSpx7kBXTr4vqKF30oiYj4ou4/3tTNSlhBnYpYeMNgr7GAannxHptt/WEPAp8+mwR6eiSRHrBBT+xE9xgHteRG6Jwl649coH4l5SiWfwPdb2nDAhWvvJTOcJwuhpS25qqLGo5fr9tRlQFAt2EZjxZ55gIbQ41HcuXFvCznk1ME5yifT8raDuRt6Lx7stOu8sYJwTJuvDwvYgEak3a00ZUpmwE4LU5rJCo+bFyB89vUuEbGRkkReZkafquAF1L3DkvxGlKlSBJ+W6doYM4/JJfYaDq5Z64c2DCTvbMjGJ8CzuV6mDnmtiAAm/oJ5S4yTyyRjUCj1RK2PrgRN9NN4TFx4ZhbpSaqPt0TaVGvmwrQMaqIsx2CoDn9Wxl7BY6GZAmxsUYsq89s/VqR/wMgORoJhPfjhqkrTs+X5J3HGrWa28VBan6EROt4QT+geIaY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3ZRdG1jbFJJa3pBUExoWWxHRWQrR3JnSm9mYVV6M1JaaUtFYTIwVGZodDU1?=
 =?utf-8?B?czRQQTAwOFl5d01aNjc1ZXRMOTg1N1VTc3dDUmhJeVVRTHhaK1pIRlhYcCsx?=
 =?utf-8?B?UytOZ1BWcE9KSHZMK0dSWllKcXM1OXlEY2RSK3dKTitXbmdNcFVZbTBScnFU?=
 =?utf-8?B?RHBMSW5kY3R0cW5KREU0d3diUS8zdHpNS283bjRvN2pyeThuSWE3c1cwQ1Y0?=
 =?utf-8?B?RUpwV002WmxWYmxnTWRrQmRhUnlZUG5LS1B3MGsyT2VZbWlQTjd4aGR0UXVt?=
 =?utf-8?B?WWVEVy8vKysweEY3cHFmTFhZZFh5Mitsd0oyZzF5ZHlZMUFaakY0M3MrQ0Jz?=
 =?utf-8?B?RXVsZkRKdWlid0pWaWU5U1Z4WC9aNkFNMyt4WVUyZjV5QSsxK21VcnhHQzgz?=
 =?utf-8?B?cDlMYlNpaER5NGtYKzJkYkRxT3NtM0NJaDI4eVlQWWhsMGFnTHh0MSswdmdZ?=
 =?utf-8?B?WDBYcUJyWnJ6RVN6TXdPRThYSmRySWhZUFN0bTRacG56OGljQUcyejhrdjJq?=
 =?utf-8?B?K3dLeEdtUmQwQmthV0d1NFcyWFZRSUdkODFWMXUvbHVmT2pTV21aR2YybmU2?=
 =?utf-8?B?dTlHZy9zTy9ZcUc2ZGJkNDBlYjQrK0llckpzbFhuYXl6b0JiYUVKeklVK1gz?=
 =?utf-8?B?U0QxVGNJcHQxOHl5ZDhiY0dPRWRnWDY3ZGNUa2FiU3l3RlBoYmRuVFBnQ0dE?=
 =?utf-8?B?WFVoUjF3eTVhOWxKb0Y3WGpOamNyYzc3RUcvSXFOck5WcmNlY0F0UjNodEIw?=
 =?utf-8?B?dVFmY2U5ZGE4SVh6L053elk0aDI1YlFQamJ4RkJhSTdRUHBhZ1I5LzhhUFlt?=
 =?utf-8?B?NmQ0bjROd1NEN2l6UEJUT1Z6NzFBUzVSQmNUWnBQeC8vMkRlZkRaaDNhVUZx?=
 =?utf-8?B?bnIvQ2ZhYkpwaU43Y1pKMFBrTGl5YStRejI3WkVzMmY2UWJvWHBZSkUvWS9X?=
 =?utf-8?B?ZldWQmhqNHpIdlJaMUtUdU8vUC9yVHowNksxWnV0WE9YQkFKNDlIT0xQcGxY?=
 =?utf-8?B?ZEpaY3p5TTFra1hlYmFhRFRzMUk0S2ZxKzE1SlV3WmxjdmVTaFc1UnM4VC80?=
 =?utf-8?B?a1FpYTd5MEZTVjZhc1RzUm81cGJBdExuSEMxVUxaSWNZdHdTTE9PdkxaaHNN?=
 =?utf-8?B?aGhMbnVTeDZiaDZ3dnRQSG54Q2c2NVJ5YnFDSGFhZ085ZWxqa1NoNEZ4YnJD?=
 =?utf-8?B?TlpXYzFCenlsRmdPMDFvdVBQWkFQM3JCbmdjT3JWcCtaWm1oWVNEa2xVdmFK?=
 =?utf-8?B?NVpkcTVNcnFkaU9iWm9PTVFoSE1lZ3JHQVBqbEpmdy9Way9XSENiS3VERmw3?=
 =?utf-8?B?d204ZGZ1bjFzMXhKK21oQWJRZDl6NDhEb1NNbXdmb2g4TE1hUXpUUFZ5YlVj?=
 =?utf-8?B?SHlnV1c1c2tFWFJjNUN3a3ptT3JINkhYWFQ1Mk9vK29CWVlzR3FPUnMvWmh1?=
 =?utf-8?B?ZG41ZVZXQjJkSmxzUnAweEZ1UlJJQXhac2VpRkl6NXFjdWZUdmpQZ2daSFI5?=
 =?utf-8?B?aVQyb0tXRWJWemFrb3huRXI0SUhRSFYzdTAzRzB0ODdoV0pUTVprTUg0ZEJi?=
 =?utf-8?B?MU5Mc0VxRlM3UjEyRXcrNVM3cGZlNWhyUElLQ2E3WjZBMTFsVEdzYThpYldE?=
 =?utf-8?B?YWNFTGJ2M2xFWnB0THlZQXcyMUNTYUZLRkJINDZ1OHpHMVZzd3NzSXlXL2VY?=
 =?utf-8?B?aWdLQW1FQloxVjBwYTUvZHcwUlBHcTh0U1ZJYmltUEM2U1RaS2FvK1lrdDJ1?=
 =?utf-8?B?SXhEZjAxVDF2WEhnWUU0RXJVRmZOVDBtRkVodUpCT05NalNMSXZacGt2MmlL?=
 =?utf-8?B?KzcvMGVsK3dlQ0dWK3h2UGJVY05DSWlFaHg4L3d4LzdJak8yNHc4QVlwS0hr?=
 =?utf-8?B?cEUzbWQ3eW5MYVdjRWZ4Z21veUYwaFRDOER6ZVVxVzRpUUFPWHAwcG5LN29O?=
 =?utf-8?B?eThBR0ZDOURzWHM3dnJjZXNTVG1KUmczRnBoeGprVVdYckhySENKcTN0OE5i?=
 =?utf-8?B?U1FKNFo4bW1oZWxVU25MT25WbE1qS1lGWEJPRE4vdU9NaXU0S1Q5ZTIzdDA4?=
 =?utf-8?B?Zlh2Z1A1OHI2V2VDdmNsR2ZtaWozK0Vnb2pMUkpjc25QVFlSYmt2VW5zdTU5?=
 =?utf-8?B?WStPbWU4UWlTR1JrR3NXTzBJY0toQ3F3VWcxR1MxUEY4YWJpNFo1ZmhDem9n?=
 =?utf-8?B?MEpGczk1VDIyVzNsOTBGMjFkTWhISG9adG1xQXZ0TlhpS3J2aVp5SzNhV293?=
 =?utf-8?B?VFltemtnVi9TYXNES3JKelNZMDVOdUZtTnN3by9iSlV0YW40MlV6TzlScVpH?=
 =?utf-8?B?bjNxN0IyUTdxMUpBRlFOeVlvbWFWTS9RaGMzdjZJUkJzUjNNNThYUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0449fc4a-002a-41fc-50da-08dea1dd69e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 08:42:26.8503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ms1eNyXmPIE7wG4/LKKA0jjr11rfUBhJA6WQCtPF+vjZNpRxCCbOuiD0tJxCtGWJ+fdIAAQVCxSIEfHWA6s0aM+jBQPi64bF/VewG4Nun68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16167
X-Rspamd-Queue-Id: 8B64C45BA5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14302-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,denx.de,agner.ch,iki.fi,amd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[78];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

SGkgTHVjYSBDZXJlc29saSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0KPiBTZW50OiAyMyBB
cHJpbCAyMDI2IDEwOjE3DQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAyNy80MV0gZHJtOiByZW5lc2Fz
OiByei1kdTogcnpnMmxfZHVfZW5jb2RlcjogcmVtb3ZlIG5vdy1yZWR1bmRhbnQgY2FsbCB0bw0K
PiBkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKCkNCj4gDQo+IGRybV9jb25uZWN0b3JfYXR0
YWNoX2VuY29kZXIoKSBpcyBub3cgY2FsbGVkIGJ5IGRybV9icmlkZ2VfY29ubmVjdG9yX2luaXQo
KS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9v
dGxpbi5jb20+DQoNClRlc3RlZCBvbiBSWi9HMkwgU01BUkMgRVZLLg0KDQpUZXN0ZWQtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZW5jb2Rlci5j
IHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxf
ZHVfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotDQo+IGR1L3J6ZzJsX2R1
X2VuY29kZXIuYw0KPiBpbmRleCBkNTMwNjg3MzNjNjYuLjBlNTY3YjU3YTQwOCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZW5jb2Rlci5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2VuY29kZXIuYw0K
PiBAQCAtMTI5LDUgKzEyOSw1IEBAIGludCByemcybF9kdV9lbmNvZGVyX2luaXQoc3RydWN0IHJ6
ZzJsX2R1X2RldmljZSAgKnJjZHUsDQo+ICAJCXJldHVybiBQVFJfRVJSKGNvbm5lY3Rvcik7DQo+
ICAJfQ0KPiANCj4gLQlyZXR1cm4gZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihjb25uZWN0
b3IsICZyZW5jLT5iYXNlKTsNCj4gKwlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuNTMu
MA0KDQo=

