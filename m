Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B073930753F
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 12:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhA1LxR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 06:53:17 -0500
Received: from mail-eopbgr70110.outbound.protection.outlook.com ([40.107.7.110]:46087
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229852AbhA1LxQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 Jan 2021 06:53:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVzXpGKygFymlegFnoMC8AVNPkKK709m2r0tIs3SkgGAIQ9DJ+sGk7niU2VfTV3Y/G+uanG4klcu6AzrxzjumZ6Xna0leeXk320nTdUlZY5j9v2z4GYznKWHff5spnBO7XWBWEzAJg6U7a/ar1BQKn5IYFs08MDjIjuWuc5+Qr75hKFaN/aBF0rq+1gqySclQLxeW0z+hIpzJ5pom/kIcb0neT9yXyvaIrtnmeiUKt1shVhR+L2f6tH/mBnDNSpQF3AsBfM8WORznIIqbt9X0/4kUWhDf60MRug6xM0npiEUlyY8bTt1EjX3j5bpHpAi48DLCbsJRdGYxwOBJ+pzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcu94ajSAYFybAcp6GwpcgnmA8g0e8bUC8fbWPkW0/8=;
 b=dy/5H40AS4w1KdAYrkQ4QxP6cCAJBuXUYwbyuJf1WP0wTYsSKaA7oNGghK4yODLKuWWJppJFMMw2Knskcs0tdzd2bpcWYYrQLGU8y9UVc6Z2MiGWMKl7l5+/UpyUve7LBtrsWDdUwa90bPKwPYBeASdLS6qjHBR/q+ZRSLdPzv3cPu8gW6owsqFVcRN799tlIPm56+elrPSutxHgtTVPDsZDasb/DQbX6S0uyrhUyZHS6wPQv3gJWhJdV2Yr8K7xe9lio3cCUSKgmbK4zwJru6g+kXK9LIz55uB0ld0Wh+e7xGyTm2aiPOxV1R4kE6h+szqo11SDOWM8ewWXkb7Byg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcu94ajSAYFybAcp6GwpcgnmA8g0e8bUC8fbWPkW0/8=;
 b=t/5Z1kITg5lPSod3GR/Ye+YMiKNpvAZiLDhp4xByegL/iFDPp1Cy+ZmrRZVC7j7Z+QCOPrskHLW11KsoXBjqSVbjSi1BFdavT3w1RbAdQdiHLI7UGMcnR41jBeQJ6Maza4yE8bjvy2yUcAAaf8avtjp7FlivQA+YLPoDNPvuDEY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from (2603:10a6:208:6e::15) by
 AM4PR0701MB2209.eurprd07.prod.outlook.com (2603:10a6:200:45::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8; Thu, 28 Jan
 2021 11:52:25 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a%3]) with mapi id 15.20.3825.008; Thu, 28 Jan 2021
 11:52:25 +0000
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
Message-ID: <b00f945a-1278-5fd2-321c-6ea5f07be128@nokia.com>
Date:   Thu, 28 Jan 2021 12:52:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <YBKhBQQ97f/J6L+u@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.169]
X-ClientProxiedBy: AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::22) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.169) by AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 11:52:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 206aa486-f8dd-4692-93fa-08d8c3832dfc
X-MS-TrafficTypeDiagnostic: AM4PR0701MB2209:
X-Microsoft-Antispam-PRVS: <AM4PR0701MB2209077175F2925F090EF93C88BA9@AM4PR0701MB2209.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XlzHMNKYguLA9YXq1gkQ5NehMrkNZ/6bmJFAWsNXp7vRpyrBpD7QoN88kRsnnxL4FWBPZWJIsjiMPgPdpPVXAV4hgVLo2lwQIJJ0xxwyYff5Bg8vINdbWcBYMYVmaidpdtZYwnE38sMeWq9OnbX9ubFwo/r66hvb/keygTu4OZSlZKkaPoVgNoVqk38Q5DjZ89Vo/kYrxDj25GywZW59bx2tjc1drQ9dcW9ALdzQ/z8FrphsPydAX9DM6Td4poOM1Yw40SG6kdx+FOq9Ja7VLm4QDj3GHleTe85jSWSJTNi3Rl4VftThIO/wB4qLd7vm3gl64ETmvaTeTR9WHodAuF8OyY5UndzxGCGMsIKYJgXLR6dMRwvTrxKTdMrjUuITfdL5Chs36RYV4ip6856UIDtWH3COBvgf9lA+/X1Ej+XKdGBDkLc632kdTCvDy0j3antSXRjXmIq5UsErDMQkMaicJm/8fbBpeGqKnoh5iMsfoINSwJR5Ia49ve9q8epWL8zxApj7CYHVWcqe86PI72L3qI+SPv38M+326XDtXotATsAp9/tk497xG5Qz37BEXRBcoic2s3m8xMzVa03CM1ZTqp2i1aMBuQZiaGGEGE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(6512007)(8676002)(6916009)(4326008)(31696002)(83380400001)(2906002)(6486002)(8936002)(36756003)(44832011)(6506007)(86362001)(53546011)(52116002)(66946007)(66556008)(66476007)(956004)(26005)(4744005)(2616005)(16526019)(316002)(186003)(478600001)(5660300002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dGl1Z0Zta0IxUnFjQ1pWNk83QlMwVGF1b3FwQUNNaXNHTmtJemZkdlJSQVli?=
 =?utf-8?B?UGx0OFRweXdneTllTmhNTWdLT1luODZaaEhrTmYxS0xMMlU2ai94MU0yKzk4?=
 =?utf-8?B?WEZwR29JSWdXckZTODV4QmlGYmxzZTREcjd2ZDY5QXJ1L3pwTEVFWWU1Z2hy?=
 =?utf-8?B?ODNXTkxDTy9ScUV4enMxbllSWE5lbTVHVGRvSGoxRFFUN3JnM0ErL0NuTDRs?=
 =?utf-8?B?RWJCNFplMHVZZ205RnMzTURoZVpUeWpwSUliZUd5ZXEydmxWd3psL0xFUmdZ?=
 =?utf-8?B?dmpYeGUxMXpHdXkyeThQb29CWkh5SGhHYmp6b2cwV0ZUOXBSNGd4b2dDUWpu?=
 =?utf-8?B?REpTbXdRTTdueUdjR1dVNEY4a2duSTBoYmNsdFhNUTFSSHRtUUNhK2VXL0V6?=
 =?utf-8?B?WGF2NngxSzJQVGZYai8wWEdPRWRJUVBJOVNoOUJUNVVvdFcwQXB4amdqTmk3?=
 =?utf-8?B?RzJNT2Y5N3dpS09weDVDUW5EOFpmcXpmM2k5Vy9mbk1HQTc0aEZ0WTlVaHhs?=
 =?utf-8?B?YmVMN0ZsRHB2SGZiWjBFK3JacnhYaDZGdmpkQVczeDFqSHpadkRYQ01LK3pI?=
 =?utf-8?B?UXVaU1NZaFBnOCswYzE4YW94SEFId3MvdWhXVHhwVDZqdHZFZjA4YkNFd25z?=
 =?utf-8?B?WVpuZWhYWHo1K0F2VTBxcmxRRE5PUHdpcTFJZVhQaENONGJITWg2VkNmZFZV?=
 =?utf-8?B?UGxESXpsRXp2bGoyTk4vR0RUdWdTYmlIMDUwOG82anVJaFQ1ODN6SWlIVk03?=
 =?utf-8?B?YWJOV3E3Z1lnM2tlM3JNbURnOXFEdHlVYUdQUEg2b3RBcTF0SDlZTTlOTmho?=
 =?utf-8?B?N0g4eDNqZkFmOGZIaklEUkpJL3FpM0ZveFNMUnpjaDFPVUI2QzNkak9aS0hJ?=
 =?utf-8?B?RXYyL3NQYmlVRStFc3RJL3ZJcXAxd0k5RFc5WGY2Z054bVdQREVLa2o1cU95?=
 =?utf-8?B?WXdTdU00aDhRdWN5QlBhU1ZPaEpjTnVobHkzaXp4T2FHcGs1R1o3bFY2WVJL?=
 =?utf-8?B?UkZ6dkliVVc3QkQ3dHpiYWt3RGhjZEVWNHRtR2pZOUNzTStmalVxQ2NHRldW?=
 =?utf-8?B?OVRnd1RVSVlLb2RqNXM5V0ZUdTJlMXBpeW54VjEzakwwcU9wZHlBK0ZiL1dQ?=
 =?utf-8?B?bSthWXZ3WGlRdE5pL0lFdU5MRUNGd1A4THJoVEhHZDRwSk1CdEpnRGliOUFa?=
 =?utf-8?B?YWljcFlPNzdaT2dPclMrNVFUYlFXSE81dWdWY0tId2FieHpvYmhmN2RpMVVy?=
 =?utf-8?B?eVJRSDF5bC9mYXkvOHBsenY0WU96VkpQWVluOVhUdy9zdzNxZ1lQRGJZT1lu?=
 =?utf-8?B?VWNpUVNVci9XQityeEovd0xiSjAzRko1MzNWSFUrMFcrMzVwOXhnd3BaR3Q5?=
 =?utf-8?B?S2gzdVJHSVJBUldVUnNHNWdFLzRGbE85VnhsNlBXbjBvUXM3d3Q3bHZwZzRM?=
 =?utf-8?Q?tpUQQabv?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206aa486-f8dd-4692-93fa-08d8c3832dfc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 11:52:25.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDKV2Ea0RD8BGuWOweOnQFa6mz2ujVOP12nNn+N2fwZip5cE3Lkr7AwszcvpuLJXjuth4oXqA1pgGTtZbyuY1HWu7a+YaUoSUkQ+7NcKQZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2209
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Peter,

On 28/01/2021 12:33, Peter Zijlstra wrote:
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

hmm, the commit message you point to above, says:

"Since Octeon does not do speculative reads, this functions as a full barrier."

-- 
Best regards,
Alexander Sverdlin.
