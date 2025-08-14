Return-Path: <linux-mips+bounces-10292-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD74B25F79
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 10:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F32EB7A668C
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 08:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3088A27144D;
	Thu, 14 Aug 2025 08:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bkUq5WZY"
X-Original-To: linux-mips@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011026.outbound.protection.outlook.com [52.103.68.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAB81DD0C7;
	Thu, 14 Aug 2025 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161301; cv=fail; b=mcU7qJFOmU6IxyL2pu7fNzKXmz2kLHL1Qs5POUefp/yiZohsE2vuTQ9OYjl8fKJzo1kXdMqSHlxj1wqCZ5WOIFvGgYWfVavyvHfN9EUvrmcK9P/3hjr79yS5oXn9qAAqK007LcnX+vM4m6nY9ZRhhMs/O9Nj+G7eiwS2aEROpw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161301; c=relaxed/simple;
	bh=npXqHw74q6C7npyCpXtPekEvAZMTsiN7MJYbpmjw5zQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B0iAtBz8nk49vqonMIvpTq2I2baBcIbf1nEpNuwo8ncaVTM/39Wr/zFFodbSEJm6Dm2xHL55zuovGCPQIPMLALA75JEuIeWork782diTGInRm9v3I4ushtSWK5LTaWRxZGGpV4nDX5ytY9JXeJ9UKwtePTUeP2F9AUtrxou29KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bkUq5WZY; arc=fail smtp.client-ip=52.103.68.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V05/rQYhjgXKvtCU/4f5QAbDxj03OeC7sNYSE2y9W++Mgh8IlfcxNNBuPYFVotnc32QvOQKu8KCg4UyHhRbfPeQE2oMgJnS42h88cDLaOjlsEkvugADy0HV+OhFhPFE8GouGfUZvJS1w9VHxmlSsIMemVOhRh+6tMjT913TOXqqr/DFCdos4zHpxTItpl0C+whLUshrOsUQN+kcYCdeCRrNZyW+hX2qrYnyPDEGmrPeQ37xAJJbimIawHXSdWOH73Ac/IRGBogdoPuBGAVp5vqrOgMdROjzF3XSE+gUgA8fjI07u8+FivHW0DI5lWTxe1wigffbAD5wTR/oZbGhw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ACe8AHuhmUm8RQCLguFaLp80YsDyGpX5pwpLxKQtfU=;
 b=YmW6fV+mf1zXe8Cd3u3j6/fmlPq0iXwPAtjrkEA1uekK0jfBzScUxOIeHvUK/9WHtn8Xg1kmYvvcd9IAap4HRj9jns3OrkLScsVasUzkU+9dEUyCQplByVqZIBTc5z8nLFxHPVIvXFiDSkZRCy7wM91rK8Xk8Cr/zWPpB3VICmKePgIhRONhTdx2aRrjVTpFquxZiwRmJ5RYqKmHLADGlkFDruYkwy17+KHH+cHY+haohoO59cQ2dJWqR0tIB8YAWf97ewuedVCGm1txtP3AzzXbXzMG29uW7mEHSzXN/GP6ItxzrevMkYmvFu1+EFpehEDYYkosBu8NI+7q8H25Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ACe8AHuhmUm8RQCLguFaLp80YsDyGpX5pwpLxKQtfU=;
 b=bkUq5WZYQPuSVfLcJzwnBmDWZKX5ZHUakDxhDVK7l7ga3HbKfRk/h+ugHwFkaDqxHOonxD1UmUVMwJXHqLgHAcz/oPTnzjBTlAr/ItL7wSPWcfBqHWQEyejZVOVoQfFE7r5G1LMKlitCNZFQ1sHBDyPP/Gd0RV67CnV2wzMqF5w0XMLdAX026oAfGfs2h+10glRS9u0fLas/FCutDY972svRSG0F3VdAObrDQntKxnvVT6UWFSqwZDNyupNhTo4nbeoFLEXp1ipjiDkwANgICutrw3LavvR7hzaxfJHABmjf5XRcwFo/K7vBoN5ei1p1fJGeUlqY7w0p1ALZCm3hZA==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MAYPR01MB10650.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:158::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 08:47:53 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 08:47:53 +0000
Message-ID:
 <MAUPR01MB110724C32BF11045318A6AE0EFE35A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 14 Aug 2025 16:47:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 048/114] clk: sophgo: sg2042-clkgen: convert from
 round_rate() to determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Andrea della Porta
 <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alex Helms <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0179.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::7) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <9fa46633-da56-4a5e-9abc-0445c3799b12@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MAYPR01MB10650:EE_
