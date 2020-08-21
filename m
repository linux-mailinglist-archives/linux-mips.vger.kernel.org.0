Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F8224D0B6
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 10:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgHUIqu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 04:46:50 -0400
Received: from mail-mw2nam10on2052.outbound.protection.outlook.com ([40.107.94.52]:25152
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727008AbgHUIqt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 04:46:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kefBkRWNfKeNgghAM2IZFiCbAXNWaADFM4lRTxjfjMSl096Q9qeQbuiGGdzNhKgCjN42T9Vh3MuUE3HCjh48v19Hv2t+J6kKUcQsI+QhgdTdrJx/2rM1kJ8sV1QDaBfY1ZsGNAY01y6fMBPUQgtQ1MnczRJPtJ9Aw8lVHwJjSme4Hv8yuOaLEACONGNq7b/nvs88GIlZo3hj4tf6EZJsxHLLpwC+B8/w0KJTeZ7i+YSfUoiLW0TlUDasiMSlOaIwMWgslOg93xSC35ExC8pmFDyP65KvKA/h08OkYvW113+21gWO1qtBh+U0mrL9JH7JJOFeVoIKJP+XTslafP76bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mdL0QKGf1VMaxE+yFFiPcOi2C+u5aL005WruikGTZs=;
 b=TvuMQYLTHZfnC87ahfV9OZ2kpEtKQJ0qy0bkrmTg+A+z39pava+EWVOsYa6yJUerzITH5Qy80zfOpD4CGaPsPG5ZDv4Z2LctUJven127035C8AelSx0ChUeHphHg8HAJ+rw8ujx/X5TG4YsJYxmTOfzC+U66owhAvFyChPP7qk7T1S24oHMhotlnwnLoNakWJvTOnni7U1CZil9ujTEnLylTItl/PWEXjTSIj5f7+RlzTVRifcSWloe/YZ03Pj2ONFplp3vzm/cMEWWKJD8zkfxLwSVWls0r0YxRGjWLxJzB48/7d9W+blFrMcSMg6B8fuIVSz/tw2bnYaE6hz4yYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mdL0QKGf1VMaxE+yFFiPcOi2C+u5aL005WruikGTZs=;
 b=e/tTvIsWDbK+l603Nqljm2zQayPC+Qo2l669nrkzSymAKA2qW5Slbea76u6ZvkVT714+K6kn4Bepj/zSjBHZGXDBIipqdtK+tImeyYXIXSj9IBkjc9Uy6N5Jm1pkDKairICnh5Ym3JMxKkq2TRaiLCFBpw1i9tJJA9menph6qYo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 08:46:46 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::4497:4639:274:54d6]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::4497:4639:274:54d6%6]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 08:46:46 +0000
Subject: Re: [PATCH] mips/oprofile: Fix fallthrough placement
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     rric@kernel.org, oprofile-list@lists.sf.net,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200820125440.350184-1-zhe.he@windriver.com>
 <20200821074821.GD8336@alpha.franken.de>
