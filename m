Return-Path: <linux-mips+bounces-15573-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QjiPB5nFTGrxpQEAu9opvQ
	(envelope-from <linux-mips+bounces-15573-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 11:23:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B1719B39
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 11:23:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=3kYBlUxc;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15573-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15573-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8937F301966E
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 09:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4FE393DEE;
	Tue,  7 Jul 2026 09:13:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EF53914EE;
	Tue,  7 Jul 2026 09:13:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415634; cv=fail; b=upcse8WentybbDzbcqeiinRHv5lh3q+dDVJx0fPevclozcUOlF3g4lq7icR32TtiUtaqA6iwPYN+4/Fy9B7ax4mIP/gTh/CGHER3oxzwqhWJvpKCDLNhtfJFmyQJ7DPCzTbrWaWywWlEKN4EA+tbU0oFtZQQGazirSW1GjEtYDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415634; c=relaxed/simple;
	bh=N9jm0wiLOP62WWmaH5+Fa278cXzQ0qHaC4Pg6pJpzOQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EQaJQELhwq5e2BD6bnpCJMIgSQR/tYJU6g0lwfzqIAUY75qnuw91Tn81S0LEV6bf8sVXusO+TRQ5OSZ68YJG6WtFLHCBMypi/xvqUtcf1kycVqKTQaM/0uZ+fSFuFS3ydvhEoGibef4QwsFk21x0cGK2Ew5fT+q+6R3SeP0ClIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3kYBlUxc; arc=fail smtp.client-ip=40.107.208.71
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUA1NWsVoCq0XXTEyt04oXRWmmP8UArAkvGLkTutEXTGbyB2FexLZAD8oCI//bzGhz3sDcoc+C2vYeyvdANyBzlbLMvCZjK8iP1K1ltg/A6iKVwZRGqtXqbK8YsaDF/L1qEBJEThiUez4yrVEfervOmSLVxlVd9zo8RYQ0nY2ewXQ3uXZS4YjSxtTNqb1GMQyc7yugAcpQGrw4gEzrAa72U7doHxB3QzEbwjd28H5WMTeswWbOJCvwK95RO5e3U3hpp/fEp4JtX6/u8WuP7MjjlO5vDaz5YdG62ju6IIiLj57ea5PxpLLgsOz1CV8ecrEsgbBvVPjxzfXQsOsrXu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQ4e1PcEa1qkg9JeeVTO5zDN+m+oZVMgiWuEff6wB3E=;
 b=AgTJ2rx2wEsYZVHthXiV4XrfdlAXXgqhjd0XluAtaXKeKz+tgHOgRQOCd+grBCbe8g3j93TyXxbY2Bfql/sL5h2bfaLV0G2cZY4QhQPJNus8yIU5O+hrWHf5dym/l17Zj+rs2khnpjN5yN+bC27xnTRnAcIu+Y/cNy60d3O/Qjp/yiOzmhpOX7CgLU/mR/PpcxMsAGQFm9+0eE6V9ySZ0QSe1NlFBLYsFnWzRwzYSgO05EhU3fRFwsBX1l1pl+TfmAYKYcmsMu+QfRvb/lKqdMi4DwVKfvaGQEQDToCmM8Q6XkEs9Nd3M0YF1E2NSzjOkq4tMmAGz6lkGPH0iHrKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQ4e1PcEa1qkg9JeeVTO5zDN+m+oZVMgiWuEff6wB3E=;
 b=3kYBlUxc2qslRtMHD3g8uABgEHghk1I2ZE5xF5m6Uva+X5ab/NVRhgmB65dIeuk6K6yHpp9/xbE0JxNfzIxvu1hxHyIw5cSxSyYpEJqMgUoP3GlgMNBnntOEtO6vrbO4G9TZyDR7Lbq7NOv7ZH7FM4yiXu/YNc2kPeCpVd6NnPw=
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by MW4PR12MB6949.namprd12.prod.outlook.com (2603:10b6:303:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 09:13:47 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0181.010; Tue, 7 Jul 2026
 09:13:47 +0000
Message-ID: <84a98c07-372f-4636-be2e-9ef695d3f8e4@amd.com>
Date: Tue, 7 Jul 2026 14:43:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/42] drm: xlnx: zynqmp_dpsub: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Alexey Brodkin
 <abrodkin@synopsys.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Eddie James <eajames@linux.ibm.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ge Gordon
 <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, linux-tegra@vger.kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, sound-open-firmware@alsa-project.org
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-21-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260703193855.110619-21-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|MW4PR12MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8e7f10-34d3-4e21-2d57-08dedc080ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|22082099003|18002099003|4143699003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	J3hQH2y7prc5ysSNH1F3Rvx1N+gkhmK7etXLLwXKc+DoEpH2vEwa1OuJEHxC3VuIdeFfNoEwRcuzmvIkJcTUHDoJfLNVLAHSft0FP9qIX3cl5UQ8/8IF6wjn+98l8V8/8lFj769qDQj/bigoXuBozfnCI7NYzmbrx2rqDq2YcTYF5cd9GDS2cqf7YKL3tsbenPWBqX4hq15GfF31eUM2SXMpYDi65pkYJIwC14YM+tBcTZHifM/dTQ+7m5B3UI30HuYrAoHB7iQHBVhJ8WMvUdWKiM4RFBWd6JY/4CzJVeHjLJ3J+IKhTcmZA9gAhrxCYK4sRP3Ke3P7J7DKz5aJIU9qnvKhaH99K6Kjv9GaNA1lx4Kpqj8B8PmqtGkGMYZk7aqfkD4VINTYOt1TUedd/M2YpIEXFSjXnjYgOL+20OpyywGGIG66knkHMNHmsok2OvkjfBgRoIun95POvRN03cbTvAi2B4RtPiJjLay8QrchnuvWHzEy+2wUaSGPXTuZ/6qm2QjKEsDVE4N10+igMGhJZF60Iodpf50gjodgOfZu4yAbsV4pM9LsgPn6LqRUytHPLLFNUXBQEeVH7kgg4vY/c6gfT/ty8PNKA5J+GdMCfKhpUn2LyQkp3Iihsgt9yC9qvVlNsibICFVzNy0xe70sL2khwn9Ey26RA+P2X7YpliheICYHMoG+YO3YGme7RXiUq1eWyavwqBrA3kRiyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3F5TjZuVTMrMHlzZG5iU29TdzViYVA2cDQwdWdkWTVxYkxVVTBzV0tFdkdX?=
 =?utf-8?B?TjFWdWhPMmc2UEVlMlRYZGx4NVdmbG5XdTNpMzcrVEtmV1FYNktzSHo5dEdD?=
 =?utf-8?B?a2FEU3RSWjNrei9vUWp6K1hIcXFNZEdMcEt0dDZSWno3emovRVRqcW9IZHlk?=
 =?utf-8?B?a21KY1YwanFWNXNYWHQya2RORmZ6K0JNVWxpb0VOUWtmTWY1S3hYZ3AvcE5O?=
 =?utf-8?B?aE1jZEE1clB5bU9hVVh6bHhBUklKWVFpM0hJWkJZM2NBb0pwb2hPZFNpdU9K?=
 =?utf-8?B?bzNRaTQySGJkY0hMeUVUeUhuU1lVOStweWVWd2V5T2E2MjZOV2JwYVV4Zmpj?=
 =?utf-8?B?dlRSZ0lPUVFHUFBCdlFFYjk5M0hXM09OUVJUZjcwNkVMeXR0NlAzUW9LWVNw?=
 =?utf-8?B?a2dIaFYxeUZXZFMxajVHQkl3am84Y2dENFlyNXRwOC9tbUl1U1UxYS9NK0RO?=
 =?utf-8?B?VWs0dUVVeU9jMTlrZ21YUlJsUlByU0xiL1JuMzBSQzlrZW1vcG1GaTJqQWV5?=
 =?utf-8?B?dDJWSFlpcjZzUjR4MjdGYmR0eGtHcnNrK3QzalBmbWdCQk91eUxtRE52R3JY?=
 =?utf-8?B?NStBTmZ2YWdJNVU5UjlJUGFBUitxblRwTUYrTVZTS2tmK1JEeWFPQVA2OHJE?=
 =?utf-8?B?cnpZazZ2YW5IYkFrdXZ5THh1STgvamJ2b3RhQXFaNVAzK2hTTm54cjNRUUZk?=
 =?utf-8?B?Ym45V0k2dE40SkFUNUpES3ZvWE41UDYvRHJ6dzVwa1lKRGwxS3pRaHk4d21Y?=
 =?utf-8?B?OVdoMEVhOWVFMERWTkk0bllXeThWN0dDZU9VVW9UaHhmcy8wcksrajlGcHhr?=
 =?utf-8?B?MFZWTlZsZ1FhS0E4OWhLSS9hRWl4ekNpZmFOQWtJM2NDaTFyR1V5aTd3ZW1O?=
 =?utf-8?B?SmtRZUhoZWE2R25LMXRJVGhvL1dyUHZQVDZkZFNLRTBqbzlRUklZUnljR1N3?=
 =?utf-8?B?VERVVVVLWmJJRkdydU82cXZnUEZ3a2wzYUxtRTNHRmFXZGJmVHNwMVgzcEpT?=
 =?utf-8?B?bWUxUmRqNzlzZzF4clVyWVJpYzc5SGplcFFrbUN6c1doT3R4emdGSTY5K1J4?=
 =?utf-8?B?bHdYTGFYcHRXcDhreEhvM3F1SjJyY1p4S09sZGpXU2I0dkVnTDRaRFRxLzhu?=
 =?utf-8?B?VlZVdnhPdXJrUU56bGg1SHpqRlhOSmZ4MU5ZUktYeUViU1cvYzg5Wkg0R20v?=
 =?utf-8?B?UTRxSm91RnRXUmJBNFUvQ05nK0ZzTkF3cEhkWXBOV0F6MnhKRnpaTDJmWDZ6?=
 =?utf-8?B?enlKeENxdUhESzVNQ0xUdXFNa1ArMFI0a015UC9zSGQ3R3RCd2RVNlVjalk0?=
 =?utf-8?B?T210WEFVMkF3NG9KcUQwSFJGUlNwQ2FWb1FkS0V3WDdYTGVxcGIxTmdnWElD?=
 =?utf-8?B?VlVrNWdBalV5Y2hLcFpsR3dPYnlqRmRrVkFzQnRnQXVQV1U5WVc3Q1plTFE5?=
 =?utf-8?B?S2J5WU94Q2pZV3VxcFQwbTMrWktXSjQwTXVVRGNPckJBa0dzSnJNRytwWU8y?=
 =?utf-8?B?MExMczh5TVBxaUNJeVUrVWZnSHJKbklxcTJreFYzT25MR3JNSkxCTzhwM1V2?=
 =?utf-8?B?ZEFxSXpYekQ1OCtUZjZLU1dEbUpqTjlSRnoxckZaeC9WM2t1Zmg3UFdJY2l4?=
 =?utf-8?B?YXRJKy9HSGw3SXk3YzhxWGJOMnV4WWdCREs2c1ZkQldaM2JQNFV5M2V0L0py?=
 =?utf-8?B?ckVQQytrdVJVa25ReGRzU2hlS2dpcHArYWxIRlB6c2hDWW9RdFl6ZVdwTmc0?=
 =?utf-8?B?MVFCOHlZQTY1eVpTcnQwdEFGR3ZST2RlVkFXQmRNTU9BUjE1ZHZlNDhMYWll?=
 =?utf-8?B?NGtTZDNtWGxxUm5hN0lWWnEyR3JDWFY5N0d3UTZaWHVlQm9mOHRWTC80R1pk?=
 =?utf-8?B?UlEwNmhxeGhMZVNpaWorTTJYVDhSekg4MkNZU0U1OW93d0xpdXdzejRYQUE0?=
 =?utf-8?B?YUsrdHdTd2QzRkZKclJnYU41V0dLaHpkV2ttWUFGM2FhY2RncHNzcUFDK20y?=
 =?utf-8?B?NER5bHNDZ0VyTWd3QUNUT3NyS242ZXlUWkphSm90NXg1S3RMdlhwdjdXQkdi?=
 =?utf-8?B?QTg0NEc3cUNiVnlDRUNpem14bWhuTWZqVzArWkJNRzdDRDZaNzhodGFZM1ZI?=
 =?utf-8?B?dklmdGxxM1NvcndRenpVbFh3a0VHM2hMZkU3K2xYeGJWeHZBUklWVisvck9x?=
 =?utf-8?B?Uzh0RkdCVG45ak1sSGtnTVdRTEVGV1VIRCtwd3VudHpkSEFvUUl4cy80RzhH?=
 =?utf-8?B?aXljMnZUdXpmUXpuOWhKTGw1bG1Vekc0Mktub09OVloxb0JlOFJITnR6UXpK?=
 =?utf-8?B?aDRhbThzRzdlc3FGZzNldFA5dlpsYjNTa0I3VGJRT3ljMVE4V3NNZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8e7f10-34d3-4e21-2d57-08dedc080ce2
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 09:13:47.1197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Cm7rb2/F/z6n6IKYYudd2pnXg7LkSHWNAU/3bAcSaxW+ihOOYTZC1KLHOGlbnJP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6949
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15573-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.or
 g,m:jonathanh@nvidia.com,m:srini@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linu
 x-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,bstai.top,gmail.com,pengutronix.de,linux.intel.com,linux.dev,amd.com,cixtech.com,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,collabora.com,alsa-project.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[radheys@amd.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radheys@amd.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_GT_50(0.00)[93];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E0B1719B39

> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 53ab1a2a5aaf..e93a7a299b52 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -203,7 +203,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>   	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>   
>   	/* Try the reserved memory. Proceed if there's none. */
> -	of_reserved_mem_device_init(&pdev->dev);
> +	devm_of_reserved_mem_device_init(&pdev->dev);
>   
>   	ret = zynqmp_dpsub_init_clocks(dpsub);
>   	if (ret < 0)
> @@ -255,7 +255,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>   	pm_runtime_disable(&pdev->dev);
>   	clk_disable_unprepare(dpsub->apb_clk);
>   err_mem:
> -	of_reserved_mem_device_release(&pdev->dev);
>   	if (!dpsub->drm)
>   		zynqmp_dpsub_release(dpsub);
>   	return ret;
> @@ -276,7 +275,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
>   
>   	pm_runtime_disable(&pdev->dev);
>   	clk_disable_unprepare(dpsub->apb_clk);
> -	of_reserved_mem_device_release(&pdev->dev);
>   
>   	if (!dpsub->drm)
>   		zynqmp_dpsub_release(dpsub);


