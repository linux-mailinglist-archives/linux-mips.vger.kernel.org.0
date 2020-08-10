Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456F9240540
	for <lists+linux-mips@lfdr.de>; Mon, 10 Aug 2020 13:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHJLWz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Aug 2020 07:22:55 -0400
Received: from mail-bn7nam10on2086.outbound.protection.outlook.com ([40.107.92.86]:51392
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726465AbgHJLW0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 10 Aug 2020 07:22:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhgTScM076jku0sO0EzEX5L/dq0mZH5duJUfUzZxlFW3OB0/2yKSAUjUi7j5674CMatjY5+7M/ow3NuRmx4CJdAnKJj2NbpyLPdj9t/ImgJtQY0ZihtPyR5JqgcU952FH1M3mQCEVyjtwL79UYbwsoFMmigEnoox+DN3j1wssUcAQUh/XiCX8hsm1YbXnxMrUsPN9lk/UbgjD32Qr3j1IgQJ106wo5tmcveJiwRRI4QfeU+b3gFDTsH496gbZm71UC2asQmW8YPa/A3a3E3d3BHsZtln9FmlUlTUpW3QZb1TGbk/+aDh8TyA56KgC4UqmPPMpNO1m0o4eGsG+X0oEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH99FXvOEdguG1pl4o758GWR3unS+XFzLzM5m92rmPs=;
 b=KS+Kk3WWBeahVXc5FqvsMH+BOb62SfTazwW986UhR4+wf+QCdN7hePy2Lrjfam+vneEc2+/P1i513tB/Y6YMwz5qiOPQL+slKy/2sonWSgQsBapT3quwOhvsan/SEKQwSdh83zWQWDSPiNxfj86WJBJs4AeZQJlaalbj9t2XVPDE58qqtx0IVgel+Sr3/M2P2rpzMGSgj1GbQG0W5B1IDUFkl34YeBMvkw1uiuQVKG0l66OxYzprlPfkt215rBbxOndklaqUQP8gHvCrIeFeVeZ3+7dN5O/SQ3QanYcAKm22W52jpD2w4Jq8nLW2VVX76haiD0m7MfALdBV4T9t5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH99FXvOEdguG1pl4o758GWR3unS+XFzLzM5m92rmPs=;
 b=yo9FZr51DJPEtxSnGKUsOoE/j/vmL10wvGXfwKVn0ngiHp0V1g8cK28qS3OJbB7Rg9/RQL6Xz9oE9oPF7x52aNTcm8bTTvrOtDV5l2LnTmb7QBLUmu0UFeSXEutXTI4M0ruuw6msq9J1EI/WjhZ/CSb8O7OEMyNdyp0/3qYUTMI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 11:22:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 11:22:21 +0000
Subject: Re: [PATCH] gpu/drm: Remove TTM_PL_FLAG_WC of VRAM to fix
 writecombine issue for Loongson64
To:     =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1596871502-3432-1-git-send-email-yangtiezhu@loongson.cn>
 <20200808134147.GA5772@alpha.franken.de>
 <b7b16df1-d661-d59a-005b-da594ce9fc95@flygoat.com>
 <38857c24-25c4-cff3-569e-5bcb773bfae6@amd.com>
 <2f3fd325-8093-98e7-5bc8-75490258baac@daenzer.net>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e0dbe1d3-b4a1-7065-43bf-67fbd052e62b@amd.com>
Date:   Mon, 10 Aug 2020 13:22:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <2f3fd325-8093-98e7-5bc8-75490258baac@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0127.eurprd04.prod.outlook.com
 (2603:10a6:208:55::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR04CA0127.eurprd04.prod.outlook.com (2603:10a6:208:55::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17 via Frontend Transport; Mon, 10 Aug 2020 11:22:20 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d1babdd-293e-4b36-2f7d-08d83d1fa657
X-MS-TrafficTypeDiagnostic: MN2PR12MB4304:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4304225BD70A1AE05CEDFE0F83440@MN2PR12MB4304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NizPEAp2pAtMGBlAIQv+Khk9qdw9DTNW6cNAoMcKcEhuUatUC6cH0TZOqs3PRhvHlb+y7rljUMWM6IbDQ8VirFNb1SCJBwLg0aYHakKSlIqVDvST7Vbfc/5oS5hnM82UDdQvKWNu4jY98f41DP+oglonqXxcUgt6oIhvd5Yi4SJpgY92JKaMaHFKwVSTDyLm5D4nUBv+p8tdINYenWbHSXXZg044J+SR8zL5XFk4VoP+I7GCQzk9wfamjYi1pUvSxZyODxOk0lTNj/Tf777PujA7kXfeGHxdkJRvqimQW91l045i4TFFo8m4TQyrKYqPsCshZVqTCQK6mUHH+GoYCQkcnNlVi6+v94skUaYsi9EQxgKzLTZBg2WEt+34dsj5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(5660300002)(66946007)(478600001)(316002)(6666004)(66574015)(86362001)(83380400001)(31696002)(31686004)(2906002)(8676002)(2616005)(53546011)(66556008)(66476007)(52116002)(36756003)(186003)(16526019)(54906003)(6486002)(4326008)(8936002)(110136005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: si6yk3rWi9zl4LUTWph4v9m3glxdACyWmhX0nvLq+4ah0hbCB/wcJ9vI1XdMA6TpE6U+ilouJmnAh40PJdEQjVnGbkOOwVRQ9741jfP+sUnPZURqa8yrlc3GsgqAld/DPydxZrHpK8kB3WXlR/lTINAhZvy7KYiMhiBuB9E5P633Z5WudgDwq38dWFXiOAWPZDaNwYVw3MOrOxVnWJz8InNRmg+pZEo95gq6nk+zjxx3Hga17ednqV8c2tUoq72ozQsR6NdEPnYXE5FQIgTycqLpPuK23qJONAqjZDlQK6n+V35OZZ90GL+q+UC1DRmX4qAcKffdEnDHxOy+LXBCL2/bDDxJ1D9is9WSaZl5o0oXHbkuE0QuZcF4y6okuHhwY/7ICC+Fyt8Pm3tuT6Nw0HV0QulMv8XnuTZmT/1JPHYuuneT9dwigGyD19d4V3zjN3QIchHCJmk81Bx2nAvIKStZQC9RE4fQeqF60/oYU/TbDFXYlNFblkqK0ml0VgJYNlcJ/cpyf3CBp4YPzdwsf8EDODH1g4nI/+NZgOfzUwNl0+fQRwflnhFXQeYT8G0wA7A8kPZd0/6xpun9idzrYlIkzCs3TI255w06+3087iUTh1T15Q6fgonYUmBiZQjleo1tYgbhkWYlqTdWH/tHRFjcYd0qoZvvS6ZA52ic1XBDuytRXRdfWxFyw81+D4IwQjjuvCFxZUvI4yz7Ho84dQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1babdd-293e-4b36-2f7d-08d83d1fa657
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 11:22:21.9086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ohO9xYwdUa/sTFdZQ9qPknNzrPXvMxsk58uLjA7JxvQg3NExdVRfXV6/F5KGlJ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am 10.08.20 um 12:50 schrieb Michel Dänzer:
> On 2020-08-09 2:13 p.m., Christian König wrote:
>> Am 08.08.20 um 15:50 schrieb Jiaxun Yang:
>>> 在 2020/8/8 下午9:41, Thomas Bogendoerfer 写道:
>>>> On Sat, Aug 08, 2020 at 03:25:02PM +0800, Tiezhu Yang wrote:
>>>>> Loongson processors have a writecombine issue that maybe failed to
>>>>> write back framebuffer used with ATI Radeon or AMD GPU at times,
>>>>> after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
>>>>> mapping for MIPS"), there exists some errors such as blurred screen
>>>>> and lockup, and so on.
>>>>>
>>>>> Remove the flag TTM_PL_FLAG_WC of VRAM to fix writecombine issue for
>>>>> Loongson64 to work well with ATI Radeon or AMD GPU, and it has no any
>>>>> influence on the other platforms.
>>>> well it's not my call to take or reject this patch, but I already
>>>> indicated it might be better to disable writecombine on the CPU
>>>> detection side (or do you have other devices where writecombining
>>>> works ?). Something like below will disbale it for all loongson64 CPUs.
>>>> If you now find out where it works and where it doesn't, you can even
>>>> reduce it to the required minium of affected CPUs.
>>> Hi Tiezhu, Thomas,
>>>
>>> Yes, writecombine works well on LS7A's internal GPU....
>>> And even works well with some AMD GPUs (in my case, RX550).
>> In this case the patch is a clear NAK since you haven't root caused the
>> issue and are just working around it in a very questionable manner.
> To be fair though, amdgpu & radeon are already disabling write-combining
> for system memory pages in 32-bit x86 kernels for similar reasons.

Yeah, well that is USWC for system memory. But this is about WC for the 
VRAM BAR.

When we don't understand or don't correctly implement something on the 
platform for USWC then this is annoying, but not a serious issue.

But when the hardware doesn't correctly implement WC for PCIe BARs, then 
this is a violation of the PCIe spec and a bit more serious issue for 
the whole platform.

We can work around that by disabling WC for PCIe BARs on the whole 
platform, or behind specific bridges or or or, but patching each 
individual driver so that they work is not really the right approach.

Cheers,
Christian.
