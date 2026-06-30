Return-Path: <linux-mips+bounces-15367-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aEITJJjgQ2qdkwoAu9opvQ
	(envelope-from <linux-mips+bounces-15367-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 17:28:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D856E5EE2
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 17:28:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=JqXe71vX;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15367-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15367-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C12A3051FF6
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 15:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52F439A7F6;
	Tue, 30 Jun 2026 15:27:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B2438F230;
	Tue, 30 Jun 2026 15:27:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833274; cv=fail; b=OFLUyvbuZPtABCruVy/OvzNf1IXut1bpXBWZLwc2sx2HMslY3tosIyd+OWYGmFZApgxKT9Sk9CUtY2l+kIHCYciuivAfnfGolfa4+Dd2UtqwTqKU2Q82oJAydchXv64OGKqszS5T23f1l6OgvWGJMqZXr0j0FnFoJ0MUyfq9L6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833274; c=relaxed/simple;
	bh=ly4Ar5DHkayVbCc8OieXkeiofBQ0N/JIv/KnHqqSN00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QN+XFXu/1wHE8eCgTev/F+uMjk11aH0NWtZXmAaevfY0iGsMra7CXko4M+kClacVPxKN0D6/OVXX3q4jaAWY+iJQoIwMFtf3hzQPZ0gO9FBUbB2sRjrEC21+4m/qv6nUYdorQGRkn1Wj2J1geW27MtFvsTzmqrAgglM46e5YJ9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JqXe71vX; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rn51hq9geuKraU+I86oibSMCAJQFFRwEYZOP4G0j/xPfMMt+yY1zPFVToRfCTA6NKZYf2fNKseQYt7O5tIr+PczKrL3N/gYwwFIr/2trOtDG3Z6SLl5ipBewyiWcP8u+og+eJhjhcJ/cKQADSY/wdkoUkgaPC/Id0JiQSiQ1xPRonRtpa/g52fIebpK9eJHNvO9mj6P4K5ZCBDzL7GdlLTmo1KwaUH0MT6OluJ0rNq2SGEQXCu6w0GoTSIV/evywCv9MFhyvgbXRA8qvkrf/0R4nwHWolmvfZ317eypJshgDRYctO93Uv90FLhaJ08o8HZIm0P1ljUABdiNeveqc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOXjvUf4kNy7tPPtj0KZlEKz8m59k9a5tIZUbCybscA=;
 b=Qsd8oy+nSMSbHiNSJ6O3irF/ZlqPczIfEA/agLHOeRIl/B5PoyDR+c8W8kyLNl0WdAwd01ee55UIRMGsGOql+IYLN9CfGAXnmZn1wMbRsZuNuYvd9vsSIP33dxUJ0Hgig8kTZMCtdEbHjTRigIoJ8VxkO6+FTHS2UvygJ/2xOMDmdm5mYvyzLXPMbLLLYKBjeGrP3hGjpUhwcHkMmI8fLRJbz+tVPIf2PCBdYe25Rr3/IQ5iGvvc5hx8ysoVERQPzYXKi/b5MmjQ6BeYpwVT1/5ILX4jXNaW+5qy2IG+oTVpRP3vF5hc2by1lqEoqJQwv5/5KN+0T+WeawVJR3e91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOXjvUf4kNy7tPPtj0KZlEKz8m59k9a5tIZUbCybscA=;
 b=JqXe71vXdJlRa36uQnUGGB7XcVom4mIl/i4763DhGzl74+lCErLtVZBXlVkgj90py77DoesRWnpHi1+2x/a8NiqHXVUzQAoNjwHiXVtZ7hM5MF4X5F8PT4IlLRUyGWnimx5J/m8bGoYDM5j0lixhpjYG0xjblTMacUN7gV0XcC2JFF14NBXtHBt+1dMWetmFEFRhTp7ZF95WR4PD25IRCtrfwQxAfGUn9tjwQ8qkZHAoiQ7u3dFwEMrC/DOVAJRE21APMG+LS8gByb9zOEanpNmAelgofFxixE/VOxXnYZALzvvKiS3biKxnV1Qp8BS3/slKFAqjQmuyhlL7ESpRlg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11948.eurprd04.prod.outlook.com (2603:10a6:102:51b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 30 Jun
 2026 15:27:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 15:27:43 +0000
Date: Tue, 30 Jun 2026 10:27:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Peter Chen <peter.chen@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 10/19] pmdomain: imx: use platform_device_set_of_node()
Message-ID: <akPgXPUGHswfBuQB@SMW015318>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
 <20260629-pdev-fwnode-ref-v2-10-8abe2513f96e@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-pdev-fwnode-ref-v2-10-8abe2513f96e@oss.qualcomm.com>
X-ClientProxiedBy: PH7P220CA0167.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11948:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f666dd4-e8c7-4cb8-0501-08ded6bc2177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zcoIJeBB8Dhzo3+7ngTfxflWB4imqVdzpBagtZZnQ//13nnWQCRNNT+3RDJ1WQbEFLsV5udYDZLYXDH/ujfOWiKNYZvZWTTuhz5qsQfncUc6QAZ+F5mF2kpl+DLwG8F1AFJ39TaiGr4HyKtfIVwzCqlnOfbsZU4XxdDydagI+rK3xLbxTFKhXydkvubdfPL2D/hEDhUWEBq1ilAUl8Lw/N/+/emmyMhk+yUK0ReMCmLJJR+2+ahh1/+SOtAC43xcZ6u/rtfWHXgW6OYvDxp4bmGe8niNu5sOslgh+KxG0O7M8pQj9a2qIKpmzRCxiZDUCx5mALMwWvBXM5q4UQ8mc3MBxzdw26c/V5ZkXQasdIvUXb4o12rGVbVYb0TMyE9gK3xutnvLDgxpXM3UBHAyEm2riXnXRHx2cYdqMZiM+UtCLdUu66xcEQcPDlqXzplstOqd37HUZJBcmq4Cpzztcp7oNA5N73pKHB+UCZQMbcPYhZZHq1baKBwfHKLAMiRW78Qh1wxbgr7uWqghQKbw6EZ0NHt0Ol8WlV6VH3Y7j1h1pC3nN892PyLS15n3637z4VymmgyiePBAqnYy8Xpp1PAuADDdc14FLQZZQVLUtL2uKVqpNJ47fyWPkZb0jOnN7tBIHdUj5KKqMhgWa7svQ7869n86Gn7UMAYpyxH5tos=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KuVKHHhHl/yqNJ87pIy0XvpH//kNGYZW3bSZDO7uPBx3d3Dw1x2yLOhKnyH1?=
 =?us-ascii?Q?kTD5DpMyy93XVxSt640gZu78KqvcQh39bwLGBCNQdMsmkpHY2FnNOgwIY6kR?=
 =?us-ascii?Q?QtC/341/UAlxg3w8tkJruLlZAKRkO/T5nxGiTeqSAQqRsXN7rxud4eJN/lDb?=
 =?us-ascii?Q?IoNys46fUcnKbxiE91ZFEUw+aGXMVXqULu4nW6JMJ7BA6wK91fnWjP+3Dsda?=
 =?us-ascii?Q?qa0wurCu8twTaYVd2YtmA6qhavUaAO7ARa/YX0vl6Da6D+xdK1ujP3MsH/Zq?=
 =?us-ascii?Q?pvI8hAy8KFsn5hpJlFVmC6fOGiacgUpumkukAFLfN8lfwxdJw2qmoWqUSuYX?=
 =?us-ascii?Q?QHvWMC1VgJksamDlYgXJHH52gUW8/XcoOJ0FP6sSYKhXNfYZ1QgeyFvVd0me?=
 =?us-ascii?Q?+5brY99cKx4snTXEmuGDevZy017VoV975HtRFCBsinvFu2sVQF67eP7YSADb?=
 =?us-ascii?Q?FKzpwd+Tmr209RgpM5F8nYFf/ED7E0kG/MVI9PIS6uRN5cF9Jp1075Xt4Yh/?=
 =?us-ascii?Q?B2yMOFSB6GTdZggDsNH10WAvy5x1GdA+fWC+BTgxtRL6ndOkNd9x2g1c9IId?=
 =?us-ascii?Q?Kr7yscb3julLatPEckrZLD1uw425ibGiGm7Ecf8FdmvLXM856A35hY0YLsnE?=
 =?us-ascii?Q?fG4zaWRDD1sURvBBUf4ccCLk13P5Y8wB04WTWMY6oBZG35fLPVEJSVlpujJj?=
 =?us-ascii?Q?t4GoVU2ngPzhebOfSOLHHIsS+/6FVIV+HNNtl5fcYS19L9CH7Nb8hBFfMbRQ?=
 =?us-ascii?Q?SoHD6Y7VjUyWBP+yLbbhuSAQ70YhJCtVEXWgXOVdMabp63u6wlwZ3MN4UyWi?=
 =?us-ascii?Q?HR1jM4Emp+ef+tedxO4jyrxiFklGEuJ5guc3CbyTlFOUcT2mAbV+QZoq/ULH?=
 =?us-ascii?Q?Fa0lEE8pr6B3xg3sg0zyf7h1IMKAZhDhgk+CPZ2T9LBqa+lqInUgSFsZv0rh?=
 =?us-ascii?Q?xlKWZrmnlBrvTwaCyWHZZ0dAGbLbPZTLRgqem7SL2WAzRBnWulbG6AhWu0sP?=
 =?us-ascii?Q?L2CTeXGbHy0JdyEHdqtZVF4gwISemZ2/+mXH5c7yUn8Fl93zx3pVPsXX2zek?=
 =?us-ascii?Q?pc3sPiSu0G3G9ADfv7g7EsYZqU6nID0eoVYafAa426enO4UAnqLayVDQNlBi?=
 =?us-ascii?Q?ZPAEFUiSe/yN1Ie70MlKhFjvFrqqgh2l1WcadgH6Uz5YJKU2MMba9qEXONZQ?=
 =?us-ascii?Q?S36ODP48GF7rBcTI/gGmNrDMRuTtooIcMLNVNZi3UavooD2kNvqYZe/inOpp?=
 =?us-ascii?Q?tGaRWwu4kZajI1TGA78EuOn4j8sJR+VsyhEiZ4UAtCpP2pbwtdJXjiDsNgrj?=
 =?us-ascii?Q?YG+zdETEkqyGkE3WVbLC/s7TGkUbnJOTGpCj9PI82wBqv1gk0kY6LS68vO8Q?=
 =?us-ascii?Q?fr0F6XXRP28YqvvWvoEUj0HGG5uBV147+mFnw7nYPULGOzP0u0Juz0Nlgo6K?=
 =?us-ascii?Q?mcZ8EcVWbYojyWlcHZYKpldL/qrAaBPkYW7YkfdYJHdj/l2ahJiz84MXnMt8?=
 =?us-ascii?Q?VWQaaqjA1j4EeHR3NdJThjPchtdMTAi/cKEahj1wdgW37FqnRzYuWdCVI9qN?=
 =?us-ascii?Q?2pLjhmCqmLeoNg5zf6verEEbBIW2o4HzrDFNVaWqVqv7j0pxnaKuncufHEAw?=
 =?us-ascii?Q?ZBqFjs+ZEVh6nOpKEwF4EV0N18j532x5Mrz4t0+2spkwzNMeeEnJCUUpuDSx?=
 =?us-ascii?Q?qkuhr/d+2Yg1YnKfCK9mheLDDnMlEG4mM5IpLHr1Qj20ervcKSPA09uXz8wP?=
 =?us-ascii?Q?0qA+hqdNM0An919GIDeu8+PoDfq1aMcq1h9Z/TIUXbuwkAP4rRan?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f666dd4-e8c7-4cb8-0501-08ded6bc2177
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:27:43.8551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPyq+y7mPxcWhJ5Yw36OeM+SolpWz/RojNIpf4lCDOLkI3ULHQbSZIaIuSuYHTlM9E2wx0uuHKXKyqdzRoE0hC4OhI1SJlE+BWUIH9TfHy5EBw35tf9L4bTTCk8Ill57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11948
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15367-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@c
 rapouillou.net,m:b-liu@ti.com,m:p.zabel@pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCPT_COUNT_GT_50(0.00)[66];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,SMW015318:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.nxp.com:from_mime,qualcomm.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05D856E5EE2

On Mon, Jun 29, 2026 at 11:12:33AM +0200, Bartosz Golaszewski wrote:
>
> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pmdomain/imx/gpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e1395c413160c950 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
>                         domain->ipg_rate_mhz = ipg_rate_mhz;
>
>                         pd_pdev->dev.parent = &pdev->dev;
> -                       pd_pdev->dev.of_node = of_node_get(np);
> -                       pd_pdev->dev.fwnode = of_fwnode_handle(np);
> +                       platform_device_set_of_node(pd_pdev, np);
>
>                         ret = platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
>

