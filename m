Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0F1A4AC9
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 19:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfIARPK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 13:15:10 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33245 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbfIARPK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 13:15:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id d10so879119lfi.0
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 10:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=SlD6nNbC74OLuo+Ae9NextjLg4+0WyKpUqWuOEo0Et0=;
        b=TUx0x4Cg7xIPwSoNlBC8VSUyfLoRSmzGMnkrswyH0VicPqpbuJ3q/d6r1yyev7WpnA
         dJa2bpcJrzubO6//kdqJJ57HX6WrpHMyWZEt5NKEp2W9pm3jPLOKRxvnXhgu1IFxS5cm
         sqG+jDfJa4Vk6GGMZzzcNBajXQu/nRQDE4dToJ8kX83i1XFBLFoJrUo5AgfFYIXAVHrX
         LJelQAA2qi/IoeAl4otE9+G8PhIy7YotApSFSvF89NaAB4Z5dq5j7ZgGc2Kt6kTtXSek
         ntstBvxjfjrMXfCdHy1r/VjPYdXI3vtYHYyqUTKhdocDcEgvx28/bEeIyYg7rKvd/g2l
         mXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SlD6nNbC74OLuo+Ae9NextjLg4+0WyKpUqWuOEo0Et0=;
        b=PZPFFgXkTPncjdwxBOVbu3ylUX+xyvqhaL3p0fkUybHW1EbT5qupAXJ24GbzELq9tf
         9uGd1Fku1Ran2uAJOEQtmZc0YibV9tN0un8cNJ2/vL5NsDX70dUZhZYPkPt5+ZyQEKjN
         6aVQb+i2NPYmfRh5RCJts/7MiD/FeVwi5jWZ0il4pxCgs0swSgA2TaeGqtFXV4oRbNTf
         qJowwU5RHRAaGpJqpF82YnvpVOkRx/GYQ4hWe3P2YZcHGjxbBE1dzYjrYRMnVlboKYLt
         /ODHnqQNV6xrdq7VbMOhZuN2qDi9OUMzDlgeMp3/5K2uHGF2NSJD3k6jiCELKh6tOjE/
         bDBA==
X-Gm-Message-State: APjAAAUEM8NMdNbrQwraFAMAIJN8qboGfuSMvW9B5KX+d3oAKdmh7G88
        oqcgACVO0fs+X3XqRqpSSYy7tVKjBwY=
X-Google-Smtp-Source: APXvYqwI/HLg/m2RWEthLlTxnF+brsvxkxQ3sNrC2i5x+IiX5AclJjknbzACORdDcZPZl3jzuyUPHQ==
X-Received: by 2002:a19:3f47:: with SMTP id m68mr14823876lfa.108.1567358108176;
        Sun, 01 Sep 2019 10:15:08 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:456:3a8b:7887:7591:d38e:68e7? ([2a00:1fa0:456:3a8b:7887:7591:d38e:68e7])
        by smtp.gmail.com with ESMTPSA id f5sm149691lfh.52.2019.09.01.10.15.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Sep 2019 10:15:07 -0700 (PDT)
Subject: Re: [PATCH 011/120] MIPS: R5900: Avoid pipeline hazard with the TLBP
 instruction
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <d3b43e48be1b888c4bd675dc4c0633dc1e8fe791.1567326213.git.noring@nocrew.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <314ae9e1-80d2-68f7-4942-c04e25dc60ef@cogentembedded.com>
Date:   Sun, 1 Sep 2019 20:15:04 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d3b43e48be1b888c4bd675dc4c0633dc1e8fe791.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 01.09.2019 18:40, Fredrik Noring wrote:

> On the R5900, the TLBP instruction must be immediately followed by an
> ERET or a SYNC.P instruction[1].
> 
> References:
> 
> [1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
>      Toshiba Corporation, p. C-37, https://wiki.qemu.org/File:C790.pdf
> 
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> ---
>   arch/mips/mm/tlbex.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> index 82136c346885..0519e2eafbb8 100644
> --- a/arch/mips/mm/tlbex.c
> +++ b/arch/mips/mm/tlbex.c
> @@ -489,6 +489,19 @@ static void __maybe_unused build_tlb_probe_entry(u32 **p)
>   		uasm_i_tlbp(p);
>   		break;
>   
> +	case CPU_R5900:
> +		/*
> +		 * On the R5900, the TLBWP instruction must be immediately

   So is it TLBP or TLBWP?

> +		 * followed by an ERET or a SYNC.P instruction.
> +		 */
> +		uasm_i_tlbp(p);
> +		uasm_i_syncp(p);
> +		uasm_i_nop(p);
> +		uasm_i_nop(p);
> +		uasm_i_nop(p);
> +		uasm_i_nop(p);
> +		break;
> +
>   	default:
>   		uasm_i_tlbp(p);
>   		break;

MBR, Sergei
