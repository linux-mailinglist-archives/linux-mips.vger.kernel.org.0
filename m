Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21AD6306F75
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 08:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhA1Ha2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 02:30:28 -0500
Received: from mail-eopbgr80133.outbound.protection.outlook.com ([40.107.8.133]:57316
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231428AbhA1H2W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 Jan 2021 02:28:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDJ1bD4Z3OvI/YnoZwzgC9OkrdTiDvn5DCZJIev28n7wZQymiRd7xvdWOWEvd11N/AGTl4MDKqu8sOkOS7YKXz6rI+mGFp0LFk2Us4UGk/sSt6BTTkqBBaKzb3xZpqr18hRN8CCPVSIKkG2NqeYDxNoPMQQxMf6sE67TEQgEh/BRYUthQAy0WQCBxA96lD1t7cxvJ9nC+hOEpiU343TPKkF3LV5ShA54lHZhNiZhtvi1tPZPJqhg8g0lasxAv9Avh7OSQqDOt3bCuycosCd75pyGXuOm3lGxVwpOOfz1yvrYK1Xkm1Hw46lgWatdF+w85yXehKb3PzbKD5aL3xRuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOQXJHG73ksNspj9WissaHjPbrWAt6t9zeLPMowU1lY=;
 b=iLkz294X+wDyrWJptKb5sZerc+EUDjf1+tiPunYvei/b+9SZO/de/c1KT1/Fg2Q6IwJQyEVdqsKyBYuITYM9/4GUXqmLX6hrMk5XzThk0ORrKsMamly4VX/bwAYiL2nSAMDLVoaGf2eCMUts2zBAMtPkeOpaMHH6YQXzHkoE24FACOQjzIEWws4gZcNtvjG2VL9Cx8rHjH83hzyAnIgI4/HmqgC9dotJQm5nivBSvEwxRv7WFAmoMX79c7vYk3ABmqNbs1+ZV/rKX8L05QWuZRiS6DBvCK6WxYrWprCvtd3mEvpnwUk58BIzRqsqqzpBYggyrr9g8FcSdUmElqnyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOQXJHG73ksNspj9WissaHjPbrWAt6t9zeLPMowU1lY=;
 b=Y7zYEYB52XOKUdnHJ7IH5ZejTQGyhm2jHoXpVYiTDQMLTAzAZ78XbE91flfekbOnjv3z/6Bmn5lw3KZfMYhVCHrjQZWBPbFXr1K9haUjb6B1y+Ookju/lzF7w3mdfx1JzZwFMHzUfohxzjLA6rzR3fvsMFVsGJcXzFJeBmHxqaQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from (2603:10a6:208:6e::15) by
 AM0PR07MB4468.eurprd07.prod.outlook.com (2603:10a6:208:7a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6; Thu, 28 Jan 2021 07:27:33 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a%3]) with mapi id 15.20.3825.008; Thu, 28 Jan 2021
 07:27:32 +0000
Subject: Re: [PATCH 1/6] MIPS: Octeon: Implement __smp_store_release()
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-2-alexander.sverdlin@nokia.com>
 <YBHp4139X+p+4IZ+@hirez.programming.kicks-ass.net>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <aace6ff1-9ddf-15af-3c0a-378c53c59acb@nokia.com>
