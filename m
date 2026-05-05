Return-Path: <linux-mips+bounces-14456-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMaHGwjO+WlHEQMAu9opvQ
	(envelope-from <linux-mips+bounces-14456-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 13:01:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3154CC10D
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 13:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4820302AF1E
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 10:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74CB37FF7F;
	Tue,  5 May 2026 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qeZ9Rddy"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC337FF63;
	Tue,  5 May 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978143; cv=fail; b=Y/Sj17oXQ5DwmqgN4POcSrRr2Li8yvMxO2GgVtLQIeKGrhm04PPe+LzwMzNdXIPJq39UZplo3YHNkuz+U7LU9pL15IJQROJbtm/jxKqZVK4QdpU4jMxxcJvlyZ4KqxGU4wUMIgqHaFZNRM18wZoIXzWCpq9Q0IKjZT0XuFzBMZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978143; c=relaxed/simple;
	bh=nOFVgPNaa8wRWXWEw8cjvFPUcbmLwAYQkNy1B0UgJUg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JJIIczSqOVpiBQiahy5o1SJOosy4o3hpvXgHttpHy2UAviRxqxjAkSu6M3lalSkW/CM3OMQ3SiwAEDt0VOmIvgRkKDIuWbsUISAtEyfwXe/V9qWW1Wl+5mQcCU2vfiOumzpMO5toDNWAUmxfB4GfCjQlLrxJK5mpeSa8w9WpJiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qeZ9Rddy; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILHdNn0/+OwCMSsyIdTyB0GdkcGJ9KE7KnZPQrqp4BPUCXnxMejgyF9Hcxq0chcShax/QFugbamCaZsrXyrVPZwR/fpI4LuMwImRLAcJqkV4yzwPqlioFBmrwifKr3Q3iYicQWOUkCBxKnfsBCuSeqiMF+QLqDUwe4QESb4WYR578IHAAH/lAWB7N2wbhUwMCRAZRVXiv42e9KzYVb1HDwrBE3El1dh7QfdoNfSL9ivAd0uh/L50sD2fT4sH0rLDuM7vgH8ZmthrLf7euhyx7ErOBSLIqiP3/OlQWKR/JRPVRcYMOL3Q1KPIjy+lkCWMF+ECNrr2iyxK+okyB5GxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tm4cieeyxWKQJzP/gn+NGwTwMIETon0wksSXBN3S/3c=;
 b=apBaRGdU/tfjnJLZPfotvBQnECBHBerzJRjZnjSVKJJu8/yGP6NNPZos+htOUQVASmVYivrF8qHDdtKsaQl+Y/z+RZovXd6SpX6ESmiUeKD091QSYZ1mVtqA47SA1Iep2k8go42YwJyaEpQqz2xjH+Yo2NsP/DgrzOmmSpNHQmflguhrf3QAWBHp7nmbHts+3FCNUBf5olxTV3gfJV/jT+IY9QOnvqgrkrmOuWfXt43NzCKHJ2TzVQOBGEEu5trx76dHrLGAzbgSFiYrNHPe3nw52lnxfRgwJgHqNZVS+MwFLTrnYLB2T2LxAmYQ60jVwW1txa59mfpWmbKU3X1nUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tm4cieeyxWKQJzP/gn+NGwTwMIETon0wksSXBN3S/3c=;
 b=qeZ9RddyR0egP9XPS40m6fYA8mh4UyWWpX13Gl7kFEVEBrOB085OinK3Pp9I+u9LCkbmoJkwW9KR61L610L3uImSAMO27kZOdxmJ08edcrbCkmr1pFylh8UdtcTPIs3myIRUbRcDU8OjnReJYzz4fOGoNnRiVMv3SQ3ZHvv71zk=
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com (2603:1096:604:39f::5)
 by TYRPR01MB13639.jpnprd01.prod.outlook.com (2603:1096:405:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:48:57 +0000
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796]) by OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:48:57 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
	<linusw@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang
	<sean.wang@kernel.org>, Paul Cercueil <paul@crapouillou.net>, Tony Lindgren
	<tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 5/7] pinctrl: renesas: rzg2l: Fix type in
 .pin_config_group_get() callback
Thread-Topic: [PATCH 5/7] pinctrl: renesas: rzg2l: Fix type in
 .pin_config_group_get() callback
Thread-Index: AQHc2LbDaLcnwsT7fUmZ3K+TtxHxDLX/R9sQ
Date: Tue, 5 May 2026 10:48:57 +0000
Message-ID:
 <OSCPR01MB143159AA54CC67CA063A153C9AA3E2@OSCPR01MB14315.jpnprd01.prod.outlook.com>
References: <cover.1777562725.git.geert+renesas@glider.be>
 <6befae30f129daffd94f7a9507d874443e444a21.1777562725.git.geert+renesas@glider.be>
