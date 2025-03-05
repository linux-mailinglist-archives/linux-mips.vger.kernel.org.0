Return-Path: <linux-mips+bounces-8093-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D08A4FC66
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 11:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0543AEC97
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 10:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3CC2063D6;
	Wed,  5 Mar 2025 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="sladbzdB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671CF2063F2;
	Wed,  5 Mar 2025 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171006; cv=fail; b=TFvoSKVTXb2W7lXvZAn6FZzXwg35NMR6+GHqdup1A05xP6TVtBD9e/9ll7mhKpnRavZTQ2p/K8BgVzQJ310aa8VwprpGRNIOvACYbzzWhRjrcpCfsVbhanTpKSDPGxSW5pBDcqY2zRPGhPty3q3wloIIrFbo8H795LGCxyQk3D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171006; c=relaxed/simple;
	bh=Z7L0XGQ9STX484/IM0i3UAZmVdqUKHfLWcX+TvOHbKY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U+glHEmswt7l78MA9f3rPFDVIU7cRmnjGNe/Y8EFW9dNQtN5a1YCLQDd2+hKITPJhCCuDNYUyYDJAurpXqk3wqHPXtxABamaA0ZZIusO4eWLv9JWdhCGKePKZZZ5Oz7huVWDElR4EvLTQ3O8gPh3TvO/tb3IQ6TCNXqiESF5IGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=sladbzdB; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5253vi6x028990;
	Wed, 5 Mar 2025 02:34:55 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 456f5tgnta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 02:34:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPCcibAdjXNq9edkhhjc1I8iupyMyyXi9aeGKRx6SutgxFlhb5PS/gKE2sgoNVE17oE11V3FkA27jVpmBy8wt4a7UnNOFLpFxCOklnE7p1/0PetM8UkHbdwVdixmnVBA0WCOi5JcOaHxUDRsuimGDtrCxZGqkZ7cO9IuumfKXxL1lhgESV19Z/ixEGP1EFHB2FScOaxD/YX6hSLzgcy32GAqj8JhSj+PFK9/JvFhQvu5gK1CtpAMlzs3kHW/3xz17GjguP3wWFE7SHpOheIcgYuqXWS6ES1p0NdFZmTCZ16kLjcGdTdBtUn4r7mEVpj2RiRCGzcjQQAyoWAfEbRE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7L0XGQ9STX484/IM0i3UAZmVdqUKHfLWcX+TvOHbKY=;
 b=pIwXXWpsD5K0zFyML14l7Q3Nh3U4QvVFwx/YhoqcOxrDHOyWtZWRBzMjjYdz//kl+Q4U8xMhqcsZfjS75ArHTnStb4DxVnhXxp/VaEaiJsWpI7+fJhaQ6eYUJhfMYjDf1Rav1gqnvOM6RNnsT7MOSacqP3dXse0a+skELq8ACUHPhnExoqX6zxfhAnXJBgIwcRjVQQVGxF8Q0rNp9f00wMVScwom6DlImygjAlZhihr7WW4/9HP1Y4m8pFYMz8WK6VlnwUm+yfoxx8Soj0RfspSurPBrjU34vALmvPrOHPQCECVLJaZ5/kmdMiSrePEXijDbku6AMKWdi/yCjY6jog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7L0XGQ9STX484/IM0i3UAZmVdqUKHfLWcX+TvOHbKY=;
 b=sladbzdBNLTrmp3ojMZxLFeFmwqvvzl057bVXehzVbE9LLjuhdOfyGrWsG8sIhco/PA90zKlKlNhJNc85E+eLXpYLNHn/3ojWGLKkXPvbSAym+i+LP6FbfxAVxhr2eVTHxdh2AHXfBYP2jbzdVoQOjokZd4SUVJXlebh7yyz1lQ=
