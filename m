Return-Path: <linux-mips+bounces-15060-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4mHNMrspLGooMgQAu9opvQ
	(envelope-from <linux-mips+bounces-15060-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jun 2026 17:46:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574B67A997
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jun 2026 17:46:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=n4CDgnwV;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15060-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15060-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 920C33036437
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jun 2026 15:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3361839891D;
	Fri, 12 Jun 2026 15:45:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19011080.outbound.protection.outlook.com [52.103.23.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8235AC11;
	Fri, 12 Jun 2026 15:45:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279126; cv=fail; b=pgd+QY2mIFVb0/2qKryWT7nZmIqoh6DMljinzYklCdEs2WlgLGeRdOV4z2nUdnlBUo966MimZxUI3kWpegIF7wM18k5j6euKxa/ymaXCj/kFgwxqvGglSA2UiPNasQtQ6UCOYYEGnKmeCHB8j1HtZZaPD/Tra9qx9nOS49q1MNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279126; c=relaxed/simple;
	bh=fE2x1VuhPhSPGSvCPrfF6YW2ujOYz9wx0xlnCmrWDH8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X7ph0tF6CcRO/I7N38pi2Z0qJxL5LAWx7fuYYnsloQKzSKb6vWdWqfOEPvH2+bLt2azWKXWWaXzeT6KGEz2nhRq4+Gn3X7+ZKarnj4BeHRF8kVu8SQ7+nedjilyBYZ0I046fQBD+hY5r8NcUhRPxJ2U2udjGXrqlOPDCPpPbkaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=n4CDgnwV; arc=fail smtp.client-ip=52.103.23.80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gpsxd6HjMwop+KzeU73xFICMLGfZbjHqP8s7AbvrW3MApdEu+8LuEbRjqeZImBkBfjQzl++xM3JQO85qSm39aYyNxum8Nf96NhA1Bj1KjKCdb4sZkXVuGblGhMwwGQioYAbJ3Kp/rIQyXOOQNd1hlLIWjT4eHXpxHis1wkF39eonHZ2pxyY8pmcHTxtUG/y+nbsJ0dVKRV7eaLpQO5ZUKTcrGCVTwwj9WSE4azYJE+JJ304cnAdfqGmWHbIrHHuew1XuFlxkKlEVfh2ZSdY6gdF0xV4fuRqZD10cDFIDRQo5e9VO43OFYdF2XBqhIdIiKmw2xPO5l2dpBSiixO9WhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2b+Uo5p0fDLRThJUtNjOLm5Xg59jboN8Z8VwOeE4M0=;
 b=gGJIX8uj/qaEfnh2zFiPgoOuHK1LLkR799PRt2xrr1fieX8UzkSJzl/tS86e7XAmM+VZ7la6ebIR1xpiiQOdOL1v3pBMQ9b5EUHfE3cmTdlquirGGgcuxnpNFQzWz3FMyQIq2JE8D15ame9sf3Zj+oVSPhR3hFdPpX95TL3ruPL/wbSzcmzOBphkfJCNTcIwsT9peCnL+6hbRB19yMPQN1s0HfTUJpxhbroyHd/zCyrkQNf+TmTe14+4wFSJmMSe0CkS+1XeK3V7IyjxelxXN7SFN/x6W/qTAK8fOfpV+j7BHGF1PQlc+XTp9BiOP+DCvNHw6livvgSpyX8xYLwYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2b+Uo5p0fDLRThJUtNjOLm5Xg59jboN8Z8VwOeE4M0=;
 b=n4CDgnwVxevcklPFZTvE3aaGxX+/dfPwUMCuy2jM/R9tjdqE/BQSp0gOZV9WoqJsWB58Osaf8ATB/R5N6jz3Exodx59BjwZawBPVa7FTtvS5wi4McIYB9evZDfnwAgIhFQ66XCEE4xAjWfFxOIBoF9gQkMOcTI2wOOaBjDF9xQfybEaVRpAPkztB0w8DKCyVv9EtmKPm3KSxLtd4bhG2oIuZ4FHebYU6OqViD1dFe9jup+gqbbpWwHsexUQLfzrJw3D4h0mID3wxd2ImpU0bQzFdhk8olXHTygrMhexM1bSirEA0CXGVV0Uwj3al+qTCk8OfDOBQckpCEDONMOEVuw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CO1PR02MB8649.namprd02.prod.outlook.com (2603:10b6:303:15c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 15:45:19 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 15:45:19 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "pjw@kernel.org"
	<pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "david.kaplan@amd.com" <david.kaplan@amd.com>,
	"lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"timothy.hayes@arm.com" <timothy.hayes@arm.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"oupton@kernel.org" <oupton@kernel.org>, "yeoreum.yun@arm.com"
	<yeoreum.yun@arm.com>, "miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "kevin.brodsky@arm.com"
	<kevin.brodsky@arm.com>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"tabba@google.com" <tabba@google.com>, "mrigendra.chaubey@gmail.com"
	<mrigendra.chaubey@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for secondary
 CPUs
Thread-Topic: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Thread-Index: AQKOA8X39m4tY91Ji20k4ddnJ9pPpAKdHzDOtMQT7eA=
Date: Fri, 12 Jun 2026 15:45:19 +0000
Message-ID:
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
In-Reply-To: <20260611133809.3854977-4-ruanjinjie@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CO1PR02MB8649:EE_
x-ms-office365-filtering-correlation-id: 7adf355c-50c9-4462-0a2b-08dec8999b4d
x-microsoft-antispam:
 BCL:0;ARA:14566002|13091999003|31061999003|8060799015|8062599012|19101099003|15080799012|37011999003|19110799012|102099032|19061999003|40105399003|41105399003|52005399003|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?K19KEHrYQNnWVCwQPbZ4LdJirckp4IQBTehP/3ugSLSDE44Nx+i0jcLYQflB?=
 =?us-ascii?Q?2fqa/zdafdSxDXyL9HBp3sZBliisSI5Fmji0MJlV+DC/xu5wyYkwn+PsiO9K?=
 =?us-ascii?Q?ig/5pQhpaL+UVLBy5MygbPUGVQWb1U0igg0hIY0DwwVzMWybBFmOX3GY2Q5j?=
 =?us-ascii?Q?Ioef2LLBYzR3kcrM0O8RuCz7LYPlxf95Oqq6vOlSdYx1rXCr2gf+uRKY9eWS?=
 =?us-ascii?Q?lyvrZaE6EY0RI6Ji+dIE4hXLXHN1qa5t0FSp35t7+F9SOijWV3+yK/W19y+D?=
 =?us-ascii?Q?1YV7tppLOHeJoQlQdzr8XLGfF1H8MJZ3ddiXufeIb3uKVr8J78w7kTAfnP/U?=
 =?us-ascii?Q?qAU7dnUfiQHxwyvXoUGqiGixiGantyG3YNX+Q4rl2BPg3awNn+GmipUmnqqi?=
 =?us-ascii?Q?XHUvyblC0XgNINDkava4urDwI9yXhJ+8drDc+LD2/YF7GseZwQ6ik/UCGTt6?=
 =?us-ascii?Q?8pJQW/E5RJz4Lv6+UZS8nNZPn1jWdpiobe0jvyNANGa1GhKj58rjkrEuPTfh?=
 =?us-ascii?Q?Ji1PJLfGA8y0Rpylv6Pzbh59i1TUad3GvaVmizv0bQdFOjQs0H1yoID5hL3q?=
 =?us-ascii?Q?61T2fc30QP4/DFcN6sPlWXoffuobz5kR/mwaXh8UXMQYvhllUR5yl6VZhQzK?=
 =?us-ascii?Q?xNUg8mdBfe6SkdpJnBit9Xb2hksEVIEcR2fj9TFxinYLDAQURVNCMIamEpmO?=
 =?us-ascii?Q?BiCQurixEoj7ocEM5JuQEREBG5rVTEPGxQ9sUQ291XozpzF3Z8p2VlGwngSl?=
 =?us-ascii?Q?5ZmyQ6qfq+gCdbHz/SwzR1FkyfIHfIc3CIolU4LCyignia0UeYtSNQ99aUwI?=
 =?us-ascii?Q?Y32Gi8LZ0mfJmamtkikfaH0Yvk7/CYIidFY5XtxntzVQQAv/BfuMNs+5nCYo?=
 =?us-ascii?Q?7KaheERniknXrI5q3bTwEVeYRchIfWKHwxX7l4n3cJQZ19njuUG7JztdB/v8?=
 =?us-ascii?Q?r/WCwX8YANguCLtCkvPec7cAvHZX+Uggt4G0746Cvl87qWAnEuQF9xDttD1K?=
 =?us-ascii?Q?hn2O0NIxpNV+cAkaiizU89hG5auoGlx74EASgyjeRiH4sYssKmN4JkOtgprl?=
 =?us-ascii?Q?o86dMyFG?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7b1sCMq8eINmu+IzNKsJR4NjgSt2hLN+P5ikjsFpa6Er0ls5iU38Sc29BIt2?=
 =?us-ascii?Q?50SMdHfKIpg0fv8f7FEALiqT+p2ZKmplErzgIOcoro+PBMOMZGVID0nr1scj?=
 =?us-ascii?Q?EvnV0kEFrz8KjvoiBJkaNvG5pT2PTeLEKzNGFxG0aE7BTfWorfN6Bng5p8oG?=
 =?us-ascii?Q?1GOphkAyoqLczY4GcdezGDtH5QdJB52Q9eyGmLjyfqRce8wMOcNZDzqNwGtb?=
 =?us-ascii?Q?cf1DhezLJwketTRGSza3IxAP3RJEhl8encdolwddp+R2wZQpXKRGlKsqDRRV?=
 =?us-ascii?Q?MwFNJXegzwXnM9pMAPg/+5gs7lbVaXpoKfQqe9h3jZMsNkDg/TQ6lKPM/uMs?=
 =?us-ascii?Q?ozk1buy5Oi1k7DDVdQ6tPO4tgP5wTpQFLCRdpfRsNrzKeCGamv3ZfQdQN7y0?=
 =?us-ascii?Q?V1OdpYJXAkrKrZI56hge1i8RkQUij+HDHQvdX9bxv/1kBA3b2yUVLSxXGppb?=
 =?us-ascii?Q?OQtGDy8HT4SFLxOqUNvNtTPLgR82TjujoNukNelTMQw/li1a7/Df1ns7FUNg?=
 =?us-ascii?Q?YYMHdOov3XU6XAL2qrlmJKA2dxnYG5hdb2VIGE1ZjSIStZJFYBTATR8hNWly?=
 =?us-ascii?Q?GEEh1y0sZulg4msC0og5NPCPUZJW3QJ9H1nqCDvlQJDv1iRhMgzpN2F8EZuw?=
 =?us-ascii?Q?JJhNLgm+NbZQLWHSqvS7vgLhk7q7CZt3HjMTR6drnLEZ1KvvJc4TR1X4Ah3C?=
 =?us-ascii?Q?ErgkeWT8U/DMX/qv2JvT6yN/KvEdPxmtFwe/jWLwD+143totusFiF7bMi3ut?=
 =?us-ascii?Q?330lr0DXt7X+JIciui+VGwOt95Sg1o6StJoqRqzKJtIDD5kuVidz8h4pHlhd?=
 =?us-ascii?Q?V64OLgRB+XBqqpsU1xW4pya3WhyReOW35+/4PhX3eBpNPl4/yBDSfPxtoDAF?=
 =?us-ascii?Q?/BeagbAwFiogc+NQAYhRQUJyufVsbugIC4wOgo4Yac9Cl/xHTYABE/X8Ctpu?=
 =?us-ascii?Q?KjdKjx3STVrSW0imt3z5gRIB3ln9JyNIZA00qhtK0lhqUXs+a8RQ8s3tjYaY?=
 =?us-ascii?Q?wu0sXpuZos3mDIkTaociL+3HJT8flrbe0rMbfLR44EHctHXaodAtx9B/N8YK?=
 =?us-ascii?Q?Tt56sf7ms/cX6Z9VtCr74Y0M0PnGzDfdc4FwmsvtMH/jcPjzOh7nipl1rNr+?=
 =?us-ascii?Q?T5byLQVqjANySOqBaEvIQhVpSOJCheKLSGeDUEeS00hxnC2gEWuVa3h3nZ7X?=
 =?us-ascii?Q?tJG2kyceMV+Xq+sOzWiah9gL0BspRmxCW/I7kklSrEkKeyDJHMP+Etkq1t0y?=
 =?us-ascii?Q?Yh3Q3pIW1pTYFg1PoTZYv20FMrF+aJx3LHlgshWY1oq0UwBbKKT7bKrvKZFJ?=
 =?us-ascii?Q?SLWkS4TQkVOE6n8HbO1VsibwpWvpm5ha7c6MFEKKpO+Kzfh23pW+j3RaJuCP?=
 =?us-ascii?Q?0IB4ocI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adf355c-50c9-4462-0a2b-08dec8999b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 15:45:19.3996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8649
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	TAGGED_FROM(0.00)[bounces-15060-lists,linux-mips=lfdr.de];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER(0.00)[mhklinux@outlook.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[huawei.com,arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhklinux@outlook.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:from_mime,huawei.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0574B67A997

From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:3=
8 AM
>=20
> Support for parallel secondary CPU bringup is already utilized by x86,
> MIPS, and RISC-V. This patch brings this capability to the arm64
> architecture.
>=20
> Rework the global `secondary_data` accessed during early boot into
> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
> enabling the early boot code in head.S to resolve each secondary CPU's
> logical ID concurrently.
>=20
> To fully enable HOTPLUG_PARALLEL, this patch implements:
> 1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
> 2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
>=20
> Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).
>=20
> |     test kernel	   | secondary CPUs boot time |
> |  ---------------------   |	--------------------  |
> |   Without this patch     |		155.672	      |
> |   cpuhp.parallel=3D0	   |		62.897	      |
> |   cpuhp.parallel=3D1	   |		166.703	      |

The last two rows seem mixed up. I would expect parallel=3D0 to
result in a longer boot time.

Michael

>=20
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/Kconfig           |  1 +
>  arch/arm64/include/asm/smp.h |  8 ++++++++
>  arch/arm64/kernel/head.S     | 23 +++++++++++++++++++++++
>  arch/arm64/kernel/smp.c      | 27 +++++++++++++++++++++++++++
>  4 files changed, 59 insertions(+)
>=20


