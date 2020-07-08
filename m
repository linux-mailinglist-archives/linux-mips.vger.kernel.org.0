Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690132181CA
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2020 09:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgGHHvt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jul 2020 03:51:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59718 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725747AbgGHHvt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Jul 2020 03:51:49 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxidT8egVf4RMAAA--.116S3;
        Wed, 08 Jul 2020 15:51:25 +0800 (CST)
Subject: Re: [PATCH] MIPS: Prevent READ_IMPLIES_EXEC propagation
To:     "Maciej W. Rozycki" <macro@wdc.com>
References: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
 <alpine.LFD.2.21.2007072043250.31807@redsun52.ssa.fujisawa.hgst.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <b62c76c5-3548-c3d5-ad3e-5664c463a52f@loongson.cn>
Date:   Wed, 8 Jul 2020 15:51:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2007072043250.31807@redsun52.ssa.fujisawa.hgst.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9CxidT8egVf4RMAAA--.116S3
X-Coremail-Antispam: 1UD129KBjvdXoWruF1rCFy3Zry8ur1UWrW7Jwb_yoWDZFg_Ar
        4fZw1DGw1UurZ0g34S9r43Zas7Wa47Ja4ftrWfCw4xKw1DXanxAayvyFyfAryxGanrtrsx
        WFsxJws5Grna9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUBpB-UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/08/2020 03:45 AM, Maciej W. Rozycki wrote:
> On Tue, 7 Jul 2020, Tiezhu Yang wrote:
>
>> In the MIPS architecture, we should clear the security-relevant
>> flag READ_IMPLIES_EXEC in the function SET_PERSONALITY2() of the
>> file arch/mips/include/asm/elf.h.
>>
>> Otherwise, with this flag set, PROT_READ implies PROT_EXEC for
>> mmap to make memory executable that is not safe, because this
>> condition allows an attacker to simply jump to and execute bytes
>> that are considered to be just data [1].
>   Why isn't the arrangement made with `mips_elf_read_implies_exec'
> sufficient?

We inherit the READ_IMPLIES_EXEC personality flag across fork().
If we do not explicitly clear this flag in SET_PERSONALITY2(),
PROT_READ implies PROT_EXEC for mmap to make memory executable
even if used with the GCC option "-z noexecstack" when compile.

By the way, we can see some other reasons in the following commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=48f99c8ec0b2

>
>    Maciej

