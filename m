Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0628A350CDC
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 05:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbhDADCz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 23:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbhDADCv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Mar 2021 23:02:51 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1425EC0613E6
        for <linux-mips@vger.kernel.org>; Wed, 31 Mar 2021 20:02:51 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id s21so363175pjq.1
        for <linux-mips@vger.kernel.org>; Wed, 31 Mar 2021 20:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OglaaZvG5xZ7XpgWXhSPqJrOEeuumuQSkTn4yQbkHfA=;
        b=uOWibEz77z2kDt382aIgrNB6v9BmktkAs9JpzygqPshBax807F3EmcDbsVMpJLAjf+
         XizeZIYfQJ4Wc8BcRlrpEgLKQJ7J/wcEejSv9jh6aLK7eMpkikBVoyMMgar0v+AyghM0
         +BmPVumFIhdAkEAULyQFnIX72Xcj2WqpKMonF8k39eUi7AHLjX8CL9QQQQBaQFEudlTn
         ZRpnEm3Wcjcw+2TnokM920oHHRNl56UabRsN/a7sG9YOFxyXWGVgLpajLyhKtZMAS03w
         4JqZnF1YMLGM2T9DFMcUH74DMsuDjgSjSTmffzppoN0N9P+VaOYlEdJyLy5eiM2pS4xH
         i7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OglaaZvG5xZ7XpgWXhSPqJrOEeuumuQSkTn4yQbkHfA=;
        b=GO/fwjxHsBhRL1Rxe7i7upzE5Mbju05So058t7oA12gpNQx1RIKWMJS3LYLlEQC3RA
         LxNMFG3kUKUuOtYqY68xQh2wdmPaMBpsQrXN4cR/7FaGynLC/54tV26dt7ZRLOrE0syH
         QK/RY9XD7Sq+rbcgz/Cs4aRI1A99oVv4RBk1gtDw+FhNBBjnG1XOQuKHcBXtoKGZbl/g
         ln/0e648j+ioVloHI91+onvn76KVzi/TFQZ4gH1u1wIq/+k96EK7BzQu70ek1DJM9w5s
         XNuYgArS/fbRKDNw22BBiYzryfLvDMM+vYXRzgUl5j1UCrkHaxbrrvZF0GndFsvO17b/
         rM9A==
X-Gm-Message-State: AOAM530RZR12pZlGDZyVPsFY1Ohsr870DrCVSWjaF95U+80/0CV8fSN0
        Hej1UtX8ka/DuWkhI1QZbdA=
X-Google-Smtp-Source: ABdhPJzruFopN+WjsNpIs5RSmRoIr7tbh/o5xxbAlCoUaN4uLviZenSdivm3Z/O67lRg/ht4cEn+9g==
X-Received: by 2002:a17:90a:a88d:: with SMTP id h13mr6367467pjq.61.1617246170560;
        Wed, 31 Mar 2021 20:02:50 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j3sm3643159pjf.36.2021.03.31.20.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 20:02:50 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] MIPS: kernel: setup.c: fix compilation error
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        linux-mips@vger.kernel.org, trivial@kernel.org
References: <20210326134158.268164-1-sandberg@mailfence.com>
 <20210329123136.3717-1-sandberg@mailfence.com>
 <20210329123136.3717-2-sandberg@mailfence.com>
 <20210330125347.GA10767@alpha.franken.de>
 <alpine.DEB.2.21.2104010053360.18977@angie.orcam.me.uk>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <94627400-b90d-e803-fc53-14b5d63a5007@gmail.com>
Date:   Wed, 31 Mar 2021 20:02:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104010053360.18977@angie.orcam.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 3/31/2021 3:55 PM, Maciej W. Rozycki wrote:
> On Tue, 30 Mar 2021, Thomas Bogendoerfer wrote:
> 
>>> With ath79_defconfig enabling CONFIG_MIPS_ELF_APPENDED_DTB gives a
>>> compilation error. This patch fixes it.
>>>
>>> Build log:
>>> ...
>>>   CC      kernel/locking/percpu-rwsem.o
>>> ../arch/mips/kernel/setup.c:46:39: error: conflicting types for
>>> '__appended_dtb'
>>>  const char __section(".appended_dtb") __appended_dtb[0x100000];
>>>                                        ^~~~~~~~~~~~~~
>>> In file included from ../arch/mips/kernel/setup.c:34:
>>> ../arch/mips/include/asm/bootinfo.h:118:13: note: previous declaration
>>> of '__appended_dtb' was here
>>>  extern char __appended_dtb[];
>>>              ^~~~~~~~~~~~~~
>>>   CC      fs/attr.o
>>> make[4]: *** [../scripts/Makefile.build:271: arch/mips/kernel/setup.o]
>>>  Error 1
>>> ...
>>>
>>> Root cause seems to be:
>>> Fixes: b83ba0b9df56 ("MIPS: of: Introduce helper function to get DTB")
>>>
>>> Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
>>> Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>>> Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>>> Cc: trivial@kernel.org
>>> ---
>>>  arch/mips/kernel/setup.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> applied to mips-fixes. I dropped the Tested-by as this would imply
>> for me booting that kernel, which I didn't.
> 
>  Why removing the `const' qualifier rather than adding it to the 
> declaration?  Is the DTB supposed to be r/w for the kernel?

In premise the appended dtb could be modified by the kernel early on if
needed even before being handed over to __dt_setup_arch(), so keeping it
read/write for the kernel sort of makes sense. No upstream platform
seems to do that though. If we were to re-instate the const qualifier
(only build tested) the path of least resistance appears to be this:

diff --git a/arch/mips/include/asm/bootinfo.h
b/arch/mips/include/asm/bootinfo.h
index 5be10ece3ef0..31919e1e2dc7 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -115,14 +115,14 @@ extern unsigned long fw_arg0, fw_arg1, fw_arg2,
fw_arg3;
 #include <linux/libfdt.h>
 #include <linux/of_fdt.h>

-extern char __appended_dtb[];
+extern const char __appended_dtb[];

 static inline void *get_fdt(void)
 {
        if (IS_ENABLED(CONFIG_MIPS_RAW_APPENDED_DTB) ||
            IS_ENABLED(CONFIG_MIPS_ELF_APPENDED_DTB))
                if (fdt_magic(&__appended_dtb) == FDT_MAGIC)
-                       return &__appended_dtb;
+                       return (void *)&__appended_dtb;

        if (fw_arg0 == -2) /* UHI interface */
                return (void *)fw_arg1;
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 23a140327a0b..279be0153f8b 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -43,7 +43,7 @@
 #include <asm/prom.h>

 #ifdef CONFIG_MIPS_ELF_APPENDED_DTB
-char __section(".appended_dtb") __appended_dtb[0x100000];
+const char __section(".appended_dtb") __appended_dtb[0x100000];
 #endif /* CONFIG_MIPS_ELF_APPENDED_DTB */

 struct cpuinfo_mips cpu_data[NR_CPUS] __read_mostly;


-- 
Florian
