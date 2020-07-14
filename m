Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C8721E9FE
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 09:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgGNH0C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 03:26:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44924 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725306AbgGNH0B (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jul 2020 03:26:01 -0400
Received: from [10.130.0.75] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxnx4EXg1fvkkEAA--.3513S3;
        Tue, 14 Jul 2020 15:25:56 +0800 (CST)
Subject: Re: [PATCH 1/4] MIPS: Loongson64: Fix machine naming
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <fdc1b16e-d69f-3cde-8564-3806dd5306a2@loongson.cn>
Date:   Tue, 14 Jul 2020 15:25:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxnx4EXg1fvkkEAA--.3513S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tFWrGF4rtr48GF1fKw4Durg_yoW8Wr45pw
        nxA3ykKF4Igr1ayrn5J3yUXryxAay5JFZruF47tryUGrZa934avr1rta1YyFsIvF1rtayF
        9ry0grWxC3Z7CFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
        MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
        026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
        JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
        vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU8a2NtUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/09/2020 07:33 PM, Huacai Chen wrote:
>  From previous commits, the machine names with "loongson3-" prefix have
> renamed to "loongson64c-" prefix in documents, but the .dts files have
> not been updated as well. So fix it.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

> ---
>   arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts | 2 +-
>   arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts
> index acd53a1..d681a29 100644
> --- a/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts
> +++ b/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts
> @@ -6,7 +6,7 @@
>   #include "rs780e-pch.dtsi"
>   
>   / {
> -	compatible = "loongson,loongson3-4core-rs780e";
> +	compatible = "loongson,loongson64c-4core-rs780e";
>   };
>   
>   &package0 {
> diff --git a/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts
> index 433f9c3..3c20441 100644
> --- a/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts
> +++ b/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts
> @@ -6,7 +6,7 @@
>   #include "rs780e-pch.dtsi"
>   
>   / {
> -	compatible = "loongson,loongson3-8core-rs780e";
> +	compatible = "loongson,loongson64c-8core-rs780e";
>   };
>   
>   &package0 {