Date:   Thu, 28 Jan 2021 08:27:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <YBHp4139X+p+4IZ+@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.169]
X-ClientProxiedBy: AM0PR06CA0092.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::33) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.169) by AM0PR06CA0092.eurprd06.prod.outlook.com (2603:10a6:208:fa::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 07:27:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 648ce27d-7315-440e-5dd4-08d8c35e2d48
X-MS-TrafficTypeDiagnostic: AM0PR07MB4468:
X-Microsoft-Antispam-PRVS: <AM0PR07MB4468F4A1B65131004088DBC488BA9@AM0PR07MB4468.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOvlG4cAEHWuvw/aEyZ1molAKWsFkLX3jsEuh+s3fUQ+x7xyoBII+/G9VCYNlNNQtJ/5vk6FpFqpMXmo5hdulu3znRtb/o4T8HQ41k1b0QvMAyLhtDPdnbPzoS5e2oicmEIwtlnrLWT56QZflka0xJsPYCnHvmukC5DyLM6L04LIji96Zedqiw4xzV+nVPuWkykQFlXjuW+UhS6qIGV7mRxuOf6zJeOkP7Wez6RUJ8zlhWRJnn41mkz47TnQSBznCd/PJB2Vj59AUymWObAkBSxMqv7DnSoCCSQKI0I3+AJwxPGtQ9IoeqqJodgUXbZ4Z29DpBsp6A0TK+EMUDGY2a9wWML8hepZNXE0KUi+2vAaQ04ENgJ7Z0J1yEgN5lk0XDrIPQzImSjyohcSw9QXB9ZDGhu428NmTWLC1CRNRJpFIY+3+1i3zyP51yk38p5I3qCqL7j+vt/QZ+SLUaTHJ4eBIpAjhMr66D8LzafPnhTfwBQ31rmYc6evUBLCUi1S+cPaz1m4cXXQ+AzzVVPEve8t4Y0Fg/0KNZYVMP3Ku6zwvYJeP9ZXMs3T8pjoAUdEDwZhyZanelpkhqE+tXt2YbovbAL6tyNKtg0QqISpPqXwUtnbl0riOpVI+0HSi87xkKpWF0Y8UUCfG/txSdcQ9uEOwZxHzvD4xOYJQE3GYyqMLUjPnF4Zkw44h66mCn8e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(52116002)(6486002)(956004)(966005)(2906002)(186003)(8936002)(2616005)(53546011)(26005)(66556008)(478600001)(66476007)(44832011)(6916009)(316002)(6506007)(31686004)(31696002)(36756003)(5660300002)(66946007)(54906003)(16526019)(86362001)(8676002)(83380400001)(6512007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?blRFZUZGSEFyckVzR3RxN0VvdGN4S0VNeEhHTjlrbTFMaFJ2dFVwMVdXVVNt?=
 =?utf-8?B?L0pRRGM1MDk3ZUpvT0o5c2I0blZERTlDZGl2cUlZNGJobUEyNnh5c1gxeWxy?=
 =?utf-8?B?TFpxaFlsdnMxRTNqcG9LbVhmOGZ0bjloT0t0OUYvOGVjT1NKLzFNbnlGbjdy?=
 =?utf-8?B?NzRCN3hIWTRkY1lpbkFZdHJOaEFQWGdUSUJOcDJ1UW8vaHQrVG9IVlBaNmlF?=
 =?utf-8?B?MzFoaEZvbVJIaWNXOENoKzJyRjhqcnBDRUp6eVZ1Ujd5VUpoQ2xUWFhUWTdi?=
 =?utf-8?B?d1FYbzJwRW9GMFZTWGNBampuZGNOY05WTWpjcjNDT2VmY05PdUUxUHVSOUIz?=
 =?utf-8?B?NExQZDl1SnByazdGaVBYRVZwdmJKR1RMTUhhMmhyTXFLTDVlZlcvY2ViMCt6?=
 =?utf-8?B?TGNNTHM1ekprYy96ZjZrbzhheDFTY0xkV1FPQWpxTm9OZFYxZEppNkhRL3N1?=
 =?utf-8?B?blF1VUl0VXh3M3RMVGVwMy9DYkZBNzhKNkl1N0Frd1U0Mko5c0JjZ1lEbG40?=
 =?utf-8?B?R2liVFVLOFd2dUc2S0U0ZWZYU3BPdUZQaGo4aDY3RWxrV09EcFVlNVg3UHE5?=
 =?utf-8?B?aENJbVdBbTZoeWtNZHorOXlBOHVhZWJ3WVJOL2xDUmd1eGdsU3VNRC9JU0RI?=
 =?utf-8?B?LzkvNWVhRHpscWQyWWZ2VDMvdmV6bGtndUphbW9qMWFybTN5LytVcFlmcTRR?=
 =?utf-8?B?b2czNDc2Y3YwUWZMZzJUbURldlpOSmowbzcyejdYOWEyN3pVTlkveUkySGxi?=
 =?utf-8?B?MHFaSkVCZy9pQ005WTZkUWtkSi96dmRoM1VpOUthTWNmdkRGS0V1b1hkeWVh?=
 =?utf-8?B?cGNZbHd4MzNscm5tVzNaNHF4Q1NleVNuSkprLzhNM0NrSUZxMHcza0N3UEkv?=
 =?utf-8?B?RVhaaDc3WnFuUldHMlJncUZyMitKRWZUVmQxcWVEOSsvZmdYVmMwYnpYTi9x?=
 =?utf-8?B?dWdaNmtsVi9SSDBkUk5rMFhhdE9EQUF0WGJyZ1FSU2dIcEF2eDNpMmxlbDRY?=
 =?utf-8?B?cVdPaVpQZXR1Zmd2aXRtSHFyK0s1YnErek5Kcm1CMU9kakUwQVpZdWdmRGxB?=
 =?utf-8?B?M0d1c1NiM1JkbU1sN2NOT0VmamRPVmhQOXE4dFNSM0pNczRTb3dDaUV2ajZN?=
 =?utf-8?B?SzRIa2ZjdVVCVHYrbjZKbjFVY0t0aFE2WWVBNnl4cUxIREhKcllySEFoVWo3?=
 =?utf-8?B?Ym5ONzJvcXBNblNMMjBGVExTdms5eE41UWpNeUNadm9obUFOZnJ4VTAyUzVa?=
 =?utf-8?B?T1NKZFlMcGdQazFCdmJNb1pTYkVhcFlIVEh3SEJNYTlCOFlXNVgrdGNQYWV5?=
 =?utf-8?B?eDFXMmhNaXkxeUxKZkM3RUFRRTg4ZDZNaDZmWmZ1eVBGY3NMMFVtSEpIK1Va?=
 =?utf-8?B?VHdLalpmQitXMkJUWUpCTmthbnFOSno5VWVvWTRCcHA1czFBMXBxaTlteEJN?=
 =?utf-8?Q?Hpbb3+4A?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648ce27d-7315-440e-5dd4-08d8c35e2d48
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 07:27:32.9533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55tYPNn4AvDvOgyrldXpsZoHMGtuOLk9YY9RoYyy85iJ/vgusTQH5MQRm0u9ACGkgSgd8HHKqWj2Ci4wcw5GGEHxsimoz0ZUYhGiVlfZGl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4468
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Peter,

On 27/01/2021 23:32, Peter Zijlstra wrote:
>> Link: https://lore.kernel.org/lkml/5644D08D.4080206@caviumnetworks.com/

please, check the discussion pointed by the link above...

>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>> ---
>>  arch/mips/include/asm/barrier.h | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrier.h
>> index 49ff172..24c3f2c 100644
>> --- a/arch/mips/include/asm/barrier.h
>> +++ b/arch/mips/include/asm/barrier.h
>> @@ -113,6 +113,15 @@ static inline void wmb(void)
>>  					    ".set arch=octeon\n\t"	\
>>  					    "syncw\n\t"			\
>>  					    ".set pop" : : : "memory")
>> +
>> +#define __smp_store_release(p, v)					\
>> +do {									\
>> +	compiletime_assert_atomic_type(*p);				\
>> +	__smp_wmb();							\
>> +	__smp_rmb();							\
>> +	WRITE_ONCE(*p, v);						\
>> +} while (0)
> This is wrong in general since smp_rmb() will only provide order between
> two loads and smp_store_release() is a store.
> 
> If this is correct for all MIPS, this needs a giant comment on exactly
> how that smp_rmb() makes sense here.

... the macro is provided for Octeon only, and __smp_rmb() is actually a NOP
there, but I thought to "document" the flow of thoughts from the discussion
above by including it anyway.

-- 
Best regards,
Alexander Sverdlin.
