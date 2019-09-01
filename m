Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA8A7A4CA6
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 01:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbfIAXJa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 19:09:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50199 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729117AbfIAXJa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 19:09:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id c10so694076wmc.0
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 16:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JJRuYPlKB5wWx0q/4EGUxsLe4cQZarfwXatit93zz+A=;
        b=IbwvM4Ab7vKvMXhbN1tXPmLo+g1czo75JQQyTR8iTj9yzl7iVoRIP0diG5HD6KxQXp
         T+VvjoeOYCcRD42wZBXJzdkzIU9o0gD14Hk8xdEBB1J+gi9KMyrPr2r8HIsT1Ddnwymx
         nh6N6hG5rDQRPy1FUL2xg2c9FbgeGh1hRjNAUUeqQv56Nt3noUz96jSz5Bi7ZgtmBA3t
         Yo4F2GDGAueDMRiHuLMkKTsCKVbSggLsQ2W2iSXc6tgBhAICLpz+AiCniHNiaC5fYmTV
         AVRfTi2Thll+i4ThtxHMrQKavoWr7gqNUfILhezQJBC+5p2OeFkkbHsSyVfmWuOyI9nE
         ORLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JJRuYPlKB5wWx0q/4EGUxsLe4cQZarfwXatit93zz+A=;
        b=a4um7CL0SJkFTjqKMQctzXDeuzzLQFG2BPnJGj4vg+sootiJPJAXxeyPZBpq1i+RJH
         uyRtN3ZvfpAIXMav07bQsadKZRkXCmNJvOOoEaQzAiB/gs35M2ROsQgaHSB+RxJooCRA
         9JNZ7dGFWEwbNFWIpYu5PK/O8Zk6Menb30W4C3wdFF1Zd8TwRbtFQrABw9xhVwqpnwHa
         8NziFPr2kFqzZBMQ5hPf7mkNtWiUQbs1fzTidrvOQvQ6w9T0STjDJD3EDfbsluo9iM8t
         nviUaA0/BEXG0xWCxf0pDHG1JNw4CV1hZ6+hVL8ADwnzpJYOreUWh29m4bkumThrITSY
         2X/Q==
X-Gm-Message-State: APjAAAULGSzxKFWsweyD6h8Kwmlpretx+GG8BlKi7eAD9QvDRmJpj1Vm
        26Nwa3Wqwc4BUGlnr4KaU1AWo+4A
X-Google-Smtp-Source: APXvYqzUfF5K6X1R6aTVjakJMrDf8spfbDnJmkwkHRwx2OFbMSGcWWXPXte0PP2CFkK4/q14/2ajXg==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr19073386wmi.167.1567379367492;
        Sun, 01 Sep 2019 16:09:27 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net. [88.10.102.251])
        by smtp.gmail.com with ESMTPSA id f197sm27121188wme.22.2019.09.01.16.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2019 16:09:26 -0700 (PDT)
Subject: Re: [PATCH 047/120] MIPS: PS2: Let the system type be Sony
 PlayStation 2
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <cf9924007a0e9515d3bd18bcca44c8908028b90a.1567326213.git.noring@nocrew.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <e77e4e45-c662-2491-85de-d3ff1591ded4@amsat.org>
Date:   Mon, 2 Sep 2019 01:09:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cf9924007a0e9515d3bd18bcca44c8908028b90a.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/1/19 5:54 PM, Fredrik Noring wrote:
> The system type is shown in the /proc/cpuinfo file:
> 
> 	# grep system' 'type /proc/cpuinfo
> 	system type		: Sony PlayStation 2
> 
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> ---
>  arch/mips/ps2/identify.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/mips/ps2/identify.c b/arch/mips/ps2/identify.c
> index 264fdc13dc43..579148fb79c4 100644
> --- a/arch/mips/ps2/identify.c
> +++ b/arch/mips/ps2/identify.c
> @@ -9,11 +9,17 @@
>  #include <linux/init.h>
>  #include <linux/printk.h>
>  
> +#include <asm/bootinfo.h>
>  #include <asm/prom.h>
>  
>  #include <asm/mach-ps2/rom.h>
>  #include <asm/mach-ps2/scmd.h>
>  
> +const char *get_system_type(void)
> +{
> +	return "Sony PlayStation 2";
> +}
> +
>  static int __init set_machine_name_by_scmd(void)
>  {
>  	const struct scmd_machine_name machine = scmd_read_machine_name();
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
