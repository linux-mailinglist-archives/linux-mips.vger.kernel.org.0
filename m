Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B926A152599
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 05:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgBEE0h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 23:26:37 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44570 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727834AbgBEE0g (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 4 Feb 2020 23:26:36 -0500
Received: from [192.168.68.106] (unknown [111.18.44.203])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH93rQzpeLI8MAA--.65S3;
        Wed, 05 Feb 2020 12:26:21 +0800 (CST)
Subject: Re: [PATCH v3 1/2] firmware: dmi: Add macro
 SMBIOS_ENTRY_POINT_SCAN_START
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     Yinglu Yang <yangyinglu@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1580875204-18052-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <aa85b2d8-d4fb-c681-e4d1-85e23750715d@loongson.cn>
Date:   Wed, 5 Feb 2020 12:26:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1580875204-18052-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxH93rQzpeLI8MAA--.65S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1DCr1UZrWDKF4rAryxKrg_yoW8AF1kpF
        4UGF45Cr4DJF4xGa97Aa13uFy5uan3tF9IgFWUZr1rua98XFyfJrs3A3ykKF1DArWDKayI
        9r1fXF1aka4DK3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
        Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
        x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
        1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j
        6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
        UvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/5/20 12:00 PM, Tiezhu Yang wrote:
> Use SMBIOS_ENTRY_POINT_SCAN_START instead of 0xF0000, because other
> archtecture maybe use a special start address such as 0xFFFE000 for
> Loongson platform.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> ---
>
> v3:
>    - split the v2 patch into two patches
>    - make MIPS DMI config depend on MACH_LOONGSON64
>
> v2:
>    - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
>    - refine definitions and Kconfig by Jiaxun
>
>   drivers/firmware/dmi_scan.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 2045566..f59163c 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -11,6 +11,10 @@
>   #include <asm/dmi.h>
>   #include <asm/unaligned.h>
>   
> +#ifndef SMBIOS_ENTRY_POINT_SCAN_START
> +#define SMBIOS_ENTRY_POINT_SCAN_START 0xF0000
> +#endif
> +
>   struct kobject *dmi_kobj;
>   EXPORT_SYMBOL_GPL(dmi_kobj);
>   
> @@ -663,7 +667,7 @@ static void __init dmi_scan_machine(void)
>   			return;
>   		}
>   	} else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
> -		p = dmi_early_remap(0xF0000, 0x10000);
> +		p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
>   		if (p == NULL)
>   			goto error;
>   

Sorry, there appears to be some issues when git send-email,

please ignore the repeated patch:

[PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START.

the correct send time of series patch is 2020-02-05 4:08 UTC, the link is

https://lore.kernel.org/patchwork/patch/1189713/

https://lore.kernel.org/patchwork/patch/1189714/


Thanks,


Tiezhu Yang