In-Reply-To:
 <6befae30f129daffd94f7a9507d874443e444a21.1777562725.git.geert+renesas@glider.be>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14315:EE_|TYRPR01MB13639:EE_
x-ms-office365-filtering-correlation-id: 9b54e937-302a-4af5-3e95-08deaa93e8e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 59/+zX0HuBCY5hf+CcQWTy5r8uvLCykxq9Wds2lKVhPu/1YkS/NOkAfOTSuCSnQ7RMBoV98Bo9b9P3h8OOlJ5PN6AEVW3uYPz3PgvRHU6b8RYE1zLH7DuVF8JqbTR8qtAfEGYgsQ77X8yRPWQLmx/8Jw/D4D6496M2dFkTWVRHeXZWHe1v8Mtyd7nqFGLn2MrClh95FxIEC1mv7RFC+J4ZYdu8UUFcWHgSLeDpunIzMC6+zFgoVL7alTts02jgE/8ABb27VxsvRrVOfnkV+vIjjfiirI19hwOlr6HkVI5GVgHfdRmeJqejR2RN8MMwl+OoH/m1HS7EsiEBSJBoTPtQnlGWF2AqReiyv2kOcOhu46cWcQkarRqxyXQTYSKRVLeOwPLK2ZKjk49bnf7CpySHmOk9L6Y7SjA9hMEX3eQucfyIJXdfWKyny0uienuA3uNNyWNhx8RDZISccNmOUfo9Onnw1fOpO4+P5bFFIhdCRLo09uJ39mQ7pCPLLQLNQ4PpT1Wf3mrkpWLUBs4hk/U83WepzbpOGneRyYk5GAa6nJFPeszhu1H7uchagc5MADipybqXSnJgjldAzquBnpx58+kiHAH1hW8viwmbRBBxM47C4yGTnDAIoaQwHQUA9x2KtZAyR/eMPQqcHVTFdSP3UzT+iSiXUAt/S36c8csG1rV7c9VsaoxE9q1f9XoyK6GBvQvR4hJ/GoyiLHkjfe+UOF6QGDSwhXMIwZpxCwwqAAvJ/m0eYAtLPxdceBYxZ4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14315.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1EF2QJID3ZyaQJ/TPJum5jfUoK1PB5aiNNWtuBCrOiQwDFBZMHtIV3CYr8Pf?=
 =?us-ascii?Q?YvSo/kTH3XZjSX9hpT89KWJGsyk+ktTa4PJlIfgPdbS0d3ZsJTUFJ0g2z1ad?=
 =?us-ascii?Q?78hOlf65zrKCOysAtxLLFdnqKKU7xF/J7qYbykr8D2J2LSyOkdxIzCXY/tw4?=
 =?us-ascii?Q?+U8Kqvw9cwR5FB8XDXDXyi5tswXZqtpP+62gp9e6z0rtNnQAnBhgf/4838PO?=
 =?us-ascii?Q?MMyzdafmKLflkNP/FBeaQKpLaKbdhBTSSrs6b95JlukDt+Pr5mBqRYsUcEIy?=
 =?us-ascii?Q?WSz5CNFzhac5R2b7CTDkJ6d6F4fZsx/zzkLTrcufFJLcvvK5SBXdZt3zG6lN?=
 =?us-ascii?Q?9zbA4dUzP680mc9rB2UdiiSK4f9eDAqMKf13Y8rUgbFRLi+5w7A21pacfzuk?=
 =?us-ascii?Q?OrZyABR69p5mHh+r0Us4SUMtJhriG/YcmR9xakOiIpKaQpHch3WPU/vk/Yuh?=
 =?us-ascii?Q?20Bnih1mXG492dK9j+k5eh5PB90BaoQKe3NWxbwNIJ79nmKAvTLke01bi9Rl?=
 =?us-ascii?Q?aGNzXnfXo9CVWPBW7RdqEmsP/cOuMbh2yNcDuiFywPa/KDfnPjhfpnrb6GbT?=
 =?us-ascii?Q?dMnCejLqx4UwzHGpd6GYZe/53m69h7Z5eSXrO8i4e9e3jm5hDPYsin4zlu8Z?=
 =?us-ascii?Q?kE15mDu7oiBPrVSITdLRtjkYFK1kFw0M5sScaxvzh3R6AEdu8KDiH5yfM1iI?=
 =?us-ascii?Q?BMr8ptOSL+WXzass/a5JdLXwQIAC6AGahhEs8lvph//Nems4+xN0c0+fjVy8?=
 =?us-ascii?Q?jH00O9lHzJyKxL9tZJJemaXFmoaCtul2stu4p8Cl8Eq35d9oq6scm42X2tdT?=
 =?us-ascii?Q?xj+6MhW5jIMYxJXvY+EQnO1iOgxXqdYxIrNlyyN3vjcyN2SIYH56iZj6JJM3?=
 =?us-ascii?Q?wdw4b7meFpq4ngBrbWZq3NKeH9BgHsOeiot3C9WJsDVNwnPYARDlT0Dk8nk5?=
 =?us-ascii?Q?cMUA+IgfYpNy2fKRjSk9NMXlKr3UxOGGoKxYMbmDSN56Ig+cENnPAi9TkXAZ?=
 =?us-ascii?Q?cmvsZRdtUrWQ2R4/UGH0j/XxgPjBH7Y08ziIkiOuyExAuW5vp96hg3KF1pX7?=
 =?us-ascii?Q?KAguXjrVmLAqOkSEqy+SQOvp5vvjb/cT4bsSMX5cZ3R/yd9I5gQvp8Jnd3Ae?=
 =?us-ascii?Q?eraJe0WsIHkUU0eT2++IqZGuvJzI/9cUCMWKOHqTiWT8adl0OI1j0AOmYEYB?=
 =?us-ascii?Q?P1V2KvfNAI7zMLShtaIpXm4nwmVlPnSXTM9AZSJBMTZydqMjeqGtJf6f1LYp?=
 =?us-ascii?Q?swb2j/gJYr2MFoswRBeZb599IjLaijDlFmaxEDfsHycE33vzBOnB2c3S0KZc?=
 =?us-ascii?Q?amJMcdOZtJs/OmcbNeDalzdyWYyhZBGaWQ1p/Yt5mhhv6tvpTg6RldpOc7Ze?=
 =?us-ascii?Q?slsAn8e1zVuOtrzlM/ByjQg7WHcoMR3Sw4qFWzweLMh25C3eL26R1c7EQIuC?=
 =?us-ascii?Q?SuKmwXIkEhqIRhoZKWYoGSgR27jCHfG3rhN9lqRUyaP/2U/DjRtfgqU5P8NP?=
 =?us-ascii?Q?IeFwUoNdnpI7ib5aLr9OVZyeKj8inUxPRiJT+q4uknD/bAp+U1NXKQfyuMQL?=
 =?us-ascii?Q?0YZb+DG5b/qGrZQwvBeonMzuDtcds2IxA6kuqypeUnD+TqyXsqjwAg1EWI2+?=
 =?us-ascii?Q?WmCP3+lMqNvdt3WDUwa1OyxSlxoKk1DFsmnvkoljiQ+5WdjVIqHINySvJsj6?=
 =?us-ascii?Q?Ql2G9N+Y5on0oskqpyBT38N8nNa3xQl8GIC0hZ+UCVhbRFKriMcM9I0NPOgM?=
 =?us-ascii?Q?vUP5RbWqjfiO0skJwA2WfeZ/bzrv7FemA4Fw7ayamQJXDgL0lQHt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14315.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b54e937-302a-4af5-3e95-08deaa93e8e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 10:48:57.7524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k3tX4syrsFTrIiHipUCVLnYmMmK0uRmrSOrSyuOvj5tNbD8WRp0DTtDxqay69XyBGtGffl1UwL2X5gaJdP5fUYSawpCdIuqc2LqFyngBIXKOIv3mFBqcb/oGApH2mQBT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13639
