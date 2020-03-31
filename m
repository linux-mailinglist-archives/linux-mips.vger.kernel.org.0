Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A79A198AA6
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 05:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbgCaDxs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 23:53:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56820 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727358AbgCaDxs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 23:53:48 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb97FvoJe+u8hAA--.63S3;
        Tue, 31 Mar 2020 11:53:43 +0800 (CST)
Subject: Re: [PATCH 02/39] MIPS: loongson64: Add header files path prefix
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1585557531-18849-1-git-send-email-maobibo@loongson.cn>
 <53CC90A0-3926-4642-91D4-F4F265F6AE90@flygoat.com>
 <778df899-4dc4-c2be-5b7b-79c16223b0fb@loongson.cn>
 <1712ea7ba9a.dad1f80a33831.4741900511750683483@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
From:   maobibo <maobibo@loongson.cn>
Message-ID: <8b7b3b19-d5e2-befb-e781-7be53d2cbd54@loongson.cn>
Date:   Tue, 31 Mar 2020 11:53:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1712ea7ba9a.dad1f80a33831.4741900511750683483@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb97FvoJe+u8hAA--.63S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1DArWDAryxJr4DXw1DZFb_yoW8AF1kpa
        93Aan09r4UCr4jyrnavrn8Gr4YyrZ8tFZFgry2qryUuasIq3ZxX3Wftry0kryDZF4rKFy8
        uFWrGasrAF4DZwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jY6wZUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 03/31/2020 11:34 AM, Jiaxun Yang wrote:
> 
> 
> --
> Jiaxun Yang
> 
>  ---- 在 星期一, 2020-03-30 18:00:19 maobibo <maobibo@loongson.cn> 撰写 ----
>  > 
>  > 
>  > On 03/30/2020 04:55 PM, Jiaxun Yang wrote:
>  > > 
>  > > 
>  > > 于 2020年3月30日 GMT+08:00 下午4:38:51, bibo mao <maobibo@loongson.cn> 写到:
>  > >> Remove header files from arch/mips/include/asm/mach-loongson64
>  > >> to arch/mips/loongson64/include/mach
>  > >>
>  > >> Signed-off-by: bibo mao <maobibo@loongson.cn>
>  > > 
>  > > Hi Bibo,
>  > > 
>  > > Thanks for your patch.
>  > > 
>  > > What's your intention?
>  > > Did you meet any problem about headers?
>  > > 
>  > 
>  > Hi Jiaxun,
>  > 
>  > When I add irqchip support for mips kvm, file virt/kvm/irqchip.c
>  > requires local header file arch/mips/kvm/irq.h, it fails to compile.
>  > Since there is file with the same name located at:
>  >   arch/mips/include/asm/mach-generic/irq.h
>  >   arch/mips/include/asm/mach-loongson64/irq.h
>  > 
>  > The compiler fails to choose the correct header file irq.h,
> 
> You'd better rename kvm's irq.h in this case.
why should we rename kvm's irq.h?  It works on other arches like
x86/aarch/powerpc, it does not work on mips platform. Just because these
header files are not used with path prefix on mips system, it brings out
such problem.

Today if we modify generic kvm code, it maybe brings out problem with
other modules tommorrow. Else we declare that these files can be defined
locally on all modules:
  cpu-feature-overrides.h  floppy.h  ide.h  ioremap.h  irq.h
  kernel-entry-init.h  kmalloc.h  mangle-port.h  mc146818rtc.h

regard
bibo,mao

> 
>  > 
>  > regards
>  > bibo,mao
>  > 
>  > >> ---
>  > >> arch/mips/Kconfig                                                 | 1 +
>  > >> arch/mips/loongson64/Platform                                     | 2
>  > >> +-
>  > >> arch/mips/loongson64/env.c                                        | 8
>  > >> ++++----
> 

