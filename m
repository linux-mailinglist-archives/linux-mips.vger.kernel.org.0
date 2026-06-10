Return-Path: <linux-mips+bounces-15022-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MGjnEyJoKWpjWQMAu9opvQ
	(envelope-from <linux-mips+bounces-15022-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 15:35:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA08669CB3
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 15:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=2vmgd4qF;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15022-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15022-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04FC2309CED2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 13:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE395409107;
	Wed, 10 Jun 2026 13:28:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175723E7BB7;
	Wed, 10 Jun 2026 13:28:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098124; cv=fail; b=sl0XxWkPtWI4yiW7F0AFRMmkY0LVEbCXyaG8amAfODpjndKTBfUCwa+EN8GXyJlPc7XnZLUdLQ/tIVbTdNjlD8xbr6BCO7lp+Prt7Rg/aIVwfmKVPk42iv2hSFhepjl0oDKCPJ/d2FHthdqkI42GXB0MJDFmK+PTHq/pIVD79FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098124; c=relaxed/simple;
	bh=0yE39m8K675xaSMDygxUlzbJVKUD4dpA9bmdSmE9+Qc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=apgmMwxDIiHekGJbVrjbNRYLO1iSOK5NBKKhdOfIjFnq0sCFhL+kClPBl82OlTRsW+P+m3h1TN2evaUv+UzWdFItusID6tVIcBcxOhBbcSdttqqnXfsREsmMvcZsZFjpS9JYK/jyHljykL/juWtAw/g2jLRDkxflg1G+9XGdrl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2vmgd4qF; arc=fail smtp.client-ip=52.101.62.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohSqXlLliH5w6yNZ/IkStXJ9259dkgq6OjYHGYKilQC03VN2sbEF/rsjJZp2Lg/pq4ku0oeOWTw3iwjkoTpsP4LN7sF7jxnlcywLRi6AkYV7W7in5Hq7Jgp3ObG+slm4vyrlzch1cqaYHSAPa5WIZbYJEkYvF7AGiME6RFql2om2WWH8HyylPgMeHMdqhdxZSoPDs8O5AacWd60ytknadfuB0nil4rVRRH6B6OC59dTWuzzgN/oXfqNOGXk9w0nUTPXEs/Iqy3Xc1YloNFAeeTynrVWJJPVYzWFyMv+yMgkFp8R99Ryy5i5H/vwPDDuM5tvji3focUozv9gpHdP6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFsbhJRI9sz/CK3kRO6eNsRdNlrzXtee02LChosCYIk=;
 b=c7jjQNSDua7AfnZBXNNdw86qFKwL+XXfME0HaaeBLlQB9D61xaD4vw5lHvSfBlTXt++Og+oN/Md01ZlmmNPrGfWy4kZ7UmXKMJX+meQbtFReRSn0jfWJik5A9CCHWOrNwjtBtuRzB5Y4fpOz6umMqsiuio/oJ7t0EdjWSUFpd8d6sbrkrocefPxKcFwC+gKpMGhnzriKJmUhNqQSkRXs6bC/JCk9nNPHnzG/sH6H+rr9782CJp79ZIDJngDYnwqn+DhmX8OtFRannWpdggzrZJNYP/kGCEJAQ7d7qoN56bp8yfHiNj3IbXObA5D9t0b+JLJt5or/L5vHV9rwTxeAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFsbhJRI9sz/CK3kRO6eNsRdNlrzXtee02LChosCYIk=;
 b=2vmgd4qFCIUpIG9gWILtF3WVTLmeF0n3JuuKQEtbbBdwdMH3c6zXT/+H4J3ZyQ7fLfg+5ZOuElwNOYrh5Xro2Nkhb08K/m45tBIoIO+PtP1/iITmziYFLimcp5M9bjGNJQ8H/tTpFvha1WetA/M2Gkur4JbIXm0XJQf9w1Kewis=
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Wed, 10 Jun 2026 13:28:36 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 13:28:36 +0000
Message-ID: <be57043d-6abf-402e-93b4-a01519c97c1f@amd.com>
Date: Wed, 10 Jun 2026 08:28:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/60] KVM: SVM: Add support for the SEV-SNP #HV doorbell
 page NAE event
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: ashish.kalra@amd.com, michael.roth@amd.com, nsaenz@amazon.com,
 anelkz@amazon.de, James.Bottomley@HansenPartnership.com,
 Melody Wang <huibo.wang@amd.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 x86@kernel.org, coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-3-joro@8bytes.org>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20260608144252.351443-3-joro@8bytes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:806:d3::17) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ce9589-6f55-4414-684b-08dec6f42d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|11063799006|3023799007|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5LE8qpBC/jgUo8+Qq0JzbyDDWEUyVGgm6xd566ibvsK0KWZEagpjt+jW5/6qQCONLmO98GlqrGwRsfOL6HB+6mjc40K9xZRjk9/0/80UjuQHDqsmJbz9XDK42huzUyTrJQtn7RKSxuzX5OXgWyBNEwaw6uv/rgclfaAioeWffPdRXQCY1YbjnLfMEoKkpq3y1Sh++CW7OAakSN2ZI2FqAAHw4TA+KceTejbZoByIJ4JXqwih3zXubU7019Pb0qsbjDibarbAPX1R3JqrvVbGpo0GU0jK2VaO4PH6AfvrJohVo+yOIAeOcEMnHhYjUjh8MVPJKSbRI+svqlNmZcutL7VKCO+mm3dxJYgwbHHh9CcrNMX0jv4pFlvo2nbk6YHwr7svdBuQCYTB3MiCT26XvzWDOmd6EF1YT7zUv7bffvl7lGmc/AMpopwmRytBYMu4+dtLGYTG9T5P+UM4rjpoPaStFZb7UwUUSEEpKt54QB0v4jjEUbvorGQmYymZGnyZfC9oS+EmkbBhN/gC1HbLyMZW9jPWtNwurLh9Y9SrscuDaZYuOj1//pw5lGrJJpfE9zGlA8bPmU5qfB343RV4Ft21M6zgCS4ftNhb9eL2iC7Ywzd751njAd6xpQFfCnoc7D5qdV4w4d4HFfJFiTO4rEFE9yGdREn7TPwpWeMVti9WG7uxZuqiqhZK91//Rgcy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(11063799006)(3023799007)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tit5elljbWlreUxpbXJWSTZxVWY3RzMyWVUyUDU2MUM5eU1hajRpem0vYkxx?=
 =?utf-8?B?VHh3R0p3RmsvQW1DZjAzWThCUkVTNXdtRjNEUExVQWpDVHM3OVNiZmk5UHhO?=
 =?utf-8?B?dFdNYXVxMEhaS0NxWVhkWisvR0cxZVcyUmhrQ3dyS3NCNTFiV1dYMkR6clJR?=
 =?utf-8?B?Nk5kWG1Xc2pKTU0zanhzd0lOeXdkRzhoUU9HUlNKdDRNL1RVNElPM1pmdVdH?=
 =?utf-8?B?b2tqR051Qk5BanZKWjVwZVJCRUo0bEI5TGU0allUanpGbUV3ZEJ5Q0tDZngy?=
 =?utf-8?B?Ujl2YVJQdTJYWEU3VGx3STUxZkxmN2lYbTdWV2tYdE0yQytFRjlSSGhCU1VW?=
 =?utf-8?B?L0RpRDdnczZMZExBOVVDVnR1cWxzNUVuWjZDNnhLRGVQUUpwQ21OVUZOZXFF?=
 =?utf-8?B?Zkc3Nk5kTVVKTXZDVmpRT1MwL09XQVVxSW1aWGtwM3FybGF0Mk1oSWpEQVQz?=
 =?utf-8?B?aHhPUEdqQm5CbHIrT0xvVTRQaU4yb1NWMFpzZFo5aENJTGZtQzErMFN1QVVT?=
 =?utf-8?B?YWJsK05oeERTbExWRVhsRk1vSzVzcFNUVy9GaENqajBlbTd5ZXJ6aU56RlRW?=
 =?utf-8?B?ZHl5bDJ5WEQvUmtKekd3U2Rhai8rWThJMTBjWW5wU0w4ZjlPd2tFL28zOGhn?=
 =?utf-8?B?OE5zMkovaWwxdU9Nc21XRit6UnpUUjNFelAvSFpXRVNYMUxvVUxnMzRXL1ZI?=
 =?utf-8?B?NkRDSVZ0N2RPOVlBVWR6eXBvdEthZ0tic1BTWDdaOG1uL05IQ3crU05UYWEx?=
 =?utf-8?B?aUhGUjM3T2tSK2NuckJwUWd4L1huZEpQdGg1Yk1DU2owaVgwaVNMcmFwdnU5?=
 =?utf-8?B?UzZnamFFVWVaR1NBZHdybHBVYlpPWXVpS0YrMkx3MkJ0bG5abmE1QzMwVnpW?=
 =?utf-8?B?U2lVckVqNFdRVFE2UFNCbCtlampsYU5OVkFhQlNVZHVQUkd3MEY2Q2crOTdK?=
 =?utf-8?B?VWFtbkFmMWZucFJ5VWVibTQ2dkN6VEExbGpjQXFoSkIrNllqTTg4SGUzSEwy?=
 =?utf-8?B?eFBLdXgxeFlmS1dqTkR3SEtKSFRxbnBUdHlEVXd5U3lrdTZTcEVvUHJoc2Iv?=
 =?utf-8?B?cmdzTU9sQWJJQXVLR1pZRndtRHNpVkJXaHcwMzkzdlBydkZPbEVTekdvMkRQ?=
 =?utf-8?B?NndaREF3cU5mSlVBZU83Y09IRy95Unl2U2RMQVhjcHp1Y1J1Q0I0Nm1ZNU5Y?=
 =?utf-8?B?R3lJYS8yK2dDUEZNSmIxWE4yY3Q5WUEzc0F6b01rZnd0SC9tWFgrTEF3WGJr?=
 =?utf-8?B?dmd3NzVGMG5LVGtYL3JQcG9Wb1pRUGxtZ0tGaTRQaDJndFJkNlZVeGtoMVZm?=
 =?utf-8?B?eEFLT2ZWYnVVK1pySWlKWnJRckRBcnkrS1kwQnNDSFdXRHNrR0Y4V0tOLzZa?=
 =?utf-8?B?YjJQTzVmS2hEejRhbko1LytlYWJqd3FlZVlJck4vREI4RG93dmc3cXpTVVIw?=
 =?utf-8?B?R05LWGV5WEtmVlgxZUtMUFBJRGVSU2xJV25Tek1qcG5NVXUzT01MZk5BNGg0?=
 =?utf-8?B?UHdFdm1YSEUwazkyZVZTaHJxbS9kdjhLL0FVYUIwVlZsOUF2aTlsRFl4di8w?=
 =?utf-8?B?MC9VUlRiVmVuMlR6VFBuOVlUSFdoUFZlcXhoR2JGRWRIVkZUREdZU0Y3Rzdq?=
 =?utf-8?B?WHhKcEhqTzlDaThnVkE4ZFRUN1FhcXQ3WU9iNnlid3U4UjYrcWNQeVNjclAv?=
 =?utf-8?B?YTZETmtlS0RpT1VLZVFBblpoZW9CSFFhenNpU1Y2YlFVN2twVnhWNkhlSk93?=
 =?utf-8?B?aVJuY2tZSmkxTGRzVVpVakEwZ043ODB3Z0RKRUVnRFg2ZVI1eWV1VGt1QXZl?=
 =?utf-8?B?UGNuL1NvRUd0ZVh1ODJxMkEzWXpUYU9VMmlDbmZtK3NxSUtQV1VpdURRNklj?=
 =?utf-8?B?UnZkNGE4OHFQQVpYSnpENDM0T0sxeGhuRDJ2R1cxdGNpbmVRY3VXUHF2RlRm?=
 =?utf-8?B?NFI0KzhzZjdLN0lOcmg5c2RPZ2FYL1YvOUZWSjJrKzJoaVVrc25RMVpsME54?=
 =?utf-8?B?aFVoMVk2ZSs3UEZRWmY4RWQxMldMWENSVi8rVFJqMEs5YWYyUU5jZE9UbEVr?=
 =?utf-8?B?alVvZ0x1TVJFbFlWRTMrRlNYYVA4T2xpRmxVdVhHRFlIVUJUcUZVWkEzZ2pr?=
 =?utf-8?B?L3JtOW91MElicXRWL2hEdUhFbHZMVmNRbjl0SFIrb242LzRGbFF3M21EcFRK?=
 =?utf-8?B?TXNwZHBjcy9TTmIyVmRyVmU4d05Sakd6V2ZwRWszUWdLdlJrRndyQWhPbnlz?=
 =?utf-8?B?SFN2Y3VRM21rUytDcFQ1MEVyK2pGdUhqL3h5NHY5REd6ZjIxZHJSMWM3R1dh?=
 =?utf-8?Q?ZB5U2M6ZvqG1qwyRQL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ce9589-6f55-4414-684b-08dec6f42d23
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:28:36.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/EO7flDGsi11VCnEwvC6UZer5sHYwQAkT9tc/YonfBNH9ag54z/PGjwi16EsxwjKmmUCK+QyJQB6Z8qQSGQ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15022-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:joro@8bytes.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.lendacky@amd.com,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.lendacky@amd.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFA08669CB3

