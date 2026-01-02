Return-Path: <linux-mips+bounces-12698-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A29CEE7AE
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 13:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9A4130041B6
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 12:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0702D640A;
	Fri,  2 Jan 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="gf1FWcfK"
X-Original-To: linux-mips@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455FAD5A;
	Fri,  2 Jan 2026 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356211; cv=fail; b=PvWiN9YQ7maJoZhnZGvWxR6OVV/LWVVX1W7mwmMgZKzBkisDt1sAIXZ30PlX/ON1awAShbsqNfKF8jkOOk1aP5wIhmVKWqbeFMeZ7IupaibmbFR2OmKifsw92HMkqqdhKFVvmwR+aAkh1kt7/EEmWeT+Pzh3UQzh0qoDRDGjNyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356211; c=relaxed/simple;
	bh=rsIa8Rt7XuSR5NjlhGQBhjJxXPVsgoNclPVXPXbq+LA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R8LlnSSwyCrP/xEdwNAlS4ESA8gXFtJky5WgHBIqOaEIcRSU8Tods1qERSmuSmTQefGXeSSZfyNl3KynRg1IObTxVQwAREQSnLA4SbvZ+831B8TQPG6GbI8cbAZSedhS5bq+ThufnuHg/RxjVdzeTpY2HplBZGq8Ahu1VhsCv30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=gf1FWcfK; arc=fail smtp.client-ip=52.101.84.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9JZqYh2DdnhSFh8zySub0M8TUm9rxafNv8TrrWujBNoxGPELSNhcOv0fsjjsMM9B817N3wJ9BR29SuqaDiaURKZeTfDVQek2WJ4oyvCzPBvbMulykzfCdJfusAWG8SvouuTYUQxZ8Ve/Nv7Mt9kWUwZD2DNvIzLd5+pjuFrjvb3WsNCD4jZyj6FsKoYoPGTHHoqpllHtGFns3ejKFhSxjS906sECZAUY1CEM57moK0Pk5mHpJJUPBO2AhIVbDBVzl0cP7b69tWH2BV9IJU61VhzJXnJ9SIZ1kMFs4twemEbE9ElgUILMXCjnWfeI4ROJcLpCax95Kl1Othsj+UjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dji0+64rQInYR7prceZ0kexNNCXMigVB52HVLPZa+eE=;
 b=DblTVr9HcTw47x3txlmJKFtpXGvToAmTr16S+bchUfDKw/I0wi0m9W1w/bLgB5rww9TdTpvOjwmlCoGgMHuNqy8Ab2rFKV+Y776MT92lDcRid9bAuPiyh4kUF1G5PtY9Q8/2NDZwkhY91S8SL/wArSZV1CingO3BJJIcolewnhU+eh3O7rDQ3mKsyLh7N3XWHNYckqZyzXnHRhYIVJrYTz5IrB7zuTl2tLRXyZ/SZcoKyf8o+uxdRNnplz/Ks+r7mGNRvlkH8Bij83s7T/TruqCWlOa/rwpKT2QrW3/vPFancQiNp1Y2pOAu0XTn2xPMhxQ6ysaBZjkh826U5imffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dji0+64rQInYR7prceZ0kexNNCXMigVB52HVLPZa+eE=;
 b=gf1FWcfKBV9DpIoDdNlO3G0vofNDyqrBCtn4UTRPMf2HBtUXAcc/mf+HomHc9AoCzag0pSjZevHE+CJA8/iaayKAfgfUT23oZgaYIGkOvl5Kx2HrMO643wUkQt/vIh2h51j5ecu0CgqaueR/8n3xa/yFWqDPWFYGLkd6XTGmUZlQzUPz9xSrUO1JqeyQqfGP04ZXUpsW1g5MEtNjrsFcPy6eQIuiOBjFqDNAxprjsyXnpkbfNcFj+KXOOtMtFbJ6faF/UZq/rpoJ3dLPwWPZMFsw61/yS+GWYhos0ag4Ou3DvC/xyKfmZMuHDX8oAOxi4tnOZLbc7vld5oHFnl+ACQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by DB9PR08MB9803.eurprd08.prod.outlook.com (2603:10a6:10:460::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 12:16:46 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 12:16:46 +0000
Message-ID: <3ca3ee0d-7402-4f97-b700-a84971413d4a@genexis.eu>
Date: Fri, 2 Jan 2026 13:16:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mips: dts: ralink: mt7621: add crypto offload
 support
To: Aleksander Jan Bajkowski <olek2@wp.pl>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: ansuelsmth@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 chester.a.unal@arinc9.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, tsbogend@alpha.franken.de,
 angelogioacchino.delregno@collabora.com, linux-crypto@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260101172052.1862252-1-olek2@wp.pl>
 <20260101172052.1862252-2-olek2@wp.pl>
 <CAMhs-H_iN7pWsis2HbeJ-xr+9JoMa+EF-+7z9e21DJ1dyNNtuw@mail.gmail.com>
 <53dc4786-a6c3-471a-acc4-67486b8cdea9@wp.pl>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <53dc4786-a6c3-471a-acc4-67486b8cdea9@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0018.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::10) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|DB9PR08MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 919b9040-f77e-4e72-4169-08de49f8cc66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTI1a1Uycmw3dStWWUxkSHRjd3dGT3pidTY0UWtGZDZocVpZZFE3Y0tldm5B?=
 =?utf-8?B?enhBSzQyTk44WDhYSG95SWhJTXRzUEpMM2k3cjlhbkRFU1V1cnJpYjNRcWRz?=
 =?utf-8?B?U3FWU2daZ3dqeVcyL1JKN0Y3T2ptNGVhVDJ6ZlJ6cEJ2eTlLNWZNTXNmUUs3?=
 =?utf-8?B?a2xqYlNqYlJ4eDdUZVorcDQ3MmJCTitrVGZFYWNHbzZaQTVGQ1JCRTdibkMr?=
 =?utf-8?B?NklIdUxKY0E0Z3dTQWkvT1RNaGdVL2tRN1l0TkcwVDdRZVJTbUFJMGpjaXQ2?=
 =?utf-8?B?SXQwZEY5dXpzUXdvMWhjSmdvY05USThkbXFQVWM3aXJEb2NZZGlTM1huRWdN?=
 =?utf-8?B?c1cydTVPeEFXc0trZzdIVG5HRGs0elVWUEg0cFcxOVpaNXRwaktzblArS3dR?=
 =?utf-8?B?eDJqd2hhR0diemxFNGtpM2xDaTJXWUNjbHlIWEV3YlVlZGdTM3BDZVJxbUJi?=
 =?utf-8?B?U0t1VytXZ0N3Q0MwL1VrMUpVNDhKcU9MNlRCVlJGVmM1NTN0RHppM0s4akdt?=
 =?utf-8?B?T2g1ekhEaGVUZ3V5U0hJSkJ4UzlKaHd4WDFtZnM4M0Z4NE8vNGxHTC9Nc1dR?=
 =?utf-8?B?SDlYQ0FVZ29BTHNBKzE0a0FzZzIvbWNMakVTaUh2UW9MaVNtMTZRYWQ2WGlT?=
 =?utf-8?B?OTFjcGRKeFZLd2hsd2FWSm9RUC93ZVpPWG9LVVpZSUFVUWVJVUZKVmQ1WVJo?=
 =?utf-8?B?OXlFY0t6MVNzZUVkK0E4WmRucFFzMVNFUzFuYkxlRXY5aDdqZHdoMVltZ3c3?=
 =?utf-8?B?cW5oYXI0NG90bnR3NVFFbHFpVmpObWdLWHBzWUdrMDQxRFI3aFllbG1vMmIr?=
 =?utf-8?B?TUxnSTFHMlVLemI1anB3S3dhWVhiYXExU1FvOGxEUGVzdS8yVHlubGx4a0Q4?=
 =?utf-8?B?Tjk5aDZPVGxXOG12bTdZZm9tKzgyeU9ObUQ4a2lValFiUGJQbVROc2V3RjBp?=
 =?utf-8?B?VW9hNUZvdXpQRDJpdUlQZXFVMXhHWFJ5RjJ2QnNDMGR5OEptNVRyaGdlcnlh?=
 =?utf-8?B?a1FBMTRSNnp3eHlsRGxXdE5XaXFtWWRQc1pQK0psTnZjRkhZZDFCUmVrbjVS?=
 =?utf-8?B?bUk3VG8xeUMxVDBUcFdhSWpHTnFVL2k1MjZqQUY4Z29saDdGZHJjRDFoaDk2?=
 =?utf-8?B?QU1yQUJEMXZJNU5WUHlPVXBYN3BzcENUclQ3TDR5UjlSN2Q4TmpFRnBYalFH?=
 =?utf-8?B?aWlySVJMRm1rTHpzRHhqYnU3b29EOE9oTXhqci9nVDR0b0VncGlkUjkrTWFL?=
 =?utf-8?B?cm9tdkg5U3FGMHNXMGZYdWNhTGZWaDlPeTFaK0dEb2NnaWF4Nm5RbXVIb3Nj?=
 =?utf-8?B?Nk1pcTBIZ3AyM20wVkNUb3dwaE1SYURqZ21QMjdPZWNqcU5BYko1Y05SZmFL?=
 =?utf-8?B?bGNJdWowT3lMUExCSmU4SGJxYlF4azA3RnI0MkM5dE55QkdFTVIxSUZ2ZGM4?=
 =?utf-8?B?OHU3cGVva1dMUXZuSC9ZaFZRWGpiNGw5cmRBWFdhNlYvQkJYVS9qbUhPQUtK?=
 =?utf-8?B?VVF2dk0xWG1oNXF5ZUZmNGw4cEpOY3R2QjFib2xnVDVURG5UNExkUUltK2Ix?=
 =?utf-8?B?MnkwbC8rZDU4OXRrd3IrYmozYTBsc3NLL0o5ZVpZbHV0UVRjRTRUbjAxbGlI?=
 =?utf-8?B?OW5OQ0FYZ2V6cHpHb2FuamlReENWOUxPMTB6QWprUThJMDA4dG40bHRJRWpa?=
 =?utf-8?B?bWFBallmb21lRFRZNERzQnBISmtCMW1jMzQ3ek1veUJWM3EwOFJ0dTRuVG5n?=
 =?utf-8?B?V3docDEyR2lpeUh3TVpNYUdEMFVFZ0RIZnhjNDRsWC9QUDdzQWx3Q05iaENI?=
 =?utf-8?B?eThiTUdLODNTSUR5Y0d1Q3lMYTFJdjc0YXBDWDFYem5zbDNGZlJueU5wTmVD?=
 =?utf-8?B?WDJoSVVPSm50aEszeTlzVVpZTTVhN053UXJXYzVVbTBraW5lUDYwTmc0UzB2?=
 =?utf-8?Q?hvhiz83hYK2FlpDn2Q9YtJx/yIFOW91i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDdHRTRNdWtnRm01ZjFFNDNCcDg1OUVvMW5tSHpyZlhIMmtENTBiRWFsNWZt?=
 =?utf-8?B?QjhveGdoYmtRcVgwUkp1TGlBQ1BzcmgvK2NwaEFBZGFwdnBSN040RFVOUmxJ?=
 =?utf-8?B?K3E3UnVhZWNTM21peTI0TGVVdFdGUzZYQWlSQzRIclJ2Z2FCYndNbklBV2FW?=
 =?utf-8?B?dDZiOHFvcmsxQitscUxOeEJibjRZYklNU3lLT2FMR1RPN0ovWkZsaUdhdGFQ?=
 =?utf-8?B?Z21Zb1dtK1hiYW0zTGNpNTIydE4zRElSbWpQTzRPdkJFaTUzTTd5aWQ5eWUw?=
 =?utf-8?B?UlZpdzN2aUtkYmgxY2NNeXQ5YWR4b1RzV0huU1Vna0hNcWF0ckh0Qjdsd0VV?=
 =?utf-8?B?Q3JNdGZjNUUxQmx1Y0NYbmdUTTlYZ1QxSGRQK0Y4b3JvTXRjdWk0U2FPU0dG?=
 =?utf-8?B?bDVaZ0crVXR4dG8wS3dMOEprS25GbnF2MVAwdVVMMEN6aFRGcVg3cUZlMWxk?=
 =?utf-8?B?U205bHJudXN1M1VUQzhRVVdkSWx0clRlNDBzbENObkZURTdLWnZ1b2M5ejND?=
 =?utf-8?B?ZWVraTNRNlZpeUFsVmEyZjIxOW9RSWVSeU54MUpUQTc0VmFxeEtUZjJNMXJY?=
 =?utf-8?B?VTYwNlVZVk5FRlB3dXIyWVNEcDBTRFV2VjZDVTZrZDBmVWgranJmeVRxbUxl?=
 =?utf-8?B?dVc5bDZZeDJBR2YvVVBGUnBjZFFKL3Z1U29nS0pPTFlkTFNnMUFEd1JBaCtz?=
 =?utf-8?B?c21xZWRObUNtaE8xVFdSbUV4Y29RZUhrS3RBMVNleEcwR2k4K3p2aEZYaTdm?=
 =?utf-8?B?MzdnNmRhbmI4YXl6eXA0MktnaGVJa0poUEFUR3pHYjdOZ1FDOVJZdnFINEZL?=
 =?utf-8?B?ckJheUVVNGVBazhBaE5ldytYcDh6VXpwbndvbkZUSGhPa0FtOEFPTDRiRGx2?=
 =?utf-8?B?RjQ1c3ZaNHJ4OGQ0eExBdXhWTzd4QmEwdDJueUJRNm1hS1dEWHcrdEhscEF3?=
 =?utf-8?B?eHhzZk5QenNXZElHZ2kwZkYveUYyb0pNWnM0aEVPbEtSMTRiMklSSEw2bGRX?=
 =?utf-8?B?cWlDN29KS09IVXdtNEFKUHhRRllQaFFSampJby9QSTRhYmdsZFRyYko3ZS8r?=
 =?utf-8?B?cmRmYUhVZ3hRWG1vUHd3SWhPZk8zK0c3aEhaYUY3amFMakhHSlFZRjZwUDJx?=
 =?utf-8?B?VDc0R3hmdmVMaExnNXZWOVBIdXNFdVJtaU9lV013bU8xajI2UkFMbmNUbGpQ?=
 =?utf-8?B?cUsxell3dHhXMk5sQTk3N0tjYTJRSkpNSG5KNnk0YjBCZDd2SnBLTDUrb2VG?=
 =?utf-8?B?TnNyUXdybGcvdnpLYW9tQ042eEx3UW45bno0Q1o1bWtJbk1FKzZjL01YNlJW?=
 =?utf-8?B?NDQ1Q2JqMUkrYkJpUDJ3RUN1V2FJc0pDdTBiM1Z0bXZtNUlOMy9zTk9PZnZ4?=
 =?utf-8?B?MGUweW84QWtUOWM4dnJHTmVmMmV1UG5NL044dWFSa0g1T1VkQjhTZ2hoMkJX?=
 =?utf-8?B?by9tQ01zbUJOTkN5Y2VLWlNjdlpHaHptNXUwUnlOSkkwdVB3MXdIN1lHSGhH?=
 =?utf-8?B?YWx6NWFTdlFIaUlZbzlqUmxQTmtMdkkvakY1aDRvL2NZemFqT3Urbk1DVE5Q?=
 =?utf-8?B?aDlVbDhXNVdiS1NWQzlaKzVycDZaNmhESVV4RTJ1Vm5vUEU3WERmQUd2WmNm?=
 =?utf-8?B?N0UrWTBscnF4VXVPeDRuaHRIM2FpbENXbm1vY2lRelhKaWdSYmE0Q1I3MHFw?=
 =?utf-8?B?LzhhSVRWMjNtMVF1dTBsYlU4VENKLy9PNG12alRxZW9YOCsrNjFXU2VadjQ0?=
 =?utf-8?B?MWxFblRpanhSWTFIOEpzdmJvYUxCdFhXZnFNcWJSNmtNWWJlY0wyRXp0cWJF?=
 =?utf-8?B?SGgxTFE2ejB4VnpBRks3azIvWnNCOE5uOHd1SFhhZURVZ29QYlR4bW9PMDVI?=
 =?utf-8?B?QjRCUGpGc3c4VEc4NlZhTVE1WE9uTXVOcEJOcHRhK2hHM21rYzdEZkV0SXJD?=
 =?utf-8?B?b0N0TktPK3dPOEl5K0pGRG40SlJoZXpKRXQ2b0xiTjNhOEIyYmtwRjlDNW5L?=
 =?utf-8?B?bUx1MXVlREhSVzdPcTVYZkxUTVBZR1Rlbmc5Y2NvSWZrQ2lEaHRrSC9ubVc3?=
 =?utf-8?B?L0dsRTJ0ckw1b296ZzRNUDdiY0lRSUlsQk5ZdlgxWnF5VjFJU1lJeXRRd284?=
 =?utf-8?B?T2tWRTZ4QmRLWUxtVzRBQnJqQllRVXZ2aUlNUGc1S3hZNjVONVFaYWNwMTlV?=
 =?utf-8?B?UmJ3cE00TVlTWHoyUmVyMkYzbm5zN2NhdGYwRkpPeXJ1dytVdnpGODZMaUQ5?=
 =?utf-8?B?Q3Nya2VLSE5XRko3dDRFajlrQkRianBEYlFJWTJVNXY1WmhxcDZ2dGxDTHFX?=
 =?utf-8?B?ZUZnYTNCaW4vN0hJS0t1azVKbzl4TWFUUWMvZFdjdUdSMFZ6MEVXbmFYOU0y?=
 =?utf-8?Q?N1qpuX/Mx5oI8BlY=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 919b9040-f77e-4e72-4169-08de49f8cc66
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 12:16:46.4213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKyVsXNcYZORke4ZEh0a3RkDjdDMCLO5WLr1m96/lgdsk/QFQgE/BHaV1upm75JF2uvtG29q+o4Hh8tjQrucGhPgdu2jcAhMcWdS5cHC4mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9803

On 02/01/2026 00:06, Aleksander Jan Bajkowski wrote:
> Hi Sergio,
>
> On 1/1/26 22:46, Sergio Paracuellos wrote:
>> AFAICS, the crypto engine for mt7621 has also a clock gate[0] and a
>> reset line[1]. These two are not present in this binding.
> Will add reset and clock gate in the next iteration. It looks like
> the crypto engine in AN7581 also has a clock gate[0] and reset line[1].
> Just not sure if these definitions are correct.
>
> CC: Benjamin Larsson
>
>
Hi, bit 6 seems to reset the AN7581 crypto block ie the current code 
looks ok). The irq seems to be 44 and the clock code seems to be correct 
also.

MvH

Benjamin Larsson


