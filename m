Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB0791600F0
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 23:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgBOWfQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 17:35:16 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37244 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgBOWfP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 17:35:15 -0500
Received: by mail-wm1-f65.google.com with SMTP id a6so14623126wme.2;
        Sat, 15 Feb 2020 14:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2khPxLYsoc4+D8Ncqx/2OdNVdlVtfOiZCN9IRxVRVyk=;
        b=Z6F/vFABZnDYPVuSDcCHdmTVE5nbEGpKQdXxdBhEYCA5KFFIkiJP+VW5T1n69zmn5L
         A92TUkYmInXX6AeKHzuzofF4pWrIbZ8l1hXYBcdVihYmv1fzg5nHP9RyZCDCX84H7NoA
         /3oBhcpPBpVqyajEGhLC/xsYKlDprjgtHXcdkrhEbJsGC+o+AZqcdfMjkKUdG3ygjOgj
         cPg+G0De4dJR7enJVnuwWUzh1XJcAzMuWi6Mk2PsjO+rwkuYz0MLPol92KKjWiADYBrP
         Cz/e6k5aqspGN4B+aHkW6ddrVI/PCKFdmDpw7e/Hu27L+vHQ7nZK1l7de4DJKF9dJ3P1
         /+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2khPxLYsoc4+D8Ncqx/2OdNVdlVtfOiZCN9IRxVRVyk=;
        b=kCLVbszCyloruChLnSVGS0LvAdImO7kLBYkTYfPRfQO81XJlt3cbk9Wpa5X3YL3ckn
         HH6FfBhXPAXANvDhRwzq/pZ/EXYoLsvfww6s7l4iyLDzHTCvkyuuy0K0p6uPo0TGbcvZ
         CkvaDFeFeZwp/MYb+TbvC4vd130huehaxEQjznQ/me6Z4AbfFOMJ7xO5ImSVV3J+qYZE
         4UPli4KV6aYrSC9Nto5KGburH14Y6GZAcQOdj8CpRRVHesNTqhM60jgLRoCRZRjvK0lO
         PCvkmKHWYinoSK0rr00N0capneRb0ieXv4+jGh4Kkysj5z5oKndcOQxJo/kHERSbpinN
         zM5A==
X-Gm-Message-State: APjAAAUSKVjsqX51vS5wlzcWDmNrq4tWHdIO6VtSxaBsr/7IyPk5QvZ6
        TXUL/HWJsiCbB73NabyYqOT7luMIZD8=
X-Google-Smtp-Source: APXvYqyyWtqmnFzmS/M1rSDPE0eB1BT5eC4zyK3nvUXZJged/3vEtVNdV8v1WY7L8DxcKoGlv1Ra8w==
X-Received: by 2002:a1c:e388:: with SMTP id a130mr12368514wmh.176.1581806112517;
        Sat, 15 Feb 2020 14:35:12 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id k13sm13009491wrx.59.2020.02.15.14.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2020 14:35:12 -0800 (PST)