X-MS-Office365-Filtering-Correlation-Id: 6142f3f4-d83e-4fe3-de5e-08dddb0f4186
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|6090799003|41001999006|23021999003|19110799012|8060799015|461199028|5072599009|440099028|51005399003|40105399003|41105399003|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzMzS1lYbFNxeExQWUNGb0VpN3V1bUkvbFlpbU03WFd4QTZNS0JNRVFKb1I1?=
 =?utf-8?B?WVFNaFRCWGxOVDhZdkRwUlhzaGsyQTE0S1JJUlQydlcyeGdHOEZpeGNJYVln?=
 =?utf-8?B?dVdTd3JnZXVWRC9EN2psNEtGdTRFYThkeDEySWZnT2Q3U1doc0NVRzZIQi81?=
 =?utf-8?B?VkFWU0JJVjNRMVJxLzVjdXpqZ0JBdDBscVF4S2RITlllNUM5UWtEYStkY2Nv?=
 =?utf-8?B?ejdNNzRxcWRUdlBLYS8rZTNSNjFicG1rMGxEMG8vWnpWSFVxempFaVhleVQy?=
 =?utf-8?B?ZWxWUG5KS2s1Yk5aZmxYaDE3QnYxRTE1ZEp3aUJqYXVENUpNWHBSalM0SjFF?=
 =?utf-8?B?ay80dnJwVjA3Vm1oSjVvVW0xYWNNenp3ZnY5eTQ0Skl0ZW5Xay9maC9OWGpQ?=
 =?utf-8?B?MXZqZS9WN0lmMVh1OUI5OGN5UnRHUHRqNXlieWwyYklmVlRObDVyWjRNczJI?=
 =?utf-8?B?eHhxYXpYcUNtR3cvT3EvQ2RycG1MZ09pUXpTaWllbTZ2TDQ4aXlObVlzS0hW?=
 =?utf-8?B?bnhTT0cvRlgvKzI0cGVwWEVRZ2l1NFgrRHJ6QmZaWWdyNHU1ZDVObTNxZVJL?=
 =?utf-8?B?VzE3MUhBR3kvbmFGTUNOZWk2M3ArTXdaY0l4UWxNb3NJekdwSk0rZEtVdXFn?=
 =?utf-8?B?ZTNlakd4OWN6WG9KOEU0WkdWWXdZSlU5b05TU3Nlc3RlUEhDS3hpVGVRb05m?=
 =?utf-8?B?Q1dBVi8xOEZESXp5UWN3REhlUnUrV1dwdno0U0RGV01nZTFmWU5zM05YY2Zx?=
 =?utf-8?B?RGsrNmR5amZzcDBNYVEvSGNjNVRZaUF0YlRteUVqMVFmNjVzd2h1c0NEVW1n?=
 =?utf-8?B?RVdNU0NJcm1GSDc3ZFdrTDJyeDBDZDNRNkV1aTZXV0RSNzRTZC9Id2toRHc2?=
 =?utf-8?B?cVNPOU1BMlJMd01PeWxZM3BLN284cXRuMUlQME4yVDRyaTM4Tm45ZkErSjZi?=
 =?utf-8?B?ZVFMS29jeXJ5Q3lvSjlCUEQ0YlBGZzN2dk5sTytWUFFWS0hHU3NqQzNwUUhn?=
 =?utf-8?B?SmlZTXRmK3pmV2lTM0YwcFNLUFMrWVpjcjJZOUxuYnhVUnZDQnR4NWhpUVFo?=
 =?utf-8?B?ZnBFdW5taEJJTkd3eVg2NGxXWGw3UzE4bkkycjVUdW5qQTZPOVJZUGZPMUwz?=
 =?utf-8?B?RXE5SmFOaEgzR0hwVFE2dytzZ212V1BJSjJCTUFDQXQzV3F6bUpNdWpQanZo?=
 =?utf-8?B?a0NwU0QreWdjUndsMXRBTVNnMzVaam9wTUk2aDAxT0ZPd2RaN3lYeU5HeldN?=
 =?utf-8?B?Sk96TU5MSHFlQ2gybC9FQm5zejVmRXNFb0xBU1l5bFJldlpQOGRmZk8vYmdq?=
 =?utf-8?B?ZHZORWpHUGFjK0FGU1p3VkpXdEYreUMvU1ZTR0YvUG1wUW1KYVpIclc4MkJs?=
 =?utf-8?B?b1JLOXpjOHJZNkV6bzR6OEdzbndCdFN4T1l2QndQNHRaVmNOTG15cHQ3RnAx?=
 =?utf-8?B?SGUwa2tOVllvTTk0cEY1UXdNUFVvMEJnNVdBUW5qNzVyV0RSd0puTTJldm5C?=
 =?utf-8?B?a1o0RnBRaHhtcDNwM1VGWVU3WnRMWUNOaEJIVXd1ODRmZURXcVY0RGNRZFk0?=
 =?utf-8?B?RUZ0a2ZvcUJJZi9lUUVrN1JYTnYxMzJ4amk5REFRVVNrTmpNNlJMTXBpdTlF?=
 =?utf-8?B?YUc5UFZxUHFxZWhEa3VGL1VFSythLzNvUXlzM2VjazRDb1FYQ2JqdEVqcmJX?=
 =?utf-8?B?TlNrcklxaTJBVTM5OG0wNjRWT0FzcFc5czZkbm1nL0FXVzlhbVhUTEpRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0hnaDliZjRKZmRxbnhPR2xlR1BVRnZPUTl1dUtxeENGSXhRU05zdGF1aWhL?=
 =?utf-8?B?VnlXRGRTNzNHdlRMWmxWNk9XK1VaUGxKcTE2Q1V6UFIxMUxjTWhsbFMyTTg4?=
 =?utf-8?B?RmhqMElETG0yc1NsQTFVZ09JN1VINklmUFJ2TXM0SGVQRW9BdDRCMkRyRGpF?=
 =?utf-8?B?QTJOSU1VN0lJNzViTk16Vko0aVZhY1ZVb09RN2F5T1lKakR3TDNPVDJZdlJ0?=
 =?utf-8?B?TjlHb0EyNkk0dm04UEM5MFozQ1V0QlpraXhiaVZnRmVjZkhBemhZZjVxWjky?=
 =?utf-8?B?bVcvMTlUeFRFMHAvY2NPcEJsTFhudk9zQUtmbTBRWVppdkdtaTRpZmV2Z3hV?=
 =?utf-8?B?dVY4OG1xeFlQekVnNkI1bFRyeHJZd1VhTk5jN3BkNmtCZFFsV2g5Vnk5dWhI?=
 =?utf-8?B?T0tGT0FVMVVXdXNKVjI0OEhEWkNmOENpYkpUSWtrODRSU0lLN2k3dXYvSUN0?=
 =?utf-8?B?OWxYK1JDeGZYZytLenRQbWdYZnRpUVl0TUhjaHY0c0NVWGxyQ3p1dmM0M2Jz?=
 =?utf-8?B?ZGMyZXdQTFQvN3Z6MU1LbGNjNWUvSy9YZldVTHJUYkpLTXR5eFkzTFN5dEVU?=
 =?utf-8?B?SzY2NW5hN1dmYU94WVk4cklXVDRlTVY2QzZveGNucDNkeVA0TFplOGlNOWxF?=
 =?utf-8?B?aEE1dlNBbE40eUI0bHhjVFdIMTVyMXZlWVpaYnhrVEJ4SXJDVTB4MkF1OG0r?=
 =?utf-8?B?WG1Wd1p2K0QzWTlBQnI2bGI5OEZnQWt4bHRDTXdsWHp4Zk03dHhsSXpTbUFv?=
 =?utf-8?B?ZkxkWmd4ZUpLZlAxdFJrRG1YemgyaGE4NXA5Nkl1YlJuaUZKSnhnN1o3SjNh?=
 =?utf-8?B?MURsc2hyWlZHM3hNYS9Vd0F2c2RTcUNHWDY1OVloMzN6VDV0NGVOZFk1YVdq?=
 =?utf-8?B?L1IyQU5oNEVKTEZxZjZ5MUUwYzRZbms0VU9waEpPbVd1M3VTUnUxT2VYcUdB?=
 =?utf-8?B?cW0vSUR3cWc0Q1RaSmZLcTM5b2N1MHZFYzFQaGVGZ2U5alhzSHJIcHRwY3Vm?=
 =?utf-8?B?U0F3RUREUFVUeVMyYytmV0puOVdBOG1ZQk14N0VjS0JwQ1Roc2dnUWFJekhv?=
 =?utf-8?B?WTZzbGNDT3JTdGkyVVM0WlZteDUzVm15WkRlU25naW42cWxXZGpPT1JqbG1O?=
 =?utf-8?B?S1hoY2hvcFVENDEyL0didUsybXdORlJXbk5zTlMzdkF3NTVYNWtDUzVOamhz?=
 =?utf-8?B?Q3lhMmU5MVM5enlaOW41S0NnNkk1MUY4cmIwNXFsVkVvbXR6dnYvb3hsaTFq?=
 =?utf-8?B?K05hejdEZnorcGFMdFh0eGtSTFFjdlBoQThvd1NJaWJsN2tRdm9vejMwekl2?=
 =?utf-8?B?MXYvSmpzSDFzMW1rUU5xd0E2Mlo4TXRDVDlueFM4YWh0NUNCWEppb1EvVHRP?=
 =?utf-8?B?OGg0RjlMZVhjdzRmTlltQjJPMUg5QzR6UG03VVhCQ1Z3NGxsRXZ5TzVmNklu?=
 =?utf-8?B?cHptQThBQnlSY2NGbjM4NXF3UHRQUjJVaXVzVEdKK3RjMWJTS3hUYXlFWFlQ?=
 =?utf-8?B?VGFCSWU4SU1CR0xtdEk2bit1Ylg5SnZPa1VobDVLQlNCeWtCaXU3UzBnZ1JC?=
 =?utf-8?B?YjB5VTdoSWdNcjFaVUt3aXJnTG9Hc2xDS3VRdVVNS1F5ZUJQbnFEQnk1eTVi?=
 =?utf-8?B?ak1YcVRjQWExckRqaFdHdExvT3R1c1F0TndSemxiYVNyK3BDWWRQbnljeVFL?=
 =?utf-8?B?bUdjNnVONFMrRXRuWCtFTGVhcGllNW5jZzFHbGVmVFNaZHMxY2RNTG9mSllt?=
 =?utf-8?Q?HiiQSi6qSTmGr3VZ35sO2PUgCofgcMYgFPTtdlA?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6142f3f4-d83e-4fe3-de5e-08dddb0f4186
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 08:47:53.7093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10650