Received: from PH8PR18MB5381.namprd18.prod.outlook.com (2603:10b6:510:254::16)
 by CH0PR18MB5436.namprd18.prod.outlook.com (2603:10b6:610:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:34:50 +0000
Received: from PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a]) by PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 10:34:49 +0000
From: George Cherian <gcherian@marvell.com>
To: =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>,
        "jwerner@chromium.org" <jwerner@chromium.org>,
        "evanbenn@chromium.org" <evanbenn@chromium.org>,
        "krzk@kernel.org"
	<krzk@kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
        "lma@chromium.org"
	<lma@chromium.org>,
        "bleung@chromium.org" <bleung@chromium.org>,
        "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "andy@kernel.org"
	<andy@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>,
        "andreas.werner@men.de" <andreas.werner@men.de>,
        "daniel@thingy.jp"
	<daniel@thingy.jp>,
        "romain.perier@gmail.com" <romain.perier@gmail.com>,
        "avifishman70@gmail.com" <avifishman70@gmail.com>,
        "tmaimon77@gmail.com"
	<tmaimon77@gmail.com>,
        "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
        "venture@google.com" <venture@google.com>,
        "yuenn@google.com"
	<yuenn@google.com>,
        "benjaminfair@google.com" <benjaminfair@google.com>,
        "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
        "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
        "naveen@kernel.org" <naveen@kernel.org>,
        "mwalle@kernel.org"
	<mwalle@kernel.org>,
        "xingyu.wu@starfivetech.com"
	<xingyu.wu@starfivetech.com>,
        "ziv.xu@starfivetech.com"
	<ziv.xu@starfivetech.com>,
        "hayashi.kunihiko@socionext.com"
	<hayashi.kunihiko@socionext.com>,
        "mhiramat@kernel.org"
	<mhiramat@kernel.org>,
        "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "chrome-platform@lists.linux.dev"
	<chrome-platform@lists.linux.dev>,
        "imx@lists.linux.dev"
	<imx@lists.linux.dev>,
        "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Thread-Topic: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Thread-Index: AQHbjbo52JxREBNQ6UqbD0W7rj3cQw==
Date: Wed, 5 Mar 2025 10:34:49 +0000
Message-ID:
 <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
