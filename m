Return-Path: <linux-mips+bounces-1973-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D35A86E036
	for <lists+linux-mips@lfdr.de>; Fri,  1 Mar 2024 12:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7BF11F22E1B
	for <lists+linux-mips@lfdr.de>; Fri,  1 Mar 2024 11:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E23B6CDA1;
	Fri,  1 Mar 2024 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=csgroup.eu header.i=@csgroup.eu header.b="BUaOJOsW"
X-Original-To: linux-mips@vger.kernel.org
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2098.outbound.protection.outlook.com [40.107.12.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF706CBE2;
	Fri,  1 Mar 2024 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.12.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709292453; cv=fail; b=NRMWJBn2Rykwo6t7mkFB+Ze+zyB2Bipd7ehxzFFDZMaPnGisTSxxKpRXiL638wNoQFUPqSGI8FUlHr8yYLU5kTdYUG5yWnddEpwbgXLguaAhNckef3VJbrOeOaITyNCHGWCn8WH/7uXMbZBtJoVSH9dX71ZKu8ct/S7NLTlPEIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709292453; c=relaxed/simple;
	bh=sin4aL5nZfRUhhwnUnnyOebqnTAmDeJz5l2Fe49rSjU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ec+VK5bQ5/bpPlvd6/Ys7LME2SMtraS+2xKyL9DNaXVsKDHf7CCpyMT5i63VdC/El579JUrYg6ZExBA9WiBKzLbHuhqMoqAQ0oWrhYGqOccbD0nP4UxMBbH/7Zq4JQh5U9LtpXmmdMn5QhYd4Xy+ypObKH57R0FqEiy3wDpFKN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; dkim=pass (2048-bit key) header.d=csgroup.eu header.i=@csgroup.eu header.b=BUaOJOsW; arc=fail smtp.client-ip=40.107.12.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhNwsa5V5GqWrzWMSkAeqy8NXKmcNIrtSOdLCZ3zvFbQBKKoyScATqIcYzWtl2z6UGlXgAPeTYWdlf/c+6lg7jjrBZSUsxRCWKIo9xb8fcXsitVZmmrZ9rUak1PL076uJ5kTshyDM+SEojmgBwQWAEOeL9WYfBQVCLJ15Xlf7mCNt20U14pD5IeugQrqBphjfQBPHUYVmyBSEznsMyhYum+DSWXlt1trDjetO8hTrEjG2i766ynVm7+mpagZuTfRhcJvFlgXAE2Aurk3/9JOw54tGe2lkOYJACRJl4hS5Qp5ePcuDKD7mJAZAL5MZTZzMkkRDSzh5/KAVgCVzn8PaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sin4aL5nZfRUhhwnUnnyOebqnTAmDeJz5l2Fe49rSjU=;
 b=iEb1TE1fX2PEJbm/GZLcLARnBapkuJhTbKxqKDoJCthCGR2hy3ebWKjKZ2bI7FXmzkOqiN2pS8k5uTkpS+O8hHaK09meen8yWDVHLFoOHuhQz9XSWD8a8vE9ArGcvsyQsEuikkEJv3yD3SmMqqgUg1QbUADcJ+BLdl2jz1DGA4cePMAjgkvnJiiMxph8dpleW7/A5HvTVTQg/eZzFFwZhHDVF4okkpI6ST+2oZTRkoVsh3jL9kvgkYBC7+RRgu+7FK9k7r9r/FEkqx5TcYv2qV5QL5Qf6byzKxyMQVjWB3VGEjltmkx+k3Ulwwmk9VijF43jqWzhYUP478mIJ/dFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sin4aL5nZfRUhhwnUnnyOebqnTAmDeJz5l2Fe49rSjU=;
 b=BUaOJOsW1bGFYPku94sobR0fDiNehA4V8whHj5v/8/TROioIpNAA0MMRggE5PpjLAPAUkdPDTBKdCQ2bNpBwTYokgpPaJmMIFWzqy+o2A88CIcCg4kDmw/zfCTukE1EumDJJVAFo1BM8B3DOGkaui63inC5cTDR3xuU554px/4AB4zm17jpgQ9PX2CPfDFMpcfMBbtQ1JcrMesYdJIZB84+C8OK9C8mYgKdPKRUBJY2KmHHp+xQLiJBeS1i9y0o2PpYg6U0J1n+ZOfD/20roHWlqEhmLG/xWwgLIotA6GhvnXTxGzb2EmrSTq9WjzICLx1J1vfYdLfqNM5XGyaGsGQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2925.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.34; Fri, 1 Mar
 2024 11:27:26 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 11:27:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Andrii
 Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "x86@kernel.org" <x86@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "paulburton@kernel.org"
	<paulburton@kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
	"udknight@gmail.com" <udknight@gmail.com>, "bp@alien8.de" <bp@alien8.de>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "kernel@xen0n.name"
	<kernel@xen0n.name>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "agordeev@linux.ibm.com"
	<agordeev@linux.ibm.com>, "deller@gmx.de" <deller@gmx.de>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>, "dsahern@kernel.org"
	<dsahern@kernel.org>
CC: "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-hardening @ vger . kernel . org"
	<linux-hardening@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
	Puranjay Mohan <puranjay12@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Johan Almbladh
	<johan.almbladh@anyfinetworks.com>
Subject: Re: [PATCH bpf-next RESEND v2 2/2] bpf: Take return from
 set_memory_rox() into account with bpf_jit_binary_lock_ro()
Thread-Topic: [PATCH bpf-next RESEND v2 2/2] bpf: Take return from
 set_memory_rox() into account with bpf_jit_binary_lock_ro()
Thread-Index: AQHaa64q5BfvZRyrqka9atYtmnTdsbEiv4KA
Date: Fri, 1 Mar 2024 11:27:26 +0000
Message-ID: <6d2f8c44-6d7a-47b7-a3a8-4154c0bf1ee6@csgroup.eu>
References:
 <8f3b3823cce2177e5912ff5f2f11381a16db07db.1709279661.git.christophe.leroy@csgroup.eu>
 <9c0b7a2e25f05c7128adcd04cf33a2df64c82627.1709279661.git.christophe.leroy@csgroup.eu>
In-Reply-To:
 <9c0b7a2e25f05c7128adcd04cf33a2df64c82627.1709279661.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2925:EE_
x-ms-office365-filtering-correlation-id: 75746b7e-eabb-4add-ab1d-08dc39e292bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GMF/fe1vmIMAAMntbvVk8fg0zf030XRgWsGoxZ2UGIWCzSTbAOn2s3p7RkR1z+slZxsF5Cy7v+m2NCChJCZY9bvvryg6FNNdLqSnOZNluatkwFbAUbtAQtzSi+NpEGeuFgf/Toor+2u6KGDslcOCP1PXUu8rbymofGlBLWqqreJ46Dxxuimp1JZ2lgaa1KfY5TNsyESPpQyytWYk4ZBkK2YGzsp8BtalulDvOR1Iea9NCjdxTmMwDrs8eRzMDpRufClMyuLH37XrEukm8piZpCmRhJiyTFayYPT70IDLVBxDEj/QugYNZikhFZBovsbEoN28O0AwiMOy0ZCoQaPsMwSwtYUjZJwo1vmpxeVFTxUndR2Jb8K4uX6ORUW8YUnS/zqcuxTs2Ba1AWkLsVehwD0nhXQexnjJ8o6+O9VjRPsJFBJcbL/M5GbecwAu5OqppW/xc26qHokLuTAg2fghw8srmDKQHOnWkaJZrozlL1TIOqW9E2xZHgHQykzKgZhgdDq+WNAifRhBR40cv7kijI8HNgDXACXF6HgE5Evth93VQB3Gq4e5p8Btt4jB/XUPLEYmea0mIY3JrDkBhzRVBQqeSJjJqNdJKVt2SfvVvTvWSjNOa2h++RL4k0GzmwjWktt7TpJZpyjc4kpQepPpu6ThzU4LXM04WdK3Ls3wohclQI9UO1I4pZHL1oewSsXT
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NldTVTNkQXJ1WFBxRy8vN1V3b21SMzd1Yll6RU1HYVFEMncrRDV2WjRtNGty?=
 =?utf-8?B?R05GMHVGbVhmSEdUTmFiVXlhdUh1TmZYd0FMNitVcjFvcDRDS1M3NklHRk1v?=
 =?utf-8?B?Q0YvZlhlU3Y2NDRhMStPZEljRFlPc3NYeGR4czZkdWJucEsxaDdwaTJrRCs2?=
 =?utf-8?B?Umdyb2pSRzFaemp3aDBGYUc3QU5TK1VzdTIxZUR5MUx2UkdhSDdzTVJHK2Fh?=
 =?utf-8?B?REx0U2FLQnRPRXVNY21VODY1d0pzNWlCeDVQRzBlc1NPaDZtekFsVHhndk1y?=
 =?utf-8?B?U09BZU95bGlHdC9TMUVMMEJiWThjdW9yV1FSRmo5UXJVWVV6ekdDNmUyUmZZ?=
 =?utf-8?B?ZzArZ1pGWDVkbk1INTBqVGxvWkRCSk9nWlpEaUhYY3ZnaVFSS2tBa0ptaDla?=
 =?utf-8?B?dzREbkxlUlQwMnZFa2JoaXF0ZWlpNGlRYWE5N3Zzai95NjZPRDZFd0txcnVy?=
 =?utf-8?B?UjRMWGNBcUtXZEF5bVFQYnV2Vm1ZWUV5OUZjdURTbEVlVmJDNE1EWkpoRlJT?=
 =?utf-8?B?OW55TkpQRTNNaUwwL1Y4Z1doUzJrTndDZ1FVZ3FNRkJadlBOYXR3L05VTjJ4?=
 =?utf-8?B?NGQyQzJGR2dadGJrWGRVRWxEYjNvdzE5ZkJicFViaVp2QjlqMzJSeVo0TUlC?=
 =?utf-8?B?TzZweDliRG95VkRHNHVUZGdHcUNqNE1Gd2hhNnV6MnE2SVl2TnF5Qmh0ZVow?=
 =?utf-8?B?YS9yVVFNaGtXdC9sT3N4NkE0RlBNWlR4Q0tWYStWdHhVSW9jYS9EUkxQMVY5?=
 =?utf-8?B?aDF3eElSVjVuYnJ6MUdFOWlXUm9pQWJoTjNvK2hOVzNWRUExNWlIVXpkZDgx?=
 =?utf-8?B?WmlINTV4czJQeEdwTS8zRW13SnR2bnlqWkFDZTU3aGJZSU1JN2hDdm5ZU0Vu?=
 =?utf-8?B?eVFiTWVJOVhEU3VSWVJtOGhaNHFUMXFFaUIyc0V2WlRPZmtMd2d5dWtuc3hy?=
 =?utf-8?B?U2U0N0k3Qkt6U1AxMkE4Y1VYazRrVHk5Z2srL1EzZHVJOEEzSDJPb0d6UHlr?=
 =?utf-8?B?cmQ3dVlMN0ZGT2hHNjVISTRFVVB1OHJwMnJtTWxSWWVEWEdjVThHRzd0c1gx?=
 =?utf-8?B?d0FramtDc2lMNG5Wajl1ZTFDYmYvbm5OWGUzZ29EbWpRa0FIQmJ0YUYxVTBs?=
 =?utf-8?B?Q1F6bmxGRlQ4dUloWGh2TE5POFJuTzZlSUVtRUVYQlIyT3ZJVHk5a1NOQWdx?=
 =?utf-8?B?aERtbEFra21Qdk9SNSt4WlhTaC9kVSs3M2UvT215U0NEWFl1R1cwYVdVYkZ3?=
 =?utf-8?B?eUNhKy90dHc4TkJjOVRUbEpzdWtuWEQyMjlWMVh4Ty9BY3FoeHcxQU9MRVpj?=
 =?utf-8?B?WXgwUVRCNTVra1J6NENDTExpMzVyK3JFYWQwWFF3RHB6cmtCWWh5WHVhM2JO?=
 =?utf-8?B?SXVJcmhvSFh0NzJtd0FmM3BDOFhQWVRNU2FXVE80TzVxSlJiQktHNDdZUXFU?=
 =?utf-8?B?a1gzOUVqUEpVMnA3U2J5Zzl2dEFPWTF6dE5Bc1ZpVGxIQjNMSHhkRmFDQ2pF?=
 =?utf-8?B?ZzBYb1dFMTZFcUMxQllBck10dGRIbEpJMEVoU1hadDZLZmNVK0J5bm0yajQx?=
 =?utf-8?B?WTh1UFBOZzFOc1ZSNzJ1Q0xQZzR5RlhsZVNLMGJ3Rm05YzdVejByY25ucWV5?=
 =?utf-8?B?ZFA2dWF0bkw3YkN0cDRjWGMzZ3h5M3J2Y2JkTUowUmtuWXVkQS9VV2pPL0dQ?=
 =?utf-8?B?dFBxbGFDZHY5YWZjaXVnS3QyOVczeWlaeVRaaXBldE9tVFZkUEhaa2xlS05p?=
 =?utf-8?B?U3RXbzZ5dDQ3dDZWamNXdGd5T0o5UlhMN3diQk12SGNhdDJFcHd0VFlvWklX?=
 =?utf-8?B?aEQ5a0ZvdVZGQ2pxcm83bE9sZmdnWG92RUg4NVVBeWFyeXhZdWRhQStJby8v?=
 =?utf-8?B?cTMySkVWdExQSGtJM0FWVEFRM1djaGg2YzZZdngxUVJhbXlDVkpkK2g4UFNw?=
 =?utf-8?B?WXAxaFRDaXNydThMcDRkREs5ckZhRzRqVWNsaFN4QmozaUpoOVBaQTgvNlBa?=
 =?utf-8?B?aDliaVZIMEhDZTA1eDhpN3B6TWdqMXlSTForZUNjT1lKeUtIUVp4QUM2VEc5?=
 =?utf-8?B?bys3eUJvWS80dnViU3hBOVJvOStscTBteFFXT2ZQVGUrR2REZk04Tk50TmI0?=
 =?utf-8?B?S2JadGtFa0ZZRUliUHJyMGJWc21RWUt2VVBQUk0rdGhBbHY2OGdMaGVMWXZH?=
 =?utf-8?B?QmJJVjM5ZWVNN3ordlB0NWEwaitQK1M5bXV4dzkrNkM0ZkxqbU1qK2hPT05X?=
 =?utf-8?B?cFhzbFJxSkRpM1NhRUVSSEhMUWdnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31BD5BED007B8C40BB7058F399F20293@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 75746b7e-eabb-4add-ab1d-08dc39e292bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 11:27:26.6656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1GyRj2GVkVs03Mb8/24V7EUMfglg9VHMFZNH/nOf2f6vy/O24BsxLd8g0GIefdXUKrp44CNznx7naWYoa7t+2M2kzleDaGiWz4JJf5Uujr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2925

TGUgMDEvMDMvMjAyNCDDoCAwODo1NywgQ2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdMKgOg0KPiBz
ZXRfbWVtb3J5X3JveCgpIGNhbiBmYWlsLCBsZWF2aW5nIG1lbW9yeSB1bnByb3RlY3RlZC4NCj4g
DQo+IENoZWNrIHJldHVybiBhbmQgYmFpbCBvdXQgd2hlbiBicGZfaml0X2JpbmFyeV9sb2NrX3Jv
KCkgcmV0dXJucw0KPiBhbiBlcnJvci4NCj4gDQoNCkRlZmluaXRlbHkgbm90IGEgZ29vZCBkYXkg
Zm9yIG1lLiBJIHN3aXRjaGVkIG1haW50YWluZXJzIGJldHdlZW4gcGF0Y2ggMSANCmFuZCBwYXRj
aCAyIHNvcnJ5Lg0KDQpBZGRpbmcgaGVuZ3FpLmNoZW5AZ21haWwuY29tLCBzdmVuc0BsaW51eC5p
Ym0uY29tLCBkc2FoZXJuQGtlcm5lbC5vcmcsIA0KbWluZ29AcmVkaGF0LmNvbSwgSmFtZXMuQm90
dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbSwgDQp0c2JvZ2VuZEBhbHBoYS5mcmFua2VuLmRl
LCB4ODZAa2VybmVsLm9yZywgdGdseEBsaW51dHJvbml4LmRlLCANCnBhdWxidXJ0b25Aa2VybmVs
Lm9yZywgaGNhQGxpbnV4LmlibS5jb20sIHVka25pZ2h0QGdtYWlsLmNvbSwgDQpicEBhbGllbjgu
ZGUsIGNoZW5odWFjYWlAa2VybmVsLm9yZywgaHBhQHp5dG9yLmNvbSwgZ29yQGxpbnV4LmlibS5j
b20sIA0KbGludXhAYXJtbGludXgub3JnLnVrLCBrZXJuZWxAeGVuMG4ubmFtZSwgZGF2ZS5oYW5z
ZW5AbGludXguaW50ZWwuY29tLCANCmJvcm50cmFlZ2VyQGxpbnV4LmlibS5jb20sIGFnb3JkZWV2
QGxpbnV4LmlibS5jb20sIGRlbGxlckBnbXguZGUNCg0KVGVsbCBtZSBpZiBJIG5lZWQgdG8gcmVz
ZW5kIHRoZSBzZXJpZXMgb25jZSBtb3JlLg0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0KPiBMaW5r
OiBodHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvNw0KPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IENjOiBs
aW51eC1oYXJkZW5pbmdAdmdlci5rZXJuZWwub3JnIDxsaW51eC1oYXJkZW5pbmdAdmdlci5rZXJu
ZWwub3JnPg0KPiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+
DQo+IFJldmlld2VkLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5jb20+DQo+
IFJldmlld2VkLWJ5OiBJbHlhIExlb3Noa2V2aWNoIDxpaWlAbGludXguaWJtLmNvbT4gICMgczM5
MHgNCj4gQWNrZWQtYnk6IFRpZXpodSBZYW5nIDx5YW5ndGllemh1QGxvb25nc29uLmNuPiAgIyBM
b29uZ0FyY2gNCj4gUmV2aWV3ZWQtYnk6IEpvaGFuIEFsbWJsYWRoIDxqb2hhbi5hbG1ibGFkaEBh
bnlmaW5ldHdvcmtzLmNvbT4gIyBNSVBTIFBhcnQNCj4gLS0tDQo+IFNvcnJ5IGZvciB0aGUgcmVz
ZW5kLCBJIGZvcmdvdCB0byBmbGFnIHBhdGNoIDIgYXMgYnBmLW5leHQNCj4gDQo+IFByZXZpb3Vz
IHBhdGNoIGludHJvZHVjZXMgYSBkZXBlbmRlbmN5IG9uIHRoaXMgcGF0Y2ggYmVjYXVzZSBpdCBt
b2RpZmllcyBicGZfcHJvZ19sb2NrX3JvKCksIGJ1dCB0aGV5IGFyZSBpbmRlcGVuZGFudC4NCj4g
SXQgaXMgcG9zc2libGUgdG8gYXBwbHkgdGhpcyBwYXRjaCBhcyBzdGFuZGFsb25lIGJ5IGhhbmRs
aW5nIHRyaXZpYWwgY29uZmxpY3Qgd2l0aCB1bm1vZGlmaWVkIGJwZl9wcm9nX2xvY2tfcm8oKS4N
Cj4gDQo+IHYyOg0KPiAtIERyb3BwZWQgYXJtNjQgY2hhbmdlIGZvbGxvd2luZyBjb21taXQgMWRh
ZDM5MWRhZWYxICgiYnBmLCBhcm02NDogdXNlIGJwZl9wcm9nX3BhY2sgZm9yIG1lbW9yeSBtYW5h
Z2VtZW50IikNCj4gLSBGaXhlZCB0b28gbG9uZyBsaW5lcyByZXBvcnRlZCBieSBjaGVja3BhdGNo
DQo+IC0tLQ0KPiAgIGFyY2gvYXJtL25ldC9icGZfaml0XzMyLmMgICAgICAgIHwgMjUgKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLQ0KPiAgIGFyY2gvbG9vbmdhcmNoL25ldC9icGZfaml0LmMgICAg
IHwgMjIgKysrKysrKysrKysrKysrKy0tLS0tLQ0KPiAgIGFyY2gvbWlwcy9uZXQvYnBmX2ppdF9j
b21wLmMgICAgIHwgIDMgKystDQo+ICAgYXJjaC9wYXJpc2MvbmV0L2JwZl9qaXRfY29yZS5jICAg
fCAgOCArKysrKysrLQ0KPiAgIGFyY2gvczM5MC9uZXQvYnBmX2ppdF9jb21wLmMgICAgIHwgIDYg
KysrKystDQo+ICAgYXJjaC9zcGFyYy9uZXQvYnBmX2ppdF9jb21wXzY0LmMgfCAgNiArKysrKy0N
Cj4gICBhcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wMzIuYyAgICB8ICAzICstLQ0KPiAgIGluY2x1
ZGUvbGludXgvZmlsdGVyLmggICAgICAgICAgIHwgIDUgKysrLS0NCj4gICA4IGZpbGVzIGNoYW5n
ZWQsIDUxIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL25ldC9icGZfaml0XzMyLmMgYi9hcmNoL2FybS9uZXQvYnBmX2ppdF8zMi5jDQo+
IGluZGV4IDFkNjcyNDU3ZDAyZi4uMDE1MTZmODNhOTVhIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2Fy
bS9uZXQvYnBmX2ppdF8zMi5jDQo+ICsrKyBiL2FyY2gvYXJtL25ldC9icGZfaml0XzMyLmMNCj4g
QEAgLTIyMjIsMjggKzIyMjIsMjEgQEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9jb21w
aWxlKHN0cnVjdCBicGZfcHJvZyAqcHJvZykNCj4gICAJLyogSWYgYnVpbGRpbmcgdGhlIGJvZHkg
b2YgdGhlIEpJVGVkIGNvZGUgZmFpbHMgc29tZWhvdywNCj4gICAJICogd2UgZmFsbCBiYWNrIHRv
IHRoZSBpbnRlcnByZXRhdGlvbi4NCj4gICAJICovDQo+IC0JaWYgKGJ1aWxkX2JvZHkoJmN0eCkg
PCAwKSB7DQo+IC0JCWltYWdlX3B0ciA9IE5VTEw7DQo+IC0JCWJwZl9qaXRfYmluYXJ5X2ZyZWUo
aGVhZGVyKTsNCj4gLQkJcHJvZyA9IG9yaWdfcHJvZzsNCj4gLQkJZ290byBvdXRfaW1tczsNCj4g
LQl9DQo+ICsJaWYgKGJ1aWxkX2JvZHkoJmN0eCkgPCAwKQ0KPiArCQlnb3RvIG91dF9mcmVlOw0K
PiAgIAlidWlsZF9lcGlsb2d1ZSgmY3R4KTsNCj4gICANCj4gICAJLyogMy4pIEV4dHJhIHBhc3Mg
dG8gdmFsaWRhdGUgSklUZWQgQ29kZSAqLw0KPiAtCWlmICh2YWxpZGF0ZV9jb2RlKCZjdHgpKSB7
DQo+IC0JCWltYWdlX3B0ciA9IE5VTEw7DQo+IC0JCWJwZl9qaXRfYmluYXJ5X2ZyZWUoaGVhZGVy
KTsNCj4gLQkJcHJvZyA9IG9yaWdfcHJvZzsNCj4gLQkJZ290byBvdXRfaW1tczsNCj4gLQl9DQo+
ICsJaWYgKHZhbGlkYXRlX2NvZGUoJmN0eCkpDQo+ICsJCWdvdG8gb3V0X2ZyZWU7DQo+ICAgCWZs
dXNoX2ljYWNoZV9yYW5nZSgodTMyKWhlYWRlciwgKHUzMikoY3R4LnRhcmdldCArIGN0eC5pZHgp
KTsNCj4gICANCj4gICAJaWYgKGJwZl9qaXRfZW5hYmxlID4gMSkNCj4gICAJCS8qIHRoZXJlIGFy
ZSAyIHBhc3NlcyBoZXJlICovDQo+ICAgCQlicGZfaml0X2R1bXAocHJvZy0+bGVuLCBpbWFnZV9z
aXplLCAyLCBjdHgudGFyZ2V0KTsNCj4gICANCj4gLQlicGZfaml0X2JpbmFyeV9sb2NrX3JvKGhl
YWRlcik7DQo+ICsJaWYgKGJwZl9qaXRfYmluYXJ5X2xvY2tfcm8oaGVhZGVyKSkNCj4gKwkJZ290
byBvdXRfZnJlZTsNCj4gICAJcHJvZy0+YnBmX2Z1bmMgPSAodm9pZCAqKWN0eC50YXJnZXQ7DQo+
ICAgCXByb2ctPmppdGVkID0gMTsNCj4gICAJcHJvZy0+aml0ZWRfbGVuID0gaW1hZ2Vfc2l6ZTsN
Cj4gQEAgLTIyNjAsNSArMjI1MywxMSBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9pbnRfaml0X2Nv
bXBpbGUoc3RydWN0IGJwZl9wcm9nICpwcm9nKQ0KPiAgIAkJYnBmX2ppdF9wcm9nX3JlbGVhc2Vf
b3RoZXIocHJvZywgcHJvZyA9PSBvcmlnX3Byb2cgPw0KPiAgIAkJCQkJICAgdG1wIDogb3JpZ19w
cm9nKTsNCj4gICAJcmV0dXJuIHByb2c7DQo+ICsNCj4gK291dF9mcmVlOg0KPiArCWltYWdlX3B0
ciA9IE5VTEw7DQo+ICsJYnBmX2ppdF9iaW5hcnlfZnJlZShoZWFkZXIpOw0KPiArCXByb2cgPSBv
cmlnX3Byb2c7DQo+ICsJZ290byBvdXRfaW1tczsNCj4gICB9DQo+ICAgDQo+IGRpZmYgLS1naXQg
YS9hcmNoL2xvb25nYXJjaC9uZXQvYnBmX2ppdC5jIGIvYXJjaC9sb29uZ2FyY2gvbmV0L2JwZl9q
aXQuYw0KPiBpbmRleCBlNzMzMjNkNzU5ZDAuLjdkYmVmZDRiYTIxMCAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9sb29uZ2FyY2gvbmV0L2JwZl9qaXQuYw0KPiArKysgYi9hcmNoL2xvb25nYXJjaC9uZXQv
YnBmX2ppdC5jDQo+IEBAIC0xMjk0LDE2ICsxMjk0LDE5IEBAIHN0cnVjdCBicGZfcHJvZyAqYnBm
X2ludF9qaXRfY29tcGlsZShzdHJ1Y3QgYnBmX3Byb2cgKnByb2cpDQo+ICAgCWZsdXNoX2ljYWNo
ZV9yYW5nZSgodW5zaWduZWQgbG9uZyloZWFkZXIsICh1bnNpZ25lZCBsb25nKShjdHguaW1hZ2Ug
KyBjdHguaWR4KSk7DQo+ICAgDQo+ICAgCWlmICghcHJvZy0+aXNfZnVuYyB8fCBleHRyYV9wYXNz
KSB7DQo+ICsJCWludCBlcnI7DQo+ICsNCj4gICAJCWlmIChleHRyYV9wYXNzICYmIGN0eC5pZHgg
IT0gaml0X2RhdGEtPmN0eC5pZHgpIHsNCj4gICAJCQlwcl9lcnJfb25jZSgibXVsdGktZnVuYyBK
SVQgYnVnICVkICE9ICVkXG4iLA0KPiAgIAkJCQkgICAgY3R4LmlkeCwgaml0X2RhdGEtPmN0eC5p
ZHgpOw0KPiAtCQkJYnBmX2ppdF9iaW5hcnlfZnJlZShoZWFkZXIpOw0KPiAtCQkJcHJvZy0+YnBm
X2Z1bmMgPSBOVUxMOw0KPiAtCQkJcHJvZy0+aml0ZWQgPSAwOw0KPiAtCQkJcHJvZy0+aml0ZWRf
bGVuID0gMDsNCj4gLQkJCWdvdG8gb3V0X29mZnNldDsNCj4gKwkJCWdvdG8gb3V0X2ZyZWU7DQo+
ICsJCX0NCj4gKwkJZXJyID0gYnBmX2ppdF9iaW5hcnlfbG9ja19ybyhoZWFkZXIpOw0KPiArCQlp
ZiAoZXJyKSB7DQo+ICsJCQlwcl9lcnJfb25jZSgiYnBmX2ppdF9iaW5hcnlfbG9ja19ybygpIHJl
dHVybmVkICVkXG4iLA0KPiArCQkJCSAgICBlcnIpOw0KPiArCQkJZ290byBvdXRfZnJlZTsNCj4g
ICAJCX0NCj4gLQkJYnBmX2ppdF9iaW5hcnlfbG9ja19ybyhoZWFkZXIpOw0KPiAgIAl9IGVsc2Ug
ew0KPiAgIAkJaml0X2RhdGEtPmN0eCA9IGN0eDsNCj4gICAJCWppdF9kYXRhLT5pbWFnZSA9IGlt
YWdlX3B0cjsNCj4gQEAgLTEzMzQsNiArMTMzNywxMyBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9p
bnRfaml0X2NvbXBpbGUoc3RydWN0IGJwZl9wcm9nICpwcm9nKQ0KPiAgIAlvdXRfb2Zmc2V0ID0g
LTE7DQo+ICAgDQo+ICAgCXJldHVybiBwcm9nOw0KPiArDQo+ICtvdXRfZnJlZToNCj4gKwlicGZf
aml0X2JpbmFyeV9mcmVlKGhlYWRlcik7DQo+ICsJcHJvZy0+YnBmX2Z1bmMgPSBOVUxMOw0KPiAr
CXByb2ctPmppdGVkID0gMDsNCj4gKwlwcm9nLT5qaXRlZF9sZW4gPSAwOw0KPiArCWdvdG8gb3V0
X29mZnNldDsNCj4gICB9DQo+ICAgDQo+ICAgLyogSW5kaWNhdGUgdGhlIEpJVCBiYWNrZW5kIHN1
cHBvcnRzIG1peGluZyBicGYyYnBmIGFuZCB0YWlsY2FsbHMuICovDQo+IGRpZmYgLS1naXQgYS9h
cmNoL21pcHMvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC9taXBzL25ldC9icGZfaml0X2NvbXAu
Yw0KPiBpbmRleCBhNDBkOTI2YjY1MTMuLmUzNTVkZmNhNDQwMCAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9taXBzL25ldC9icGZfaml0X2NvbXAuYw0KPiArKysgYi9hcmNoL21pcHMvbmV0L2JwZl9qaXRf
Y29tcC5jDQo+IEBAIC0xMDEyLDcgKzEwMTIsOCBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9pbnRf
aml0X2NvbXBpbGUoc3RydWN0IGJwZl9wcm9nICpwcm9nKQ0KPiAgIAlicGZfcHJvZ19maWxsX2pp
dGVkX2xpbmZvKHByb2csICZjdHguZGVzY3JpcHRvcnNbMV0pOw0KPiAgIA0KPiAgIAkvKiBTZXQg
YXMgcmVhZC1vbmx5IGV4ZWMgYW5kIGZsdXNoIGluc3RydWN0aW9uIGNhY2hlICovDQo+IC0JYnBm
X2ppdF9iaW5hcnlfbG9ja19ybyhoZWFkZXIpOw0KPiArCWlmIChicGZfaml0X2JpbmFyeV9sb2Nr
X3JvKGhlYWRlcikpDQo+ICsJCWdvdG8gb3V0X2VycjsNCj4gICAJZmx1c2hfaWNhY2hlX3Jhbmdl
KCh1bnNpZ25lZCBsb25nKWhlYWRlciwNCj4gICAJCQkgICAodW5zaWduZWQgbG9uZykmY3R4LnRh
cmdldFtjdHguaml0X2luZGV4XSk7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9hcmNoL3BhcmlzYy9u
ZXQvYnBmX2ppdF9jb3JlLmMgYi9hcmNoL3BhcmlzYy9uZXQvYnBmX2ppdF9jb3JlLmMNCj4gaW5k
ZXggZDZlZTJmZDQ1NTUwLi45NzlmNDVkNGQxZmIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcGFyaXNj
L25ldC9icGZfaml0X2NvcmUuYw0KPiArKysgYi9hcmNoL3BhcmlzYy9uZXQvYnBmX2ppdF9jb3Jl
LmMNCj4gQEAgLTE2Nyw3ICsxNjcsMTMgQEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9j
b21waWxlKHN0cnVjdCBicGZfcHJvZyAqcHJvZykNCj4gICAJYnBmX2ZsdXNoX2ljYWNoZShqaXRf
ZGF0YS0+aGVhZGVyLCBjdHgtPmluc25zICsgY3R4LT5uaW5zbnMpOw0KPiAgIA0KPiAgIAlpZiAo
IXByb2ctPmlzX2Z1bmMgfHwgZXh0cmFfcGFzcykgew0KPiAtCQlicGZfaml0X2JpbmFyeV9sb2Nr
X3JvKGppdF9kYXRhLT5oZWFkZXIpOw0KPiArCQlpZiAoYnBmX2ppdF9iaW5hcnlfbG9ja19ybyhq
aXRfZGF0YS0+aGVhZGVyKSkgew0KPiArCQkJYnBmX2ppdF9iaW5hcnlfZnJlZShqaXRfZGF0YS0+
aGVhZGVyKTsNCj4gKwkJCXByb2ctPmJwZl9mdW5jID0gTlVMTDsNCj4gKwkJCXByb2ctPmppdGVk
ID0gMDsNCj4gKwkJCXByb2ctPmppdGVkX2xlbiA9IDA7DQo+ICsJCQlnb3RvIG91dF9vZmZzZXQ7
DQo+ICsJCX0NCj4gICAJCXByb2xvZ3VlX2xlbiA9IGN0eC0+ZXBpbG9ndWVfb2Zmc2V0IC0gY3R4
LT5ib2R5X2xlbjsNCj4gICAJCWZvciAoaSA9IDA7IGkgPCBwcm9nLT5sZW47IGkrKykNCj4gICAJ
CQljdHgtPm9mZnNldFtpXSArPSBwcm9sb2d1ZV9sZW47DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Mz
OTAvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC9zMzkwL25ldC9icGZfaml0X2NvbXAuYw0KPiBp
bmRleCBiNDE4MzMzYmIwODYuLmU2MTNlZWJmZDM0OSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9zMzkw
L25ldC9icGZfaml0X2NvbXAuYw0KPiArKysgYi9hcmNoL3MzOTAvbmV0L2JwZl9qaXRfY29tcC5j
DQo+IEBAIC0yMTExLDcgKzIxMTEsMTEgQEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9j
b21waWxlKHN0cnVjdCBicGZfcHJvZyAqZnApDQo+ICAgCQlwcmludF9mbl9jb2RlKGppdC5wcmdf
YnVmLCBqaXQuc2l6ZV9wcmcpOw0KPiAgIAl9DQo+ICAgCWlmICghZnAtPmlzX2Z1bmMgfHwgZXh0
cmFfcGFzcykgew0KPiAtCQlicGZfaml0X2JpbmFyeV9sb2NrX3JvKGhlYWRlcik7DQo+ICsJCWlm
IChicGZfaml0X2JpbmFyeV9sb2NrX3JvKGhlYWRlcikpIHsNCj4gKwkJCWJwZl9qaXRfYmluYXJ5
X2ZyZWUoaGVhZGVyKTsNCj4gKwkJCWZwID0gb3JpZ19mcDsNCj4gKwkJCWdvdG8gZnJlZV9hZGRy
czsNCj4gKwkJfQ0KPiAgIAl9IGVsc2Ugew0KPiAgIAkJaml0X2RhdGEtPmhlYWRlciA9IGhlYWRl
cjsNCj4gICAJCWppdF9kYXRhLT5jdHggPSBqaXQ7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3NwYXJj
L25ldC9icGZfaml0X2NvbXBfNjQuYyBiL2FyY2gvc3BhcmMvbmV0L2JwZl9qaXRfY29tcF82NC5j
DQo+IGluZGV4IGZhMDc1OWJmZTQ5OC4uNzNiZjBhZWE4YmFmIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L3NwYXJjL25ldC9icGZfaml0X2NvbXBfNjQuYw0KPiArKysgYi9hcmNoL3NwYXJjL25ldC9icGZf
aml0X2NvbXBfNjQuYw0KPiBAQCAtMTYwMiw3ICsxNjAyLDExIEBAIHN0cnVjdCBicGZfcHJvZyAq
YnBmX2ludF9qaXRfY29tcGlsZShzdHJ1Y3QgYnBmX3Byb2cgKnByb2cpDQo+ICAgCWJwZl9mbHVz
aF9pY2FjaGUoaGVhZGVyLCAodTggKiloZWFkZXIgKyBoZWFkZXItPnNpemUpOw0KPiAgIA0KPiAg
IAlpZiAoIXByb2ctPmlzX2Z1bmMgfHwgZXh0cmFfcGFzcykgew0KPiAtCQlicGZfaml0X2JpbmFy
eV9sb2NrX3JvKGhlYWRlcik7DQo+ICsJCWlmIChicGZfaml0X2JpbmFyeV9sb2NrX3JvKGhlYWRl
cikpIHsNCj4gKwkJCWJwZl9qaXRfYmluYXJ5X2ZyZWUoaGVhZGVyKTsNCj4gKwkJCXByb2cgPSBv
cmlnX3Byb2c7DQo+ICsJCQlnb3RvIG91dF9vZmY7DQo+ICsJCX0NCj4gICAJfSBlbHNlIHsNCj4g
ICAJCWppdF9kYXRhLT5jdHggPSBjdHg7DQo+ICAgCQlqaXRfZGF0YS0+aW1hZ2UgPSBpbWFnZV9w
dHI7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wMzIuYyBiL2FyY2gv
eDg2L25ldC9icGZfaml0X2NvbXAzMi5jDQo+IGluZGV4IGIxOGNlMTk5ODFlYy4uZjJiZTFkY2Yz
YjI0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wMzIuYw0KPiArKysg
Yi9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wMzIuYw0KPiBAQCAtMjYwMCw4ICsyNjAwLDcgQEAg
c3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9jb21waWxlKHN0cnVjdCBicGZfcHJvZyAqcHJv
ZykNCj4gICAJaWYgKGJwZl9qaXRfZW5hYmxlID4gMSkNCj4gICAJCWJwZl9qaXRfZHVtcChwcm9n
LT5sZW4sIHByb2dsZW4sIHBhc3MgKyAxLCBpbWFnZSk7DQo+ICAgDQo+IC0JaWYgKGltYWdlKSB7
DQo+IC0JCWJwZl9qaXRfYmluYXJ5X2xvY2tfcm8oaGVhZGVyKTsNCj4gKwlpZiAoaW1hZ2UgJiYg
IWJwZl9qaXRfYmluYXJ5X2xvY2tfcm8oaGVhZGVyKSkgew0KPiAgIAkJcHJvZy0+YnBmX2Z1bmMg
PSAodm9pZCAqKWltYWdlOw0KPiAgIAkJcHJvZy0+aml0ZWQgPSAxOw0KPiAgIAkJcHJvZy0+aml0
ZWRfbGVuID0gcHJvZ2xlbjsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZmlsdGVyLmgg
Yi9pbmNsdWRlL2xpbnV4L2ZpbHRlci5oDQo+IGluZGV4IDdkZDU5YmNjYWVlYy4uZmM0MmRjZmRi
ZDYyIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZpbHRlci5oDQo+ICsrKyBiL2luY2x1
ZGUvbGludXgvZmlsdGVyLmgNCj4gQEAgLTg5NSwxMCArODk1LDExIEBAIHN0YXRpYyBpbmxpbmUg
aW50IF9fbXVzdF9jaGVjayBicGZfcHJvZ19sb2NrX3JvKHN0cnVjdCBicGZfcHJvZyAqZnApDQo+
ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBicGZfaml0
X2JpbmFyeV9sb2NrX3JvKHN0cnVjdCBicGZfYmluYXJ5X2hlYWRlciAqaGRyKQ0KPiArc3RhdGlj
IGlubGluZSBpbnQgX19tdXN0X2NoZWNrDQo+ICticGZfaml0X2JpbmFyeV9sb2NrX3JvKHN0cnVj
dCBicGZfYmluYXJ5X2hlYWRlciAqaGRyKQ0KPiAgIHsNCj4gICAJc2V0X3ZtX2ZsdXNoX3Jlc2V0
X3Blcm1zKGhkcik7DQo+IC0Jc2V0X21lbW9yeV9yb3goKHVuc2lnbmVkIGxvbmcpaGRyLCBoZHIt
PnNpemUgPj4gUEFHRV9TSElGVCk7DQo+ICsJcmV0dXJuIHNldF9tZW1vcnlfcm94KCh1bnNpZ25l
ZCBsb25nKWhkciwgaGRyLT5zaXplID4+IFBBR0VfU0hJRlQpOw0KPiAgIH0NCj4gICANCj4gICBp
bnQgc2tfZmlsdGVyX3RyaW1fY2FwKHN0cnVjdCBzb2NrICpzaywgc3RydWN0IHNrX2J1ZmYgKnNr
YiwgdW5zaWduZWQgaW50IGNhcCk7DQo=

