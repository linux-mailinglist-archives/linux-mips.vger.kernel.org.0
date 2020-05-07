Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3881D1C8536
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 10:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgEGI60 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 04:58:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3883 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725809AbgEGI60 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 04:58:26 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id BF247D8A7D0CF12B64F2;
        Thu,  7 May 2020 16:58:23 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 16:58:18 +0800
Subject: Re: [PATCH] MIPS: Lasat: Remove dead code in lasat.h
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     <tglx@linutronix.de>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200506134258.32634-1-yanaijie@huawei.com>
 <20200507083857.GD8924@alpha.franken.de>
From:   Jason Yan <yanaijie@huawei.com>
Message-ID: <9cd87ccb-64a1-bc5b-748f-fcd0f9ddb317@huawei.com>
Date:   Thu, 7 May 2020 16:58:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200507083857.GD8924@alpha.franken.de>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.213.7]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/5/7 16:38, Thomas Bogendoerfer Ð´µÀ:
> On Wed, May 06, 2020 at 09:42:58PM +0800, Jason Yan wrote:
>> This code has been marked dead for more than 10 years. Seems no need to
>> keep it now.
>>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>> ---
>>   arch/mips/include/asm/lasat/lasat.h | 5 -----
>>   1 file changed, 5 deletions(-)
> 
> I'll send a patch shortly to remove lasat completly. Therefore I'm
> not going to apply this cleanup patch.
> 

OK, thanks for letting me know this infomation.

Jason

> Thomas.
> 

