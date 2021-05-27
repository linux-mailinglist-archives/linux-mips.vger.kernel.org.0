Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A771392DCC
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 14:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbhE0MSI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 08:18:08 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2316 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbhE0MSG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 May 2021 08:18:06 -0400
Received: from dggeml702-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FrRWc1bzXz1BFTr;
        Thu, 27 May 2021 20:11:56 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggeml702-chm.china.huawei.com (10.3.17.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 27 May 2021 20:16:31 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 20:16:30 +0800
Subject: Re: [PATCH] mips: kill pte_sw_mkyoung
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Huang Pei <huangpei@loongson.cn>, <linux-mips@vger.kernel.org>
References: <20210520110043.149003-1-wangkefeng.wang@huawei.com>
 <20210527114135.GA9210@alpha.franken.de>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <77431c3e-9489-0891-d236-c96f6befa248@huawei.com>
Date:   Thu, 27 May 2021 20:16:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210527114135.GA9210@alpha.franken.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/5/27 19:41, Thomas Bogendoerfer wrote:
> On Thu, May 20, 2021 at 07:00:43PM +0800, Kefeng Wang wrote:
>> Kill unused pte_sw_mkyoung after
>> commit f685a533a7fa ("MIPS: make userspace mapping young by default").
> I just sent a revert for that commit. So we still want and need pte_sw_mkyoung.
OK，please ignore it.
> Thomas.
>
