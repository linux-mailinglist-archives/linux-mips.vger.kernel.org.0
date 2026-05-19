Return-Path: <linux-mips+bounces-14636-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOIbOpdgDGpXggUAu9opvQ
	(envelope-from <linux-mips+bounces-14636-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 15:07:35 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E257F4CA
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 15:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1EEE3083F2D
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 13:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947AD35201F;
	Tue, 19 May 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="rQsZVf52"
X-Original-To: linux-mips@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A584DB562;
	Tue, 19 May 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195637; cv=fail; b=K9fULM5LRw0JBDc+XEeFT68dj5gZmJ96fOcp3OaQqeu1Cdf5eFJjLMKTGxsOmv5yyMO3EoTnY2zTPNz80DMW9s+4b19r+5E8mFv/m06j1pV6cDb7ok9RedGGITVuu6L/1H9H19TOkvrbOGJ8dyQNlDm/EmsvirfS7hMzkga6i5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195637; c=relaxed/simple;
	bh=J8QNRUxXRdcXk+z7Kyp9dT+J+owDfYt/xl08WDgLeA4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ATLwFuMPsxE3u6XNzC6RTW2RQIQV9+X65m5OjDoIlNVlqZk2cNg2T0g/Di68z868Gpx9yI8V1jE84uGZapfVIEztlC37EbX34p3L+8ONTwF1r5IXhu121Bi3iuwi1HbEgBy4FdwoKn/jVMupL1RcXBA3+w2KV+Puf9sBOq2dBts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=rQsZVf52; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/fpcgipvZauxZxPHdGvg5rqakLbtI+b5FEmMYvvIMNjlJLAuD05kEpMKaZmu2MiU6IiSVfiUbdwKgq9FMgHxS6CyG7szZGWKZO25gieHjcsw7zsA0K90OYT7w0p3CYwRDt9xZst0IWO+nJH56mSatdkZJDGOSNA3HPyvbhA7NzJ85yfJaUzcTI8i9yBqPMj5S2UKElhq0VA4w6xWcHXnYClcNEqfau/VtyuuDaGbFDoxf1lnptn1jEDRzJPhiEkejrx0fSqhFGxPDiAXUEGOnYjsPwA97AmoRixrpfKG+IWwGazgv2K7pdx8UQ7CaMtO3zk5cO9TctjqFLCW1oWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7C1LKGNXW+4MUCmAvDKKmcdvtNi9KSBlfXAG4AOlYU=;
 b=fjptrOEtMdlyDm1fWlVagamAXhmvTs709sQ1OpwFFgx5oCfX0LC9jh0nrp8z8qfU/Y9o/h5C0wJ6bikR+O4ZWtrUb7EYIqHw4O5Yb17JR8DPXae+exNPNvmmXZsMZxUtbiJXEuVyHYdSidD8gwtj10j94oZgdNkoEiv1+HadXciIaZ+GlegaqWToifwEt+7z9Hjd/H+yte8I6aLt7jqyfPP+toyNkPUCTC+EaTdrevPTZ/as6WA+AN+qhu33dwTgdHWwQwzoDiApI8LGtSAmCBaCXjllUz+ZbLDQhW2/668uKE4MsaiDpVfjdf/6fTtIhT3N4rIAtjdjtXmA5N7cdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7C1LKGNXW+4MUCmAvDKKmcdvtNi9KSBlfXAG4AOlYU=;
 b=rQsZVf52umcDGXe53c7VDYEJPD4vntMh0W/0srxEr+L0shmud7ApCNt/2ZNR0s66l9t+VeJjG5gHKAEa5n9YznFi59lG8dfAnpsx9I9tZ4eWdpZwiXEJzEYPkAI8df4wfNnCrdLyKyfuHdTdsCmmoXja99CrlTQjl/3p2ZglGr2sck43kaWGasxlqzlR6OCPn0MtU82XC+7LzUpbxht9bcDE8Bq7ja6U0Zca0AK0NcHpVwOellgj5fZOaD1IXK2IaIEkXI0f11ibIoNN6ZQjQJyB+q/1/CAxm2J2IWu0DF9hAXUjTbCM/wDnd3qWHnQm16oT/ZC+xF/E3B5EI8ir4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AS1PR07MB8901.eurprd07.prod.outlook.com (2603:10a6:20b:480::5)
 by AS8PR07MB7605.eurprd07.prod.outlook.com (2603:10a6:20b:28b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 13:00:32 +0000
Received: from AS1PR07MB8901.eurprd07.prod.outlook.com
 ([fe80::66c4:2505:f3d:9e2f]) by AS1PR07MB8901.eurprd07.prod.outlook.com
 ([fe80::66c4:2505:f3d:9e2f%6]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 13:00:32 +0000
Message-ID: <4a414140-66d7-4114-9b36-e746573d4fa9@nokia.com>
Date: Tue, 19 May 2026 15:00:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mips: mm: Call rcutree_report_cpu_starting() even
 earlier
From: Stefan Wiehler <stefan.wiehler@nokia.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
References: <20260409164846.3176046-2-stefan.wiehler@nokia.com>
 <alpine.DEB.2.21.2604101353010.29980@angie.orcam.me.uk>
 <dff4fa6e-8eed-4dde-be99-f8adced872e2@nokia.com>
 <7fd22b08-d9af-4751-a6f3-6ef9c9205a2b@nokia.com>
Content-Language: en-US
In-Reply-To: <7fd22b08-d9af-4751-a6f3-6ef9c9205a2b@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::14) To AS1PR07MB8901.eurprd07.prod.outlook.com
 (2603:10a6:20b:480::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR07MB8901:EE_|AS8PR07MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 252f1dc3-68d5-4467-00c3-08deb5a69c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	1fGqGme5svYQpPbsFaB6DAh4y+1hlqV0SL2ATpHuf80DE8JAb1myP1vtwALnLAS9XFajV+8rfFC77NPwt7x2y8vd+eH/aEV/Bosd4e5ug8azpu950mcyrkf20c/YS9GimjCQTFBP2mG3YBsPRDXO7o9uY7X/J9Wdp0dWRAMT81+Frzrpn7VdmFKGiTGVFavkayI5+b8nSrqjUQ3tuDG3pfgLEsU0BHfdj+la3CEtv7KRJ+CkggL9p10JFFkF56oHluCSgbqMa2QqDAQrL5WWLprMqc23KKEnh2jwl2EVEVCUgVHxLpDEKmn3MwVdv4pozhS/B/0S4h+K+mF0qbm21RIVnVqdwIm7NT2JOthSutn8M+Xl19Tym3N/zNcIaWPa3zuOFV2VeOPV7VGZtwBYhSA3O7Z37P+DWIijRg9s/byJ6AT535wtkVdjID8b4NN7oJDoRLQ28+boinZVDAWimmorllVlwO9Mte9O+qo6FRmm7gnbkceHVxL3tjyEo3rKsFwTOyNNtMbKDJS4OzgvswlS8X7AwFmLIAwwqoSk8QizsVhvqSyjafuM+bnfWdoCEHoZS3+Xld/LOBGW9GgEaQlNL7pSwdMDkqz/9Tpkk+X79cntBGJdyZRHh6sdnXrEYRsgUosZlCl0g5Dn4qfcZRvL8CpfuFfVhm81RjX3qBQ5NH9dxZmNoiE0wCb36/p+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR07MB8901.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGJJNzlpV2p3S2NlUWEyTVdaWjZWdzlBTDdkUjBXNnp6R1J4dUNZTHFOSWdU?=
 =?utf-8?B?bmJYam41TDc2TXQ3U2JHdzA3N1lIYjh1bkxjL3dHZVFoc0c2V2w1VVZSanBX?=
 =?utf-8?B?dUY0empRMWF6NmxuL3hnQ3VnSGpqZFFSUUZxajlnbWF4aHlCMkJuQjA5SmFE?=
 =?utf-8?B?VEtrMXNyR1lOT0N0cnduZ2dtRnZqT3NZTGNtTmlaRjgxSW1CemFjeEtxVlJ0?=
 =?utf-8?B?Z1dpR1E1eEZpengxaFVHZmo5Vk41K1RlTWFuWUJnUWFkL2lMSS9qQjJRUXVk?=
 =?utf-8?B?bjdlajFZRmgxNVBMYWhTRE9NT2tJdktpVGw1enI2UzB5eGF1L2R4UG83d1lu?=
 =?utf-8?B?cWlzb1ZSSnU0bVV3cWw3Mk5VVk93b0pCeHhPVHhkTmgrQlg0TnhPdk5nQU13?=
 =?utf-8?B?UFBkeFdlQy9ZU2hFTHl0SndsSjd6NytGT25nZjA3V0hJNDJnSGNmSE5PQVp0?=
 =?utf-8?B?N0dMaW9ZdkdWZjZYK2lCUmZOU2RKMnFWd2E0VFFuNWtaQ2VYQ1E4WmMrVXZm?=
 =?utf-8?B?K0JCRFlvWC9pRzBlcjJCdWJFQWJycmQ5dVArbHFRYXNQeWk4dWxTQ2xlM09x?=
 =?utf-8?B?OXdDSDhiZy9iMElaYXo5dnpwTGtRaFlnRUxIVnhMbFpEOFN4U2lKTTZCcWFG?=
 =?utf-8?B?M2ViMm1jN0xtOFpLN0twcVliNkF2ZlYrY2RQTGN6L1NMUmZ2M00zdzJKN3ha?=
 =?utf-8?B?VzJ1RXhBMmJoazNUSnl5aWtBcHZ2anF6OXBpMnQ5STRHVWZyeEQ4TXlkVncw?=
 =?utf-8?B?cktJUGtUZXMxM0FPY2Y4MGZMMVNjc2FYZWRnVytEQ2NKNkZmbGo5MEN4MnRV?=
 =?utf-8?B?cGVzaUM5TjB3cFBCem01WG42cVhEcUo5eFVtdnRINFZ6QzNSalIzNU5OT1Vs?=
 =?utf-8?B?ejNFMXlwSFZ4S05tdUN2L3BsSy9JRjNoK1pIblliUjBRdVp4YmhFZERTdkxp?=
 =?utf-8?B?RllGZUJPRHJ3cG5HTHNibGd0cXpWbmZZN2x3ZncyNW1adzQzdmNsd250dFRG?=
 =?utf-8?B?VHNBOUN2Z1F4ZUZuUUhHUjFQL3dyTDkwdmM0U01MallIT2pYVGVCQitUMjRw?=
 =?utf-8?B?bENJM0lyd1V1VTRzeFQxVmdLQTRnQytwamdiUHNuUVRoaFhxQmdFV0NpUVM1?=
 =?utf-8?B?TTRyR0FVaUNrNncvbnJtV3M1SXRhS1F6U0drVTJBT3dWNnB1ZW4wSlVZQVlI?=
 =?utf-8?B?MnNQVFJVbXhielpBRnpQRFRad0JuY3cvVU5hSVNBSGNQb2tEZlNwbUkvTzkr?=
 =?utf-8?B?TmJVWFRNajl2TmZHdEZaU2RMUm5YdnBGLzRWWldHRWppc210RlJ3MzZWNWZr?=
 =?utf-8?B?dnVtZ3Jhb3p2aHVYa2ZuSCtRaFFTYVZuQmhJdEZNZFVBZXdQa0VEVVVTWWcx?=
 =?utf-8?B?ZjROSW42KzhvUXFLdCtod1luM240aFpEak5DUVk1ZlhHeWVmMUtXTDJjb2tx?=
 =?utf-8?B?aGJDTUxueWFlUHo1NHZUK0k5K2ZiQU1iMlJseEpEc0J0dmlRQSs0S1cxaDQr?=
 =?utf-8?B?bDR6SDU5TFErOXlhakcydEc1U3FSTy9lNStSd3p5OFRsbzhzOFpPRXgvNVNs?=
 =?utf-8?B?bFVhNmVzRDl4aUVpZDROcFNIZ05vcm5tK0dabXJIdG8vS0RYMjNla1NWMkk0?=
 =?utf-8?B?VWFranliaW8rMC9TSXRNUGVxZnRHUE8yeDZDZWJWSlpqbTBVdzF1aGtENkU3?=
 =?utf-8?B?KzZGeUFBY3BZTWtRSi94OTBWWmZSeHhFZ2FVK1k4WjBLYlA1ekc0Z1BtTEln?=
 =?utf-8?B?VHVRZmk2bTRWTVVVNFVvU0dzTis2d0h2OUpqWXp5dklPWUlvQkVEMXl1U2pk?=
 =?utf-8?B?dUVkQ3lYTldqMGY3OEtlNWxQTG82S2dadlo1TTBsZ1lFdjJzMmlaL2NTVktT?=
 =?utf-8?B?WXIyWTJNODVzRFViRmk0WjlLdTR6WlNMWTc0aVA0Yys1ZTM5OEg5UWhIeEpl?=
 =?utf-8?B?TURFNktacWNMNHNoV2x0Q3lCUENvbzhyb1pyczMwZWVEZGlhZ2NqT2h0dkhN?=
 =?utf-8?B?WVczMHdxMFh2NWRrSThrWnB3aFNQVzJxdUVrWXZHM1NucnlGRi9OU0toYWlC?=
 =?utf-8?B?eWRMdVIva28xVlZ1SUNaNiswS1RXU1RRLzZhWWZ1bHNjZkNyd2xMbW9mK2RJ?=
 =?utf-8?B?b1F1VHRkVitDQnlvOVR0LzgyeGptOWhmUzIvR2ZaRzBhM3RQSTJUQXM2NkVs?=
 =?utf-8?B?ZC9LU1ZxL1E4MDRiL3dwOW9UaXM2RG9NR2k5SGpuTmZKR2QzYWJNdnVBcVN1?=
 =?utf-8?B?dUEwSGtQVTZ5bVoxMVZ1RGUwZ0h0RDZySnprYmRSc1FmZXBwcG1aWTlpZU85?=
 =?utf-8?B?V2U5VW5pcWEzWGR3N2l6eEtXOUxGVHdSa3JwVmZwWEMxVmhIOWpDZz09?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252f1dc3-68d5-4467-00c3-08deb5a69c4e
X-MS-Exchange-CrossTenant-AuthSource: AS1PR07MB8901.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:00:32.7451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMerIIK+Yc2TVTX3orggUdT75ZFEMmeJnyhhJhHNlHXrR/bY9MqXFIETHgudr/gos7T8pNfk45WmWfXrxqnCeeZZbW+9wypyWT/VnVR39Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7605
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nokia.com,reject];
	R_DKIM_ALLOW(-0.20)[nokia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nokia.com:mid,nokia.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.wiehler@nokia.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14636-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[nokia.com:+]
X-Rspamd-Queue-Id: 535E257F4CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maciej,

> I was able to reproduce this splat on latest mainline with the attached
> defconfig on QEMU, which I invoked as follows:
>
> $ qemu-system-mips64 -cpu I6400 -smp 2 -kernel vmlinux -nographic
>
>   =============================
>   WARNING: suspicious RCU usage
>   7.0.0-rc7-dirty #13 Not tainted
>   -----------------------------
>   kernel/locking/lockdep.c:3801 RCU-list traversed in non-reader section!!
>   
>   other info that might help us debug this:
>   
>   
>   RCU used illegally from offline CPU!
>   rcu_scheduler_active = 1, debug_locks = 1
>   no locks held by swapper/1/0.
>   
>   stack backtrace:
>   CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 7.0.0-rc7-dirty #13 VOLUNTARY 
>   Hardware name: mti,malta
>   Stack : a8000000021fb938 0000000000000000 0000000000000018 a8000000021fb888
>           a8000000021fb888 a8000000021fb9b8 0000000000000000 0000000000000000
>           00f87412b0603bdf 0000000000000001 0000000000000000 0000000000000000
>           ffffffff80f9e5b0 0000000000000000 ffffffff80abb824 000000000000001b
>           ffffffffffffffff 0000000000000000 0000000000000000 ffffffff80d2ea28
>           ffffffff80e10000 ffffffff80ccf9e0 0000000000000001 0000000000000000
>           0000000000000003 0000000000000000 a8000000021fb680 0000000030400080
>           0000000000000000 a8000000021f8000 a8000000021fb880 ffffffff80f00000
>           ffffffff801190dc 0000000000000000 0000000000000000 0000000000000000
>           0000000000000000 0000000000000000 ffffffff801190f4 00f87412b0603bdf
>           ...
>   Call Trace:
>   [<ffffffff801190f4>] show_stack+0x5c/0x150
>   [<ffffffff8010eeac>] dump_stack_lvl+0xa4/0xe8
>   [<ffffffff801bd250>] lockdep_rcu_suspicious+0x180/0x228
>   [<ffffffff801c2020>] __lock_acquire+0x15b0/0x2b00
>   [<ffffffff801c421c>] lock_acquire+0x144/0x490
>   [<ffffffff80ac9e9c>] _raw_spin_lock_irqsave+0x54/0x88
>   [<ffffffff8031ec90>] ___slab_alloc+0x190/0x950
>   [<ffffffff8032282c>] __kmalloc_noprof+0x344/0x520
>   [<ffffffff80323d88>] __alloc_empty_sheaf+0x48/0x78
>   [<ffffffff80321904>] __pcs_replace_empty_main+0x4ec/0x680
>   [<ffffffff80322944>] __kmalloc_noprof+0x45c/0x520
>   [<ffffffff80abe770>] r4k_tlb_uniquify+0x58/0x2c8
>   [<ffffffff8013af6c>] r4k_tlb_configure+0xb4/0xd0
>   [<ffffffff8013c5fc>] tlb_init+0xc/0x80
>   [<ffffffff8011b054>] per_cpu_trap_init+0xfc/0x168
>   [<ffffffff80123a68>] start_secondary+0x28/0x118
>   [<ffffffff80125864>] mips_cps_core_boot+0x74/0x88
>
> However, on that platform even before that you will see various Lockdep RCU
> splats complaining about taking the console lock from an offline CPU
> originating from c-r4k.c; one more reason to call rcutree_report_cpu_starting()
> earlier.

Any chance we could conclude on this topic?

Kind regards,

Stefan