On 6/8/26 09:41, Jörg Rödel wrote:
> From: Melody Wang <huibo.wang@amd.com>
> 
> To support Restricted Injection, the SEV-SNP guest must register a doorbell
> page for use with #HV. This is done using the #HV doorbell page NAE event.
> 
> This event consists of four actions: GET_PREFERRED, SET, QUERY, CLEAR.
> Implement it per the GHCB specification.
> 
> Co-developed-by: Thomas Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Thomas Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
> ---
>  arch/x86/include/uapi/asm/svm.h |  5 +++
>  arch/x86/kvm/svm/sev.c          | 71 +++++++++++++++++++++++++++++++++
>  arch/x86/kvm/svm/svm.c          |  3 ++
>  arch/x86/kvm/svm/svm.h          |  2 +
>  4 files changed, 81 insertions(+)
> 
> diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
> index 010a45c9f614..d84a13ac4627 100644
> --- a/arch/x86/include/uapi/asm/svm.h
> +++ b/arch/x86/include/uapi/asm/svm.h
> @@ -117,6 +117,11 @@
>  #define SVM_VMGEXIT_AP_CREATE_ON_INIT		0
>  #define SVM_VMGEXIT_AP_CREATE			1
>  #define SVM_VMGEXIT_AP_DESTROY			2
> +#define SVM_VMGEXIT_HVDB_PAGE			0x80000014ull
> +#define SVM_VMGEXIT_HVDB_GET_PREFERRED		0
> +#define SVM_VMGEXIT_HVDB_SET			1
> +#define SVM_VMGEXIT_HVDB_QUERY			2
> +#define SVM_VMGEXIT_HVDB_CLEAR			3
>  #define SVM_VMGEXIT_SNP_RUN_VMPL		0x80000018ull
>  #define SVM_VMGEXIT_SAVIC			0x8000001aull
>  #define SVM_VMGEXIT_SAVIC_REGISTER_GPA		0
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 6c6a6d663e29..b9ad1169cb2c 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -3522,6 +3522,10 @@ static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
>  		    control->exit_info_1 == control->exit_info_2)
>  			goto vmgexit_err;
>  		break;
> +	case SVM_VMGEXIT_HVDB_PAGE:
> +		if (!is_sev_snp_guest(vcpu))
> +			goto vmgexit_err;
> +		break;
>  	default:
>  		reason = GHCB_ERR_INVALID_EVENT;
>  		goto vmgexit_err;
> @@ -4341,6 +4345,65 @@ static int snp_handle_ext_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t r
>  	return 1; /* resume guest */
>  }
>  
> +static int sev_snp_hv_doorbell_page(struct vcpu_svm *svm)
> +{
> +	struct kvm_vcpu *vcpu = &svm->vcpu;
> +	struct kvm_host_map hvdb_map;
> +	gpa_t hvdb_gpa;
> +	u64 request;
> +
> +	if (!is_sev_snp_guest(vcpu))
> +		return -EINVAL;
> +
> +	request = svm->vmcb->control.exit_info_1;
> +	hvdb_gpa = svm->vmcb->control.exit_info_2;
> +
> +	switch (request) {
> +	case SVM_VMGEXIT_HVDB_GET_PREFERRED:
> +		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, ~0ULL);
> +		break;
> +	case SVM_VMGEXIT_HVDB_SET:
> +		svm->sev_es.hvdb_gpa = INVALID_PAGE;
> +
> +		if (!PAGE_ALIGNED(hvdb_gpa)) {
> +			vcpu_unimpl(vcpu, "vmgexit: unaligned #HV doorbell page address [%#llx] from guest\n",
> +				    hvdb_gpa);
> +			return -EINVAL;
> +		}
> +
> +		if (!page_address_valid(vcpu, hvdb_gpa)) {
> +			vcpu_unimpl(vcpu, "vmgexit: invalid #HV doorbell page address [%#llx] from guest\n",
> +				    hvdb_gpa);
> +			return -EINVAL;
> +		}
> +
> +		/* Map and unmap the GPA just to be sure the GPA is valid */
> +		if (kvm_vcpu_map(vcpu, gpa_to_gfn(hvdb_gpa), &hvdb_map)) {
> +			vcpu_unimpl(vcpu, "vmgexit: error mapping #HV doorbell page [%#llx] from guest\n",
> +				    hvdb_gpa);
> +			return -EINVAL;
> +		}
> +		kvm_vcpu_unmap(vcpu, &hvdb_map);
> +
> +		svm->sev_es.hvdb_gpa = hvdb_gpa;
> +		fallthrough;
> +	case SVM_VMGEXIT_HVDB_QUERY:
> +		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, svm->sev_es.hvdb_gpa);
> +		break;
> +	case SVM_VMGEXIT_HVDB_CLEAR:
> +		svm->sev_es.hvdb_gpa = INVALID_PAGE;
> +		break;
> +	default:
> +		svm->sev_es.hvdb_gpa = INVALID_PAGE;
> +
> +		vcpu_unimpl(vcpu, "vmgexit: invalid #HV doorbell page request [%#llx] from guest\n",
> +			    request);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
>  {
>  	struct vmcb_control_area *control = &svm->vmcb->control;
> @@ -4617,6 +4680,14 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
>  	case SVM_VMGEXIT_EXT_GUEST_REQUEST:
>  		ret = snp_handle_ext_guest_req(svm, control->exit_info_1, control->exit_info_2);
>  		break;
> +	case SVM_VMGEXIT_HVDB_PAGE:
> +		if (sev_snp_hv_doorbell_page(svm)) {
> +			ghcb_set_sw_exit_info_1(svm->sev_es.ghcb, 2);
> +			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, GHCB_ERR_INVALID_INPUT);
> +		}
> +
> +		ret = 1;
> +		break;
>  	case SVM_VMGEXIT_UNSUPPORTED_EVENT:
>  		vcpu_unimpl(vcpu,
>  			    "vmgexit: unsupported event - exit_info_1=%#llx, exit_info_2=%#llx\n",
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index e02a38da5296..7981e7583384 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -1277,6 +1277,9 @@ static void __svm_vcpu_reset(struct kvm_vcpu *vcpu)
>  
>  	svm->nmi_masked = false;
>  	svm->awaiting_iret_completion = false;
> +
> +	if (is_sev_es_guest(vcpu))

Shouldn't this be is_sev_snp_guest() ?

Thanks,
Tom

> +		svm->sev_es.hvdb_gpa = INVALID_PAGE;
>  }
>  
>  static void svm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 5137416be593..fb956c37c941 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -270,6 +270,8 @@ struct vcpu_sev_es_state {
>  	gpa_t snp_vmsa_gpa;
>  	bool snp_ap_waiting_for_reset;
>  	bool snp_has_guest_vmsa;
> +
> +	gpa_t hvdb_gpa;
>  };
>  
>  struct vcpu_svm {


