Return-Path: <linux-mips+bounces-15395-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wAIcOwcLRWrQ5goAu9opvQ
	(envelope-from <linux-mips+bounces-15395-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 14:41:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D06ED777
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 14:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nokia.com header.s=selector1 header.b=t6yVBeVS;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15395-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15395-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nokia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC81330C4A4B
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 12:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E7548AE09;
	Wed,  1 Jul 2026 12:26:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F1481649;
	Wed,  1 Jul 2026 12:26:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908794; cv=fail; b=R4/g2amtijKWqOraf5+IfeAZcath3xRTaxvn0Djff5BFkuHJqpWby2mOwqB0Stn907uq2trliZnvpa2a5drar0l73BfsNefIn64fz7uCNaKv3VkCE2dOQpd5EWX4KA6WiIRPWwW+cg2U3Blr3vi3VlP09yhX6hy7glj4i03LCzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908794; c=relaxed/simple;
	bh=QckbG/mvdoSKRP8VlkCmN9MlygbKOZuu/JIyt/M8J1E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fQbMAAP4jOb3mY8qavG+z57oCOdHEyxtWmBICntEykTAG8y7X+2QhMrQVlbf7o040lKWTf7EhcNKtX+uHExwINWOhYxCCsFPhFpCSmjhXl2NmaxUawykLbfuwfqComSvPK/HAfki990Y9P7xjsqGeCydJDRKehtgmaxc0tqgTlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=t6yVBeVS; arc=fail smtp.client-ip=52.101.83.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6hH2oh4ruKyKO1aOiahgBBS7INQIOXXAx9sejam1GQ3pSVcFnQVt4jinUAEJp6uaQ14G05hTkC79dJs+vp+Nxv5ASPr7KG0JDFs2cuqnq2xqcxsOnNctgIH+sbfT8Q2dv7KnwWOnginvDtWvqrCbsc2f58TPBu5TFs2jsRmqmK7NUde9xb4bxQEmukuaDvrTgFM7/l1P/V5KMXjaq79r+eXcToLds9JDax5ISjS/FUctSCTzRf+ipR+BPDCKLyyZzCY54DY4aS5kI1wU+o8Ov8gsnqfnoXz+HWriDGIjYDEQVPcmnQcWyhCKhVvOjaU1nV0v+dr4evIMTOmM4wJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMxzanPf4GHq/EqztXHiVsZAs83XrXlnt/rByJZ0LeY=;
 b=CTmERyHr0RpWe/zjQREQn79zyNWjYgq63xoMM+09S0iet/qWHhJXKsVZDmSTAPrWpfuLFVSceYBgegyOGDaul/UJJtwbioQPxTOOYCq4oTgmX49HF3HiuLv6MeTyIRsjxlcrqX2XNSGai0t0bZFHrLdtvmy+4BKjEChxBBw/FfD5jy+DhcPK976g2FXJQ0baQ4sIn6IRR4aVak4CyFbl71Xqof33oQyHykVSm7IOQ3r4JuOVpK93DCGnPVwmIU3JOKtoZDVMerZdjL6/s6XURpTp9LCqDSedpTdbiXfsLNPus7s8UjbmG2XRppwjVR4WHf2nKikwNVqXgPkkaNv+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMxzanPf4GHq/EqztXHiVsZAs83XrXlnt/rByJZ0LeY=;
 b=t6yVBeVSljzzhoKvMXm1mjvGIzbyyexD9js/GrqQ59qosUImg/QyKNb8LTPVowMHoQQKOL8SZECOngBUtRP9H7fBKO9fG0NNgJCVeXFJMVLUaivRGVbmdAGDjDBakwpw5sjtZ8CwYuY/Y7CvLgIZUuNdmyT8aIRtqeZw5mwsJjfzrtH5JXTdgPBP8OWY9dBOX4Nnqegub8h09Siz65/fGiRlSfvHhW/Bk1iQ1nLNVdBmOdRFRGdDXW+cDXZfa8VejuML1j0Y1fEDRmTArn/V9GJQD/QDH2c/f4Wo1MnB+v5ZzIJAB2UQfYPfDSGj8aHCRZEOF+S5N45VPJVIIh42rg==
Received: from AS1PR07MB8901.eurprd07.prod.outlook.com (2603:10a6:20b:480::5)
 by MI3PR07MB12339.eurprd07.prod.outlook.com (2603:10a6:290:73::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 12:26:30 +0000
Received: from AS1PR07MB8901.eurprd07.prod.outlook.com
 ([fe80::66c4:2505:f3d:9e2f]) by AS1PR07MB8901.eurprd07.prod.outlook.com
 ([fe80::66c4:2505:f3d:9e2f%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 12:26:28 +0000
Message-ID: <18fdaf3e-a957-4d9e-bc29-3c570d50f482@nokia.com>
Date: Wed, 1 Jul 2026 14:26:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mips: mm: Call rcutree_report_cpu_starting() even
 earlier
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
References: <20260409164846.3176046-2-stefan.wiehler@nokia.com>
 <alpine.DEB.2.21.2604101353010.29980@angie.orcam.me.uk>
 <dff4fa6e-8eed-4dde-be99-f8adced872e2@nokia.com>
 <7fd22b08-d9af-4751-a6f3-6ef9c9205a2b@nokia.com>
 <4a414140-66d7-4114-9b36-e746573d4fa9@nokia.com>
 <alpine.DEB.2.21.2605231440350.1450@angie.orcam.me.uk>
Content-Language: en-US
From: Stefan Wiehler <stefan.wiehler@nokia.com>
In-Reply-To: <alpine.DEB.2.21.2605231440350.1450@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To AS1PR07MB8901.eurprd07.prod.outlook.com
 (2603:10a6:20b:480::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR07MB8901:EE_|MI3PR07MB12339:EE_
X-MS-Office365-Filtering-Correlation-Id: afbcfdaf-89ce-4390-98d0-08ded76bf950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bJaPvrJHpDoEnyU4ZwhRARYBdV8blcIMKIeR/pkRLejldfUwbQep1nj5LMrh4l0t3tbdDyjHIjAbILFPKL3bVoWjvABhG8ccoP055K1UxhRa9rnVOxTuDY5p5hs+L5iW0Fw5P8SKeQDmowL0h3T8dyDFGbfSs29y3KAR2PF4koWy1N4jxQ5ZGFb0Z4gcm7NfMmD1ffhqsbi4ZUmFUtWhmJNBLCH0w4RJuZBuLef1iHvu6H6P/+KcbLAZMV52Ru+W3V3fJ38QdJgoZHTSnSEGQ/AKN6LKU00x94ptwfYZBK+jE0bCMyY6YuCZwbqPYYx+Qs36+eyv92mhlN9tytf6akWobxw+/WBxzhVksfLnXW9kQYltTYqlVjmnwlmGJIcTMAt42caxS190yqWLVu8M5Hvln/h8WgiVxGuZ0ofBAc8+ohFQr5bPYrDPcGWpRFvkwoFXsB/uuNI/G+dWT3cJEy3nO6AixJhANM5fo3ux1pwUudc0FWBMcQFgGw1z6C6K6iXhwtRqvUl1T/vAQjPmPasP+Pt8c8M5m3KXylWhuYizccOe++txlltWpNmfWqWkoHDYUbMAGYoYYAfHH9vR9YFpHKKjKz1/Cg+hfTsMGdYCklM8Zp13Xlsw/UhJ/Fk/rYHnbWj7PvEnO2czWhcZRAFdr+/JSAEKUUoNUK4sFyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR07MB8901.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V29CQnNkYTc1dm5KU0c4alY0bWtuS1hXVGhHT1ZWOGQ3clFYRGtzRVRNa3lT?=
 =?utf-8?B?K05aVzZiZlZCN0E1cVlFenBub2pJOTVxT1dscWJiR2pSSmZmUDRTSU8vUjZr?=
 =?utf-8?B?d3NlcjlVellCRDA3bUtjTDVGb2N1b3YxSVIwcUR1N2FLTWhTekg4SXdkSHVi?=
 =?utf-8?B?SnprK0pFUlZwTmhpbUd3M1pFaDNscmxLaHh0UVBFN0djZzNSVXg0SEpxUTIw?=
 =?utf-8?B?OHUvc3BUclExbnpIQk9YM0RlWHZuYmRwaEMyU05NU2dEbnJkQ3crWFA1QmxT?=
 =?utf-8?B?eEtKRDVJVnVlWG5RTmFLV1dYL01tUEZmUXhFWmh6QmtLdXlVNE9kT0hQOUJS?=
 =?utf-8?B?Qzg5c25qS0NKWHphKzdaZ3VvcUx0aEtLUVRGWk5jeUFIaitUTXFpRFZFQWRq?=
 =?utf-8?B?WGZ0a0tqT3lGYnFVOXR6dXl0a2o3d1JiMi82KzZ2MVhpMkUwSU5ZbzJDUmxq?=
 =?utf-8?B?NHpNWHNyZWIwOVVVYmpiSnZPbFlJaVJXMjlGOVMrRXFkM0Evc05ZeWo4TWF0?=
 =?utf-8?B?OXdkV0FiVWhTLzhLRDBJejZlTy9iYmtkNDZsbzlZZnFNRE1Fa1pYZ1plbCtT?=
 =?utf-8?B?cXc4UjR4L04xR1MvYXJ4c0xaWGpwelBHZ3gyWXBpMXhLUC9kUFRTQWV2OThj?=
 =?utf-8?B?YjlpREtXUHU0M0prUlE1OWxKK3lHVjQ5Tzd2YjcyckVmNFlHVHVZbVU0M0Uw?=
 =?utf-8?B?R0l6Vk1iS2RrUVo0U25SMm1YdGFVd3ZHUVJXWk1TS2RRRTRxbnpZY2c5bzNo?=
 =?utf-8?B?dVpwSDBhcGt6YkZybldGQXk5YllxRkpLaktlVkpaQmFscWV1VFg4NUxDK1ZF?=
 =?utf-8?B?NHkzbEtaUlhkQ3dXMmhDZzRIY01hOUNscU00KzFCSXdrckt3YXZvT2xFNDFp?=
 =?utf-8?B?Ly9renBReUsreERkaWEzRndBNExrVmNiam81cDFzcVNVL2UvRlhIb3Zzdkwv?=
 =?utf-8?B?bCs4U3V1dzFzSGxTMlpQQ2JSWjZsbEVBV1Z1WmZqcE5IQk9IWHhyMlF1bTRC?=
 =?utf-8?B?ZnlBZ29nVzVkZXQrSDlCQW8rbHhmUEg1bk1icVhXSXd5SjVWYi92TVdmMktz?=
 =?utf-8?B?SGs2Y1h0dmowait3YVRmd0pSdEtlNHZOVGM1emxZNG1kY1RuRzlwUUxkaXJs?=
 =?utf-8?B?MFF1a1Bqd1A4UkJtak1xOWhoditveFROMlFrU2dvcWd1THhEREFNZnZYeFdK?=
 =?utf-8?B?YTRnS1ArN2NTTmM2aGhJN0RaTzBQQ1FoUDRPM3pNUUVPalUrT2xUWkZzamQy?=
 =?utf-8?B?TUQ0cW1BMTJnNk9pUXlXa0xYWTE0N0xxUlFqQ2RXTzNIdmdkUUo4aUtaaGl0?=
 =?utf-8?B?aTV4c2JVUkw1aGcyS29GdUNIR3A5VGdWcCtxMVFRQzUydVlIYitqL2Q5Mkox?=
 =?utf-8?B?S21iVFo3REpXamYvWHUyYkk3N0VkaVUrTHNQa05XbVkzamhmWkEvZ2RqTDlT?=
 =?utf-8?B?NUZPajR6dmJ6SWlFUTJVNlR4K05hdlRNSEM5WlQxR3d4OFJqcWFaYzVRMUkx?=
 =?utf-8?B?SUxqWmpzQVQyM3pBUXA0WFVVMG1mNzdOL1lJZkw4OEE4RjI5Q3E4dTRMVFZq?=
 =?utf-8?B?YWVlUFJDU3ArQjQ2QXlrSWliM25NcFBtWVRvV2JuSnZRaExaYi90eG1VdlRw?=
 =?utf-8?B?NWNJdTAvUTBrSG1TNTBpRFRYUUdiWHpmNlRML0dXT2ZCR2hiNE1jbWFGYXpU?=
 =?utf-8?B?QkJzS1FXckJyUjdzR0RKVzJzSHd0RVo5QStnWkYyY001RVZ2V2tBUlVjNkhO?=
 =?utf-8?B?SXNVZXQrUzl0bTh2OGUrWHQ1M3pkbk1MRDUxMzRiMWk0NFRCdkVhWW1tcXZF?=
 =?utf-8?B?d2pSL0x6YmZKMUFRUm0wZGpwd0gvR0M1dm1MMUh6YlVCSGNMNG1rNnJCSHhL?=
 =?utf-8?B?aDBKN1VycWp3bU1wZU5QUnF3Z2R6a2wxekdaWXdYeXlXWTFuUTk0aTBzVnFq?=
 =?utf-8?B?MGVnaEtmYmYrTnFURW9RTkRIY3RCQzBjMlZpcW43SlRsQzRBNDhMcm4rL2Vi?=
 =?utf-8?B?KzJManQ5ZDk1VWswTWhhMTh5RnEzQnZPeUFZbXM1UEt6enhicjIwbkRkTlho?=
 =?utf-8?B?TWhiZ3NIRXhtNGR2d21vS1h0dWM5MEdkOS91RllFQ0VwVjIrNExPVzFxOXZ1?=
 =?utf-8?B?TXdCa05HVEd1RjdjaFlkbFd4U2ZUOVhCU1UxUnZwbFZsWCtaVkVlYTA3aUlT?=
 =?utf-8?B?WGJhMTdwdEEzU21rak1vNkxMQk9sN1RXdFBVM0ZUY25VbXBHMnB4TWl0QkZB?=
 =?utf-8?B?WGhXMkIwb0I4VjJ0WHJ3L2VVNy82M1ZVblJiTHYwNFRrRG5oT2pNUFhVeGFh?=
 =?utf-8?B?SFNCeDNUb1pNUEhValBVNTViTmUvaitNbFA2dzdNN0U3Y1k1TmE3cGg4d09D?=
 =?utf-8?Q?FOokB9ONp/CTJ+ns=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbcfdaf-89ce-4390-98d0-08ded76bf950
X-MS-Exchange-CrossTenant-AuthSource: AS1PR07MB8901.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 12:26:28.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFdzXWYzDT07i1M9HnrrqW4DGk3O7wCYq474sQFWdUVJh9TANANgseD9MnUKPHQnS3TI4qrdi1JwuAFahPbZaGWQFXiN0W25YfHP/xEzgG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR07MB12339
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nokia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nokia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15395-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:macro@orcam.me.uk,m:tsbogend@alpha.franken.de,m:jiaxun.yang@flygoat.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chenhuacai@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stefan.wiehler@nokia.com,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.wiehler@nokia.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[nokia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 893D06ED777

Hi Maciej,

>  I'm afraid I have no QEMU installation ready to use, so I can't reproduce
> your steps without getting sidetracked.  Would you be able to explain why
> it triggers with QEMU and possibly the I6400 CPU in particular, but not on
> real SMP hardware I have?  From your commit description I infer this isn't
> supposed to be a heisenbug.

The only explanation that comes to my mind is that your platform has
TLBINV support and never calls r4k_tlb_uniquify() [1], therefore
skipping the kmalloc() call. Would you please verify that?

Kind regards,

Stefan


[1] https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/tree/arch/mips/mm/tlb-r4k.c?h=mips-fixes#n817

