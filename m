Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 324DF109CF
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 17:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfEAPJd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 11:09:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52593 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfEAPJd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 May 2019 11:09:33 -0400
Received: by mail-wm1-f67.google.com with SMTP id j13so7484239wmh.2
        for <linux-mips@vger.kernel.org>; Wed, 01 May 2019 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UrF1HV567imV8kGhjPVIyiq0gwu6+3+ww/Xo+YRR8uk=;
        b=lsMUiyvKsXWJPjTwKglZMo85TR1vzC88oZYn1e8MX3NQ42mnrJbArzmT2m13MYpMUw
         pK/7Lv80rU4n8r8Pav5o0X+Vtuo9+BaAF8uB89I8V12ILPrShrWIWeY3Kx/LKOCWpNYN
         /qTKUc8V34tvZIalXiIo4WYyWoVH6o/q4zon/7PVBBRhKVq/55pFxg2nrDNyP+SqT1wY
         mchr9RhjR57XvWQoMl+/OrNULm5hIIfFAWYDreZAqS01lFK26vajaV8NuCBHBnZFEqEq
         mns8n33JNNDcHUmsSBBABacImaThJVfu050YR4WBTUzxU3JTDJuFH0MgbkpYzzvQ+t7r
         yKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UrF1HV567imV8kGhjPVIyiq0gwu6+3+ww/Xo+YRR8uk=;
        b=s9bdwtfxTVCOUtAEkTM50FqQ2Xd9SA7rPyBXA/Xd6s5lsSYinP1lx1XkcIl88L9t/P
         zeh0lPF51XtF8jSyVatQAO7F24SUFqzjja/bHEkmfvd0C38y5g27FpxRHhcOCm89U1cU
         A4o9ON1LBjmRvDAxTgTUWG1yI7gDEiffTqBhXNWrbUY/QccLqG3oLNHMENJQYaIR8aw9
         t/KXYdbPYwFDiRWT9isosU5w/6mjfE1+/ERGuOT2c+rRvB8yf39ue75n6ODsxCJxpcdB
         Hax7C5k7DmYifbZBMHK31kZm2DafVFPoZVrzsQnH/S62VeJAlq5Vw74kg88YHDGx+o9o
         8MIQ==
X-Gm-Message-State: APjAAAVSq07d5uwCbUHE48ySJM5WsEFzqowTsL/KonJoSN41sAx2tETG
        hhf8TUdActkDEeK2rKQmKRE=
X-Google-Smtp-Source: APXvYqxB/Ni3DgBPEe+9Re04PcLpYX5enwSckeaiZOCB3FEigHJgJ1LzQiDDTaNjvsR31buyBF+83w==
X-Received: by 2002:a1c:23cf:: with SMTP id j198mr6620940wmj.29.1556723370996;
        Wed, 01 May 2019 08:09:30 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id m187sm3428690wmm.37.2019.05.01.08.09.29
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 08:09:30 -0700 (PDT)
Subject: Re: [PATCH 3/4] MIPS: Sync icache for whole exception vector
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Paul Burton <pburton@wavecomp.com>
References: <20190430225216.7164-1-paul.burton@mips.com>
 <20190430225216.7164-4-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a9878dba-f982-fafa-bde8-1b35757b0b97@amsat.org>
Date:   Wed, 1 May 2019 17:09:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430225216.7164-4-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/1/19 12:53 AM, Paul Burton wrote:
> Rather than performing cache flushing for a fixed 0x400 bytes, use the
> actual size of the vector in order to ensure we cover all emitted code
> on systems that make use of vectored interrupts.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> ---
>  arch/mips/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 9b565ed51662..2775190adbe7 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2454,7 +2454,7 @@ void __init trap_init(void)
>  	else
>  		set_handler(0x080, &except_vec3_generic, 0x80);
>  
> -	local_flush_icache_range(ebase, ebase + 0x400);
> +	local_flush_icache_range(ebase, ebase + vec_size);
>  
>  	sort_extable(__start___dbe_table, __stop___dbe_table);
>  
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
