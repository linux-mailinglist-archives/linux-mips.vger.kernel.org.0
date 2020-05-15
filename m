Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE941D43E0
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 05:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgEODKB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 23:10:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43792 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726192AbgEODKB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 23:10:01 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX2sECL5ef+80AA--.32S3;
        Fri, 15 May 2020 11:09:57 +0800 (CST)
Subject: Re: [PATCH 1/2] MIPS: Loongson: Fix fatal error during GPU init
To:     jiaxun.yang@flygoat.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1589508901-18077-1-git-send-email-yangtiezhu@loongson.cn>
 <ECE71DFC-57D3-4132-BB85-609448B29238@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <636ba812-3849-2667-d625-ab7e35d5ac36@loongson.cn>
Date:   Fri, 15 May 2020 11:09:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ECE71DFC-57D3-4132-BB85-609448B29238@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX2sECL5ef+80AA--.32S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1xKw4xtryrCw1UWr1DAwb_yoWxtrg_Gr
        yqkas8Gw4DJr48Za1UKFn5Zr1aka1DGrWxCFW7XF48C3sxJrs5Xrn8AryrGry5Ga1ktwsx
        CF4jqrW0yrnFqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUUEfO7UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05/15/2020 10:33 AM, Jiaxun Yang wrote:
>
> 于 2020年5月15日 GMT+08:00 上午10:15:00, Tiezhu Yang <yangtiezhu@loongson.cn> 写到:
>> When ATI Radeon graphics card has been compiled directly into the kernel
>> instead of as a module, we should make sure the firmware for the model
>> (check available ones in /lib/firmware/radeon) is built-in to the kernel
>> as well, otherwise there exists the following fatal error during GPU init,
>> change CONFIG_DRM_RADEON=y to CONFIG_DRM_RADEON=m to fix it.
>>
> The commit message looks shocking.
>
> You'd better reword it as "MIPS: Loongson64: Mark GPU driver as module in Kconfig"

OK, I will modify the patch subject and send v2.

>
> Thanks.

