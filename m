Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C251FAE11
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2020 12:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgFPKe3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Jun 2020 06:34:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52506 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725843AbgFPKe1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Jun 2020 06:34:27 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_98toOheQWFEAA--.6519S3;
        Tue, 16 Jun 2020 18:34:22 +0800 (CST)
Subject: Re: [PATCH] MIPS: Do not flush tlb when setting pmd entry
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1591177333-17833-1-git-send-email-maobibo@loongson.cn>
 <20200615101443.GA10075@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <4bef403d-baba-ddf8-c25c-3d6968897a53@loongson.cn>
Date:   Tue, 16 Jun 2020 18:34:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200615101443.GA10075@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx_98toOheQWFEAA--.6519S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZw43trW5uFykuw15WrWDCFg_yoWxAwcEqw
        n2yr4kXr1Utr47tFs5JrZ8JFn8Wr17WFy8XryxXr1UXryrAw4kGrnakr1Syw15JFW2gFsI
        kw4rZr9YqwnFvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v_M3UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 06/15/2020 06:14 PM, Thomas Bogendoerfer wrote:
> On Wed, Jun 03, 2020 at 05:42:13PM +0800, Bibo Mao wrote:
>> Function set_pmd_at is to set pmd entry, if tlb entry need to
>> be flushed, there exists pmdp_huge_clear_flush alike function
>> before set_pmd_at is called. So it is not necessary to call
>> flush_tlb_all in this function.
> 
> have you checked all set_pmd_at() calls ? I found a few case where
> it's not clear to me, if tlb flushing is done... If you think this
> is still the right thing to do, please change arch/mips/mm/pgtable-32.c
> as well.
well, I will double check this and do more testing about thp and hugepage.

regards
bibo,mao
> 
> Thomas.
> 