Subject: Re: [PATCH] MIPS: configs: Cleanup old Kconfig options
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200130192926.3635-1-krzk@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <465a49f2-2ff0-eb96-c528-f5ef2fe29c0a@amsat.org>
Date:   Sat, 15 Feb 2020 23:35:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200130192926.3635-1-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/30/20 8:29 PM, Krzysztof Kozlowski wrote:
> CONFIG_MTD_NAND_IDS is gone and not needed (part of CONFIG_MTD_NAND)
> since commit f16bd7ca0457 ("mtd: nand: Kill the MTD_NAND_IDS Kconfig
> option").

OK.

> 
> CONFIG_IOSCHED_DEADLINE, CONFIG_IOSCHED_CFQ and CONFIG_DEFAULT_NOOP are
> gone since commit f382fb0bcef4 ("block: remove legacy IO schedulers").

OK.

> 
> The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
> now enabled by default (along with MQ_IOSCHED_KYBER).

Selected as module in lemote2f_defconfig and loongson3_defconfig, OK.

> 
> The BFQ_GROUP_IOSCHED is the only multiqueue scheduler which comes with
> group scheduling so select it in configs previously choosing
> CFQ_GROUP_IOSCHED.

You select CONFIG_IOSCHED_BFQ dependence in loongson3_defconfig, OK.

> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  arch/mips/configs/ar7_defconfig                 | 1 -
>  arch/mips/configs/ath25_defconfig               | 1 -
>  arch/mips/configs/ath79_defconfig               | 1 -
>  arch/mips/configs/bcm63xx_defconfig             | 2 --
>  arch/mips/configs/bmips_be_defconfig            | 2 --
>  arch/mips/configs/bmips_stb_defconfig           | 2 --
>  arch/mips/configs/db1xxx_defconfig              | 1 -
>  arch/mips/configs/generic/board-ni169445.config | 1 -
>  arch/mips/configs/lasat_defconfig               | 2 --
>  arch/mips/configs/lemote2f_defconfig            | 2 +-
>  arch/mips/configs/loongson3_defconfig           | 5 +++--
>  arch/mips/configs/msp71xx_defconfig             | 2 --
>  arch/mips/configs/pnx8335_stb225_defconfig      | 2 --
>  arch/mips/configs/rb532_defconfig               | 1 -
>  arch/mips/configs/rt305x_defconfig              | 1 -
>  arch/mips/configs/xway_defconfig                | 1 -
>  16 files changed, 4 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/mips/configs/ar7_defconfig b/arch/mips/configs/ar7_defconfig
> index cef2754bd408..cf9c6329b807 100644
> --- a/arch/mips/configs/ar7_defconfig
> +++ b/arch/mips/configs/ar7_defconfig
> @@ -21,7 +21,6 @@ CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_BSD_DISKLABEL=y
> -# CONFIG_IOSCHED_CFQ is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> diff --git a/arch/mips/configs/ath25_defconfig b/arch/mips/configs/ath25_defconfig
> index c35add2fd716..7143441f5476 100644
> --- a/arch/mips/configs/ath25_defconfig
> +++ b/arch/mips/configs/ath25_defconfig
> @@ -22,7 +22,6 @@ CONFIG_HZ_100=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
> -# CONFIG_IOSCHED_CFQ is not set
>  # CONFIG_COMPACTION is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
> diff --git a/arch/mips/configs/ath79_defconfig b/arch/mips/configs/ath79_defconfig
> index 4ffc59cab436..3d14d67dc746 100644
> --- a/arch/mips/configs/ath79_defconfig
> +++ b/arch/mips/configs/ath79_defconfig
> @@ -23,7 +23,6 @@ CONFIG_PCI=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
> -# CONFIG_IOSCHED_CFQ is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> diff --git a/arch/mips/configs/bcm63xx_defconfig b/arch/mips/configs/bcm63xx_defconfig
> index 54e2f9a659fb..861f680184b9 100644
> --- a/arch/mips/configs/bcm63xx_defconfig
> +++ b/arch/mips/configs/bcm63xx_defconfig
> @@ -21,8 +21,6 @@ CONFIG_PCI=y
>  CONFIG_PCCARD=y
>  CONFIG_PCMCIA_BCM63XX=y
>  # CONFIG_BLK_DEV_BSG is not set
> -# CONFIG_IOSCHED_DEADLINE is not set
> -# CONFIG_IOSCHED_CFQ is not set
>  CONFIG_NET=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
> diff --git a/arch/mips/configs/bmips_be_defconfig b/arch/mips/configs/bmips_be_defconfig
> index f669a40e085b..032bb51defe8 100644
> --- a/arch/mips/configs/bmips_be_defconfig
> +++ b/arch/mips/configs/bmips_be_defconfig
> @@ -12,8 +12,6 @@ CONFIG_NR_CPUS=4
>  # CONFIG_SECCOMP is not set
>  CONFIG_MIPS_O32_FP64_SUPPORT=y
>  # CONFIG_BLK_DEV_BSG is not set
> -# CONFIG_IOSCHED_DEADLINE is not set
> -# CONFIG_IOSCHED_CFQ is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_PACKET_DIAG=y
> diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
> index a0b775893dba..625bd2d7e685 100644
> --- a/arch/mips/configs/bmips_stb_defconfig
> +++ b/arch/mips/configs/bmips_stb_defconfig
> @@ -21,8 +21,6 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
>  CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
>  CONFIG_BMIPS_CPUFREQ=y
>  # CONFIG_BLK_DEV_BSG is not set
> -# CONFIG_IOSCHED_DEADLINE is not set
> -# CONFIG_IOSCHED_CFQ is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_PACKET_DIAG=y
> diff --git a/arch/mips/configs/db1xxx_defconfig b/arch/mips/configs/db1xxx_defconfig
> index bc9b6ae046b2..e6f3e8e3da39 100644
> --- a/arch/mips/configs/db1xxx_defconfig
> +++ b/arch/mips/configs/db1xxx_defconfig
> @@ -28,7 +28,6 @@ CONFIG_PCMCIA_ALCHEMY_DEVBOARD=y
>  CONFIG_FIRMWARE_MEMMAP=y
>  CONFIG_BLK_DEV_BSGLIB=y
>  CONFIG_PARTITION_ADVANCED=y
> -CONFIG_DEFAULT_NOOP=y
>  CONFIG_CMA=y
>  CONFIG_CMA_DEBUG=y
>  CONFIG_NET=y
> diff --git a/arch/mips/configs/generic/board-ni169445.config b/arch/mips/configs/generic/board-ni169445.config
> index 1ed0d3e8715e..fc3580e4e6bc 100644
> --- a/arch/mips/configs/generic/board-ni169445.config
> +++ b/arch/mips/configs/generic/board-ni169445.config
> @@ -19,7 +19,6 @@ CONFIG_MTD_NAND_ECC_SW_HAMMING=y
>  CONFIG_MTD_NAND_ECC_SW_BCH=y
>  CONFIG_MTD_RAW_NAND=y
>  CONFIG_MTD_NAND_GPIO=y
> -CONFIG_MTD_NAND_IDS=y
>  
>  CONFIG_MTD_UBI=y
>  CONFIG_MTD_UBI_BLOCK=y
> diff --git a/arch/mips/configs/lasat_defconfig b/arch/mips/configs/lasat_defconfig
> index c66ca3785655..00cf461db971 100644
> --- a/arch/mips/configs/lasat_defconfig
> +++ b/arch/mips/configs/lasat_defconfig
> @@ -16,8 +16,6 @@ CONFIG_HZ_1000=y
>  # CONFIG_SECCOMP is not set
>  CONFIG_PCI=y
>  # CONFIG_BLK_DEV_BSG is not set
> -# CONFIG_IOSCHED_DEADLINE is not set
> -# CONFIG_IOSCHED_CFQ is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
> index f9f93427c9bd..8254d7d1396f 100644
> --- a/arch/mips/configs/lemote2f_defconfig
> +++ b/arch/mips/configs/lemote2f_defconfig
> @@ -26,7 +26,7 @@ CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODVERSIONS=y
>  CONFIG_BLK_DEV_INTEGRITY=y
> -CONFIG_IOSCHED_DEADLINE=m
> +CONFIG_MQ_IOSCHED_DEADLINE=m
>  CONFIG_BINFMT_MISC=m
>  CONFIG_NET=y
>  CONFIG_PACKET=y
> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
> index 360c6b2d397a..51675f5000d6 100644
> --- a/arch/mips/configs/loongson3_defconfig
> +++ b/arch/mips/configs/loongson3_defconfig
> @@ -38,8 +38,9 @@ CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODULE_FORCE_UNLOAD=y
>  CONFIG_MODVERSIONS=y
>  CONFIG_PARTITION_ADVANCED=y
> -CONFIG_IOSCHED_DEADLINE=m
> -CONFIG_CFQ_GROUP_IOSCHED=y
> +CONFIG_MQ_IOSCHED_DEADLINE=m
> +CONFIG_IOSCHED_BFQ=y
> +CONFIG_BFQ_GROUP_IOSCHED=y
>  CONFIG_BINFMT_MISC=m
>  CONFIG_KSM=y
>  CONFIG_NET=y
> diff --git a/arch/mips/configs/msp71xx_defconfig b/arch/mips/configs/msp71xx_defconfig
> index 0fdc03fda12e..6ad1a2381226 100644
> --- a/arch/mips/configs/msp71xx_defconfig
> +++ b/arch/mips/configs/msp71xx_defconfig
> @@ -14,8 +14,6 @@ CONFIG_PCI=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODVERSIONS=y
> -# CONFIG_IOSCHED_DEADLINE is not set
> -# CONFIG_IOSCHED_CFQ is not set
>  CONFIG_NET=y
>  CONFIG_UNIX=y
>  CONFIG_XFRM_USER=y
> diff --git a/arch/mips/configs/pnx8335_stb225_defconfig b/arch/mips/configs/pnx8335_stb225_defconfig
> index 738ba3b1374b..d06db6b87959 100644
> --- a/arch/mips/configs/pnx8335_stb225_defconfig
> +++ b/arch/mips/configs/pnx8335_stb225_defconfig
> @@ -14,8 +14,6 @@ CONFIG_HZ_128=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
> -# CONFIG_IOSCHED_DEADLINE is not set
> -# CONFIG_IOSCHED_CFQ is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> diff --git a/arch/mips/configs/rb532_defconfig b/arch/mips/configs/rb532_defconfig
> index 5b947183852b..252d472387aa 100644
> --- a/arch/mips/configs/rb532_defconfig
> +++ b/arch/mips/configs/rb532_defconfig
> @@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_MAC_PARTITION=y
>  CONFIG_BSD_DISKLABEL=y
> -# CONFIG_IOSCHED_CFQ is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
> index 110948bc6b39..8c2ead53007a 100644
> --- a/arch/mips/configs/rt305x_defconfig
> +++ b/arch/mips/configs/rt305x_defconfig
> @@ -21,7 +21,6 @@ CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
>  CONFIG_PARTITION_ADVANCED=y
> -# CONFIG_IOSCHED_CFQ is not set
>  # CONFIG_COREDUMP is not set
>  # CONFIG_COMPACTION is not set
>  CONFIG_NET=y
> diff --git a/arch/mips/configs/xway_defconfig b/arch/mips/configs/xway_defconfig
> index 49b5ea6eff62..9abbc0debc2a 100644
> --- a/arch/mips/configs/xway_defconfig
> +++ b/arch/mips/configs/xway_defconfig
> @@ -23,7 +23,6 @@ CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
>  CONFIG_PARTITION_ADVANCED=y
> -# CONFIG_IOSCHED_CFQ is not set
>  # CONFIG_COREDUMP is not set
>  # CONFIG_COMPACTION is not set
>  CONFIG_NET=y
> 
