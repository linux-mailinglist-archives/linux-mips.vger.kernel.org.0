Return-Path: <linux-mips+bounces-15089-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ux65KDP0L2pcJwUAu9opvQ
	(envelope-from <linux-mips+bounces-15089-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 14:46:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12B6865ED
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 14:46:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15089-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15089-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90A6A30254BE
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8735C3EEAD3;
	Mon, 15 Jun 2026 12:45:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020140.outbound.protection.outlook.com [52.101.196.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D133EDE48;
	Mon, 15 Jun 2026 12:45:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527528; cv=fail; b=pmA8aviQA1HMkCD0t2iQXdzqFoqlbTmaCeGnt2MQai2jDuYEyFFMOuPYDXduHHAgxPiUoMUIEYj9VX7b7TmbrIFGC958gxze9L8ppGy37zgTwcVaSp1S0aMJRkGiPoyGsYHFFg5WEImteOoewUSziZA/wcFdCxkrLd8TTq+AmiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527528; c=relaxed/simple;
	bh=hpXMZK8H+ot7uSZTa0zhQW6qeOh0Ucbnj2W8FEjJCfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NX83wloWMKGi1YTSSoljHqVm9BKNPXyYMSB4Xa/PU14yj7J2FdFVBpcD+a6Oj3aO/gzHImuld8xSp9d9RuyewrbfuwS+5Qf1n1ujt6l5nd+HWRqaqElE8dKIegC2MNChRv3be3zWT9tP865LwBnf9ZTNlk5fzlk1+bZapYSQQA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.196.140
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHqRrNAsL7ZUXE2ZcwknO9beH1+OFebuzVNwV2U0lF7GqN1c0r0nZRmgbtPv6fHPEfU4iVfHqcfQatTZ++Fdc3qewTg+4iu5W4EwChgyrOJ/kmFNxob945bBshv+Vj+9ok548ErOn3Fdohsf25hbxYGIFm0K2yKM6nZoFtCR6YmkAwmAuzw5oFjLreX4oCfNPsFPmI4E6WuYGVxZWnEzPKKgw6Vhqtb28hem9m9J2Mzt+105PxfhPi7Kubo9X0gOtvwUbrtvBBsgvhj4NFO50AvSMDGzI5TMaQvzS8oEP/yfa/5Abc7kRGB54fsBWptWNBlVG9pbY15Zs/APrBEKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=DfNmjZTPwAUABbXPIWlfOkBkyk4zOFmZwnGeRfLtSAQ=;
 b=xvYxc/kcSGXzms4VNQmA/jo2riAiaBAHSW95WTjJKqnu9XCk/c7GeQmBCMfZKaxwSVAYDwoBdFNjaa/3rAk3Qe4NCKLR96PKCKd6l62Ow8xpva46kqeWxj65CNdRwRFf9Eubs67nsHYXS6LXC5KDwe829ZQdMCplC0WQ0E3pQKYF4+NKGy93an1W516uYiPLD86SlAfO//BrtnbENUbDnpuWbeAhjRjRAUDnFDzPaKMWqzc4znYnld9bFd3l+qvz+/Or83SCMPMgcdlmpT8cUeaqC7nkv7vro5f5diMLblVf3bFqe6DhPSIYXPRaftG5Jd1brDCLu/1jRhbdvtWt7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO3P123MB3292.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:45:22 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:45:22 +0000
Date: Mon, 15 Jun 2026 08:45:21 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: paul@paul-moore.com, ralf@mips.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mips: sched: Fix CPUMASK_OFFSTACK memory corruption
Message-ID: <psb6pxogv2dlknps4p3sh6rt2h7xuuxkoif6ock5vxfz2jimec@txa6iy65crtb>
References: <20260526141651.773306-1-atomlin@atomlin.com>
 <ai_T_uRkojOsTE-Z@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ai_T_uRkojOsTE-Z@alpha.franken.de>
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO3P123MB3292:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e57f120-87d9-483c-bc06-08decadbf71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	05LUKNjQ87NtZu8VyFYcfNdwMWTVtGu6m2UAWANw3yBVogTqdkO4moU3T7vDOgCtPOQCH3j4Q7/OulavpjvIIH4XzQOwGvKzPp4TyPEf7PR45LxZymepSBMva90wvM1Di+A8tUOgWTKii0HJKmgSj6+kKcfDCkMpDV7wTCDfXRNmgY5qc8L5EqWkozQqC60io9DVq19dxV8Mvxg+PkiP2h2wAYeGtJqMOomcBhGqek0bji8EI+S6JW8Q31W/xvWmZweiLIjHQ1k0WD/JVtE8/uM7M8rA00g6Cc/NmgnXJxAgXgYi6p1F+ekj6OrJv07f1EYheDZUeub2VP8u3Nnaa+SoNzoL5imk/M8Xm1pVn6q/fNUN1jaIzWbGU5VyHqB/2vIEirW7xsr/WWjHI5XR4a6Sazi732zEJ03yBzXnvCSvmqoyoTDiKMwhygOjLfu4/dtLzR+tVhEeLzSLOMzeJQtMIX9Og+OzVBkY4BLmcwzle0yqoGygzXbKjgUwCsXsOFOraz8RERquq4QjpCj19QWKXzCFibDsYbTIdpCNqjJPa9Fv88y8PPetbtIDe5z1d2YLXjb3sN7NHzsjVbdc5kUDCMjfTwqwSLWmWtV1ADuJBLi54QhwWyhL3SaYEELtniZjMVDmJTaQ+G41CjuzTvAxGWmt9awTJGR/5xk5jln5kW09p5N0HBn8/VEwZENa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkxOM0NFVWphQUFFcDI3NFZ4OC9MV1pqT3cwMjc1TnlNUnJQOWIrUzBURHdZ?=
 =?utf-8?B?MjBRM1dveGxKYnd1M2hla3JhVllvUHg2K3BwQ29NZGc3QTNhT3JHNk1uakZW?=
 =?utf-8?B?MzUrTGl6UGxMSUhXSjlVSWYrV1BGTUJ4NTNrL3ZQMmVYQXF0WEQ0RHNvbUlj?=
 =?utf-8?B?QWk0MFc3TXVOYnErbmpJZExKWFBxd0ZvQzR1U0tqc09rL0trdmd1UjBxM0FF?=
 =?utf-8?B?RU41STFYbHpYd1BVejR1SFU3QmpmYVRJTnNIOVhWMmFWTVhXSk5aQ05hakVx?=
 =?utf-8?B?Sm12bndwbzduRTU1L1NPdERSUFF2ODNqSVBvWFkvSDVIQWVrbmdYYlF4c2Yz?=
 =?utf-8?B?NTlmamgxTld3emFwbjhVSHdRNzVrWENLUGoyMExOdmFHZmUwZDNjdm1aRXRP?=
 =?utf-8?B?citESUdFUll0eW9mYzk5b2RWWlVxZEQ3YW4zbFkzYnVBMU45djhoaTQrYndU?=
 =?utf-8?B?bHpJRWdIcVdjY1VPNW1sRXVtOVBpajdGQkhFNlNiZlgvYnJJNHNETXNwU29z?=
 =?utf-8?B?VkI2TzBleWwzVDN6a0MvZkFMR1pPNFZCRnZ3bW5WKy8wSWtvZ3ZMWmRZMzJ5?=
 =?utf-8?B?alY5NlUzbHBzc0R5SnVtUDJwc25wTXNTTUgxb0FQYlZsUk5lQ1orRWVYb3lO?=
 =?utf-8?B?YUltWlUxRUxPYU16amw0NVdUSklHeThudFp5c2hSd3R2R2kxaXhRaUZFbDNw?=
 =?utf-8?B?ZzlQaFp6d1pXL2JaZmhvazRYKzViczBITFpTZFFybUl2MVN6MXY0SzJmaUlF?=
 =?utf-8?B?d0xscW40SDM3aXBHZkswMHlrNjFLL3BiMHE3bkN0VWhkV043TDVtZmozZXFF?=
 =?utf-8?B?Rmhub0pBT1J2bi9IcEdoaU5KelRWcjJOeVNFV1BJYUJsYUFFNnR3cnptOUlj?=
 =?utf-8?B?TGIvVFN4M2U1eVlLY3AxOHhIa1A3S3lQeGh1WHdpR3FWYW5OaENkU2lnY0lM?=
 =?utf-8?B?VEZCTTVwNk9wMGRlVm5YNDJhVUoyeDhjc2JUc3ZSQ2VoMEZFZ2JYVTE0Vjc3?=
 =?utf-8?B?YkMwTEQ2WFJmeFF6R2FOekZ0ZUZjSXMzUVZ5eE9yZms4QUxjc3ZzR2FuWG51?=
 =?utf-8?B?RFYzNHZkWU04Y1lOL0dLTlNxUEtRRTNHYm5yOVgzeWNNVlZZand6YlhUdjNz?=
 =?utf-8?B?SW1sWEZQOCtTL3I4QXlpMHBvQWRRVHpOSFhIYStMMlMxeHJGWmVuRFE2Tlls?=
 =?utf-8?B?NVpqUXh1c1VEdG0wMDdOei80b0UzR0ZFK3gzYVZSeStKL3Fya3VxdU5yZzlw?=
 =?utf-8?B?UWdGSS9NVTVLTHgwTklsUWc5TTZrY0ZOQkVOdEpuV25VNDFabzg2SGFRUVk4?=
 =?utf-8?B?RU9xMyt4SU92UmV2QXVwLzFkTWJsazE5eHlnNHZHNzFTNVRwbWZEV2hOYytD?=
 =?utf-8?B?QjNJdVQvdFllL2R1cVdERzdCblB4WDJleDExc01neVp4cHcrUWJJd1BGTEZS?=
 =?utf-8?B?c0g1VHN2RVI4M3ZoWkszRTN6RjRKckFDTXFaNzVDNzJIRUZDNTlHWHRhOC9G?=
 =?utf-8?B?bzRvZ1JPbWZhL1l0N0FjN2FnNzZvbnFabkErVCtIYk5xQzRoTWxwNTNWekdF?=
 =?utf-8?B?Um4yZnZ3eFlrUGlmeEtEc0tuenZ2SnJ1dEhFNWJ0NGlwbjdMNzM0R3VTU0tn?=
 =?utf-8?B?Wk1qV3hoclJZL1lUdmczVVhPM2tlb3paRmdReDF6RldWTzlKMXk1aFBjOHNj?=
 =?utf-8?B?Zkd2WXF3Z25iSkNQOUZDZEc4dXdaallMNUxEN1EwRmtBNWNBQllaMldYeUdF?=
 =?utf-8?B?WXdvZWxlSURRamhkVWwrS0pUU3djU3Z1N2lwOGx1c3VFSi9BdU5xVEZwb2Fl?=
 =?utf-8?B?MkNrWkZOMlIyQjFibzQzSHAyN0xQdHVJK2NnR0loV1p4czhUQXE4UHo0WEJL?=
 =?utf-8?B?YmFrWHdOa0RxQXFmajVPTS9qZWJ4UEl6YTFSdlA4NU45RXZVRWhpNkJlVDkx?=
 =?utf-8?B?WnVCM1RaLzhLRXVuS29ER0Q3UHFmU3B6MDRZVE1oeC9vWlkyWG5FbjZ3NDY5?=
 =?utf-8?B?SkhNRkNQQkZFWnpZdDNueGI2cTBBTFpYMVNMblI0dHdmdi9SR005OElqd3cx?=
 =?utf-8?B?cHJORlZkdUFGSkpRaVF3ekhnaGRKRmV2aWxybVFIQVlSWGFFN0xxSnhqV09J?=
 =?utf-8?B?NEJRdngzK1hNUU54bUlQa3IwZFlTZkl5V25FeVJRQnlGU3lYNVhWQ3RoV0hB?=
 =?utf-8?B?bm5YWHJIK3NXQjhWZGVwclp6ZUZUNENCeWtjVmw4OWFDVVlUSkF2Q1M1eE9C?=
 =?utf-8?B?Qitwa0hsSVlBcWVxMHpDbk03U09iaCtmb3FaalRuUlNlVmtyVE9JWkl0NE9q?=
 =?utf-8?Q?Y+mph9NDBH2x/Fd08n?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e57f120-87d9-483c-bc06-08decadbf71a
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 12:45:22.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnSazUynrX/MtvsZzqg7MuNuru0MaXjwsQjuyGUKMJeysywYwnsROaXVhw/A5IWvjhq8AuQAtjEVC2zcmyCT5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3292
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[atomlin.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:paul@paul-moore.com,m:ralf@mips.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atomlin@atomlin.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15089-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atomlin@atomlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[atomlin.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D12B6865ED

On Mon, Jun 15, 2026 at 12:29:18PM +0200, Thomas Bogendoerfer wrote:
> > ---
> >  arch/mips/kernel/mips-mt-fpaff.c | 28 +++++++++++++++-------------
> >  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> applied to mips-next

Hi Thomas,

Thank you.


Kind regards,
-- 
Aaron Tomlin