In-Reply-To: <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR18MB5381:EE_|CH0PR18MB5436:EE_
x-ms-office365-filtering-correlation-id: 43ad9ebc-b6f8-4be2-e5ef-08dd5bd15b92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NWRTOXZPaXdnUHpTT2MzRTg5UlA0WlRDL0ozaC9nTnJNZnZybC9qRlNNNWVj?=
 =?utf-8?B?MDJsR1FEWUpaSVlldy96bmphOTZDZXhLOTAwREdua01JdEFwUmo2Ym5qL0x1?=
 =?utf-8?B?c2xtSU1nZ0VPTlJqK0lFWnFSb2paN3MveU9FUE51UTBHbVBtUTBEbE9CN0Rr?=
 =?utf-8?B?NTd1UnduTGs1M3FkTUFpaHd0LzZqa2tqbjVKMTJUcjRFNVVxNEpod0xydHNL?=
 =?utf-8?B?QW5SRXZPTVRDK1BMaHJ1bjlmMDdkTDVrR1l6ckkweEFWc3JIYXZ2NGo5RFlZ?=
 =?utf-8?B?N1FwdHJrMVRwSEdmTXMyNjRTdGowVktsL0lwbFlSNHpESEVXUVJhQ1FDQ1ZB?=
 =?utf-8?B?RXpzdDVBTWExaXJ3c2pYSXJwd1J5NnFFZUxoNWVrVGtnMHhsOTFHS25xRWdM?=
 =?utf-8?B?dVIvN0VrNm5Hd2F6YUc1RmIwRUk1Q3ZCdUtGQVRqeVRQeWIyZHdlY1JLdjlR?=
 =?utf-8?B?VUJ2YmVIMDR5c3cxeWoxdngyYXFSbmdUT21aYzV3eW1aT040TVZTelAreFpR?=
 =?utf-8?B?VW5ielRnRERpSFl5THZtZDNnM0Zkd3lMTFJpUGM0OGlYK1ZvL2tPb0JJMkZk?=
 =?utf-8?B?alYxYnkyZERhbFdLK3FNWXIwZ2t3V290dk5EcGFwdnluMEx5ZDROaGQ3bzFE?=
 =?utf-8?B?dVN1ZjB0YTZ5Si9nY3JnVS9lZi9KN1ZuR1E0cmp6NnFqaWR4QW5qKzhURUFu?=
 =?utf-8?B?R0QvYzRQVk9WMjF4SXlkTnRteDluZzgxMGxydEhwR1huVG1PMkZEakt2OTZR?=
 =?utf-8?B?UWR2bnZHN1IxWXRKaWVsUzA3M0R6MTNYT3lRWG1mR0JuWW1HaTZuS09sdGdz?=
 =?utf-8?B?bk9RaWtGdkhrZ0k3R0w0cjVrSUZTemZtOFA5VVV4Zy9wazJQamJZZ1V4ZnA2?=
 =?utf-8?B?T0ZIamN3YmJVL3lueVUrdkJJaHRZWFpMdDFCUlVsMyt3aktkdUZqaEw2d293?=
 =?utf-8?B?UjdCZU1vUDF2NWtMM0gwOUpRQnVwaFowenRzSERVd0x1Y2ZvdEJFM1RvYzh1?=
 =?utf-8?B?TjVFMkZQT2d3WnU0WXhYRk0rSWxUdkxZdktURnJGYUoyR01mYzJldUtkaWxV?=
 =?utf-8?B?UFNOR2xZNUwzVktnUFZxUWFWMGQ5VXJROU9LRk4wNUZkbHpaQ1l6K2tJVFB6?=
 =?utf-8?B?MXkzeXdwckxRMjFuSzdENU90QVJPLzlhZHRoMEN0L1hyclRFclpzK3dkOVg5?=
 =?utf-8?B?L1NhZExBUGRISFpyYnZwOUlhdEpZSXRqZnJCbDNDcHRKWjZ6OEJ2SnUrSEtT?=
 =?utf-8?B?RVcyUHpMSXVSeGh6T1V6NjNJOG5pZGVPdVJXZWxlQUhtS05QRStxSThBTjJp?=
 =?utf-8?B?WUNCSzk5UkFSbGNydzRwYytJSVBnZWNYNEFGOHpVeHkyYk9zTFZ3aktsVmYx?=
 =?utf-8?B?MGY1a3d6VFhoOWN6VzlJc0JWOE9UVzVOcWM3QzlLUlEybGhLV2lkLy9TakNv?=
 =?utf-8?B?TE5qR0p5bzlMaTVSNWVBQWhYQ2w3N2xDTlpna1dLODZFRFlvUGg4czdXYm1S?=
 =?utf-8?B?dEJaSnBPeUk0RVIxSkpBZEU4K2QyWlpva0NnYWc3SEJHWVA0dklmckNOU1JS?=
 =?utf-8?B?MXY3RlZqSXJSQzZsVEZtNXJQekN1cUFpWFEvRm5zbk1BWjRObGZFcUl3TUNh?=
 =?utf-8?B?emtXMnVXZ1RJSmFZUXoyeEtYcVdCVTRPQmJGcVI5dTZxSWhaSDJZZW9ORVFD?=
 =?utf-8?B?d1MvY0U0U3YvVVoyS0VNN1lNYlBUM1lVa293b1lwUWhIWmlsenN2VHUyZ2JD?=
 =?utf-8?B?MmowUzgvUzlCSlBkc05lcHVWWEZyYmZDbmNxbEJLTFJ1RlFrZmc5ZGZUWXhK?=
 =?utf-8?B?eTFqNkdSWXptd0tudndoVm9uODR5bHlBQldmQjkrUGw5VmJocjhPTERvckhQ?=
 =?utf-8?B?amtMbzhhamhFeTY3RkRmOG9SWlkvZWJ3SlJGQ1I4RzBXS0I5eW5SNit6QitX?=
 =?utf-8?Q?onYPB2KcbjEYSLfRRRQMiGQUGzquRSUF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR18MB5381.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0ZDNjVIbTJSUDNWa1ZqM0dSTEEwNWhUSFBrU2RtWnJnN1gzV1N4THNqTUd3?=
 =?utf-8?B?emFtUzBrNzdlT3FPQVQ1bGU3Nnp0eEQxTU9LTlFhNXNtYnJ6UEN4UU42S3FT?=
 =?utf-8?B?UnNZcy83Tkl6OEJPNUJHMU9aRE9oVm1xZitBVHcwNkRzUHdWL1NRM2pYWnpT?=
 =?utf-8?B?a1FHdnVnRkFuYjQ4NXJIQkVOc3NjK21lek1qS3IwWFRJMnduZjJ2bG14WURs?=
 =?utf-8?B?QzUyeGRRNXNoWmZicVhrSFVmS2Y1QmExdks5QysvaVBIcldSS0MycExsbkwr?=
 =?utf-8?B?NE1XZkJmenlOZ0NLKzJRZjIzd1oxdW03UW4vSUUvb1J1ekJnRm5LNUlGY3ZV?=
 =?utf-8?B?SDU5MU9DTnhITWxoU2drV3R3UUZpM0NYbXAvUEt5a0VzQi9aQks2d1J5QmpK?=
 =?utf-8?B?Ly9TaUozSzRzNHpHcVExcGFZWm0yUEFIdE9uNHNtVi9oK3dyVFNYd21tbUFX?=
 =?utf-8?B?aU1MYjM0ZjRISWZoMjFuNmlTNThoN0ZtOE1RdlBPdDNOWmxyT0w2T3dpVlhY?=
 =?utf-8?B?MGxkeUptdytCN2JuMEFmOG0vN01hdGs4YVZRdE15dC8vVG52Ris5djRvaDlu?=
 =?utf-8?B?ZnNFOFhNb1dFMVhWRXRIMkRiRWxWcWlGOXkzSk8zL1hDUVptcFFQWWJycytN?=
 =?utf-8?B?aW9MQVo0QlFaMTZLL1EvNGJERS95bDZZeVJGdHlVNWpMeTIxUHlYV1FRQVhE?=
 =?utf-8?B?Q05vY0x1NDljTkFmdDZJUUowU3B4UllJV1lqb2R2eEZZNWs0UXFnZ05wV0R1?=
 =?utf-8?B?bDg5M2RNSUNHYUREcitHQTJiYnZOby90dkZSZ0o4WmI4cDNPazNMVCtNUFd6?=
 =?utf-8?B?aVo0RUgyOUJjQlVZN0o4dUp5c21YeUlKS1dvLzRKc3lrN0x6MitpeWpLeUJB?=
 =?utf-8?B?dVUwWUlUd0MyNzlmZG5UNXB5WWdYUTZScU84Vmc4bUN4YjNjWjVNM0w1VFRm?=
 =?utf-8?B?aWNyM3FRNVU1Tmh1b04zRHFaWlB5Z2pWRTN0WE5jNUVEc1ZGYWxVNXFzMzhU?=
 =?utf-8?B?ZTZkblo4Zkw0WkNJUkdqSm55WUo4NHh4SVVGeDluNWd1L0xBQkQwQXZnNGd3?=
 =?utf-8?B?bEM0Nzk3aDZVblcyRXpaUzNwOXdUd2ZiTitUNitJeUw3cU5JUWhxOEFMZURB?=
 =?utf-8?B?SEhjeTZqQStJMnhTSUQ5SU1Xc2xTSE1tR0ZKRDRacHUvbVNqUkRwakk3ZFlS?=
 =?utf-8?B?ZldEemtVZXJRRnlLaURnYWhUd3NLSUN5QjZ3QzRUVUJqZ1ZRMjJXQ2c2Qmtn?=
 =?utf-8?B?YVQwVWF4NGVrOVVKbkFDcTNYdWcybnU5MDQ5NFR1cWRBbGZ3eXBDaEcxQktJ?=
 =?utf-8?B?M0lJNWF3OFJMT1c4aC9NQWxSWXdIazVLSTh4dE1nSzVEZ3RLN0FUY3VBdXJW?=
 =?utf-8?B?SVJVUVhGMllVRjZ1ZlhIL0ErTDBSbThKUTJlcVNTYy9FdXF0UXlYU09MeHQ2?=
 =?utf-8?B?aXNYSWxRSjAzcnVWMTNZektuWXM2clBlUUp5bmRsN056UFdYaituV0lsM29C?=
 =?utf-8?B?R2xxZUR4T1FPNVVzR2ErTzhMeXAxMTU5TzRtMlN6MDdGandIQWY4MFdmdmF2?=
 =?utf-8?B?azFjaWdRU2xsTGFZK21sRzA2MVMvRytsK01CSkZYTmJwRG5rcDM5N1dmRis1?=
 =?utf-8?B?VVJrcG5YaHR2akNNa3BEbXdiSytmR0p3K2JRM3RubnoyVmh1YTRFQkZvODU5?=
 =?utf-8?B?SHMxb25ZaU85S0d1eXEyNnUwa1lhYzhDN1pXYU1OK3Z2L0lPTTkwUDVhak40?=
 =?utf-8?B?cnZRY1RhL3EwdEF3dUxKQWgwZ2VCUVdhSXprRE1nZndYaDFVeWJkS3YvY0Ru?=
 =?utf-8?B?TFpMRFc3aTVjSmlBdWoxU1N5UU9paGpOTXc5a25nQmhrUUlTMUEyd1cwSldw?=
 =?utf-8?B?OVpuK1luNkljdEFXY2lXZEt5WXh2blBVUmdnM0RLZ3piK1VmeXpNRmVKdWFu?=
 =?utf-8?B?Tks5Q0l5NmdpcWswOVFxc3hBUzJLMmI2bVFGWDEzWmRYY3dXRjhBS2tSQklF?=
 =?utf-8?B?WFVtUGZrUDljeCtVVmlEQXZ2Q1dkdk1ZaWVkc0JxbDNJZlN4aE00eUVPRTdw?=
 =?utf-8?B?YVdSNmtTc2d1aW13ejVXN0dWRVZQdmpWU2dtcUl1cXFuSmdKRERFTXJXUC9t?=
 =?utf-8?Q?6PGW4yNR4DN6PCRxQiAs+Ud2B?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR18MB5381.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ad9ebc-b6f8-4be2-e5ef-08dd5bd15b92
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 10:34:49.8830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j8Vk9SQQWzhlYyASlrhiXwGukWbOVYANJiwiigx1z0ffdmGOkfILRA2InsgVRiZFSdPvelj6Ev3xVRAl89GOFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB5436
X-Proofpoint-GUID: Vx3ZHgtp4HQW96Bz7s6FvrhCA4Dwv2Mh
X-Authority-Analysis: v=2.4 cv=JtULrN4C c=1 sm=1 tr=0 ts=67c828cf cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=-AAbraWEqlQA:10 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=_jlGtV7tAAAA:8 a=e53pv_uEAAAA:8 a=cm27Pg_UAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=X3a0BiUdAAAA:8 a=ER_8r6IbAAAA:8 a=QyXUC8HyAAAA:8 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8
 a=1UX6Do5GAAAA:8 a=Bq6zwJu1AAAA:8 a=c-n4J4-pAAAA:8 a=JfrnYn6hAAAA:8 a=voM4FWlXAAAA:8 a=w1d2syhTAAAA:8 a=SXsqmeqgKWCo4p8WRO4A:9 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22 a=nlm17XC03S6CtCLSeiRr:22 a=i2WUat-zol0iyFTidwVo:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=aWu3muFgq6otJbhCXpL5:22 a=9LHmKk7ezEChjTCyhBa9:22 a=Et2XPkok5AAZYJIKzHr1:22 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=1CNFftbPRP8L7MoqJWF3:22 a=IC2XNlieTeVoXbcui8wp:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: Vx3ZHgtp4HQW96Bz7s6FvrhCA4Dwv2Mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01

