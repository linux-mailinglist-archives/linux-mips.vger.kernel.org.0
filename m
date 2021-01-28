Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA903075A8
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 13:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhA1MOL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 07:14:11 -0500
Received: from mail-db8eur05on2135.outbound.protection.outlook.com ([40.107.20.135]:3616
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229683AbhA1MOB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 Jan 2021 07:14:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI+ctgy+VSVP9hJAGhDw/il2yGm+3QMY1HBlMbWK3EN4zXCCVCNsD5yE8AGjMrS1nH6T3+TYja7Bzykh11rFdDPchLZbvXHr9JS162+3R+lw0aHMIopDuHZNiwnT1+koyKsa388qNeQ2zx5PrBZP+QN8bQBLbks6Qw3KSBhVH+OMALyfs1Zu6bYK4dTWIinbBMMWH13bUqnNFnEMmU7V9QNy9omEefvNwA4xKr1zcUPbsHorNPytI2M71A37KiCOIuM6hlLcLKSL/W7p+FYK6AVvUbAzgLFhBZJ2mZT8mQIOTO2ECNJX126AGlqZVlM2alNRbG4aTQZa19QHIxIRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEqYar4ex//TFqMfEeHMpRyIrUHhoE64HQ6bVsIia0c=;
 b=c5nRQUxj8eOMcrp9ibRPe3V5LkezA45wSGGjkQ850rksuiPRj5Io+81BGhP1Nsm4vyoepNI6WY12txpTClw4QRlI68bExsB+IHbaZNRxETcjywh3y8VCpOHJz3pWcG980v4l25pk6lPWkglgjM68U65PEpiZ2kpNgEp4Nd7aR0ZnfYUx/LQemcGAU9ceDv1zGPwySpZcmXC+9ov9vE2SDkZS6llJfj6gi3IaK+kKii2yC0NfsiWbi8A8ldqP1PMwED+VpXrw24ueNSbVWWo08XHbUxg2KrVivv4UPvUXMXJbE83eWKtawuilPd4tohkxFkSabCi+/0zJkg7n/47qBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEqYar4ex//TFqMfEeHMpRyIrUHhoE64HQ6bVsIia0c=;
 b=yj6b8DVMVklj1JJv91G2oiB5qKtOyltHD9RoC12YBXQjHTX70jQpfgdokt86Z0Qhx5tdV86xhQyxUaxHujM/JsjLIZDi+XWHl+IHPO/g9iXpeE2nBZe3ObapCtKO9mvYen834Ok7w3/nS8pB0Oo+hJZXE9nFRWE5VfBGKgUUkVQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from (2603:10a6:208:6e::15) by
 AM0PR07MB3875.eurprd07.prod.outlook.com (2603:10a6:208:45::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6; Thu, 28 Jan 2021 12:13:12 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a%3]) with mapi id 15.20.3825.008; Thu, 28 Jan 2021
 12:13:12 +0000
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
 <f492b29b-32a4-b4d4-a5d3-0d0dd8a56b5a@nokia.com>
 <YBKha2GRFWyYp+Lz@hirez.programming.kicks-ass.net>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <f8344f35-cdf1-ec3d-dcd0-7bfc392ef6e0@nokia.com>
