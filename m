Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2FDA194E5C
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2020 02:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgC0BVi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 21:21:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53078 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727547AbgC0BVi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 21:21:38 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj90NVX1ew3EgAA--.18S3;
        Fri, 27 Mar 2020 09:21:18 +0800 (CST)
Subject: Re: [PATCH v3 1/2] firmware: dmi: Add macro
 SMBIOS_ENTRY_POINT_SCAN_START
To:     Jean Delvare <jdelvare@suse.de>
References: <1580875713-18252-1-git-send-email-yangtiezhu@loongson.cn>
 <8ee01022-d3d1-8145-1a0b-ba77c5bb7101@loongson.cn>
 <20200326150716.47b4152f@endymion>
Cc:     jiaxun.yang@flygoat.com, chenhc@lemote.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        lixuefeng@loongson.cn, paulburton@kernel.org, ralf@linux-mips.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <623abcd1-7c5b-3cae-817b-fc993897b9a9@loongson.cn>
Date:   Fri, 27 Mar 2020 09:21:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200326150716.47b4152f@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxj90NVX1ew3EgAA--.18S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GrykJw4UZr43GrW7uFyDZFb_yoW3AFbE9w
        4kCr1Sk34jkr1UAwnrKr1avFn5t34ktFWIya18Cw47Z3Z8Aan5Xr4fuwn5Jan5J3W8Cr4D
        Ar15tryqyrsavjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbskFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
        WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
        IFyTuYvjfUFVyIUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/26/2020 10:07 PM, Jean Delvare wrote:
> Hi Tiezhu,
>
> On Thu, 20 Feb 2020 10:43:56 +0800, Tiezhu Yang wrote:
>> Since this patch is independent and it has no any negative influence,
>> could you apply it to your DMI tree first?
> I've just queued your patch for kernel 5.6. Thanks for your
> contribution and sorry for the delay.
>

Hi Jean,

Thank you very much, it has been merged into
mips-next and linux-next tree by Thomas about
three days ago, so you can drop it in your tree.

https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=3da27a4eb8c214d692e024473415fe7d2e88e7d7
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3da27a4eb8c214d692e024473415fe7d2e88e7d7

Thanks,

Tiezhu Yang

