Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F141F32BD8A
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233700AbhCCQNH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:13:07 -0500
Received: from mail-eopbgr1310114.outbound.protection.outlook.com ([40.107.131.114]:6381
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235101AbhCCDUz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Mar 2021 22:20:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4surpfKsZleTBlyYsG4cABD7OqQzcBAaS+q0hAFQ4z68Fpg6wPU9VbDm1VA7mw+XtT9LfscpBuKS7pjnfPY5gkTC3egZhnoLleQGUsPMRd3t3uGtyugkzoJ8/gcXbhx+OvDiAZgB2rpQLa0enJQI3QBdkJOz+V1XFdLIvAghbZhsI03UB1OSCRqKSR+qxbyOq/8FvRprvV7rJ0vl3oXBtQfyHdGXgPZd6NI4gQWCjg28/h5nv08EYKvVPJiIJGH8h9B4FAjNJUUEHDzjG5wDjecEP7rQpkD9tKSzI/4pjIhLL1120vVizLGomatbtm0/G3cuNltvvGTKCVP97IElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTjM8Y0IauSPDdKUjFENP3y7DdhnAS0gpZJ6TOXWDwk=;
 b=i+x2gh22bHRrvicsS8kJvkpo9Hmka5t9et2qkV4/hdscTZ7jKoxy19bJPT2s4sTjsxQP0V5Tr1/tqmPT/CN8NcGCe+cl/5Ryk9DK4V0pC638LBJRhDMm0wQvhhB0loYTeiTFjOguxUk6+oG2DFn2pKNEJrf4bJUgvO8I688iClrQbVB0nyff86R+jMsQlklNU/DdMMBUCh2kHVMsXFgW6W8+CESS6v/wrA9gEoJ7RuGe2cymH0q0V/AkIRf1s/9VscQvVJBJHm+Z6GXJbJAbGAyoddChuim8cAyySn5mN7yAk69c5xX/rjSjCvGb03JYCt4RioDpzPSQPD0bh3nVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cipunited.com; dmarc=pass action=none
 header.from=cipunited.com; dkim=pass header.d=cipunited.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cipunited.onmicrosoft.com; s=selector1-cipunited-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTjM8Y0IauSPDdKUjFENP3y7DdhnAS0gpZJ6TOXWDwk=;
 b=v55R+tTbhPjhPL1dSaLTafZgQF2iptb3blUR2Z9/OvhoJdsWKzl9giaxdNpHiOxzvwvMLbtgqOnCk6Iz91hRpSwpIOWw/7EmsMv/PAxpjs9b3mbYeQxz++dP1gWBCAUREX5cRhfkNn2L6om+oQEo80agk1om9xeWC8ARgKLOLIg=
Authentication-Results: flygoat.com; dkim=none (message not signed)
 header.d=none;flygoat.com; dmarc=none action=none header.from=cipunited.com;
Received: from HKAPR04MB3956.apcprd04.prod.outlook.com (2603:1096:203:d5::13)
 by HK0PR04MB2388.apcprd04.prod.outlook.com (2603:1096:203:44::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 03:17:45 +0000
Received: from HKAPR04MB3956.apcprd04.prod.outlook.com
 ([fe80::b5d5:d70f:ed37:984c]) by HKAPR04MB3956.apcprd04.prod.outlook.com
 ([fe80::b5d5:d70f:ed37:984c%6]) with mapi id 15.20.3890.030; Wed, 3 Mar 2021
 03:17:45 +0000
From:   <yunqiang.su@cipunited.com>
To:     "'Maciej W. Rozycki'" <macro@orcam.me.uk>
Cc:     "'Thomas Bogendoerfer'" <tsbogend@alpha.franken.de>,
        <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>
References: <20210302022907.1835-1-yunqiang.su@cipunited.com> <alpine.DEB.2.21.2103021645120.19637@angie.orcam.me.uk> <000701d70fd0$ecbb21a0$c63164e0$@cipunited.com> <alpine.DEB.2.21.2103030321240.19637@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2103030321240.19637@angie.orcam.me.uk>
Subject: =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIIHY2XSBNSVBTOiBmb3JjZSB1c2UgRg==?=
        =?gb2312?B?Uj0wIGZvciBGUFhYIGJpbmFyeQ==?=
Date:   Wed, 3 Mar 2021 11:17:43 +0800
Message-ID: <000b01d70fdb$c7b74450$5725ccf0$@cipunited.com>
Content-Type: text/plain;
        charset="gb2312"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFc3TirHHapM3NboiGq8Vd1cyrtKAJU+sYAAgKDhOQCAEvdqKszOkrw
Content-Language: zh-cn
X-Originating-IP: [103.125.232.133]
X-ClientProxiedBy: HKAPR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:203:c9::10) To HKAPR04MB3956.apcprd04.prod.outlook.com
 (2603:1096:203:d5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from PCYSU01 (103.125.232.133) by HKAPR03CA0023.apcprd03.prod.outlook.com (2603:1096:203:c9::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Wed, 3 Mar 2021 03:17:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1d04409-f5b2-4146-0527-08d8ddf2ea2d
X-MS-TrafficTypeDiagnostic: HK0PR04MB2388:
X-Microsoft-Antispam-PRVS: <HK0PR04MB2388D8C804CA71A1DBEEE531F2989@HK0PR04MB2388.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K9w9zOdO/boGVJBUrI1PSxbbR70Vct6ypG0jIgKeQEXzuSermGpHvS26y7BeVlRyuDa03/+NCQ51hJiIK13acky5GPIRenoB4VknJEjl9cGohAOV6XjVxaE2ZTlhALisVTNDCWbf9aPSnLawmr2wFa841IU75EpVkA+ENpqcCU7E3YBitdUa6gWD58FY7uzmP0p48KgmbnnF1NSJNOMZH6xLM5aPaDhuR9VAHfPcbSiyQ1rHpyhpNmJ+N2FO+P8cKkJdZ8G62EzVuhzfznNo05PPHGBCU75DAuTb5W61j87q0gLoNPq4B6kMX+khoBtrC7kwC5EHHjNYzbtrz19KM9LTBI/G17Sf16yUv/HU7LAq4AGhMOOCv0AHMijkQ/OuomGUyPEZ5VqFv3fv5GCfBARwwiDsAK9cUrBjlhpslWmYOgt/4EFu03xz0dZ5TnzSfU8TwHUt7Cw+0pLfpheunc/NUvsnLRbJ8KTqwjJo3Y8ziWDTR2mTJj5rM/fQPeMdZfHC5bLhv0ECOm2iSL1sIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HKAPR04MB3956.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39830400003)(396003)(366004)(346002)(376002)(6496006)(6486002)(5660300002)(2876002)(478600001)(83380400001)(86362001)(52116002)(2906002)(16526019)(4326008)(66946007)(36756003)(1420700001)(316002)(2616005)(956004)(224303003)(44736005)(26005)(8936002)(6916009)(54906003)(186003)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?gb2312?B?QVJkWVQ2VW5CVGpTUlNvNThPVHVtNmx4NDlGeDA1ck51SUV0cTRJWTNTTTV1?=
 =?gb2312?B?ZzlGTE5HK0kxZm5IemJCc3gwaUZvbTRISEp2WmdjM1hTcEg2QVdNWThPcnpY?=
 =?gb2312?B?QXpJOUhScTBwRTFGaU5BZnp2bkZVUitRMHI5aUJsZFROaWtYdmFKRjU0ZkU1?=
 =?gb2312?B?OCt5RStaWVRqTm9nb2xEdW9IZ1NkSEl4eDFCZHErZ1J3YlZsTnRnMkV4MmJH?=
 =?gb2312?B?b0hMTkFLeGZPa2g4Q3N1OHRkSDl1d0J2d0xpQnhWUHFjWkh3b0FPdjlVdmI2?=
 =?gb2312?B?bHdzUHoyeGZSTncxditCR2NkS0hUL1VQOXYxVkRYT1BnbFpMRmZKWS90ai9j?=
 =?gb2312?B?SmdQcGdheTA4REo3VVVKVG02Q2t2K3Y5Q3cyeUlIR2daZ0VBdlFqRFprekEy?=
 =?gb2312?B?ZUNpKy9PQXdGSlNEdXRMMHR3cWttWGtQSWlEbzRRcms1WFVvU0xhYm1xcFkr?=
 =?gb2312?B?cEpBaS8vM2FwY1Nvb2JGVkJOK2VvZU1WU29sRWtFV0NrQTNlbXR1VzNWT05G?=
 =?gb2312?B?WVB0bjF3VGlia1dBYTVMTXdvMVlhaXJ6Qk1EM2IrUEYvbi9vZFM4Mnp5YkZh?=
 =?gb2312?B?TWxYSS94R3pYK0lmQXdwSG9LYVFwVDRMVDZTSGpVUHBxdFo0ZjhhL1F0RzY2?=
 =?gb2312?B?UXljUDF3a2xWTXE1bXdXKzQxRFB1R0hlYkZRWHlmbjhGRkZJU0tLM1JOd1BO?=
 =?gb2312?B?OG4xT2xiZHVFY1NmNFp0Y09BT0lwRy94QTI2MGFhUWhSQzMxWkVqRTZqblpF?=
 =?gb2312?B?S2wvcy9iZG9WcFh0RDZpZ0VlSFdIQ3JQL3VjWTczWktJS0lOUVdhZ2J1a2R2?=
 =?gb2312?B?U1VSb3FFbEFBZTBvbHU3UzBycThBT0VtOGF3bGZDQVRFdWVYcjNTYWtKeFRN?=
 =?gb2312?B?R3BzbjBmbmlOdzlrYVFOVS9tTk1YdytqZGROeW01a1FWaU8wcEJjcmtCb2JF?=
 =?gb2312?B?NnE1eSs1Y1V4dUxBQnZxUit3Wi9UTTdxTjdnNW1lZDlEZFlpWG5FQzVlYXMr?=
 =?gb2312?B?OHVRVmFjVU9DSkJIZlMxQ1VEU2U3S2tCZ2RsSFpGY2liVFpMdDNaaEhUdVpM?=
 =?gb2312?B?RmMzaDJQS1UwOUtqWlZoSU9MdDU1SUpHeGYyVGVwZzVycTFtem1NMGJlZURG?=
 =?gb2312?B?eE03MHYzY3U1K1lybENWZTBaVjhKRjVMR2svMDNkYzZCcEFFUWdjQlA0MjB5?=
 =?gb2312?B?aWFUV2wxb3RLRXZRaHlVclZPc2x0cjhzdEZYQ3kvZktQM01zajVacVA0QUJO?=
 =?gb2312?B?SFh4RTNCUmhWbE5halZzb1grVkdub05BS2phbWxFaXFWbU1URlNvWEhoc0pE?=
 =?gb2312?B?K0Y0VTZhZTZTa1hJaEs4aHpwN0ZVZFZwbTNuc2hqc2d3eUhZb2x3WUtFSjVv?=
 =?gb2312?B?UGM4UzRnWTNVdDR1Vms1V1ZJQ2lPUStlTCt6WkEzazlGajM4VGMxVEtJU2Jz?=
 =?gb2312?B?aHBlT2NJSlFsM1I0VUt0N3E3UlB3Vjk1TG94dTJuZ2JrTlBuTElrL0ZkUS9E?=
 =?gb2312?B?UnBwZUR1RVNnc3hiS2hYNWFBSzhubnhzQlVnUk16SzM5aEpjb0lBM0R3Wm1E?=
 =?gb2312?B?WTFyQWd4VlJlZnA5YVgyelZUcEFodGdLdVBSWHp0eE0zRGdtM0ZyUnVLd0wz?=
 =?gb2312?B?WXp2SjE3K2NtN0hlangzZ3lQc1JHY1c5ZGN6VWNOTy9QWldZVnRJQThzZHlG?=
 =?gb2312?B?eEFBMmFSZUtLSkoxaGo3cUlrcGk0TDgyM2lzR1J4M1lzTHFweUl5MXNLSDk3?=
 =?gb2312?Q?cjgvIQJT+Y8CysJ1pVz0DNUuwNlsRYCqgR3ijRz?=
X-OriginatorOrg: cipunited.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d04409-f5b2-4146-0527-08d8ddf2ea2d
X-MS-Exchange-CrossTenant-AuthSource: HKAPR04MB3956.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 03:17:45.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e31cf5b5-ee69-4d5f-9c69-edeeda2458c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjqYdwPjnzeVf2nK0d4pKJsX0cSHvY4cgq3hAVe8r/Sz5XPSClXEEBNi0Y4j6IZ5tKe9HaDBxS74Tsusiy1/5k/0g/UOe7VAvlR7oYRAlVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2388
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> On Wed, 3 Mar 2021, yunqiang.su@cipunited.com wrote:
> 
> > > > v5->v6:
> > > > 	Rollback to V3, aka remove config option.
> > >
> > >  You can't reuse v3 as it stands because it breaks R6 as we
> > > previously discussed.  You need to tell R6 and earlier ISAs apart
> > > and set the FR bit accordingly.
> > >
> >
> > It won't break r6, as all of r6 binary is FP64, and on r6
> >    `frdefault' is always false, and `fr1' is always true.
> > It won't trigger this mode switch.
> >
> > Oh, you are right, there may be a case that to run legacy app on r6 CPU.
> > For this case, on r6, we need to set the CPU to FRE mode.
> 
>  The FRE mode causes a severe performance regression for single FP
> operations, so we shouldn't use it for FPXX software.
> 

If we need to run pre-R6 FPXX/FP32 app on r6 CPU, it may be the only choice
for us.
Any way, in this case we need lots of T&E, the problem of FRE won't be a big
problem.

>  As a matter of interest: do you have figures available as to how many
> software packages are affected in Debian?
> 

Almost all packages built with Golang in buster.

>  Also it has now struck me that another userland workaround should be
> possible, by setting LD_PRELOAD in the environment system-wide to a
> dummy FR=0 DSO (e.g. via /etc/environment or /etc/initscript; I reckon
> systemd has its own way too), which will force the right mode the normal
way.
> All the distribution has been built for FPXX I presume, right?
> 

It is not acceptable for "stable" branch of distributions.
For developing branch, we have fixed this problem on Golang itself.

>  You can distribute a package with the dummy along with the environment
> entry to all the people who require it.  I fail to see how it could be
more
> problematic than getting a questionable hack included in the kernel
forever
> and then requiring everyone to upgrade the relevant packages anyway, which
> you will have to supply for stable releases too.
> 

So, I'd prefer to introduce a new CONFIG option.

>  Or I guess you could just rebuild libc as FR=0 instead, or is there a
Golang
> standard library that every Golang program uses?  And then have people
> upgrade that package instead.
> 

Rebuiding libc to FP32 is not acceptable, since we want to do is to support
MSA,
Which require FR=1 and all the result is FP64.

In fact we found this problem when we try to enable MIPS_O32_FP64_SUPPORT,
Without this option is enabled, all FPXX binaries are still use FR=0 mode:
See: function mips_set_personality_fp()

So, here, we doesn't introduce the rollback to FR=0.

>  It seems to me like there are still a couple of alternatives available.
> You might be able to come up with yet more if you continued looking for
them.
> I consider putting any workaround into the kernel the last resort really.
The
> problem is in the userland, so let's try hard to deal with it there.
> 

Yes. It is problem of userland, while it has no way to fix in for the
pre-exist binaries in userland.

>   Maciej

