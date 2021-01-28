Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92638307599
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 13:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhA1MKd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 07:10:33 -0500
Received: from mail-eopbgr30136.outbound.protection.outlook.com ([40.107.3.136]:28577
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229817AbhA1MKa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 Jan 2021 07:10:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpT1IzfNJuIYFNoZ3CeuZENx+1qzbuTtYsjBmtP0oi5cpQEUkKcd4YaQ0NGIY+bRIgW1T/EOMlfC7pmr9l5XNQ39XQFiAjAeTdLIHTgWNybEcMOBXcUwJNBO1mdCSH+ZsNgclW/iw5GGf9EH0FyRkcz4c+PWBOK3eAG5V+m7l1zPGTp2YpM9kXntJPBRLBHFHUOIu637WC2qiCtWUUVwTiDxLINWKVWce/kwjsmwJ7EtJKl7E6t7+ggWgR2hiCqRLdwFRjT/cLIUYmXJjDl3Gl13XzmO1xpqRfUqVJ7njf18++GSb2kasG81dQ0YmDvJYwA+eh8gQOeiuNJnQAwALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO9z5G/GuaoXIA6nSx8XgTqSNFDo5kkVO5YgyaiCM04=;
 b=If38DSwDGE1OabxziKhk3fHG77s2HCsq2zVlHUNLw3TiG1bPXdEdsqCH99xxQHSG4Cytkio6kTFdWDhDSPQOzGYC8rg7ks+xdlqrUsqzehv5IFCcWHKTOz2L9T2CvDcxmIVTuDrLbBOZdlMu7xWq9pkNO1EJ+TAGxxHprFeI2LwZoo7fu3xfLs8HIgAVp7VFPswp0vyUhAAlXgiWaabDuFnrzTqhAn1rqbnFuzciBF6PykPMxggETKCZwjNEU4z/h3nNdtpyFWFyazascCFlVjnLv114q9sdF2y1ME3C/8sX6Eotvi2p0x93UAn2VWxMYAqs9Ijf5HIKJj6zmLPDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO9z5G/GuaoXIA6nSx8XgTqSNFDo5kkVO5YgyaiCM04=;
 b=ckccAzoX1Z6Xc069CTq8I2EGJnwf6hnpWHu0bZnqDUD57odw11vExtkglX2OPnPEiODc45u10oTXBTDJ8TdXKj52bALnlQOg7jrtJIj9NpXpo5vdBvqyR5uahYYvT235RAaqd8Dpyx0VWxVgcNXjq2OQWITxhmzlvESRBXrKESU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from (2603:10a6:208:6e::15) by
 AM0PR07MB4033.eurprd07.prod.outlook.com (2603:10a6:208:3f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6; Thu, 28 Jan 2021 12:09:42 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a%3]) with mapi id 15.20.3825.008; Thu, 28 Jan 2021
 12:09:42 +0000
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
 <aace6ff1-9ddf-15af-3c0a-378c53c59acb@nokia.com>
 <YBKhBQQ97f/J6L+u@hirez.programming.kicks-ass.net>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <3c0165d9-1814-df1d-7ec9-bf515a3996b3@nokia.com>
