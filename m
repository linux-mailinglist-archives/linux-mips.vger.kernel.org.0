Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25CA32404F3
	for <lists+linux-mips@lfdr.de>; Mon, 10 Aug 2020 12:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgHJK7B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Aug 2020 06:59:01 -0400
Received: from mail.netline.ch ([148.251.143.178]:41850 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgHJK7B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Aug 2020 06:59:01 -0400
X-Greylist: delayed 489 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 Aug 2020 06:58:59 EDT
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id A582E2A6042;
        Mon, 10 Aug 2020 12:50:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id Mpbg-h6jHzk1; Mon, 10 Aug 2020 12:50:48 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch [188.63.174.212])
        by netline-mail3.netline.ch (Postfix) with ESMTPSA id 9C3F02A6016;
        Mon, 10 Aug 2020 12:50:46 +0200 (CEST)
Received: from [::1]
        by thor with esmtp (Exim 4.94)
        (envelope-from <michel@daenzer.net>)
        id 1k55O9-000Uyj-S3; Mon, 10 Aug 2020 12:50:45 +0200
Subject: Re: [PATCH] gpu/drm: Remove TTM_PL_FLAG_WC of VRAM to fix
 writecombine issue for Loongson64
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <2f3fd325-8093-98e7-5bc8-75490258baac@daenzer.net>
Date:   Mon, 10 Aug 2020 12:50:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <38857c24-25c4-cff3-569e-5bcb773bfae6@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-08-09 2:13 p.m., Christian König wrote:
> Am 08.08.20 um 15:50 schrieb Jiaxun Yang:
>> 在 2020/8/8 下午9:41, Thomas Bogendoerfer 写道:
>>> On Sat, Aug 08, 2020 at 03:25:02PM +0800, Tiezhu Yang wrote:
>>>> Loongson processors have a writecombine issue that maybe failed to
>>>> write back framebuffer used with ATI Radeon or AMD GPU at times,
>>>> after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
>>>> mapping for MIPS"), there exists some errors such as blurred screen
>>>> and lockup, and so on.
>>>>
>>>> Remove the flag TTM_PL_FLAG_WC of VRAM to fix writecombine issue for
>>>> Loongson64 to work well with ATI Radeon or AMD GPU, and it has no any
>>>> influence on the other platforms.
>>> well it's not my call to take or reject this patch, but I already
>>> indicated it might be better to disable writecombine on the CPU
>>> detection side (or do you have other devices where writecombining
>>> works ?). Something like below will disbale it for all loongson64 CPUs.
>>> If you now find out where it works and where it doesn't, you can even
>>> reduce it to the required minium of affected CPUs.
>> Hi Tiezhu, Thomas,
>>
>> Yes, writecombine works well on LS7A's internal GPU....
>> And even works well with some AMD GPUs (in my case, RX550).
> 
> In this case the patch is a clear NAK since you haven't root caused the
> issue and are just working around it in a very questionable manner.

To be fair though, amdgpu & radeon are already disabling write-combining
for system memory pages in 32-bit x86 kernels for similar reasons.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