From:   He Zhe <zhe.he@windriver.com>
Message-ID: <5e86b824-4c92-3cfe-fc36-493425e85f2a@windriver.com>
Date:   Fri, 21 Aug 2020 16:46:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200821074821.GD8336@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by BYAPR08CA0053.namprd08.prod.outlook.com (2603:10b6:a03:117::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Fri, 21 Aug 2020 08:46:43 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2101f93d-d5c1-442c-98b9-08d845aebc33
X-MS-TrafficTypeDiagnostic: SA0PR11MB4637:
X-Microsoft-Antispam-PRVS: <SA0PR11MB4637CB95445D9B262D89388F8F5B0@SA0PR11MB4637.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m7HQOBQyScLygMHiJiB+FNW3l5N4JnJE9pjmQDjOAkmDvEi5D40TM5GHxayKcoJ4DR0xbLm+UvKSVSlJ30qtqg6ANMeaPY6hhAuTYWzpJPwSX6dnPmWEY6tA4FuYCz2o5ljFQvaanXQbLOZOcWX51Gw1dp+4LtCOPMdgRi/nwSSOT8vE7d2FW9Teyz+bZ68poEKeVyg5M3N9lhyJ8YhYcv3XkAKrUMDlN8x4LlIdMO9zj3OMhM9XUSw/10DoI4aZs8CPLcz1nU5XMjVLsQdElh5288qowM0xpkh4eXOF5c0lIdpWshxOZ2wy1AgCnpqFdkpmD/uzb6qnlhvOr7Dh3S9GX/0z0auE5uXG0EsHEXTr6Y5/qWnQRalbgJO7eelzhqUhHUrejC8bz4/3IuhAY2STkLIe3iQV6bsGEBfTWBd08RkpUZDp4hDYPAYQaMr9vKCx2RWCnXETBqCaE8mznFXhOoqUKLE59Ws92BbA9Zo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(346002)(376002)(4326008)(31686004)(6486002)(8676002)(16576012)(186003)(2616005)(956004)(316002)(6666004)(8936002)(52116002)(110011004)(2906002)(83380400001)(66476007)(6916009)(53546011)(66946007)(5660300002)(66556008)(86362001)(966005)(36756003)(478600001)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 4j+G2VRhl7QB4uZhuvM7oWx2bPcq14tLuuNTaO/yjdWs6EktAjLBqMjl88AYJCj5bNL+mKEYl1HV8JFg6zWI7QhPtRW070hp+b1w9/GtoKeEIRMSKqFW392TNHkLe3MyZO4LZg8kshkF0wxVXMLJNNw0jq/dq8HWUVOYP4kJG7FenXZRWZjjq5i91WFFR1PWBNNre0/fkveE3rwOVh7oS7kP8fNz42xr5xbUCrDeHZF8O6Uhvdy6bhvqMfrhidn0BXJ1NQ2MD6YAJY1kGlsF5TEyfDFzYy3mOdWkAi3gwzSB8B3Di9NW8W4de9hGFbcJNf35di+tmqIo7Owe8UgDSbJCMWSMEtRHFy9s6A5+AF38ajwc07J6jPDuqduYV7Qk7SaAEDFowSuXIzFgdIPj5xNFBR3U1uXYGKfQY+pUKwf23HnvkXX8/Ot+3h8p7qY9+qNtBCaPPa3w/w+t3LrG52LM4fT4Gc5XG24lDhw4ST+fzRlhUJVpxO3IqODY6FYyjFhdppNJFoM+oSkd4/A0BiQCFjC1v+im1dcy37QtCAZp1cZy3bOfXAeC9oSug/srZGqpATa1pUotGYI4j2IVF+EMx3CEDjk8rXzY54KsOXsd0eMPT4LQSx2girce9YZ6ujr50FXtl92OBn9B6Iiy1Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2101f93d-d5c1-442c-98b9-08d845aebc33
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 08:46:46.3135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4L6yCCAbRhmfD44OtLC9+Sm/NdC7A4lgIhHhZYccjF+QoyhDW4jzgoVzR+xkj2/Ttviubfci2GVqjh7iVsNTHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/21/20 3:48 PM, Thomas Bogendoerfer wrote:
> On Thu, Aug 20, 2020 at 08:54:40PM +0800, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> We want neither
>> "
>> include/linux/compiler_attributes.h:201:41: warning: statement will never
>> be executed [-Wswitch-unreachable]
>>   201 | # define fallthrough __attribute__((__fallthrough__))
>>       |                      ^~~~~~~~~~~~~
>> "
>> nor
>> "
>> include/linux/compiler_attributes.h:201:41: warning: attribute
>> 'fallthrough' not preceding a case label or default label
>>   201 | # define fallthrough __attribute__((__fallthrough__))
>>       |                      ^~~~~~~~~~~~~
>> "
>>
>> It's not worth adding one more macro. Let's simply place the fallthrough
>> in between the expansions.
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
> there is already another patch for the problem, which I've applied
> to mips-fixes.

You mean the below one?
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?h=mips-fixes&id=5900acb374fe2f4f42bbcb2c84db64f582d917a1

That patch handles the first warning in my commit log but does not handle the
second one which is introduced since gcc v10.1.0 commit 6c80b1b56dec
("Make more bad uses of fallthrough attribute into pedwarns.").

Zhe

>
> Thomas.
>