X-Rspamd-Queue-Id: DC3154CC10D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14456-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,crapouillou.net,atomide.com,linaro.org,gmail.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakar.mahadev-lad.rj@bp.renesas.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 30 April 2026 16:33
> To: Linus Walleij <linusw@kernel.org>; Lorenzo Bianconi
> <lorenzo@kernel.org>; Sean Wang <sean.wang@kernel.org>; Paul Cercueil
> <paul@crapouillou.net>; Tony Lindgren <tony@atomide.com>; Haojian Zhuang
> <haojian.zhuang@linaro.org>; Matthias Brugger <matthias.bgg@gmail.com>;
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: linux-gpio@vger.kernel.org; linux-mediatek@lists.infradead.org; linux=
-
> kernel@vger.kernel.org; linux-mips@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-omap@vger.kernel.org; linux-renesas-
> soc@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH 5/7] pinctrl: renesas: rzg2l: Fix type in
> .pin_config_group_get() callback
>=20
> On 64-bit platforms, "unsigned long" is 64-bit.  Hence checking if all
> "unsigned long" configuration values are equal should be done using an
> "unsigned long" temporary.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar
=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index bc2154b695149809..5b0f23af5a6cc9de 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1647,8 +1647,9 @@ static int rzg2l_pinctrl_pinconf_group_get(struct
> pinctrl_dev *pctldev,
>  					   unsigned int group,
>  					   unsigned long *config)
>  {
> +	unsigned long prev_config =3D 0;
>  	const unsigned int *pins;
> -	unsigned int i, npins, prev_config =3D 0;
> +	unsigned int i, npins;
>  	int ret;
>=20
>  	ret =3D pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
> --
> 2.43.0


