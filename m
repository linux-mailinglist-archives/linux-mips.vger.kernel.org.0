Return-Path: <linux-mips+bounces-15911-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1QMACnIzV2otHQEAu9opvQ
	(envelope-from <linux-mips+bounces-15911-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 09:14:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AA475B58B
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 09:14:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b="hM/TunoM";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15911-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15911-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A857D301B719
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 07:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86C33B4EBF;
	Wed, 15 Jul 2026 07:14:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AAF381EA6;
	Wed, 15 Jul 2026 07:14:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099692; cv=fail; b=Haa0zH3kPA7DIQhRBMmDUtJ+dG9W7grHXYJkXYeY1ZrmFOHpyj6xoHgChT4EcL537CEFxPyinebZvExjUCWriLDXQYB5sh2zJHESxKnr62yxS7DbxOxp5bh0LeBUkd1SRKOz/ePJn7I3V09AcOEM/4HM9NialVmN/zjvY/FIjnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099692; c=relaxed/simple;
	bh=b04VK2rAiC4QGEW+4EcmaeJWrInL/u/L1pZXlsR97ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pv9mFjbLsT6iWG1/VggTL4+KP/6hrZsfeMT+WZYaXYtTFr60x4U9hjT5sRHFVIYqNdSws7XoT+zE3KoUqMFypWfoRHlx/4WoTI4Gsh3yzeg9L08WSzVlwTcuLVN+YVivsIWRbPr+mAea6psa590+Jjf7Gz7F2q84xI6Qa9yrb+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hM/TunoM; arc=fail smtp.client-ip=52.101.52.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6mXb8EYkmWuAq2t5DVU3XPeZH3irMYx/mRaQU1A0gEW3oMiLbdXa1KrTAx7DpN1A/QLNKWAgnmknkcO2cv/ROol+GaayuiDFi3W/NOvz17TDf6tSY9ZjFiQdGgEPxBYNIM3FJDXngQZ1E4yYBB2/cVV15joe9MjjjuxSxPeMRyFu7qafqeGp3RotvbcjLZcIEB9NtDZ6YesB2z/01SUMyk2O7BAZ02m+XVF3pjja8/2qWWzo2bH4E7gNIQJ4c1c+mC0qFoAKWn97RjUhkp+ipQcXosGRV7UXzdeBezS3NgLpJNXjsNY0UwyuaIjFAcJpeWWfO8Y3jTSR7VzDOtSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2umTuA0uDsjmo29/9k/4nXaVg8rS/NVfTkTK6+Zhvik=;
 b=HiOWL1827OIpMro1bQshFvgTZ8oO7Dff6hOOGagxPm01ecpnBgl7pZpVJ+c+muf111ZXms+Qb72rohi2tpW7fgGTZj3P4pl07X+elQEfeutWm9G99KlfcUV/sa/QmohKW2v6+zvdreCAk0k+DrcrCpXolcTdVbTUWFFmN37NppSWj3K/lRMGuLe8k93GCFFmUC3SPmoT1je0QOEWdrwG7SBCrR348zNFSr98XqXVyNjPezpFCnj66KRYCt8DlHPGpnq6N8rmjua9Zsm6aHYLJUntR8VZY34CRx1rnuQcTFfaQs1P16RUOKR13Gwuz4lTqqGuD5ZoJtA07JB8z5X4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2umTuA0uDsjmo29/9k/4nXaVg8rS/NVfTkTK6+Zhvik=;
 b=hM/TunoMFMHARErnDN9aI63BRN/NRduQtWUohbyPk1K0jWF7zjm+GyJsRt4t+kQ2HtjyYA7ILg/gzWKo1OXhuaJtg2Lr2yaeQnZat8F3gEWl2YSSUGpwbi+TbMm11tH3pr2ed/qcJnl3dHiRSFkXuSzgHQ9wedTPDPoNGwhmwYbIxl5WofHeZ0g0Hn7b1JVqTf5Tfj41egGO+czH29anV9JfM57ZONQRQ/TyQ/hzebh1RElRWp8lkgX9uOkLs3ZKO/t7c/RQNI0Kh7fZsNy0Nkd9t/v0p+4GwsuN72Edxx/6HCG4KLwhuMI1GhqHH8JkFk2d9l7d+ig8MuIM0JwLFw==
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DS3PR12MB999216.namprd12.prod.outlook.com (2603:10b6:8:38d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 07:14:39 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 07:14:39 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Alison Wang <alison.wang@nxp.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Albert Esteve <aesteve@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Albert Esteve <aesteve@redhat.com>
Subject:
 Re: [PATCH v2 3/5] drm/panel: of_drm_find_panel() return a counted reference
Date: Wed, 15 Jul 2026 16:14:35 +0900
Message-ID: <hm3gW14-QtmZmT6DKePecw@nvidia.com>
In-Reply-To: <20260713-drm_refcount_wiring-v2-3-d3bb61f4bd4d@redhat.com>
References:
 <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-3-d3bb61f4bd4d@redhat.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::17) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DS3PR12MB999216:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9157d9-5405-4c83-71e9-08dee240bb9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|23010399003|921020|3023799007|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	j0TIiVA1SFyow06vbq3b6RKxS/uco1dXBHP+i15V2Pjn8oQgeD4WHW8t8sFKCJdly1H4bm9owAY85MfhsVmndiSUuc0d47BRsPH6lGYHYhwcaf5owlgz+YXvtNcTlEGgjFKSlSSkwUVe+ScIEjQz3dSbQQnXL6Er4Mp7M20XU2cVRD6832jW3WQZyaVk6gH4INthU4mtDfU0vA8YhArRZlrjOYRAuxu0tBe65BX9X5zJ7TG5mO/pxhjX8a9BZznEJl2pWTqTDg5n5GKu2xy8h/bdh54kSztjNemFC+MRib7lCs7pg115OCx1fJp111YkSl+qwhDA76KhLWFk83bH7E7PPcbXCoYWVTyrzvFHsIMmtpUPAtLWGUHeamA525sLIgRXYj8/zmj3AkpjLVYoAdHjv7N9di3F5zx4MxLxPxe5DHlAPOraAfNcACpgtxMZUJt94U75SUI4a1yYvVbaMMn+cfKBcVdWq8o6TPUAkX2trSu8e7ie0b/quMUV0GXdguT4htm9r/NWK3XYbyM6iihK/v6Ah0YSNUzpYEMuLbg1p+AfhaFX6EEE3Qomy7P4cBgrjdhhcaGbS8StvGm7hN5oE8d2LS2P3rXkWBYzFN++4hCYMWrRUF20sZHlpOfvdrmRyc6KPPXGNefyXLZFKZmnXHw1aT/77ITSUNJ1+9ZbJ6VYU+G2PYnAGe0dQzmCsw46Ue2Y1sf1CxUO9pNJFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(23010399003)(921020)(3023799007)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEFTY1pSbHE3RUhZek5pamR2RjAvcmtaL0s5RzFLcE9lTStrUXI4ZlA0Qm9H?=
 =?utf-8?B?eUlHYWlyTDhqSERjSnhqRTB5eGJMd3k2eU1haFlleG5PVk81ZHRIWElzWHVW?=
 =?utf-8?B?dTAyc0FURHlaSlIwYXVUek1tWTk2ckRvd0RQUmdjenlCQk5qektWRDk2Y3Uv?=
 =?utf-8?B?Nm1aRG5HNXF1ZUU4aGdrQmpYYlE3aVJTZjV0ZWM1U0RTeThFbVBqWWs5ekF5?=
 =?utf-8?B?Zk1oYndoTTJySjVwYzRITnI3QmxUYTJodGVwT0xWWmZaRmhLRmxaQ3M4akdu?=
 =?utf-8?B?RCtJSlI2aW5jOWV5NzdCWnZUdFNkYlQvdS84bmhNY1dEMERZRUhIR215YWRr?=
 =?utf-8?B?M2VXdVpnTmdESDlRYzdZL0tOcXZ2SVUxWi83aUdXaUZiZkVKaWRaN1hzbEZw?=
 =?utf-8?B?bjB4UVdGUG4ybDZKU2ZOTmJWVHZNbFZJdmM0SEgzTTRkanpwVTRtUXdqenNy?=
 =?utf-8?B?UWo3eTZwenBrRHNkUVV4aVQwdlF2V053VmZvcGY1NWhBNzhONlAzNnp5WWZ4?=
 =?utf-8?B?Z3JISDZFMVZTRWlmbitvSWVBemMzcGJ3YWpadTZOVmlURXBLalQydENtc0tW?=
 =?utf-8?B?Y3VXL1MwV0x0Mldla0xQbDI0a2V1YWVUNWZXcTExZkw3ckJtTHJOOTVpaWp3?=
 =?utf-8?B?ZzVjWWcxYTIyVEJ6bmp3MFo2Y080YVZYNEhWcnpRVFBaRitqQlo1djBNcmxs?=
 =?utf-8?B?a0MrbWluTWV0UnJiWllaTG42cDVwY2xmNCtGN0F6bm1YamwxL01rRzF6Y281?=
 =?utf-8?B?VXpDVGFiVzU0SnJ5YWttaDVVcUNpcGpWM3c5ZjZhVlYvWUhFMXlhb2NvWkdU?=
 =?utf-8?B?eGdGdlh6Z0d6QUtkWVJZVEVTd096MVhQZ1JTc3ZyczU2OURZSE5MSVM2endW?=
 =?utf-8?B?aW05cXd2T2ZITVJOaWttUVJpbUNkZlZ5TlN2N2twNXhoS0gwbVhsanU0bGFa?=
 =?utf-8?B?bWxWOTdqVk85cHEwQk0rYzc3eUR0UUpia3NPV21GcEt4aU9ienFxcWhYNVBJ?=
 =?utf-8?B?S2FLTVRsYjA1MGYwemtnOHZRaUc3R3NzUUdtM3huQk0vTisrQ21OZ2ZVK3hm?=
 =?utf-8?B?UG5mUUtvRmMxdytFWlRjbVZrYzdZaGVLc3p5RUM2YktvUDNrUTREY0ZCOUMz?=
 =?utf-8?B?TlFFb0ZrVG03RXFWaXlhN29CY0p3NzBacWdlN1lyT0c4SmhxWGZDZjVMU0la?=
 =?utf-8?B?RmlSOW1sV0VKVzh1TFhpZXhKWVdyTVlYYkZYbVU1R0VsUGI2MStua2pBd2RS?=
 =?utf-8?B?MHdub1RPZ1A1NmlhdWJjUmhqUUFtNXlXV0lvZFNydjdXS2cyUEs2YWhuc3VJ?=
 =?utf-8?B?YzVvQ3FUWWZvVlZRM3NXMExsbktlbXVCNzlLOUl4QnhWRzBEcnZJQUVkalFw?=
 =?utf-8?B?WC96dVZxemw3cGo3MnRiQUtUczE4dXFwbGhFdUszaFRjQktsRDgyZmdmT1hv?=
 =?utf-8?B?UWpiOXVzeWFNSWRNYlh6YitjZEpUMlZRS0ZENWpsR2k3OGxqbWZHWlozUjFY?=
 =?utf-8?B?U3dWdHRkZWpJVjlFOUxCdy8rOXIra3FRK0Z3NHFyR0tDTVhhV3d1L204K2kr?=
 =?utf-8?B?MFkwajdMNkw3SFNBWm9DWm9sOW8xWi9oTXBWTmR1b0toOWxUeFdWYkdMclZx?=
 =?utf-8?B?UXRjNEs3ejJFOFYxc3gxbUMydHdTbXUrU1dKMmdDZjA3QzVwWjZDRXFiN1pz?=
 =?utf-8?B?R21GTURnTElESW1kUVNyOVc2bjNjMVVLS0prYm85b0lkbjg5YUdXTUg3dGVQ?=
 =?utf-8?B?a3k4SThXYkQzTTF2SXVLRjBhWTZmc2p2bkhrTUNKQjFuTUNad3laQUVtaHVj?=
 =?utf-8?B?dHpOK0xYNnh3UzB5Z1hlVWl0c1VVSGlMZ0RzcHZEZm9wekl2bmlMdjJMRjk2?=
 =?utf-8?B?UnkyczNWWFJBazJzRGhqNlQxUEF3V2Myemo4YW9PNlFYZ2hvWjBST2J4czd0?=
 =?utf-8?B?VGpzbkZNSU9hMkJmTkpUblBDZnlIL2RjMVhaMVpnOFVuK0l0WVNNSWV4c2pn?=
 =?utf-8?B?OHRqck9GNEFlYlBLd1daSUNlMEcvdThHZUhublVBcTBOMDVuMGxTaXZNOUxM?=
 =?utf-8?B?RW5VK1Z3QmZsQUFxQmFvbFFXeFQ5WEtYcHd1cVVFbUVyV3VBNTJJVlExL1pW?=
 =?utf-8?B?RFZjTmYvQ1ZDRVZNeG9rd0JtK2xLSVZxRUdhTHFLK3Rtc2loVW9Vc3AwQzZq?=
 =?utf-8?B?eVZ4ZnQ5cWFXWXVST1FCN053dTJramg2Y0g0dHBBSE53WkJFa1BkaHBMaWxj?=
 =?utf-8?B?OUVBYnhqYStYK2doTGJjTllaZTNmYnNBc0IxTFpVVW1aT3hLK1hFdU9PN1NE?=
 =?utf-8?B?UWZZdC93M21mRzJxV0NMZVhlZWdWNTI5bWRBZXhoVzhDazc4ckE4S2g4R2s3?=
 =?utf-8?Q?gJL5+7aOZNAwVPHLW2hxpLOmGjqOoZaW6ZrpavQow4ggR?=
X-MS-Exchange-AntiSpam-MessageData-1: AZ8BNAgkWPxYCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9157d9-5405-4c83-71e9-08dee240bb9f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:14:38.9754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJT5D9VRPiS9SGgTaqPLFKd1fU1l/N0yiMMDbcnVp6MOm7VOHx2ufHVnGSXx2YmP3RFRtXRRiHQXwkJgrKLNSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.66 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15911-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,ideasonboard.com,kwiboo.se,bootlin.com,samsung.com,amarulasolutions.com,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,denx.de,agner.ch,glider.be,bp.renesas.com,rock-chips.com,sntech.de,foss.st.com,sholland.org,iki.fi,sys-base.io,nvidia.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:paul@crapouillou.net,m:linusw@kernel.org,m:marex@denx.de,m:stefan@agner.ch,m:tomi.valkeinen@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.
 st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:samuel@sholland.org,m:jyri.sarha@iki.fi,m:jingoohan1@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:alison.wang@nxp.com,m:paulk@sys-base.io,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:aesteve@redhat.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-samsung-soc@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[68];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:from_mime,nvidia.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7AA475B58B

On Monday, July 13, 2026 8:53=E2=80=AFPM Albert Esteve wrote:
> Callers of of_drm_find_panel() receive a pointer with no reference
> held, creating a window where the panel device can be unregistered
> and freed between the lookup and first use (e.g., drm_panel_prepare()).
>=20
> Fix the lookup function by acquiring a reference with drm_panel_get()
> before returning, under panel_lock. Callers are now responsible for
> calling drm_panel_put() when they no longer need the pointer.
>=20
> For bridge drivers that immediately wrap the panel in a panel_bridge
> (which acquires its own reference), release the lookup reference right
> after the bridge creation call.
>=20
> For analogix-anx6345, which stores the panel for direct use, release
> the reference in the i2c remove path.
>=20
> For platform drivers using analogix_dp_core with a component lifecycle
> (exynos_dp, rockchip analogix_dp), release the lookup reference in the
> platform remove() function. The panel_bridge created during bind() holds
> a separate reference that devm cleanup releases after remove() returns.
>=20
> Also fix devm_drm_of_get_bridge() and drmm_of_get_bridge() in
> bridge/panel.c itself: both call drm_of_find_panel_or_bridge() and
> then pass the panel to devm/drmm_panel_bridge_add(), which acquires
> its own reference via drm_panel_bridge_add_typed(). The lookup
> reference was never released; add drm_panel_put() after each bridge
> creation call.
>=20
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  3 +++
>  drivers/gpu/drm/bridge/panel.c                     |  8 ++++++--
>  drivers/gpu/drm/drm_of.c                           |  3 ++-
>  drivers/gpu/drm/drm_panel.c                        | 12 ++++++++----
>  drivers/gpu/drm/exynos/exynos_dp.c                 | 10 ++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  3 +++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          | 18 ++++++++++++++++=
++
>  drivers/gpu/drm/logicvc/logicvc_interface.c        | 12 ++++++++++++
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 11 +++++++++++
>  drivers/gpu/drm/sti/sti_dvo.c                      |  3 +++
>  drivers/gpu/drm/stm/lvds.c                         |  3 +++
>  drivers/gpu/drm/sun4i/sun4i_lvds.c                 | 13 +++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 13 +++++++++++++
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |  2 ++
>  drivers/gpu/drm/tegra/dsi.c                        |  1 +
>  drivers/gpu/drm/tegra/output.c                     |  3 +++
>  16 files changed, 111 insertions(+), 7 deletions(-)
>=20
> ...
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 7f25c50621c94..57a016f47434d 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -1516,6 +1516,7 @@ static int tegra_dsi_host_detach(struct mipi_dsi_ho=
st *host,
>  	struct tegra_output *output =3D &dsi->output;
> =20
>  	if (output->panel && &device->dev =3D=3D output->panel->dev) {
> +		drm_panel_put(output->panel);
>  		output->panel =3D NULL;
> =20
>  		if (output->connector.dev)
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/outpu=
t.c
> index 49e4f63a5550d..90db39dbdd332 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -195,6 +195,9 @@ int tegra_output_probe(struct tegra_output *output)
> =20
>  void tegra_output_remove(struct tegra_output *output)
>  {
> +	if (output->panel)
> +		drm_panel_put(output->panel);
> +
>  	if (output->hpd_gpio)
>  		free_irq(output->hpd_irq, output);
> =20
>=20

tegra_output_probe's error cleanup paths need to be updated to clean up
the refcount. Also, it can technically call drm_of_find_panel_or_bridge
and then overwrite that value with of_drm_find_panel. While there's
already a WARN_ON for that case, I think it would be good to fix the
refcounting there as well for consistency.

As a note, the tegra-dsi code also uses tegra_output and can overwrite
the panel field with its own -- but in those cases tegra_output should
never populate the panel and we've been talking about removing that
code path anyway, so the dsi code can continue to assume that
tegra_output_probe doesn't populate a panel.

Cheers
Mikko

> --=20
> 2.54.0
>=20
>=20





