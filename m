Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A8C23F7DA
	for <lists+linux-mips@lfdr.de>; Sat,  8 Aug 2020 15:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgHHNvT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Aug 2020 09:51:19 -0400
Received: from relay3.mymailcheap.com ([217.182.119.157]:44893 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgHHNvT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Aug 2020 09:51:19 -0400
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 8226F3F15F;
        Sat,  8 Aug 2020 15:51:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 59A9E2A7CD;
        Sat,  8 Aug 2020 15:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596894675;
        bh=aMvdZDiGSkgDY34UFhCXqMYg0yzNL97YlcKNxs7qbyM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ylgj3ZeC6SrvHrTDxBpi2JJuB5D7RxGXVhJeE0bC76iqaf7IVqu6A2BNQtR2+U+DB
         vnPnz11HPKDlUFGFTjtkk/cE8Wg0i+vxqh3wd6vNALWoLc8YA9TFTemd8zcarvpg8Q
         QxW1w/GTjxJYHX953UiWIlZ0KKp1FyeP5OtJmmTY=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pKApvAm2ixEj; Sat,  8 Aug 2020 15:51:13 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Sat,  8 Aug 2020 15:51:13 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 9CC79419E4;
        Sat,  8 Aug 2020 13:51:11 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="MJHIzbWP";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 14D50419E4;
        Sat,  8 Aug 2020 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596894667;
        bh=aMvdZDiGSkgDY34UFhCXqMYg0yzNL97YlcKNxs7qbyM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MJHIzbWPjOIoXUO93z3n0T2+G0nMiFSPIIPlB237bMTBEFDgVBTc0BIb3nV+BtZRI
         cz3Mi7mHVmLK9Qo6WQ41zTNeQtb+WGgVP/pA/Ak+NP31tLS6Eh4Ggn5xPVFuRLKTep
         /wz/8xlJ0A/eVao6Qh2XTZxKy1TCkbsaHMUVB0j8=
Subject: Re: [PATCH] gpu/drm: Remove TTM_PL_FLAG_WC of VRAM to fix
 writecombine issue for Loongson64
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1596871502-3432-1-git-send-email-yangtiezhu@loongson.cn>
 <20200808134147.GA5772@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <b7b16df1-d661-d59a-005b-da594ce9fc95@flygoat.com>
Date:   Sat, 8 Aug 2020 21:50:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200808134147.GA5772@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 9CC79419E4
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/8/8 ÏÂÎç9:41, Thomas Bogendoerfer Ð´µÀ:
> On Sat, Aug 08, 2020 at 03:25:02PM +0800, Tiezhu Yang wrote:
>> Loongson processors have a writecombine issue that maybe failed to
>> write back framebuffer used with ATI Radeon or AMD GPU at times,
>> after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
>> mapping for MIPS"), there exists some errors such as blurred screen
>> and lockup, and so on.
>>
>> Remove the flag TTM_PL_FLAG_WC of VRAM to fix writecombine issue for
>> Loongson64 to work well with ATI Radeon or AMD GPU, and it has no any
>> influence on the other platforms.
> well it's not my call to take or reject this patch, but I already
> indicated it might be better to disable writecombine on the CPU
> detection side (or do you have other devices where writecombining
> works ?). Something like below will disbale it for all loongson64 CPUs.
> If you now find out where it works and where it doesn't, you can even
> reduce it to the required minium of affected CPUs.
Hi Tiezhu, Thomas,

Yes, writecombine works well on LS7A's internal GPU....
And even works well with some AMD GPUs (in my case, RX550).

Tiezhu, is it possible to investigate the issue deeper in Loongson?
Probably we just need to add some barrier to maintain the data coherency,
or disable writecombine for AMD GPU's command buffer and leave texture/frame
buffer wc accelerated.

Thanks.

- Jiaxun
