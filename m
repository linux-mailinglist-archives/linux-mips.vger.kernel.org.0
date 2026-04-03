Return-Path: <linux-mips+bounces-14027-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD81JyjGz2lH0QYAu9opvQ
	(envelope-from <linux-mips+bounces-14027-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 15:52:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40655394B5F
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 15:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 737BB30523DE
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2026 13:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F0C312826;
	Fri,  3 Apr 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="BaEdaPFs"
X-Original-To: linux-mips@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022076.outbound.protection.outlook.com [52.101.96.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94B23195FC;
	Fri,  3 Apr 2026 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224248; cv=fail; b=NdbgCgOovZkIorRb84MvPbf2ZkzCOpcHEl3dtz4JLsg8cYRQBKFZcmgOStWSYTbxABOa96X7r4wktiGSksHS0Im+OzZYAROk2/XE4W2EgBp+6TpH0OAVNTwIUEj+YWG3ZVsInL52qG2eDWqJdrimHEq+g5Us7LFj1SBWWhYtDOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224248; c=relaxed/simple;
	bh=u/Mp3NEkDJTO551AF3f74Y9mO0RNoffslVcPLoSzUlQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=D1CV3xXW3u8LdxaQtKsD2B/mRA4kHBGZ5qs63HksiUcVHDfKRzYXXTqIxK1mCdj7leRBvDw+AId9xl4gGZnnT2n6CDJlWvQW3kjhmdYTXSP+ZNfSuWRlWz0k9D+YtOoSVtvz4bfsBetk5c2noOQGSr/VBQa/pLsxECjfV0d/w0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=BaEdaPFs; arc=fail smtp.client-ip=52.101.96.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=For7Mu5J4qT5DrlolwEREOQ0fsjaxOYlIU9DRbVCcM045EOcy8Wh56lZbCl5xwIglmNAoPtJofAGdRqfAk2Ih8w+2zLAq0IWKnF0+BvH949hZpH8MA1cw8JJUMkUINRb2c+6ft7Ur/m98LK+ug1fiAZy+Y/Njq/kaZpSKbQp1kRn5LspzHrXnh77ZuB/whj3sTMQ3RrRYt+FYY/POCCSBYQq2IyyqX97ZnnzFk6AIpMj1oNVDbVFkpkhU/QuO6yYpaXhUKqBE+QwXNN6tR+bW/KiBEomkVKVO+8rm2aVmnZPyqfk5ky9fepQ4aepYF9M19jjmqgli6tXV2bOW29eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+85aZHT3Q/aT1j3ih8ZA8LqUq/NZIvlhXip4s7bXHk=;
 b=ciJpynuen8omBeerwJ3L2VZLn2YSKfbul8ih4EVEwP+vwq+katwJqXp2R+VUOszh0TwnGWQKHP5QVn6wwexdTRjfkKQDuNg2BSto9h/ANKPikB8NT4l8G+yyitAgPfq9CrvkmVEsdjOvvJQd9QFty+M9GiTeYhltOSZUJyKbWI7ayOM2uVapxQFostyo6qm/7nJuGuXe9lYpEYR2h2ja0tpAH13lHW1LJkBEVQjoAFVYlIkJPWz56KmbekP0Xl1OWcIztQHNu6RqjJxfVn8MusnNXsyNb5niWcOLNImvcBKvkideXzBkT/2k56SMXm4PbwlxFGj1cLDSsH5DDtdaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+85aZHT3Q/aT1j3ih8ZA8LqUq/NZIvlhXip4s7bXHk=;
 b=BaEdaPFsG+uw0468r7Ji3hDJIhJY+dNWlmCvZAuIp4XnmrlICCTTRsFSW8MHrCftWIME+4+vGdapHfTvLibWHcXuhKi4LO/SZEHcQpfwupuVeQPCvMgrMgP8FrqWe6rVx7OAvlHynnmsp9yISu43PnIZOM7e4ixyJnBc6u373Gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB2169.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:105::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 13:50:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 13:50:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 14:50:32 +0100
Message-Id: <DHJKGY0F52GL.14FQPOWWO0F77@garyguo.net>
Cc: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
 <andrew+netdev@lunn.ch>, <horms@kernel.org>, <jes@trained-monkey.org>,
 <chenhuacai@kernel.org>, <kernel@xen0n.name>, <tsbogend@alpha.franken.de>,
 <James.Bottomley@HansenPartnership.com>, <deller@gmx.de>,
 <maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
 <chleroy@kernel.org>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
 <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
 <svens@linux.ibm.com>, <bhelgaas@google.com>, <dakr@kernel.org>,
 <kwilczynski@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <ebiggers@google.com>, <ardb@kernel.org>, <tiwai@suse.de>, <tytso@mit.edu>,
 <enelsonmoore@gmail.com>, <martin.petersen@oracle.com>,
 <jirislaby@kernel.org>, <gregkh@linuxfoundation.org>,
 <geert@linux-m68k.org>, <herbert@gondor.apana.org.au>,
 <vineethr@linux.ibm.com>, <lirongqing@baidu.com>, <kshk@linux.ibm.com>,
 <vadim.fedorenko@linux.dev>, <dong100@mucse.com>,
 <wangruikang@iscas.ac.cn>, <hkallweit1@gmail.com>, <kees@kernel.org>,
 <loongarch@lists.linux.dev>, <linux-mips@vger.kernel.org>,
 <linux-parisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH net-next] eth: remove the driver for acenic / tigon1&2
From: "Gary Guo" <gary@garyguo.net>
To: "Jakub Kicinski" <kuba@kernel.org>, <davem@davemloft.net>
X-Mailer: aerc 0.21.0
References: <20260402183029.1236713-1-kuba@kernel.org>
In-Reply-To: <20260402183029.1236713-1-kuba@kernel.org>
X-ClientProxiedBy: LO4P123CA0621.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB2169:EE_
X-MS-Office365-Filtering-Correlation-Id: a403a136-a0ab-4411-1c28-08de9187fa24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WJEsDgxR/9xWNh1HFrejYaoiIoC+Qx0DZzyFr/kdZXc5xbuveigxyERg0B2PA1e73p4DZi0gXjP1xGYV5r2OGoEJ9LlHwoD7szLZ+bpF7c0vjwAajIg09VBlGTR1oQSZwLbDLc+l5DoYDG2d717su1gzvyZn7kC3pJ4+8CQyg+KTQBaIR4z/n2UI9V2UdUJOCvc7WnvIwH+WGb443WXnBC01Rvv3s0WPJ2BW0sK3Uii2ZJh4YjrOaz2jhUGf14LuSTCU9C/UqX0Jt8yZ97qvTqxmxT6fK6OlyGH+dfuEiXej+K5e0DsPJvhAaJivluCOB/cTHaRI8Id0tvps3Z/KmVl3YcS9tdgP9z+7cF9iTt+n15qbtcdullKYdHzmm04owK17JVgZNPRxMbsJ0YvDgzaRtTYtj6+dAzd2tfZ6l91bQ9ZF9hA7Bj1t8EJjhZyvxY2khHA3CRuVoqK5sZu9vwi2XgW36/d9zaVDMDroJiZuvMaA3gDoycsTDvvGvqQg1YntNnh625bqz8cROL6+BIq6pqWoxsoWH72/q8WNvvdFLIvfxqrOdZnFHRN3QN1EHplvTtc8Ho/Dq9mgTnaKM+ct6PoBr21ohjpRAvPk6w7Vm782rZQJrtRx7CfctSoZEr40DNerr4Jlct+J0IEJgWd4VTfXVvjfWQRUBbw5PBm/ha2Tjgtci2N7yukd6lW78KlhUQ1AaCkpuqz/9M6zlYQGikzL7/djiSDRJVzHE+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qjd3VjdJUzBoTFB0SjhGeXhIUmJVSml4NCtraHBwdGNYV0M3WG0wOGR4R2xF?=
 =?utf-8?B?MkViZGE5dVhYdVRWL2tJemU1NzZQZjFZSUFPUzN6T2g5SEoxWUJJYnlWN2dY?=
 =?utf-8?B?S0dhb0hjTjh5a29BL3l4Y3Q2b0dGemFYbldmVTBQWVBXd1ZvT2RjbG44ZG5v?=
 =?utf-8?B?UkJ3blRycEQ5Z3Nwc2tCazM5NHM0M1ZOTDFmN0R4UmVhL3A0ay81clVPdEox?=
 =?utf-8?B?RE1wQXFBZ0FuZmI0RFpNd3lTVVNST1ZPU2tPQXZqZVNFMitaN3R1UkRSWm14?=
 =?utf-8?B?cU1kVzNDUksxQklRZUdTb1JMUE1KTUZvL0dyaExGVW5wY0pnZXVhNGhJTlY1?=
 =?utf-8?B?SExHYnY0WE0yVEowLzNrSitZOU5qUU1sNFVlaHNabFB1cVE5SEtaK2ZVdkVF?=
 =?utf-8?B?WUJadEJwL0hPVDlOelNqT2tFNE5Qa1FJZkZQb096M0JhRmRaSktZWjFTZnpJ?=
 =?utf-8?B?dUNEcitZQkNJZmMxWGFNWGdKUWpSQTRWNW1ycC85Tkg1RkM4cUpTSDNMWWll?=
 =?utf-8?B?TzNtUWFISENybEpjNUVvNEEwQnpSKzZCL3VUbXNsMmJ5WkEzRVgybFFVbUNh?=
 =?utf-8?B?cVRDT3JaQU9STjZLTGNMVlJMQ3gyWEJpWnlVVU01M3pEbHBvQVdGUnRHc25S?=
 =?utf-8?B?N0dLUXF5SUprK2g4RjZVNURnd2pKT3BQMHBFWHo4bTV5dXBzdk5SdmZ5c2ZQ?=
 =?utf-8?B?Z1MwYml4d3VFcWkrL25vdGd5aEJIZkVmelJNM0tlczg3czZ2NGNEdlo0YWdW?=
 =?utf-8?B?WVZub0J6TDV3VmxESDVWRkZuMHpXNS8ydkc3OWNZZGlGK2E4TjkySFhKU3h2?=
 =?utf-8?B?MkN5WFFkcU5FNjN6R2hkL1BUVU9oa28wRmpFN1hpZjBlb2JLd3lVdmZCZ2Zu?=
 =?utf-8?B?ZFJPakFGalBTWjltWGtHREhhS0YrNEFsTlcweWJFODdqcXl5dXlRRzc3c0cy?=
 =?utf-8?B?dmJLaHlJZzJTQmVCSHRodE9mWVlFOWQ5eU1OOHBWdFM2ZEdoMFNXQnZiZmlE?=
 =?utf-8?B?N2JCN1JKTWhoUmphV2tJbFZiaDBzaUNHbHgyZGppdHdSdTlmSDVYRGhJbHdW?=
 =?utf-8?B?aWRlUlZZbmtrNFB5N2NyVlNNOW5MMWZGUDIxajRBVHNzY29XeGVUTWJjRENS?=
 =?utf-8?B?OW9QLzc4NThySGc1TTFmNG1waUV3c1h3cVI3Q1U4RUlXanJoMHVsTWVIaFFB?=
 =?utf-8?B?NmpwV0NkSlMvMlBrMktMTlFPeGI2Q0I2R1EwQ2p0eU00OWZOdFBmSzlFNmRn?=
 =?utf-8?B?NUpvSkc5am9YUi9kNnVSRldzRldsanpTb2FuRDh3TlM5OHVoRGJOSjBwdWJI?=
 =?utf-8?B?QjBhZk9OQTNiVTVkZjJJWW0zVUhYbitLTi9LbTUyanpsMnZEdnVkNmlLQUtY?=
 =?utf-8?B?bHJvUmVwTVM2RHh2NmZzYnBxNFNsNWM1WWlXWUFvWWZuODM5eGJza29KbmFS?=
 =?utf-8?B?TldvLzBVQlFPeXBCeGFwL3NXMm84d0o1OTZIU3U5d3Z3S2srZWRqZkNaU2FH?=
 =?utf-8?B?angrK0NUTUxCWGcvZlFJbmdrazFmbGhFWG1waDZOTi94Z1VRV2c5cU1Bc2pU?=
 =?utf-8?B?NDlQTm5ZczMzUUpxT3BCUlFrdkVzV0JXaEtmR1JTcDM3SDdUNWx2blVKZnRL?=
 =?utf-8?B?SXZxWDVMc2w1S2s1bzJxTnB1UjUwL1k1UFhLd0JPOTE5bXZveStoRWQvbFJM?=
 =?utf-8?B?eTRBalJHQkx1S1liNzZra09Pd1FOQkVCbHlxdkd4N3RZZzErNnljS3lZYk5Y?=
 =?utf-8?B?dTRsc3d5b3ZCcXdJNHVYdFpkS003VUY1eldwcFhIUmsxYkNXaWNpRm9HaEVI?=
 =?utf-8?B?UlVaQTN0WG43cXRic3IyRjlieUlNSSsrRnZSWm9SUWpCS0FXamNvWEhQUmdW?=
 =?utf-8?B?dEsyYkZkT1RKSzE4MDUrLythUnJpSWU0RUFrSTF4MjQwdkt5ci9lbjZQNEgy?=
 =?utf-8?B?UkM0R0JZQ1ppbHNQVW5tRkVDWndsa2xGeXZHS3c5Yk54ai9RTUNRazVZaHg2?=
 =?utf-8?B?OXp3ZTN5dFR2WGk5NWg3Mmg2VjMrSVF3UFFyd3k4eDdhU29hNVF0Q2RnOXk4?=
 =?utf-8?B?dTFiR0ZmQnJkZzRnQ252ZjA3V0VwdWg3c3l3TjVPd0JGY3FCSzZCQ0p0ZGhD?=
 =?utf-8?B?aWRJTmt4Y01abUovaTU2WUtYUDZ6M1o4MlBnV21WZU80QlpSNDFERFFadkVO?=
 =?utf-8?B?WlJ4S0VjNkN5QWxUSHhyRVEzbEZPcTQ5VzJkVnV6THY2RHNteE11YjRHNTAr?=
 =?utf-8?B?SXFtYWhRUUVzZGg2ZFh6ek15aFZLSzk3NS9EZkoyZGZRRmJNZ2VjTGtVTTd2?=
 =?utf-8?B?Nyt6RU5LYkJoREVuN3hvNTN3Z3pMWDlDOE42ZG52WjJYRkNmNVJUdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a403a136-a0ab-4411-1c28-08de9187fa24
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 13:50:33.7339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lys3wC0wRiT08h7J/HhggPTBCPA/6j5xitxdtoNyW5doFIQ8AW6NrklewKMekg0KHPiunkBvube/Dc/lNzXzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2169
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,trained-monkey.org,xen0n.name,alpha.franken.de,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,garyguo.net,protonmail.com,umich.edu,suse.de,mit.edu,oracle.com,linuxfoundation.org,linux-m68k.org,gondor.apana.org.au,baidu.com,linux.dev,mucse.com,iscas.ac.cn,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14027-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40655394B5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 2, 2026 at 7:30 PM BST, Jakub Kicinski wrote:
> The entire git history for this driver looks like tree-wide
> and automated cleanups. There's even more coming now with
> AI, so let's try to delete it instead.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: jes@trained-monkey.org
> CC: chenhuacai@kernel.org
> CC: kernel@xen0n.name
> CC: tsbogend@alpha.franken.de
> CC: James.Bottomley@HansenPartnership.com
> CC: deller@gmx.de
> CC: maddy@linux.ibm.com
> CC: mpe@ellerman.id.au
> CC: npiggin@gmail.com
> CC: chleroy@kernel.org
> CC: hca@linux.ibm.com
> CC: gor@linux.ibm.com
> CC: agordeev@linux.ibm.com
> CC: borntraeger@linux.ibm.com
> CC: svens@linux.ibm.com
> CC: bhelgaas@google.com
> CC: dakr@kernel.org
> CC: kwilczynski@kernel.org
> CC: ojeda@kernel.org
> CC: boqun@kernel.org
> CC: gary@garyguo.net
> CC: bjorn3_gh@protonmail.com
> CC: lossin@kernel.org
> CC: a.hindborg@kernel.org
> CC: aliceryhl@google.com
> CC: tmgross@umich.edu
> CC: ebiggers@google.com
> CC: ardb@kernel.org
> CC: tiwai@suse.de
> CC: tytso@mit.edu
> CC: enelsonmoore@gmail.com
> CC: martin.petersen@oracle.com
> CC: jirislaby@kernel.org
> CC: gregkh@linuxfoundation.org
> CC: geert@linux-m68k.org
> CC: herbert@gondor.apana.org.au
> CC: vineethr@linux.ibm.com
> CC: lirongqing@baidu.com
> CC: kshk@linux.ibm.com
> CC: vadim.fedorenko@linux.dev
> CC: dong100@mucse.com
> CC: wangruikang@iscas.ac.cn
> CC: hkallweit1@gmail.com
> CC: kees@kernel.org
> CC: loongarch@lists.linux.dev
> CC: linux-mips@vger.kernel.org
> CC: linux-parisc@vger.kernel.org
> CC: linuxppc-dev@lists.ozlabs.org
> CC: linux-s390@vger.kernel.org
> CC: linux-pci@vger.kernel.org
> CC: rust-for-linux@vger.kernel.org
> ---
>  MAINTAINERS                                 |    6 -
>  drivers/net/ethernet/Kconfig                |    1 -
>  drivers/net/ethernet/alteon/Kconfig         |   47 -
>  drivers/net/ethernet/Makefile               |    1 -
>  drivers/net/ethernet/alteon/Makefile        |    6 -
>  drivers/net/ethernet/alteon/acenic.h        |  791 -----
>  include/linux/pci_ids.h                     |    2 -
>  drivers/net/ethernet/alteon/acenic.c        | 3178 -------------------
>  arch/loongarch/configs/loongson32_defconfig |    1 -
>  arch/loongarch/configs/loongson64_defconfig |    1 -
>  arch/mips/configs/cavium_octeon_defconfig   |    1 -
>  arch/mips/configs/loongson2k_defconfig      |    1 -
>  arch/mips/configs/loongson3_defconfig       |    1 -
>  arch/mips/configs/malta_qemu_32r6_defconfig |    1 -
>  arch/mips/configs/maltaaprp_defconfig       |    1 -
>  arch/mips/configs/maltasmvp_defconfig       |    1 -
>  arch/mips/configs/maltasmvp_eva_defconfig   |    1 -
>  arch/mips/configs/maltaup_defconfig         |    1 -
>  arch/mips/configs/mtx1_defconfig            |    1 -
>  arch/parisc/configs/generic-32bit_defconfig |    1 -
>  arch/parisc/configs/generic-64bit_defconfig |    1 -
>  arch/powerpc/configs/44x/akebono_defconfig  |    1 -
>  arch/powerpc/configs/g5_defconfig           |    2 -
>  arch/powerpc/configs/powernv_defconfig      |    2 -
>  arch/powerpc/configs/ppc64_defconfig        |    2 -
>  arch/powerpc/configs/ppc64e_defconfig       |    2 -
>  arch/powerpc/configs/ppc6xx_defconfig       |    1 -
>  arch/powerpc/configs/skiroot_defconfig      |    2 -
>  arch/s390/configs/debug_defconfig           |    1 -
>  arch/s390/configs/defconfig                 |    1 -
>  rust/kernel/pci/id.rs                       |    1 -
>  31 files changed, 4060 deletions(-)
>  delete mode 100644 drivers/net/ethernet/alteon/Kconfig
>  delete mode 100644 drivers/net/ethernet/alteon/Makefile
>  delete mode 100644 drivers/net/ethernet/alteon/acenic.h
>  delete mode 100644 drivers/net/ethernet/alteon/acenic.c
>
> [...]
>
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 406abf629be2..8608361fac95 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -1809,8 +1809,6 @@
>  /* formerly Platform Tech */
>  #define PCI_DEVICE_ID_ESS_ESS0100	0x0100
> =20
> -#define PCI_VENDOR_ID_ALTEON		0x12ae
> -
>  #define PCI_SUBVENDOR_ID_CONNECT_TECH			0x12c4
>  #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH8_232		0x0001
>  #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH4_232		0x0002
>
> [...]
>
> diff --git a/rust/kernel/pci/id.rs b/rust/kernel/pci/id.rs
> index 50005d176561..dc2035a4c175 100644
> --- a/rust/kernel/pci/id.rs
> +++ b/rust/kernel/pci/id.rs
> @@ -428,7 +428,6 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Res=
ult {
>      TRANSMETA                =3D bindings::PCI_VENDOR_ID_TRANSMETA,     =
           // 0x1279
>      ROCKWELL                 =3D bindings::PCI_VENDOR_ID_ROCKWELL,      =
           // 0x127A
>      ITE                      =3D bindings::PCI_VENDOR_ID_ITE,           =
           // 0x1283
> -    ALTEON                   =3D bindings::PCI_VENDOR_ID_ALTEON,        =
           // 0x12ae
>      NVIDIA_SGS               =3D bindings::PCI_VENDOR_ID_NVIDIA_SGS,    =
           // 0x12d2
>      PERICOM                  =3D bindings::PCI_VENDOR_ID_PERICOM,       =
           // 0x12D8
>      AUREAL                   =3D bindings::PCI_VENDOR_ID_AUREAL,        =
           // 0x12eb

Does the PCI ID needs to be removed? There was a similar change that I reca=
lled
and the discussion eventually leads to ID not being removed.
https://lore.kernel.org/all/20260123033233.16906-1-enelsonmoore@gmail.com/

That said, if the decision is to remove the IDs, then the Rust change is ok=
ay to
me

Acked-by: Gary Guo <gary@garyguo.net> # Rust

Best,
Gary

