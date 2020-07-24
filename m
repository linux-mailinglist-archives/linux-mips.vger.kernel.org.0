Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48C822BBAB
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jul 2020 03:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgGXBuT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jul 2020 21:50:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60426 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726381AbgGXBuS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Jul 2020 21:50:18 -0400
Received: from [172.20.10.6] (unknown [114.242.249.158])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv2ZWPhpfb_IDAA--.1709S3;
        Fri, 24 Jul 2020 09:50:14 +0800 (CST)
Subject: Re: [PATCH] MIPS: Grant pte read permission, even if vma only have
 VM_WRITE permission.
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
References: <20200717095536.45011-1-liulichao@loongson.cn>
 <20200722093603.GA10090@alpha.franken.de>
From:   Lichao Liu <liulichao@loongson.cn>
Message-ID: <c42085fa-43f7-c845-79d7-8b30eefb78da@loongson.cn>
Date:   Fri, 24 Jul 2020 09:50:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722093603.GA10090@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxv2ZWPhpfb_IDAA--.1709S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ur48GF4kZw4xKFy8urWDXFb_yoW8Cw1kpF
        W8ZFyDKFnrWr95Cr4DAa4UXF1rCaykJrZ5Ga4rWr13uanxWry5KrWqqaykKa4UJ3s3Ga1Y
        qw429ry5Xrs8Ga7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
        ZFpf9x07beiiDUUUUU=
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/7/22 下午5:36, Thomas Bogendoerfer 写道:
> On Fri, Jul 17, 2020 at 05:55:36PM +0800, Lichao Liu wrote:
>> If a page can be written, then it can definitely be read.
> IMHO it's exactly the point of RIXI enabled CPUs to support a
> writeonly mapping even if most of other archs aren't able to
> support it. So if there is no real good reason to change this,
> I'm going to leave it this way.
>
> Thomas.
>

If a vma only have VM_WRITE permission, the vma->vm_page_prot will
set _PAGE_NO_READ. In general case, someone read the vma will trigger
RI exception, then do_page_fault will handle it.

But in the following scene, program will hang.

futex_wake_op() will read uaddr, which is passed from user space.
If a program mmap a vma, which only have VM_WRITE permission,
then exec futex syscall, and use an address belonging to the vma as uaddr
argument.

futex_wake_op() will disable pagefault and set correct __ex_table(return -14 directly),
then try to access the address in atomic,
do_page_fault will find the correct __ex_table, and then return -14.

Then futex_wake_op() will try to fixup this error by call
fault_in_user_writeable(),  the fixup will success.
But, because the pte only write permission,
so after fault_in_user_writeable(), 
the corresponding pte and tlb will set RI bit.

The program will deadloop:
do_page_fault(RI) -> find __ex_table success -> return -14;
futex_wake_op -> call fault_in_user_writeable() to fix the error -> success -> retry;
do_page_fault(RI) -> find __ex_table success -> return -14;
futex_wake_op -> call fault_in_user_writeable() to fix the error -> success -> retry;

I think there are have two solutions to the problem:
1)modify fault_in_user_writeable(), 
  must claim read permission when claiming write permission.
2)Grant pte read permission, even if vma only have VM_WRITE permission.

But not sure which one is more suitable.

Thank you.

