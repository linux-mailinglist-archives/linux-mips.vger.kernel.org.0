Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D696935B8C6
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 05:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235954AbhDLDDJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Apr 2021 23:03:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46202 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235857AbhDLDDI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 11 Apr 2021 23:03:08 -0400
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxHck7uHNg698GAA--.9221S3;
        Mon, 12 Apr 2021 11:02:19 +0800 (CST)
Subject: Re: [PATCH] MIPS: Fix strnlen_user access check
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
Date:   Mon, 12 Apr 2021 11:02:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxHck7uHNg698GAA--.9221S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tw17XFWxCFWUAF4ktw1UKFg_yoW8WrW8pF
        s3Aw1kKFs0gryfAa4ay3y2qF1rGws8Gr1Y9a42gr1UZF1qvw15trWSkr1q93y8JFs8Aa4x
        WFWSqrn5Wr1jvw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjHGQDUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/11/2021 07:04 PM, Jinyang He wrote:
> Commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs") brought a problem for
> strnlen_user(). Jump out when checking access_ok() with condition that
> (s + strlen(s)) < __UA_LIMIT <= (s + n). The old __strnlen_user_asm()
> just checked (ua_limit & s) without checking (ua_limit & (s + n)).
> Therefore, find strlen form s to __UA_LIMIT - 1 in that condition.
>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>   arch/mips/include/asm/uaccess.h | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> index 91bc7fb..85ba0c8 100644
> --- a/arch/mips/include/asm/uaccess.h
> +++ b/arch/mips/include/asm/uaccess.h
> @@ -630,8 +630,15 @@ static inline long strnlen_user(const char __user *s, long n)
>   {
>   	long res;
>   
> -	if (!access_ok(s, n))
> -		return -0;
> +	if (unlikely(n <= 0))
> +		return 0;
> +
> +	if (!access_ok(s, n)) {
> +		if (!access_ok(s, 0))
> +			return 0;
> +
> +		n = __UA_LIMIT - (unsigned long)s - 1;
> +	}
>   
>   	might_fault();
>   	__asm__ __volatile__(

The following simple changes are OK to fix this issue?

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 91bc7fb..eafc99b 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -630,8 +630,8 @@ static inline long strnlen_user(const char __user *s, long n)
  {
         long res;
  
-       if (!access_ok(s, n))
-               return -0;
+       if (!access_ok(s, 1))
+               return 0;
  
         might_fault();
         __asm__ __volatile__(

Thanks,
Tiezhu


