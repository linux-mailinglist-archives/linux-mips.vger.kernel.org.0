Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0452123FE29
	for <lists+linux-mips@lfdr.de>; Sun,  9 Aug 2020 14:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgHIMNb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Aug 2020 08:13:31 -0400
Received: from mail-co1nam11on2069.outbound.protection.outlook.com ([40.107.220.69]:16128
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbgHIMN2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 9 Aug 2020 08:13:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRXFOOL9dQviBmuhHHmEzJGqIxYVjRbTYQhQT0dpg+Qy2ZDKDnm3odXtJnvEvnwsrAVJ07aDICGYYgvDjTlvV6+WVHJU20YxbLfbcnzQI5VVLKcAm5nezq4dE9QzIZP03TGlGI32HCN4CM+LGjPBdOWSOxrsMur5xxw10ohXpWLdK3De+IeVPOvhXvYuuUKCHmqYgf4PjEGspa6TU1Cr9uObSXcREEtUucG24Ef/b9B1N73RsWq9tcpdogPh8EgihcUVCv5t+gaT3pxIPBiL1isYlnpGd/k2muFE7ROJCPSBAcoIbWF+Hf4V+caaZ1ThPUE7AT87Lg1qf94266gpDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqMl/ywsyFOJ1cIT3GhjhamVIVIYTPF9BSkLV7w3hZQ=;
 b=cxsHsYX8vEdtpQyTCx+fqpeVLMBU1ccdujYhiKx6z4BojOrJYbc54tm7uM8tNC7f/cIUlHUSqfF3XbXQ0fppapVheJ6VLrtMkmNnWMCXwt9N+qaq6FgREEgHInUurEljnPmRgt08TJtbhk3hawUqFUY7ChKQ2pYGbmDPXqGtBEe9Tr6rq3ynp4THibPDwG4QC0o2OFHRY+xTfueZBWSsCtobD5WGfhia3UppDXyZzV8d8TysqgAVurygi3S2caDixz+CM6LAZsottHUP65m/Wo3o+SWwTcpGwq3EGHT2BmBmRQD4jM8t7c6/xp/LHnPeDFQVuk/5pyQZmbkarE7jAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqMl/ywsyFOJ1cIT3GhjhamVIVIYTPF9BSkLV7w3hZQ=;
 b=ZSd6umuF6vKIE9BekmevIPrYMLxDxMDDmgR6kIiVghYJr4uC4EwJT8TlpeRXe6tH8WSXthOhKu4KWcpueMaSFjQ8vwfBtouGOuf04zNcYIM8AR8HkZX9WI96gxeCuVNAFczIugcWkmQO3cAIxVtk/VbGf5p1Myj7GZYHsInM6tU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Sun, 9 Aug
 2020 12:13:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3261.022; Sun, 9 Aug 2020
 12:13:23 +0000
Subject: Re: [PATCH] gpu/drm: Remove TTM_PL_FLAG_WC of VRAM to fix
 writecombine issue for Loongson64
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1596871502-3432-1-git-send-email-yangtiezhu@loongson.cn>
 <20200808134147.GA5772@alpha.franken.de>
 <b7b16df1-d661-d59a-005b-da594ce9fc95@flygoat.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <38857c24-25c4-cff3-569e-5bcb773bfae6@amd.com>
Date:   Sun, 9 Aug 2020 14:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <b7b16df1-d661-d59a-005b-da594ce9fc95@flygoat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0010.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR07CA0010.eurprd07.prod.outlook.com (2603:10a6:208:ac::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Sun, 9 Aug 2020 12:13:21 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b5c63698-e1d9-42ba-a989-08d83c5d9c88
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125AD19075424D0E5D970D083470@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uN8Y5xJg/KLD8QPvwgezJpZ0r4VCinFUcwfwimT/glg1ehEDVWmVdzI7rEiPHp6E0w6O3nSaHiLOi3furEHw4Q//bJXeNj+z0wUj/5KMTCuB5F/Btdmkp7vzs3kDwPEMhMuPDDjOT87NyE5sQOCGdjn1jq7yeHo54y0QBv+YabV7zUatCad4z0WH9cY31tpJICkw1t5ULPGOwhmtjulgMm9qnA4jUxPYnD/ZtxTRii52UJNSQYrHEkN+V05uT9JTfg2swssZn6gN2WyzVPxDt4Gxw3RPiyBJVawvVCry38TPLFpR4u4iSVrne/SR+Z0pRvTviwVlGQaW45dWI1TxkyZZEEvmiBZSMTeCZ1JB9xBQphlMSVet0/GjXZem8qwg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(5660300002)(83380400001)(478600001)(36756003)(52116002)(66476007)(66556008)(6666004)(6486002)(110136005)(54906003)(66946007)(8676002)(31696002)(2616005)(16526019)(86362001)(2906002)(31686004)(8936002)(316002)(186003)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 2rj0ni+RFjrw9Vu3DRmSNHmtBsIxZKQMNJpdBqls7kK73gSEuu693TbiAJErpn0nT3Z9Wgzuw7K1I/tSaagnyaty3+42DIBrLs8WP5ZXES1Q++h6r7o2y+YeL4GLlx3IljMXOYgeAykbHYvkJeVX2sT7dv3qlX1X0fSGS+fiB+kwjfKPdLYYN7nDEXGqQLHkIxuHLgR6lM9W9yh9tK/CQ9nW0P59SwFqurLYWQ00sqjAOr4EUVQaXAEJtr5CS1AEGID46QILURR/xesSkCsmzp6nPI6YzKZBG0Uz2fpp778PP3uTksVnV5ZgrmVOM3p9v+W6FllzzC+OTbrs+toVHlu8Zq3dC/PPnXE4lAHYZFD/zTaRjAMwMpzlAyRkghUWxlW5Q7M/Vs2C0k/gkpP3Kq2MLPlgZWXxSQcM9P9jZ3gfBowZBL7md2eZq9/5Gm6iY8Wj2qPcKaLKfaizgepWeL1erjO+97kPCAmhhCHJbxyXQ9JU4Twa8gIIJlLwSouYmAUDx0vSD255Gp0g6QfzfrKnwKO/f5AP9aDHuGHDANps8kUiijfAZRwBmm1/khUR279E203fICA7jpNBW48Yuga1rDdTT/Zmyz38DDsL7BKezqBVcRVwkUabd6tEVD9FlI26poTUZDhNoqKX0/KkWz2vJDFR4QazwpP9dQ+ds+IzFHcC7CJXJLgLACb47qNrB5/ANAIqAxM291U1brdGbg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c63698-e1d9-42ba-a989-08d83c5d9c88
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2020 12:13:23.7107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDgOsZI0O83TVmJ8yX7Cbzv04xALq9Z9fNvkiGf4J7qQpZ0EDjZnPoyvVZUtnrFe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am 08.08.20 um 15:50 schrieb Jiaxun Yang:
>
>
> ÔÚ 2020/8/8 ÏÂÎç9:41, Thomas Bogendoerfer Ð´µÀ:
>> On Sat, Aug 08, 2020 at 03:25:02PM +0800, Tiezhu Yang wrote:
>>> Loongson processors have a writecombine issue that maybe failed to
>>> write back framebuffer used with ATI Radeon or AMD GPU at times,
>>> after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
>>> mapping for MIPS"), there exists some errors such as blurred screen
>>> and lockup, and so on.
>>>
>>> Remove the flag TTM_PL_FLAG_WC of VRAM to fix writecombine issue for
>>> Loongson64 to work well with ATI Radeon or AMD GPU, and it has no any
>>> influence on the other platforms.
>> well it's not my call to take or reject this patch, but I already
>> indicated it might be better to disable writecombine on the CPU
>> detection side (or do you have other devices where writecombining
>> works ?). Something like below will disbale it for all loongson64 CPUs.
>> If you now find out where it works and where it doesn't, you can even
>> reduce it to the required minium of affected CPUs.
> Hi Tiezhu, Thomas,
>
> Yes, writecombine works well on LS7A's internal GPU....
> And even works well with some AMD GPUs (in my case, RX550).

In this case the patch is a clear NAK since you haven't root caused the 
issue and are just working around it in a very questionable manner.

>
> Tiezhu, is it possible to investigate the issue deeper in Loongson?
> Probably we just need to add some barrier to maintain the data coherency,
> or disable writecombine for AMD GPU's command buffer and leave 
> texture/frame
> buffer wc accelerated.

Have you moved any buffer to VRAM and forgot to add an HDP flush/invalidate?

The acceleration is not much of a problem, but if WC doesn't work in 
general you need to disable it for the whole CPU and not for individual 
drivers.

Regards,
Christian.

>
> Thanks.
>
> - Jiaxun