RnJvbTogTWFyZWsgQmVow7puIDxrYWJlbEBrZXJuZWwub3JnPiANClNlbnQ6IFdlZG5lc2RheSwg
TWFyY2ggNSwgMjAyNSAzOjQ4IFBNDQpUbzogR2VvcmdlIENoZXJpYW4gPGdjaGVyaWFuQG1hcnZl
bGwuY29tPg0KQ2M6IGxpbnV4QHJvZWNrLXVzLm5ldDsgd2ltQGxpbnV4LXdhdGNoZG9nLm9yZzsg
andlcm5lckBjaHJvbWl1bS5vcmc7IGV2YW5iZW5uQGNocm9taXVtLm9yZzsga3J6a0BrZXJuZWwu
b3JnOyBtYXp6aWVzYWNjb3VudEBnbWFpbC5jb207IHRob21hcy5yaWNoYXJkQGJvb3RsaW4uY29t
OyBsbWFAY2hyb21pdW0ub3JnOyBibGV1bmdAY2hyb21pdW0ub3JnOyBzdXBwb3J0Lm9wZW5zb3Vy
Y2VAZGlhc2VtaS5jb207IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXgu
ZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOyBhbmR5QGtlcm5l
bC5vcmc7IHBhdWxAY3JhcG91aWxsb3UubmV0OyBhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb207
IGFuZHJlYXMud2VybmVyQG1lbi5kZTsgZGFuaWVsQHRoaW5neS5qcDsgcm9tYWluLnBlcmllckBn
bWFpbC5jb207IGF2aWZpc2htYW43MEBnbWFpbC5jb207IHRtYWltb243N0BnbWFpbC5jb207IHRh
bGkucGVycnkxQGdtYWlsLmNvbTsgdmVudHVyZUBnb29nbGUuY29tOyB5dWVubkBnb29nbGUuY29t
OyBiZW5qYW1pbmZhaXJAZ29vZ2xlLmNvbTsgbWFkZHlAbGludXguaWJtLmNvbTsgbXBlQGVsbGVy
bWFuLmlkLmF1OyBucGlnZ2luQGdtYWlsLmNvbTsgY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
OyBuYXZlZW5Aa2VybmVsLm9yZzsgbXdhbGxlQGtlcm5lbC5vcmc7IHhpbmd5dS53dUBzdGFyZml2
ZXRlY2guY29tOyB6aXYueHVAc3RhcmZpdmV0ZWNoLmNvbTsgaGF5YXNoaS5rdW5paGlrb0Bzb2Np
b25leHQuY29tOyBtaGlyYW1hdEBrZXJuZWwub3JnOyBsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgY2hyb21lLXBsYXRmb3JtQGxpc3RzLmxpbnV4LmRldjsgaW14QGxp
c3RzLmxpbnV4LmRldjsgbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmc7IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7IHBhdGNoZXNAb3BlbnNv
dXJjZS5jaXJydXMuY29tDQpTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvMl0gd2F0Y2hkb2c6IEFk
ZCBhIG5ldyBmbGFnIFdESU9GX1NUT1BfTUFZU0xFRVANCj4gSGkgR2VvcmdlLA0KPg0KPiB3aHkg
aXMgYXJtYWRhXzM3eHhfd2R0IGFsc28gaGVyZT8NCj4gVGhlIHN0b3AgZnVuY3Rpb24gaW4gdGhh
dCBkcml2ZXIgbWF5IG5vdCBzbGVlcC4NCk1hcmVrLA0KDQpUaGFua3MgZm9yIHJldmlld2luZy4N
ClNpbmNlIHRoZSBzdG9wIGZ1bmN0aW9uIGhhcyBhIHJlZ21hcF93cml0ZSgpLCBJIHRob3VnaHQg
aXQgbWlnaHQgc2xlZXAuDQpOb3cgdGhhdCB5b3UgcG9pbnRlZCBpdCBvdXQsIEkgYXNzdW1lIHRo
YXQgaXQgaXMgYW4gTU1JTyBiYXNlZCByZWdtYXAgYmVpbmcgdXNlZCBmb3IgYXJtYWRhLg0KSSB3
aWxsIHVwZGF0ZSB0aGUgc2FtZSBpbiB0aGUgbmV4dCB2ZXJzaW9uDQoNCj4NCj4gTWFyZWsNCg0K
LUdlb3JnZQ0K