Date:   Thu, 28 Jan 2021 13:09:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <YBKhBQQ97f/J6L+u@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.168]
X-ClientProxiedBy: AM0P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::39) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.168) by AM0P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 12:09:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01c6ded0-f484-4d03-e821-08d8c38597ee
X-MS-TrafficTypeDiagnostic: AM0PR07MB4033:
X-Microsoft-Antispam-PRVS: <AM0PR07MB403304BAF84E39E63DB5FFA388BA9@AM0PR07MB4033.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L1c2XhArCsXn/0zbQwga6kaf3FS/obzXHR1+yvhrMChuRtmNyUlowvLqKaJGKDehG40q+AQazoc5rGevEUClZxx8aKH9KtzOazN546JSiAECzQJ7+Ck2ZNfV925BYrGpecUxlsaDDKUO9RaNvvbu94vLZswM+c1QiF80ifPPhU3ti7CL+O2aNA3JOjwLvdIiPavLCWOHsdvrxxEVF7f7SAIveJfVOO6PeJiNynH+8a/lRPKwwLJ7SJtNfqfPxzeNJVwHniOAZcgQDo8Lfp3akRaZopSq4qeN6BEtRYIg5CoGR/GfcQsH4Mdp6+HXE2sW26eiHqqyJJqsiyX6b0eJCPafcq+hGkEmoelsqzjgSjMLX3g8WtR1mIjZI3anMq220CdHHrPZtXizqFIgigVnL004KbpVkKzP10z/KkgTXE7AdHFU0e59ekMAGNH7OYUYX0TNYhGShVeo0lgTW4X/W6NGZD9SkBehJunJzeEJ2J1rUfQe7SalhefwGHw5pmhi1t5jB7/vhBVbqd3ruRZLk/z1NzlglpU2H7O+9P8JnwM6+pJ1zJJrGsRo1mpRjFsWjT6E2UDsHZHJJK03QNVKGrqXv+lF4yncrsBvot3s968y+SeXQzLd6oaXuFqCGgKmLLYAUbCTWH1/+27OZS309ZYE3LpALtj5xq5+lxQ5SHEmRKVfhdoLXJEAAEVrvhO6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(66946007)(4326008)(66574015)(478600001)(186003)(66476007)(66556008)(956004)(316002)(2616005)(86362001)(54906003)(52116002)(2906002)(16526019)(8936002)(44832011)(6486002)(8676002)(31686004)(83380400001)(966005)(26005)(6506007)(53546011)(6512007)(5660300002)(36756003)(6916009)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2pQTjc1Qk1rTVA4SXc2Q1JoeUh2TjFPN011V1JLUUI2VGxnR0d3ZVkwcG0z?=
 =?utf-8?B?azdnUWhwMHdvUGlZd0JwdWZiVnhPbXVPU2kwS0FzaHNpT2ZzUi9kcytWbDZa?=
 =?utf-8?B?ek5Ub1hHdHRVQVQveVFYR2I4Qjc2em03ZkdTZVhqa1kweGJ5RFE1ZUJuZ3lz?=
 =?utf-8?B?ZUM4UnNRcDBRV2JJbWY2SUtWU2VYUi9udjd4RVk5V1NtZzBHNTlFNG0xUDZv?=
 =?utf-8?B?dFpaaW1WLytpVTNkRjVYUzhVcDk1bWR0UXlOaU4vQmNxZk9oeUtwM3VLWG5H?=
 =?utf-8?B?T0g4blNlQ1ZMUXRJUHYwODliMklvYkpoVW51bnBTakcwYzNmR3Y3VysrYlZQ?=
 =?utf-8?B?T1JtNksxM1N1RzRyUXEzRnBLS0t5cjdJNDZsSGRyU1c2aW8rMWdDRytCaUVT?=
 =?utf-8?B?YTB6VUV6ZVNHMU0rcDlEbjN1SVNMQy9mMHdQenlxcHhNVERweTRHSVNWcmFk?=
 =?utf-8?B?NnRqZmNOS292aGpoWHZyN05aRjdoVHpuS2RQVjU1dzlzYmFjQ1dseUNHK1l6?=
 =?utf-8?B?b3htNUp4MGsxQk12L3JwWU1jTyt4TTRNNTRDL3djS0E5Ym4yK2lMbm5VWjJs?=
 =?utf-8?B?clpnZXpCS0FDVGlzaHB3WVF5QXRtMngrcDNLT2JCZXJRLzNTbldtaGI2YjBl?=
 =?utf-8?B?emc5SDlQUitJbjhlVlN1eWJOS2h5bFlVQVhFb2ZxNTBpcUs3L2NRQ2IveVdr?=
 =?utf-8?B?RXRBWkdMcVQxQXZIb1c4WEZQNTlKbFdSR2F6WnJPUTZxRTQrbkExTmk3Vmxx?=
 =?utf-8?B?Y3BiQ2NGZmdtZnNpSm9CcjdFVXFIOGhOVkpCdW1WZXRFN0ZOSmEvQmFmODhW?=
 =?utf-8?B?dE9EVjhlbVZaTDV3TStzM0EyRU1OZTQxZVFaSmJxRk5BTDR4THBYdlNrekhk?=
 =?utf-8?B?aUgzcTVsZ1A2OXMvTWp0elNTUlJlNzdOaE0rNm5DSTVKYkpscHo4TmVlWEdq?=
 =?utf-8?B?bDVrQWdUVHFlbUhRdzQvMHpaZ1FpSjBzY3B0UjUwUDAybmJoa2RicUh2VkRq?=
 =?utf-8?B?Uko0dFNaZFF1YTJsSWhNOEhPSVE4UG1IbGcrY2gvUjhWZ1VZNDNrNjR5aWlw?=
 =?utf-8?B?MjZLaDVrOTNuU1E5cEN2dm9EbW9Gb1FwRVhNOUxZNzlrbzVuZ3RCM1IyR1pX?=
 =?utf-8?B?QUMyNTE4c3o5MVRZa0NtZTVMTzFBSTFuWVZxTC9RNFRhdWFOWEV3NTA3YWR2?=
 =?utf-8?B?R1ROOU1WYi95UDlNWlhkZVVMN2ZZOU1lcjJFMzJMYURrbkROWFZ0cjFsS2NK?=
 =?utf-8?B?cEFrWFlMNjF0ZmVHR3o4ak5OVTJaRUJpTDdDVjV4Z29aYXhYK0Q3cjlYbWVo?=
 =?utf-8?B?Y1hLem5mcWRUZDhLWDNZbnYrWXFBT0theFFyaGxZMC9JN044Y3QwV1BNSVlR?=
 =?utf-8?B?NS9JMFM0L3prdDZkWlVpa3JGZ2EzV1YrSFRDTjlxN00wMHRBK0Zhazhiam50?=
 =?utf-8?Q?AInEwA4u?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c6ded0-f484-4d03-e821-08d8c38597ee
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 12:09:42.1407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyTtZLB5hR8nT2elAX/6I7nhH6H0q5DczNveF5KhZmxBYPNhUYMOBJArrKlJY3FL2PqTfXHD87iHwv33ECQKfUDBkswvc7JWhbLw3VsvYHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4033
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On 28/01/2021 12:33, Peter Zijlstra wrote:
> On Thu, Jan 28, 2021 at 08:27:29AM +0100, Alexander Sverdlin wrote:
> 
>>>> +#define __smp_store_release(p, v)					\
>>>> +do {									\
>>>> +	compiletime_assert_atomic_type(*p);				\
>>>> +	__smp_wmb();							\
>>>> +	__smp_rmb();							\
>>>> +	WRITE_ONCE(*p, v);						\
>>>> +} while (0)
>>> This is wrong in general since smp_rmb() will only provide order between
>>> two loads and smp_store_release() is a store.
>>>
>>> If this is correct for all MIPS, this needs a giant comment on exactly
>>> how that smp_rmb() makes sense here.
>>
>> ... the macro is provided for Octeon only, and __smp_rmb() is actually a NOP
>> there, but I thought to "document" the flow of thoughts from the discussion
>> above by including it anyway.
> 
> Random discussions on the internet do not absolve you from having to
> write coherent comments. Especially so where memory ordering is
> concerned.

I actually hoped you will remember the discussion you've participated 5 years
ago and (in my understanding) actually already agreed that the solution itself
is not broken:

https://lore.kernel.org/lkml/20151112180003.GE17308@twins.programming.kicks-ass.net/

Could you please just suggest the proper comment you expect to be added here,
because there is no doubts, you have much more experience here than me?

> This, from commit 6b07d38aaa52 ("MIPS: Octeon: Use optimized memory
> barrier primitives."):
> 
> 	#define smp_mb__before_llsc() smp_wmb()
> 	#define __smp_mb__before_llsc() __smp_wmb()
> 
> is also dodgy as hell and really wants a comment too. I'm not buying the
> Changelog of that commit either, __smp_mb__before_llsc should also
> ensure the LL cannot happen earlier, but SYNCW has no effect on loads.
> So what stops the load from being speculated?
> 
> 

-- 
Best regards,
Alexander Sverdlin.