On 8/11/2025 11:18 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Same comment as Alex. I will test this out after you send out v2.

Thanks,

Chen

> ---
>   drivers/clk/sophgo/clk-sg2042-clkgen.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> index 9e61288d34f3757315702c355f2669577b29676f..1d3b1656bcf2e6655e0299e68ab39f32189744dc 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -176,9 +176,8 @@ static unsigned long sg2042_clk_divider_recalc_rate(struct clk_hw *hw,
>   	return ret_rate;
>   }
>   
> -static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
> -					  unsigned long rate,
> -					  unsigned long *prate)
> +static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
>   {
>   	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
>   	unsigned long ret_rate;
> @@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
>   			bestdiv = readl(divider->reg) >> divider->shift;
>   			bestdiv &= clk_div_mask(divider->width);
>   		}
> -		ret_rate = DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
> +		ret_rate = DIV_ROUND_UP_ULL((u64)*&req->best_parent_rate, bestdiv);
>   	} else {
> -		ret_rate = divider_round_rate(hw, rate, prate, NULL,
> +		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
>   					      divider->width, divider->div_flags);
>   	}
>   
>   	pr_debug("--> %s: divider_round_rate: val = %ld\n",
>   		 clk_hw_get_name(hw), ret_rate);
> -	return ret_rate;
> +	req->rate = ret_rate;
> +
> +	return 0;
>   }
>   
>   static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
> @@ -258,13 +259,13 @@ static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
>   
>   static const struct clk_ops sg2042_clk_divider_ops = {
>   	.recalc_rate = sg2042_clk_divider_recalc_rate,
> -	.round_rate = sg2042_clk_divider_round_rate,
> +	.determine_rate = sg2042_clk_divider_determine_rate,
>   	.set_rate = sg2042_clk_divider_set_rate,
>   };
>   
>   static const struct clk_ops sg2042_clk_divider_ro_ops = {
>   	.recalc_rate = sg2042_clk_divider_recalc_rate,
> -	.round_rate = sg2042_clk_divider_round_rate,
> +	.determine_rate = sg2042_clk_divider_determine_rate,
>   };
>   
>   /*
>

