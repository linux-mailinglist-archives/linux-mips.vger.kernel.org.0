Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53B832CA7B
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 03:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhCDCaw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 21:30:52 -0500
Received: from mail-eopbgr1310122.outbound.protection.outlook.com ([40.107.131.122]:18048
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231330AbhCDCam (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 21:30:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzqoH8ssFgYzjMJHoc/0dVTqaVjbeo0uz74EdDEbFQEh2UH8KXasI7Ruz0Puk0tK92tjnK/JIuf8jqh4sJ/Rcrdnenw/AhHItWOVagVo0x6WbR7fSrhbUNzbNZL98+rEPQw8kXOwvovzHGaqzR+Wp8zUE/wb6CLQiO28VqsjfyabDOCvbU0YUNrw9qs2oUgMQMQd4DbU3Pyhu1s055Gp1PezTCL/tup+KFDaUOWReqDlN8A2kVA+cWjMU32OcEkG79sOQdZH8AHntW5PtZ1Xz8saNplH5AzpjUZYZcc9vmrJ/yShNbvd3SEwWzuBgZ6RMjGVOXTeChbSipt59b8Sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2yZim/MqmkTkJVEjscl7fDEla6rY01eloqgBXTGBTw=;
 b=T5mIN5M+HWOloE78B3kweJcl4rRNtQOtwOC32PUkIVRLVjl54mJ1Ls/wmCukmaPtK4t/odJg/zAa82Qva5j5Az17NZbvXP82aby7koh80WNLi1CLHipabPfFUDMkjgJFnOOpYxF2Whv2MzdEvu84HsrW4R7co1sUuDWcq6nsUtFA4JmLqrAh4uAIktbXJUZnNPrW8kALPT9Y3AdgoOuhYV3GDgLgxhnW34X/4MlWE2fAxJeLzIUrZa4TVpuprsaJ56m+UXoi1g9Li2yIZi/N3Vamtn+Ca5t1p8qBBLKLAdtspiAcl9RKkcfUg5jxM/ZXMYGEsr6sIBLXfNo6dcW3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cipunited.com; dmarc=pass action=none
 header.from=cipunited.com; dkim=pass header.d=cipunited.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cipunited.onmicrosoft.com; s=selector1-cipunited-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2yZim/MqmkTkJVEjscl7fDEla6rY01eloqgBXTGBTw=;
 b=shliBDSzYXKtqtwCBkMQRyUCJkilf2M8ba6TLL41rwv+XWkx4kGMdsrgsX5Q0X2ul+5ks9D206dOyuED39W72ivWFCSSE5Rjsb8B9Hh8Rfeai6fL5KbxJgRcSppfIdiV5gdSz9hp7mbwcwWwM5xaWfNu+UxFKytsKRJIJ3eQ1yc=
Authentication-Results: flygoat.com; dkim=none (message not signed)
 header.d=none;flygoat.com; dmarc=none action=none header.from=cipunited.com;
Received: from HKAPR04MB3956.apcprd04.prod.outlook.com (2603:1096:203:d5::13)
 by HK0PR04MB3313.apcprd04.prod.outlook.com (2603:1096:203:83::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 02:29:08 +0000
Received: from HKAPR04MB3956.apcprd04.prod.outlook.com
 ([fe80::b5d5:d70f:ed37:984c]) by HKAPR04MB3956.apcprd04.prod.outlook.com
 ([fe80::b5d5:d70f:ed37:984c%6]) with mapi id 15.20.3890.030; Thu, 4 Mar 2021
 02:29:08 +0000
From:   <yunqiang.su@cipunited.com>
To:     "'Maciej W. Rozycki'" <macro@orcam.me.uk>
Cc:     "'Thomas Bogendoerfer'" <tsbogend@alpha.franken.de>,
        <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>
References: <20210302022907.1835-1-yunqiang.su@cipunited.com> <alpine.DEB.2.21.2103021645120.19637@angie.orcam.me.uk> <000701d70fd0$ecbb21a0$c63164e0$@cipunited.com> <alpine.DEB.2.21.2103030321240.19637@angie.orcam.me.uk> <000b01d70fdb$c7b74450$5725ccf0$@cipunited.com> <alpine.DEB.2.21.2103031800130.19637@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2103031800130.19637@angie.orcam.me.uk>
Subject: =?gb2312?B?u9i4tDogu9i4tDogu9i4tDogW1BBVENIIHY2XSBNSVBTOiBmb3JjZQ==?=
        =?gb2312?B?IHVzZSBGUj0wIGZvciBGUFhYIGJpbmFyeQ==?=
Date:   Thu, 4 Mar 2021 10:28:57 +0800
Message-ID: <000e01d7109e$27296360$757c2a20$@cipunited.com>
Content-Type: text/plain;
        charset="gb2312"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFc3TirHHapM3NboiGq8Vd1cyrtKAJU+sYAAgKDhOQCAEvdqAGeMA4IAmiKyy+rFIp1cA==
Content-Language: zh-cn
X-Originating-IP: [103.125.232.133]
X-ClientProxiedBy: HK2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:202:2::15) To HKAPR04MB3956.apcprd04.prod.outlook.com
 (2603:1096:203:d5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from PCYSU01 (103.125.232.133) by HK2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:202:2::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 02:29:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42e6724d-0d27-4ff6-c5a6-08d8deb549a3
X-MS-TrafficTypeDiagnostic: HK0PR04MB3313:
X-Microsoft-Antispam-PRVS: <HK0PR04MB331312F29AB26E7E98EE4B72F2979@HK0PR04MB3313.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3EtcGP0XNY9fspKRa56bwF67h/NrnqbNSup1xjoz2ohH5aJ5UJjtBkBKRpnFY9VKHSnXXFoFkyTF9SSA50Hu3VZsix3FozFpuMn57ihfbZOQ3f5Rzr4BsF7fLoZbbOMbFoIBMyJS+qt/zbjSQITWgRsORHvPcFefD3P5Qywxv6KRVQX4XR5CXggpmhkxgDin+cZlc0v4tijvbd9g5jTYkXuVJJ+HOMWsapP0OLliHqWzWby+rWIWrsAoGWF6hMKZdRPSBem9gDqsXVDVJSbnWV5Voe2kguIWwJBpfe4RAs2XUPETKVk4yBpbmjnhmmTo3PI9gbGJNYtQ3vNmzvMkYjJNlyWdGFcqmJcI9BSQ8n1gklfPB/XLkllNV+ScGtl4UlgBG7zm4xzn31rpMCObY1owDEqcJHkxOR+gauO7KTXjNs36jHko/rZM0cShMfwtI4z0LW/0GW96lWyP/hP4dNY+LekW3ulZDXFVDptVDFuulJPw1k/xFRuHZE5jilzH1PQ9SsapWhByLyJ3IiXCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HKAPR04MB3956.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(346002)(396003)(376002)(136003)(224303003)(316002)(5660300002)(36756003)(6496006)(44736005)(4326008)(478600001)(956004)(6666004)(86362001)(8936002)(52116002)(26005)(1420700001)(2876002)(6916009)(83380400001)(16526019)(66556008)(66476007)(2906002)(186003)(6486002)(2616005)(66946007)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?gb2312?B?dzNPVkc5MzdwVFFBb3ZIeTM0clA1VUY1bStDcmhwUEllM25Kd1QvY1U2WC9k?=
 =?gb2312?B?dmY0a1BkcjhFVDNBcVY0NytCZXpMOTJINzJES3VDTGZuVGQyUU9nVUhiNFVQ?=
 =?gb2312?B?dHoxNHJwdy9Gc3dSUEhKT1N1SytnUTZIaCtXazBaOXZSYTIwOVRXUVBaTXBE?=
 =?gb2312?B?MXVzMWRZSEk2MFViYk1tU05Vd2ZNVy8vakI4MjR3SEltaVpSTnBLZ2lCbVZz?=
 =?gb2312?B?NmlWc2NBaG90WUJwbEZRS1VEN3d0MlBXWmk1cTBQOWhhSXljV1JKMFNNNGhh?=
 =?gb2312?B?TEZUYmlUS0V0eDFZazRWbFR6dm4vWWExZU1PQmVlNHJFTTVXQnVLdFQ1OGxR?=
 =?gb2312?B?ZFFuSzNTY2xwL1VpZlV1azZER0gxRHFvODdRZ1ZVNUp6dWlzZzBGY016bCtC?=
 =?gb2312?B?MWg4SjlwNXpONFdlTy9rcFlBaU9QbjU2ZE81ejYzQlVjYVE5WHVpWUY5L2Ev?=
 =?gb2312?B?cjBDcXZKd1BZWDhhRFdMTUNwOXp1blRLVVJNQVhXRkkrOUNscTJJSjdpcmVs?=
 =?gb2312?B?c3Zoajc4MWcrMExpVUJKb0hKWkIvclRIUWxoSHhtcmh3cWtqWTZNd1hISXFP?=
 =?gb2312?B?VTFXeUowd2d3MzBjMWZrZWxnLzdXQmlmNmFxUlIwcG5wSkF2NjdFOC9jdEV1?=
 =?gb2312?B?QjN3S256dmpYY1FDZVRxUTlHczAweDJtQUZsTGgrNUY0NVFMaEMzQVR1dnVV?=
 =?gb2312?B?YTlmemNsVHlYYlBCc1pMS3FVdjN3eStFMzFvZTBEalJmWU1nQ3hXOFRSbVIz?=
 =?gb2312?B?SlU4bXEvNTJSYkN2UXBLWVVmZS9PK1VJdlU1Q0hyalZwaFpHTzlCaHltS1NF?=
 =?gb2312?B?UkIzR05YclEyT1FOQU5vZ1Nkc05zVndudy9JbDJlZVArTUJJbFVhTTgwc2hi?=
 =?gb2312?B?VVIwZ3RzUlFtL1gyMjNQUFNQSkRVUjhVZ0RiNDJYUnlzSmhpWWtpVVpWelZF?=
 =?gb2312?B?a1dRKzJmVWRDY01hZnBQWWFJVmhZVEs3NlNzS1NxcGtKL3NvQ1hnYjJwdnhm?=
 =?gb2312?B?TjBUYlFML3kxQVhyeE40R1VrS1cxQ2YvQjFGUG9iQkI4Yi9NT2tMd3lwaXlS?=
 =?gb2312?B?cWdHVU5lLzN0Q1BKbUtsZVVqNWsraExHY2NCNFMzWnZrYWlDSTdFNSt2RHBF?=
 =?gb2312?B?T0RaTDdCU1Y1Y0FNaVNWeHpvdUhZdWNyTDBMZTFQUjFXYngxcE5HemRhVWVp?=
 =?gb2312?B?OFZMUWhHRWRrcTh6R2RicXJnb3NDSC9ZRTFvODVGWGFCSzMxVE9IWVVZalVq?=
 =?gb2312?B?VDlUeWk4Y2ljbk1VMG9XbUYzTCtwNmdqUE9uOTRvc2QydjhyQ1VwV09GaXJp?=
 =?gb2312?B?SWhzaVYzR0xGV0dkYTlPbTZpa1VLR1dZcjA0TnpUcWxsTXNQeVhrMG9FeERO?=
 =?gb2312?B?TytUcUFiT1l5M3gxZ3BlQ09JSUIwNFYwK21uR1J4ME1lM0tsc0JGdFRsVVc4?=
 =?gb2312?B?b1lmSmRPbDQvUlRsSFUzRzVMOHV1RllMaVIyWmxXV0c1aDRlQnFNNUtSODJh?=
 =?gb2312?B?Y2J3c3o1SklSaFM3WWJEZ2JZTVFrcHdqRlVzNkI2SkdDcmwwZzZXcnArQ3Bz?=
 =?gb2312?B?bURNdEUzWkJJem52eDRHdFQxWUdQWEg4SnRSd0Y5VEpTbW5pVW9NRW1naklY?=
 =?gb2312?B?MDJPMldsenN2WmxGVG1OTVFWbVVVMDIxNWFSSlZIZTIzR1J6a2RMRnRRdTVD?=
 =?gb2312?B?TVQ4ODZPVHZ3aUxDZVRPT25Ia0l5OUUxYWRxb3BRQXN3eGFYVE94WWJXV1Bp?=
 =?gb2312?Q?NnVahEdyzcxF3bKHEe6oU0UDDOt1gmFHRkhpZIR?=
X-OriginatorOrg: cipunited.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e6724d-0d27-4ff6-c5a6-08d8deb549a3
X-MS-Exchange-CrossTenant-AuthSource: HKAPR04MB3956.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 02:29:08.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e31cf5b5-ee69-4d5f-9c69-edeeda2458c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9zBE+ptwyZAFP/FKPBB8GCDNNI9yhuuuyiC+2jHrdy1tBAhZnmp/rT/J2EOqiEQSSJCQ9i0eAVvrP2lRkdoVpLd11iRwimv9pt8hL5loBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3313
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> On Wed, 3 Mar 2021, yunqiang.su@cipunited.com wrote:
> 
> > >  The FRE mode causes a severe performance regression for single FP
> > > operations, so we shouldn't use it for FPXX software.
> > >
> >
> > If we need to run pre-R6 FPXX/FP32 app on r6 CPU, it may be the only
> > choice for us.
> 
>  Nope, FPXX doesn't require FRE, and FPXX is all this change is about.
> 
> > Any way, in this case we need lots of T&E, the problem of FRE won't be
> > a big problem.
> 
>  The R6 instruction set has been designed such as to minimise traps and
> emulations, so there is no point to make it worse for everyone for the
sake of
> a broken corner case.
> 
> > >  As a matter of interest: do you have figures available as to how
> > > many software packages are affected in Debian?
> > >
> >
> > Almost all packages built with Golang in buster.
> 
>  How many is that though?  Two?  Ten?  A thousand?

syq@m530-2:~$ cat
/var/lib/apt/lists/mirrors.aliyun.com_debian_dists_sid_main_source_Sources |
grep 'Build-Depends' | grep golang | wc
   2039   21384  344099

> 
> > >  Also it has now struck me that another userland workaround should
> > > be possible, by setting LD_PRELOAD in the environment system-wide to
> > > a dummy FR=0 DSO (e.g. via /etc/environment or /etc/initscript; I
> > > reckon systemd has its own way too), which will force the right mode
> > > the normal
> > way.
> > > All the distribution has been built for FPXX I presume, right?
> > >
> >
> > It is not acceptable for "stable" branch of distributions.
> 
>  I'd say the chosen policy of any distribution is said distribution's
problem, not
> the upstream kernel's.  You can have a local patch for the kernel too if
you
> consider a kernel solution the only one that works for you.  From the
> discussion so far it looks to me like the least involving solution which
will
> make everyone happy.
> 

It is not only about one distribution, instead of all distribution, since
this is caused by the bug of Golang distribution.

> > >  Or I guess you could just rebuild libc as FR=0 instead, or is there
> > > a
> > Golang
> > > standard library that every Golang program uses?  And then have
> > > people upgrade that package instead.
> > >
> >
> > Rebuiding libc to FP32 is not acceptable, since we want to do is to
> > support MSA, Which require FR=1 and all the result is FP64.
> 
>  Do you have any software build for MSA with your distribution already, or
do
> you just plan it?  How is it expected work with non-MSA hardware, which I
> believe is still predominant?
> 

I am just plan it for Debian. While currently there do be some downstream
user of
mipsel/Debian are using MSA on it.

>  Also I'll repeat myself: is there a Golang standard library that every
Golang
> program uses?
> 

Yes. It even effect /usr/bin/go itself, and all of binaries its generate may
be effected.

> > In fact we found this problem when we try to enable
> > MIPS_O32_FP64_SUPPORT, Without this option is enabled, all FPXX binaries
> are still use FR=0 mode:
> > See: function mips_set_personality_fp()
> >
> > So, here, we doesn't introduce the rollback to FR=0.
> 
>  So keep MIPS_O32_FP64_SUPPORT disabled then until the environment has
> been fixed?
> 

That is really a solution, while we still need a solution to compatible with
the pre-exists binaries. 

> > >  It seems to me like there are still a couple of alternatives
available.
> > > You might be able to come up with yet more if you continued looking
> > > for
> > them.
> > > I consider putting any workaround into the kernel the last resort
really.
> > The
> > > problem is in the userland, so let's try hard to deal with it there.
> > >
> >
> > Yes. It is problem of userland, while it has no way to fix in for the
> > pre-exist binaries in userland.
> 
>  I gave you examples.  It appears the problem instead is with the
> distribution's policy, and the kernel is not there to work it around,
sorry.
> 

It effects all distributions not only one.
I am not want to change the default behavior of upstream kernel, that's why
I prefer to introduce a new config option.

>   Maciej

