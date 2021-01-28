Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35697306F86
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 08:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbhA1Hca (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 02:32:30 -0500
Received: from mail-eopbgr80133.outbound.protection.outlook.com ([40.107.8.133]:57316
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231963AbhA1Har (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 Jan 2021 02:30:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB1tudRuwpcyk8zI69o1KKGJW5j6WPHOLcFGrJyjunklvFBZkC81WOwszh/cHaPZWoGY/7YKTQMjmKSPeoRKWu75llRAJ8UX3cORo12MBVoASTN73yb0F93gpgLl8lJ5MTv/eAmxsoUb78II246BgffndNIAC+tVMzafgvPjaeflUy+rlYLo0wgRqkQiXzYzqAs6KfAGj+Q4WPWqEQkYmZUP0soroLC+fT9MA4QKAqA+S5yeH76cLS0LYK2/5kKqJtNQmcxPSPD2RzqoUM6vG667YSDDvwrd6QCMwfb2afPENoZalqF9ollGKxCBgsENB5otk0mdhopjAjvRUNZ+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6f1DBwdal0UwIiItGPzGZVS0cC5CdJRE2GKdfP8TGw=;
 b=binO9FACULZNGc+ZUm9/iuQuw17ofyEmnQNXd6kBsWeUNob9FfXfauVqdRlrNI32LeyZRQBwSLZM0SOHptuX0a8q7kUSb52YXhkYhbgsMjq1aK0kZJ3XoAWuMWc6j4p1NPFW76xNWNGq0ihuaWDs+C7Zv5PexDWWVYl3gglQQN8FmIu/yurgL8xpr31KqQ7HrsguP6HmxEmUmdKGXMYU3nHI8+OvCtHFxZrf/ILof0hXz6C3OemFYW2pyMs22VVoutyPm9qfoRuxLQoqRzbPoJlmbGH4tU0Z74G4qVtmpZc+NNudkBUcjHoP99jmWf+ha25Bk8AxYe1p01z4P9iUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6f1DBwdal0UwIiItGPzGZVS0cC5CdJRE2GKdfP8TGw=;
 b=OEDqkq1SqKL577GljI6pc90zyUYo+xBueAZlfCmXcHFCEDnDdcUpxDWVmqPsHfOdXU7uUi4GCdFwi0MnfISEYzO8f582N4ige/JgYSLOXl9Jp4WYcAUuew0g1vfmc3ICOeSSsXXJ8UsRN30OS4XKzSLBBzevRv6uygc8v/FnR2k=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from (2603:10a6:208:6e::15) by
 AM0PR07MB4468.eurprd07.prod.outlook.com (2603:10a6:208:7a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6; Thu, 28 Jan 2021 07:30:01 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a%3]) with mapi id 15.20.3825.008; Thu, 28 Jan 2021
 07:30:01 +0000
Subject: Re: [PATCH 3/6] MIPS: Octeon: qspinlock: Flush write buffer
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-4-alexander.sverdlin@nokia.com>
 <YBHqeXPMILg+352D@hirez.programming.kicks-ass.net>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <f492b29b-32a4-b4d4-a5d3-0d0dd8a56b5a@nokia.com>
Date:   Thu, 28 Jan 2021 08:29:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <YBHqeXPMILg+352D@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.169]
X-ClientProxiedBy: AM0PR10CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::31) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.169) by AM0PR10CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 07:29:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: beb783a9-6e67-4cc3-650f-08d8c35e85b0
X-MS-TrafficTypeDiagnostic: AM0PR07MB4468:
X-Microsoft-Antispam-PRVS: <AM0PR07MB44681AA0FE369680C48C9FF288BA9@AM0PR07MB4468.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nY53DwnAu9j7XlP8KZH2qu94SinSF+v67nJC9QQTS8am1B6o63o4kiFL4ZdnLlw7IhBEmUfwII0+voOE7ZaldVQWGR0BB9HnuzIzXGB9XcHdd8mk/DaArHES6QZ4yy84xZKXK2Y5a/9rYXKYYhEHBzxzPiAqs5VYtEgGmfEPe7UH6Kf6p2XR8KZTajTnBmibW7GgZZUjGQ287ODdqRQotEO6HzOb59C9HaFTvxNm31RANpfiF6eM0RSPxAk8SWRBbPlDIzwGgAg3zM2fxBVJygd4ySz0dB5YZkCDMfQwRhwq1O4MUYA4CJzIcW1nQg+a1bKhUnajI4+O6YUIBdsrEHRaTvFgMJaR58UWlZG4HoeG23cNaU2ZRoaLj8Od2shVpUhLB5oaQRwRdEE6/zv6vi7XvGiYwgzGE4aV0Z2QmufPFgwacmcyjENvBybJAx9jtcDYXWLOTcQMAStU51YRiSNAZNX+A3MAKdRbfrJFzwduDga+BN6VNE1G4KhTZi1CAUZyv/RnIG+0OVK2H8iIo4RC0DUr7OYl8O+8pHXZ9325HJD+hdzXI0GrYi3WKQ6Hufgr+RafOUNFhOaznQr/3mn3k8SaBancam71WfPGe94=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(52116002)(6486002)(956004)(2906002)(186003)(8936002)(2616005)(53546011)(26005)(66556008)(478600001)(66476007)(44832011)(6916009)(316002)(6506007)(31686004)(31696002)(36756003)(5660300002)(66946007)(54906003)(16526019)(86362001)(8676002)(83380400001)(6512007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmpMYzgwcXl1TTl5SXpMN2c3bTBmU21Xd3lDWlNOeUdPZmUzV1hYdTM4YTBI?=
 =?utf-8?B?Q05FeTdVejdtU0FaNFpwdUlUREZwRGtBUUlRMDZlYzAxVDV0MWJmdm9Pd2Iz?=
 =?utf-8?B?TTFwWFdIWmF4aDAzNmp5bFAwR0dnTHVwWENKME1jU29uNmg1bFJsckFuVDRE?=
 =?utf-8?B?S3VkK1RZeExmcFhtMWxqUHZ0V2xJM3V3T2dQUmZUTk9vQmdPeHpnNDJqYURq?=
 =?utf-8?B?dzdEYzNieUVEQzBTZ0YyZitmbWhvbUlDTnliTUxLemE4MW1XOXlnT3lOQy9R?=
 =?utf-8?B?Yk5jNWpjWi9iRy9maXVjU21PSGlKaGdWM0NQeFV0K3ZPTFZJRElpL2dWVnNP?=
 =?utf-8?B?TldTbnNrODh0N0x3bk9KNVdFWHdmUjh6Q01LZ0N6aGRTMjhhVmlQdXZtcm90?=
 =?utf-8?B?MmxadlM2eEhIelJ6SU9LMURkYmp3a3V5MS9EL095YmZwdUJLS0hzRXNzUEJs?=
 =?utf-8?B?Z2Nvbk1FcDJ1bkRqbDRCMXQ1M2VBa3VNQTA3c2h4RkduWHhlR1NGOXE2a3Fl?=
 =?utf-8?B?TWFITFpFUEp6Q1N6aVYwcXRxdldkbkQ2dW1Zai8wMXEreHdYb0sxTnVtaFAz?=
 =?utf-8?B?UUtkUkF4MkovT1pDYmtXcSt1dGxKeGV4LzE3YjZxR3A2Y2FYa1dkNm56R2Zu?=
 =?utf-8?B?RE16SmhhTEFNZUNvWmU4SjIzeU5sTG52WlRkU1FwWkNqOVQrWlpLaTZQVm9V?=
 =?utf-8?B?K3A4Ti9aVFNlRTJDY2szODViVUJLNHkzazNUVkwyYUlraHBiTFNyRndUcjAx?=
 =?utf-8?B?bmM2Rjd4dmFvNmFOKzIramROdFRTbHBCOTBJK1BMUVZNbWl4Q1dkbjJUSkIx?=
 =?utf-8?B?MjlwMjhLYURyWHBjRnBWQndRWlVLVWhLWmFueGpUR1FhdmZxME1taDV4Q1ZT?=
 =?utf-8?B?TnV3RWc3NVNoZVJCRXpkRUgxaFVQcnVMMmpkNmpENk9xdUJBMXhoWEJBZklV?=
 =?utf-8?B?a3J6bFYxemJ2bmFzWU1sbjBjZks3NFNsR05jOEpTU0RtdUMyc3FveXErZFFC?=
 =?utf-8?B?VHNsYlRneDV3T01uUE9Wa1lpWDVhWlZEdGs4NFZPMjBPdm1BYlZiMENvWDFE?=
 =?utf-8?B?UFNTVnBWUHg3WGFCYS9PM0J3Q2YydE1xYldxMFJWU3dmaUF5RVRGZUNuWWFE?=
 =?utf-8?B?M3hsd2pOSnV4YUxKNFJCRmhuNHhMdVdBMkFhWGJmMzMyeE5aaTZubExrdHYr?=
 =?utf-8?B?VnVPRzd3S1NjTTdHNldqQzBuTkFqQUN6ZmVTNWZvVEpVNys3Yjg2V0xsV1R3?=
 =?utf-8?B?T1Q4UWpmNUJ4Q285MWJlU3owenZPM25KRWxGOVZPWVkwNjFPc2NWb1VrdHEw?=
 =?utf-8?B?a05XWUJOd2ZYdTFMdGdFUG9vK0xDeVRRNVN0RTN3WTVWSExrN2lPeDBiOVBl?=
 =?utf-8?B?RXFpbGpJZUZoY1k2cUNPQng3alVSRGJlOTM0L3ZQZVpuekpvZUhKMmRZMFN0?=
 =?utf-8?Q?B4HF8v5F?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb783a9-6e67-4cc3-650f-08d8c35e85b0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 07:30:01.3775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pb/qUQXn16xai7oZdeDDqHpQmulSKkJf3aZ1cBX6zSHBN6RPeQx8HTM5B9xGcP1VsW859MMLQq1Z2L4RBYmyM9t0U4nERpA3WaXkLnHNXRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4468
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On 27/01/2021 23:34, Peter Zijlstra wrote:
> On Wed, Jan 27, 2021 at 09:36:24PM +0100, Alexander A Sverdlin wrote:
>> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>>
>> Flushing the write buffer brings aroung 10% performace on the tight
>> uncontended spinlock loops on Octeon. Refer to commit 500c2e1fdbcc
>> ("MIPS: Optimize spinlocks.").
> No objection to the patch, but I don't find the above referenced commit
> to be enlightening wrt nudge_writes(). The best it has to offer is the
> comment that's already in the code.

My point was that original MIPS spinlocks had this write-buffer-flush and
it got lost on the conversion to qspinlocks. The referenced commit just
allows to see the last MIPS-specific implementation before deletion.

>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>> ---
>>  arch/mips/include/asm/spinlock.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
>> index 8a88eb2..0a707f3 100644
>> --- a/arch/mips/include/asm/spinlock.h
>> +++ b/arch/mips/include/asm/spinlock.h
>> @@ -24,6 +24,9 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
>>  	/* This could be optimised with ARCH_HAS_MMIOWB */
>>  	mmiowb();
>>  	smp_store_release(&lock->locked, 0);
>> +#ifdef CONFIG_CPU_CAVIUM_OCTEON
>> +	nudge_writes();
>> +#endif
>>  }
>>  
>>  #include <asm/qspinlock.h>

-- 
Best regards,
Alexander Sverdlin.