Date:   Thu, 28 Jan 2021 13:13:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <YBKha2GRFWyYp+Lz@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.169]
X-ClientProxiedBy: AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::28) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.169) by AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 12:13:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e30c2b68-4205-4b38-fb78-08d8c38614f9
X-MS-TrafficTypeDiagnostic: AM0PR07MB3875:
X-Microsoft-Antispam-PRVS: <AM0PR07MB38759A93A91AF5F7A267B2D088BA9@AM0PR07MB3875.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ANuFSTTXw+R87V1XGruwHT5VxwniS/KtJYIYvnxx9u4SBqDWDp4oDkpHp6VUEvfDsrfRh85xKrRixFx71t7vayHqMULZenvFbSGnYiE9wYHBxUzVZNf13K1SgVjn02APFyt92my8mINvSBp0qrTt0GGC1cTlsqkrcpP5wCuKBO9XIQnthlfblkfRx1IBPJCE3soTvg23upHyqalkig8XLYSZMmymLE0VB5rCc33yRIi8QwKnpAjOgPe+cayjJm4x/WMbvNPi+zVCp/29Z5/XCa4IDYVJ7UzSPO0gdq8iIrV1ODEgmtFaaJaZZIDdlVJGujuhM/Sy/1OLOf9sY/yh0jUYOUxWdxUhJEvOzsQBs5nW9kFs/Iu+w1bI4930PiVSMLCHQl330VJk02b9sVjeLGVVCXsXx/vEDuzavJuIPIhIGCe/1shWTMv+Tl6+UsJ1/GsVI9XuFGGWpJDghg9+3M4u2AnEJF2rFSz1IwJy8KEcJSVetSkZ+qlYr2MJlvVJDGflZEgOhvJ56p/16fHOATApi2trxZlUEN5YoJce7MwJLXIZsDZbkmJOEEhL15SbG+T1PaAr1bHvpiX208lHdnGWoQfVSFjkm4cckCQ3oqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(54906003)(956004)(44832011)(31686004)(52116002)(6916009)(66556008)(6512007)(6486002)(2616005)(36756003)(53546011)(8676002)(8936002)(26005)(2906002)(478600001)(66946007)(83380400001)(186003)(6506007)(16526019)(5660300002)(316002)(66476007)(86362001)(4744005)(31696002)(6666004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWtpVERwOVlmbjBPQ0RnWFlpVlhua2kyUG10YVducURzNVlTVndxUEllY3Rm?=
 =?utf-8?B?Q1ByRjFQbExxY2lrdXdBdkZWTXI1dUxkQ2NldENYL01PelFHTXZRTGFaL2FY?=
 =?utf-8?B?TytCY0ZLSVZkQkxRUDBKcXlsTi8rQi9YRS95YjdQZWtkMkx1ejNJbWVkMHNH?=
 =?utf-8?B?WXVZY2YzazVidlFLamoxQkdsWUZSQW56UlJ0NFA5UDdRK21PU1NKNFpCcjd3?=
 =?utf-8?B?TTBGOEp2dkZ5KzcrVUl1dGV0bFdhOG5NSGFaeEVOdnRlQllpVjNKYzhDOUQ1?=
 =?utf-8?B?RExYWGQvTC8yelFmZU5YMkVaVFI0OVoxUXgvaDZHMzVEanlFays1VlJwU3Fo?=
 =?utf-8?B?MzgzRCtET2JSWWowbEF4V3hiSGVPaUtmSjU4SytQUkN3a3VSU3crVDJMOHY5?=
 =?utf-8?B?ZTlRd2l6SlFIMjJ6WXZHN3dFajhnQWMvc2tSQnRhSXNPMWdNWjl0bmxJT2tU?=
 =?utf-8?B?U3JYMUNhbmh2TWdiNC93WkVhR1IrWjBaQk4rZFRUbEM4L0VlRE4rMUNUQnFE?=
 =?utf-8?B?d2k2LzhXNDl6Rkl6MjQ4c1ZWWFNQVG51US9LOEgreGZzNnd1eHIzbW41Z2Rt?=
 =?utf-8?B?TndjY0dPQ1JFTTVCb3kyM1RTMnNXM01zVUdNUXFtRTJCd1VqTFUyMkhqQjBC?=
 =?utf-8?B?WHZPekU5MUFKRVRMVFIvOHFnUUFYYjlLN0d5SFpqWWs2MlZQSWl0dVpraGNG?=
 =?utf-8?B?TngxVCsvZU13M2xLMDI0S2pqaDFWZ0Z5SlJpOXp0NWNPeWsxUWdrYTk3MkU5?=
 =?utf-8?B?QTZQY0dOVHpZY3Y4ZUhCWWEvYTI4TGxWYllqTW80MFNSdVcxeURaRnZ3U08r?=
 =?utf-8?B?VjFtUjU2b29ad2x1WW5WU3ZUUmY3clFhMkduOWZPNWJ1dnNXZkF2R3AzVTBW?=
 =?utf-8?B?NDNQcWZEU21IaTlLY3pnZzg5Q1Q4d2NLOWxKWm1qZFlZUEpQUGk2L25GcEtr?=
 =?utf-8?B?bnBxOUVsUk5Gcno2bTJ2bEFFbXFSOTI0ZGN1VEZlS0VmcDkyTnpQQzZOek90?=
 =?utf-8?B?WjY4dkFnWElLRnhRNHNhQ3E1VlNvUU5PVncwWFhaaDBDR0ZaNi9MSnRac1Jo?=
 =?utf-8?B?VW9JajFXbWlsYnptaGpmUXpEc3NOM2QyT2poK1hNNDRtaEV5bzYvdEEwTmVE?=
 =?utf-8?B?OWpMdW1wNXhBYTJMU0k0V3lKWHNMRnlIMzh6Yk1xcTVJWW04aDVGZGVieVk5?=
 =?utf-8?B?eFliRTYwNGlOZi8wdElZYzYveGFBSkhRUE04T0lBVERSdlJmc2RiOTNuN21B?=
 =?utf-8?B?QVJMV0MrOTFmSkF2K0JrU0RuVmlsT0VmZnpvbmgydFVSd0p6M3orT3o5c0FW?=
 =?utf-8?B?VWhaNk9QR1ViM2VmWjFyRUR5akxzRFpZV3dCeHVTU0NjRjVMb0o5dVIyN3ds?=
 =?utf-8?B?OVNiSTlkS1J0Zlk3L01BUGwyWVYzMy9jZWJpWDUyblErMnJLQ1JFYldnQzlS?=
 =?utf-8?Q?JHu76x/C?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30c2b68-4205-4b38-fb78-08d8c38614f9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 12:13:12.2793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfaHKQ4JrLWpZ6G5Y8/94DJcYE4bfr6+Mj2suhUOiNopGM/ro89P69s8QT0NTkbFNVU4wwJtW1n36cc56LIQLpE2Pyga0BwtwESybH9sTCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB3875
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On 28/01/2021 12:35, Peter Zijlstra wrote:
>> My point was that original MIPS spinlocks had this write-buffer-flush and
>> it got lost on the conversion to qspinlocks. The referenced commit just
>> allows to see the last MIPS-specific implementation before deletion.
> Hardware that needs a store-buffer flush after release is highly suspect
> and needs big and explicit comments. Not vague hints.

I have a feeling that you are not going to suggest the comments for the code
and one has to guess what is it you have in mind?

Do you think the proper approach would be to undelete MIPS spinlocks and
make these broken qspinlocks a configurable option for MIPS? I don't even
mind if they will be default option for those not interested in performance
or latency.

-- 
Best regards,
Alexander Sverdlin.
