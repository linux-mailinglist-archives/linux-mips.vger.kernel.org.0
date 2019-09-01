Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0CB5A4CA8
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 01:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbfIAXMX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 19:12:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35501 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbfIAXMW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 19:12:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id g7so12143255wrx.2
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 16:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=olrL1OycUvbdWlM3H3VJ7l3jjzPYSEzgqRzzKSt7Hcw=;
        b=fWcSsAanJaCBBN9CAgRMi8QRpN+jGWBnfzpQ2CfHFuPoF4p2UGlhGvL8AfvyL4izif
         RmgP8o9LHrv98lXCe6PUaB6+MrnLt//vF60YeStsYTmX64TlO+oRndE87e0g1Uge0BBJ
         GeLIU+wvE0cDAlTegVxtfsjSfAp7UWrVg14cZgY0FJEo0rDjYaZZnWEVFfRx2YCu9stG
         lGuwmO4S2moGCW8DK8AKBQWcZ1MiwCh3OorhlXxlTssW5OeuZJLRZpWJl5/+BDVccd3t
         ITnkYXGLt/30RAUxQ8+fSYxfSzfsrIK0vhIE5FD81MeNkfe7crZqwPx7yoeaJ81zkJSb
         MeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=olrL1OycUvbdWlM3H3VJ7l3jjzPYSEzgqRzzKSt7Hcw=;
        b=DRJdCAQ2gKVy3Yit/aOFWdvM7Mu7XRw4zfK1nZBoNFoi/D5aLaZjjTAu5QfBO+wnfK
         XchtMJhv3uIc7ls7qLiHvggjOwDTNjGNu9d87qt+0sLVjR/KWnldtO7tT/GsuzbOgYCu
         kHNCSz2wjonhzPpNX8nomkKVmzVri/lbBKOquA0aTn2J5XZbBxVMO3htloYPba0u/fHu
         ikB0ECeVoAHJCK/mMJS1qCPUDZsuNgZWXsv7a7ssoAfIp0hOJFooE7sy/mPc1EkPQnL5
         SDzdSvL9ymCPiTpRhX1VMiJs+YJ0E1NwWjJ5MuyMOoiwAQsD0zv60Udc5lOhsDwVuJvW
         C3Zw==
X-Gm-Message-State: APjAAAVIQ5RzsZuxJttxf4jYRMgZ3a2O6b69c0keKAkaF6cHSHu4+Tdk
        IfjhDBGu48rFzOTVD8HeRNWsg5JV
X-Google-Smtp-Source: APXvYqyYtkNabD1Ju8IR6YP2EPQM9QyHnV/zo7XIOsifRVmWHziQzK5J+uXZ77JXiAeLhjrqZn9aPQ==
X-Received: by 2002:adf:f846:: with SMTP id d6mr13063504wrq.67.1567379540379;
        Sun, 01 Sep 2019 16:12:20 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net. [88.10.102.251])
        by smtp.gmail.com with ESMTPSA id e30sm19396249wra.48.2019.09.01.16.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2019 16:12:19 -0700 (PDT)
Subject: Re: [PATCH 093/120] fbdev: Add fb_warn_once() variant that only
 prints a warning once
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <5dd47e9805a123aa9bea3c8c3cadfab24e25c29d.1567326213.git.noring@nocrew.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1b3e3acc-388d-89dd-31e6-cce877c2399c@amsat.org>
Date:   Mon, 2 Sep 2019 01:12:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5dd47e9805a123aa9bea3c8c3cadfab24e25c29d.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/1/19 6:25 PM, Fredrik Noring wrote:
> fb_warn_once() is a variant of fb_warn(), to print a warning only once.
> 
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> ---
>  include/linux/fb.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 303771264644..19f5118e34ea 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -818,6 +818,8 @@ extern int fb_find_mode(struct fb_var_screeninfo *var,
>  	pr_notice("fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
>  #define fb_warn(fb_info, fmt, ...)					\
>  	pr_warn("fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
> +#define fb_warn_once(fb_info, fmt, ...)					\
> +	pr_warn_once("fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
>  #define fb_info(fb_info, fmt, ...)					\
>  	pr_info("fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
>  #define fb_dbg(fb_info, fmt, ...)					\
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
