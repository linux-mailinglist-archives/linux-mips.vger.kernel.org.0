Return-Path: <linux-mips+bounces-14230-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HuDHEO86Gn7PgIAu9opvQ
	(envelope-from <linux-mips+bounces-14230-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 14:17:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AF0445CB5
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 14:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBC833012B68
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 12:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387C33D1CB0;
	Wed, 22 Apr 2026 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="SfCAxJaN"
X-Original-To: linux-mips@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA093CBE96;
	Wed, 22 Apr 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860203; cv=fail; b=JjuldaT+la3YhRNGQ0IEpuJfcK60Kve1NhVwNgoQA1bHqO8+sxQiMxxNmAf82pwtA78wS/zJ/GwNok6x3pGLpz7kTirX605Uyrn7cptgoL5Od6g8x8NrjTPorMiCAklIxRXCxxYKVtV/Z1OnHgxC3F4ZGs4VAdBBJZ0SN5IRfJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860203; c=relaxed/simple;
	bh=TnjO9pUUVwFpDOqJUBu3Lru1AgHovyX4odzjmap+ZWo=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CKobaTrZoB02Y3qdrl3gT+52+EJudR4nzhOosMZIbpTobGgrYwFIf1u2fSu7tkhRKn+0ZJWmiJUyERQvGmwu5m/uAF+nh9Mr0dWUwO8NLe6YzR0tEZJNjNJ6N+wVFameaW5eicZLxrVFIUfmVPuf/otAbPmxU55MgWiRrYRkSQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=SfCAxJaN; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrQ9yp136Nl++G6ICUT4G2+2wdA3IEj2hnG8KvLY87XeeOy2OUtNW6QygKuzGSo9U175ZDETQDvvufqqVEYKfuuXA7/JBrZkQb101fJVjygh1g6DLSBwhuH0OXLRU1Dan6zVjaYzVPWfb+Z9FHCXS9T9DQV21xpHH6VmRZrLTpICReCtMYTPG4/itcRItkam38VbhPdoCM18RmXDj1BpVxIek5EdYKKGmBi0FYXqCmZNd3OVVxg/X5XTsTklyEo+P4GTNFVfDDH9u76LFHWUVzDEYsDqMz9F+hC1RC0//ShonB4RK0qXO+F9u4s2Gt8YjmNBNGNH2CA1O0tnFd+U2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkjnK6HdywDQCwPfqM36LXPqMIpX79Q1BYHOY8rqZNI=;
 b=EAade0jq8qRFNn26Bf6l1ra1gjfXxQleycngeoeq/tPIg7rhDbYIK/9SIWMXAU6i8a7rR74hqvFyYpG+laovIGTR2tAkp5iUtwr1Py8/j1Oo6Zi9NASLHDVnpVH8DxSb1Qs8tWGq6Sa+puTavKcxaxrwn+TTWEFoki74aWBZmdbwJNyGG60bSS/kMxeoA3SPL6uIi0n58D4CVb0Iz+ZjsfVCb+JBpnx56T3/gw/XPISRz5FQR7e02IpMv+fxDVEypMJDt7KLIf9TqPLaidShuLjYmB91klGuqo3g4tv4ZjpgeoKHMp61Tec/8tBIPUKsHQ1z1H8fn6UvsSjB5WAYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkjnK6HdywDQCwPfqM36LXPqMIpX79Q1BYHOY8rqZNI=;
 b=SfCAxJaN4RsQ9VcSxgxGEvMjABbQNFEtE0Ibf+lqcXNLT0kWKWRUMPvKLheXujPYvepFKjHXwvUjGqhxkkU4WT4u+9kRyzuoz9AbFSBTcqHJnytpo5FFHzhJLh4xqWGsiwyzQxmZILxTBrxeg8dr1TZ3gO81qI59b7q/7Xyu0Ye1ONQZnficejYSkRmDDXaF2N+ZnMTC2MU0ITgbp2GRucQSnXbMJGl/rMHRgpspiWMtHVDji078MzPX39TlbP8Fc2WEU95GvMzbnlmMQFeTzZuOTbPiF86j9TKc6VYJaSZU2LocJ4GX0JNcKkJDcys9Hwh9GBj0FZkur7eC9k0Meg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PAWPR07MB9688.eurprd07.prod.outlook.com (2603:10a6:102:383::17)
 by AS8PR07MB7799.eurprd07.prod.outlook.com (2603:10a6:20b:396::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.45; Wed, 22 Apr
 2026 12:16:39 +0000
Received: from PAWPR07MB9688.eurprd07.prod.outlook.com
 ([fe80::3a2d:5997:c1c7:3809]) by PAWPR07MB9688.eurprd07.prod.outlook.com
 ([fe80::3a2d:5997:c1c7:3809%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 12:16:39 +0000
Message-ID: <7fd22b08-d9af-4751-a6f3-6ef9c9205a2b@nokia.com>
Date: Wed, 22 Apr 2026 14:16:37 +0200
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
Content-Language: en-US
In-Reply-To: <dff4fa6e-8eed-4dde-be99-f8adced872e2@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::14) To PAWPR07MB9688.eurprd07.prod.outlook.com
 (2603:10a6:102:383::17)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWPR07MB9688:EE_|AS8PR07MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 836fcfe9-d8dd-41ef-efbc-08dea0690153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iL1a8UlEqxWAvvdFfbD3o7a6ZUk03tXKySgpOTP8fEffOFXepcsWmimub0yh2fwi0alyHIaH+geb7vYWbdSWwgQrIX1xjZjaeIrtRSkE6Ov2N2NpPg1NRnEIPNbo1G4Oh6ZfOeE9YWP8ArURo7Ml9AP2vT2KpP31jYDafBJWGlNXh3pG1TpdkOZR+W/7n5fIGleiBtNvmJpYSmZ+YyCyvxw78g90lDWNtYyNvH4FMP4a0nvN2OdY86IjHnMn38+RayX3RcOmNON/dPedeZi6YBrqoS/bRJW/RDsxM9IXnU0goOCNs8MYeEPVHoHKQtyqtJFE5dIHDtmnB2yShxWwMv3FIntT7s/BHsX+NrDOjK1Vw6137/qZW4+acAA49iNSyFSgUONgXXGlW38eWWuI80/dPSu9BZ/Vbs5BJCy+A3fbWtO36EtBGIh++MWCE2SBae7Mn48Q/JvRr03FKJIcivoyUKJisLvj4VYLJja9AjcJ3+XaoN0uKwom7T+BBDJLekaHiQYAJh3ken/eOfUmXv0fwHL97VS17L3evVw+KY06av0/Jag5RucIvLyBYZ1TKK6N9MjoGifHdHfwISxzqjbf3ZiKy1ECG0twUcjOEVNPK9bPs9k3WW9ZGAdD1AKAxJ8/Xcoler0di5q6zISjATgW2m57Ws0ocgT8m5wbHWABJ1msYDSfhaR5FT7FgoVgZfClmBU7PvjSaRdJFDOVU4XzNbED7PB7kka3WioIyFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR07MB9688.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhBUk5yaUZleW5oVWgyUDZBenZkV1B4SkF3VVhjWUtHNEFIT1dCWXBEWTk3?=
 =?utf-8?B?VzJxWTIzc2NzOW9RVW9tN05PTUZVVy9ZeVpKSEw0SEo4VzRnWUFiL0F3a2FO?=
 =?utf-8?B?L1I0L2xHK0lLZS8wTlY5VHU4YmJSNlNxV09mTXhGcEF4K1lCU3pOVE1ubXpD?=
 =?utf-8?B?Q2V6OHNQaDdrN3RQNml5NVNkM2lkVkpVblNRNCtEK0cxQUszUlVKdzlVNkFm?=
 =?utf-8?B?Wmw0RGtaOGNDaWZKYjEybVNZNFZoVVVxdUY0d2tLdUVVaHNhUTVrRTNQam1q?=
 =?utf-8?B?YmZWdjcxRGdqQlBZMmRZcFAvb2J2UUtTTHpqWDRqZnlXRzJLSWxxalIwZVRn?=
 =?utf-8?B?ZDVZTFFYbUh5K3VxbHV6YlNNMWJCNTNTbFZGaStlSHBzem45aCtUa3VBdnNN?=
 =?utf-8?B?OWhtN3FNV29RamI4aUhtbm9CM3FJSlpHN04xL3pxZ3hSbDA4eE1KeGxDMTNS?=
 =?utf-8?B?SlJaRDJ1VFFlNE1OVjkzY0Q0ZXU0YzhyWUd2OVd6QUZJMTZ0MHhiZlE1WDll?=
 =?utf-8?B?c3FrbXN0QmlsVWRGZk9ENU1yUUhMMVBBTnJXZDd2eElFUEJxd3BNamk1ZFFx?=
 =?utf-8?B?bWdyaU9DYnpxdFJpYkE5NU5RVldjSnZubEdtQSsxTk5wTzVJbVZCRmVvSzVT?=
 =?utf-8?B?L2I1SU5NR0ZDK0F2a25VYWtkWCszVkNwNWp2cHlmY2pWejlkV1Z4ZzlPbkdo?=
 =?utf-8?B?Skd6ZXVGN2Uxc3lNdjNtb3RiN1dBcGVDOVpGdDRjc2MxbGovYUQwSW0zZEFY?=
 =?utf-8?B?V1hYUExSNE1ibGNDSWVMODF0RVowYkRONjNoZ2ZtRm1iSlJrQjV5a00vMUQz?=
 =?utf-8?B?dUl4R0NrVlRlR0s4RW54TEU2Mklvd3E3NTl5R2VrNjFQOWUrU0l5bkZoRk1G?=
 =?utf-8?B?Z2tMTTRuSGpiT2ZvRFN2T3MzelBwNUF5Nmg2eXkvWDNDTUtUU1RTdFkxQzFn?=
 =?utf-8?B?cTB6Z3gyTkU2TmxIWGdRZFk2S2N5ZEdCYjFBalFUWXBQZXJ2d1VlQXVGbFJF?=
 =?utf-8?B?Z3Z6Z2VsOHVpWm9RV01SQnE1SVYzazlvWnJNT25zenJKSi9WZ0ppNG5TS3Rm?=
 =?utf-8?B?Mjd5aEg2M0J6NnZyYkhuREd3RmEwQnkwUkJxd3FvL0h3MDhFWE1BNjdKS3hj?=
 =?utf-8?B?c3Y1TVNIS2x3c2ZYN3lsNkZhSlBzVjZCN3dwMzFDM1I1bFBlZWl5UU1oeHJm?=
 =?utf-8?B?RksvVUVWWUtQNTFTVEE3LzAwYUJ4cVUxbDMzMm1TYzlvWUlZbUplWHVVNFhC?=
 =?utf-8?B?cXVqaFVLUnkrcUpZbC9XTmhtVDRvSDI0N3hBK0x1SGdOTjAycDM0RThldXJU?=
 =?utf-8?B?WnFLbUROZVgwYllFdUY0bDFxOFZkczF4NWVjQTJlQnZVQWVVTURJL3NDOXhj?=
 =?utf-8?B?SEt2S0wreTZScG0wV2lZa1kvMS80RWpabWN3S0dRR3hPd3VkQVJsSTI5WmFG?=
 =?utf-8?B?Zk9xNzh3dUloWUdyWStaRnpnb0k0dHVISUg4aGRhWDFneXViZlhTa3Mycisr?=
 =?utf-8?B?cmwvektOZU41U3NlNWVXQmJzL3N6OXFJandXNzhrdEtHdkdWSEw4dE1DZ1BW?=
 =?utf-8?B?OVdZQlcwMzlETUlrdlJvNjJDN3N3RjJjcmhtL2pKNnI3KzM2MDg3QytGeXgz?=
 =?utf-8?B?aHI3TUtHWFdNTmhkTlIyV2ltV3JUVjM1TlhFRDZYSkpKWWd3MVJzWFBUbVRu?=
 =?utf-8?B?UkFEM2xRTTVPVVVIaGVMbXNTSHJZZEpoa1Y1dnU4b1BEMmk4TDd0ZjlIU3Jj?=
 =?utf-8?B?bm9TVEVDaDFuQmZwbFUrOXZoQ1JCSkhodmtLMXZ2ck5ZQTh5WHdxNUl2YUhF?=
 =?utf-8?B?R3c4b0JrV0FUdWlyL3R4TGdlNUlrSjhJV0N0ckQ5R0tuOURtTEpBakV5dmQ4?=
 =?utf-8?B?bTkya3FMK3hidlZmVHpXalljTmdVaWswTDRvRTRBTElrSXFXYjZReURLTzNj?=
 =?utf-8?B?TUhJVVlGQUlDZWxtZFA1QVpHRWxTak1iSmZ0dUZMOTVuWmpDeXJNQll3UElq?=
 =?utf-8?B?TVF4UGVSWWpuYlh4NUh2aFJ6NDFrckU0VDcvV1A3aEZDVTRIeHlSYmJaK09X?=
 =?utf-8?B?VXhBWkVnbUhpTzZhZENBellncGZ2bnB1Z3dDRnBUOWxZZGpiY2E4OTJIT1Jr?=
 =?utf-8?B?Y0tPa3lCd0pMbjduYktTdVlEN1NnZGxmVmdBNFZhaVZQemx1U0g5aG5GUUxF?=
 =?utf-8?B?YmordkJOQ0NpUE1taCtxUmtPdDFON0ZrTmRrS2xEd25MOFZwUzhJcjFWeEh4?=
 =?utf-8?B?MmE2L1dpSTRHV25OQ0pWYUtuV3FzV1pCZndSRW9kSU93cklOVTJHYkw2ektW?=
 =?utf-8?B?ZEluWWZzRVZ4QmhNbVdVVXo1R0txOGdOMDFHNi9wcFh1eUdOWG52VWVCcFpn?=
 =?utf-8?Q?dumvOPNKMVvrglTQ=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836fcfe9-d8dd-41ef-efbc-08dea0690153
X-MS-Exchange-CrossTenant-AuthSource: PAWPR07MB9688.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 12:16:38.9766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQEFKu00JG/PrC5H5QP1RhWOOm80QCpYhkwtO3I6aRd2zyMftwiRwUQ7qxj+lH6pDBZuXM+F/I6SvPKxaAaZmG9d4LV+/5CkS3MWywnZVig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7799
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nokia.com,reject];
	R_DKIM_ALLOW(-0.20)[nokia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14230-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[nokia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.wiehler@nokia.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38AF0445CB5
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

Have you been able to reproduce the issue with above hints?

Kind regards,

Stefan

