Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E642A22E0
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 03:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgKBCE4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Nov 2020 21:04:56 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35064 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727409AbgKBCEz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 1 Nov 2020 21:04:55 -0500
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKtEyaZ9fYqcDAA--.5264S3;
        Mon, 02 Nov 2020 10:04:34 +0800 (CST)
Subject: Re: Kexec on MIPS32R2?
To:     Mauro Condarelli <mc5686@mclink.it>, linux-mips@vger.kernel.org
References: <21a8d116-ed18-d1f1-9c72-019a619f7ebc@mclink.it>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <b0332180-2dd8-8eed-8cf1-b34640a8e343@loongson.cn>
Date:   Mon, 2 Nov 2020 10:04:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <21a8d116-ed18-d1f1-9c72-019a619f7ebc@mclink.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxKtEyaZ9fYqcDAA--.5264S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4ftry5WF13GrWkWF43GFg_yoW8Gr1kpF
        1rCr4Sqrs5XFy0yw18Zw1xurWfZw4Y9Fy3JwnYgr95Ar4Dtryktrn29a129a4jqryrK3Wj
        qFW3Xay0ka1Yy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Kb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VCY1x0262k0Y48FwI
        0_Jr0_Gr1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvE
        wIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrw
        CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
        14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
        IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
        x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
        AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUyXAwDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 11/02/2020 08:01 AM, Mauro Condarelli wrote:
> Can someone confirm (or disconfirm, of course) kexec is supposed to work on MIPS32R2?
> My attempts to use it on a MT7628-based board result in a silent hang (watchdog cuts in)
> right after:
>
> [  201.309836] kexec_core: Starting new kernel
> [  201.318239] Will call new kernel at 004f0000
> [  201.322581] Bye ...
>
> Apparently old kernel jumps to `do_kexec()` and just dies; new kernel does not give a peep.
> This can be completely my fault, of course, but I would like a confirm this is supposed to work.
>
> Thanks in advance
> Mauro Condarelli
I'm not familiar with MIPSR2. I guess your platform (MT7628-based board)
cannot use the common function. It may not give a machine specific 
function, too.

How CPU0 do in do_kexec()? Maybe arch/mips/kernel/reloacate_kernel.S 
gives us
some useful information. In this file CPU0 goes relocate_new_kernel() 
and other
CPUs go kexec_smp_wait() if CONFIG_SMP is enabled. Normally CPU0 will 
enter the
kernel_entry() of the new kernel. In my own understanding of the kexec 
process,
I find it extremely difficult to pass parameters. Please make sure your 
platform
passes the parameters necessary for startup. (See 
arch/mips/kernel/head.S, such as
dtb, fw_args* or other necessary parameters, this is what I said 
"machine specific")

