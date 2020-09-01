Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737D0258A94
	for <lists+linux-mips@lfdr.de>; Tue,  1 Sep 2020 10:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgIAIoP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Sep 2020 04:44:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60134 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726078AbgIAIoO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Sep 2020 04:44:14 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [182.149.161.99])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj93VCU5f290PAA--.640S2;
        Tue, 01 Sep 2020 16:44:07 +0800 (CST)
Date:   Tue, 1 Sep 2020 16:44:05 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: perf: Fix wrong check condition of Loongson event
 IDs
Message-ID: <20200901084405.2lhsns5zxljbkhgy@ambrosehua-HP-xw6600-Workstation>
References: <1598515388-3604-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4MA7L8uBG3y1R-VgkS74Awa5-Qsp-vQUsYM8jwgtekJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4MA7L8uBG3y1R-VgkS74Awa5-Qsp-vQUsYM8jwgtekJg@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9Dxj93VCU5f290PAA--.640S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry7Cw45KFW3XF4Duw4DJwb_yoW8WF4Upr
        4Uua1aywnrtr12ga98ZanrJr1DJrn8uwnrWayDKF13Awn8Z34DXFsrXFn8tr15Xwn0kayx
        Xay2gr17Za4UZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCF
        x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
        v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
        67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
        IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
        xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 28, 2020 at 04:49:37PM +0800, Huacai Chen wrote:
> Hi, Pei,
> 
> On Thu, Aug 27, 2020 at 4:05 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >
> > According to the user's manual chapter 8.2.1 of Loongson 3A2000 CPU [1]
> > and 3A3000 CPU [2], we should take some event IDs such as 274, 358, 359
> > and 360 as valid in the check condition, otherwise they are recognized
> > as "not supported", fix it.
> I think this patch needs you to confirm.
> 
> >
> > [1] http://www.loongson.cn/uploadfile/cpu/3A2000/Loongson3A2000_user2.pdf
> > [2] http://www.loongson.cn/uploadfile/cpu/3A3000/Loongson3A3000_3B3000user2.pdf
> >
> > Fixes: e9dfbaaeef1c ("MIPS: perf: Add hardware perf events support for new Loongson-3")
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >  arch/mips/kernel/perf_event_mipsxx.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
> > index efce5de..011eb6bb 100644
> > --- a/arch/mips/kernel/perf_event_mipsxx.c
> > +++ b/arch/mips/kernel/perf_event_mipsxx.c
> > @@ -1898,8 +1898,8 @@ static const struct mips_perf_event *mipsxx_pmu_map_raw_event(u64 config)
> >                                 (base_id >= 64 && base_id < 90) ||
> >                                 (base_id >= 128 && base_id < 164) ||
> >                                 (base_id >= 192 && base_id < 200) ||
> > -                               (base_id >= 256 && base_id < 274) ||
> > -                               (base_id >= 320 && base_id < 358) ||
> > +                               (base_id >= 256 && base_id < 275) ||
> > +                               (base_id >= 320 && base_id < 361) ||
> >                                 (base_id >= 384 && base_id < 574))
> >                                 break;
> >
> > --
> > 2.1.0
> >
Acked-by: Huang Pei <huangpei@loongson.cn>

