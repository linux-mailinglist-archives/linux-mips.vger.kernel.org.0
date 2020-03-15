Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9333185ADE
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2020 08:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgCOHL5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Mar 2020 03:11:57 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36198 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbgCOHL5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Mar 2020 03:11:57 -0400
Received: by mail-oi1-f195.google.com with SMTP id k18so14325929oib.3;
        Sun, 15 Mar 2020 00:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Iv77R9xIf2Zpsv1uSDBTkW8/S6yCOSOT3Zqw79KydcQ=;
        b=jY85eJ2U5VTlShse99xoMUEpxK9C3/jNRTt4TsSlUV/X/A9mb0yc9Izf++OUtEaXeY
         aqB0crDjj5kG9Am46iR8uxP4K8MYsc2uVSPxUjJfQZJUTISZPPwy7G0edlrcDMbgtK3L
         2dEU6jA8WppacltoUkYSR7x9D8b8xKv8pD0nj2++nLlDFFr/1aNIWDnGzLta+xCkfbnU
         fTwyrRhMMWO+bfBW2fM2T/VAXW4CtkxvdNLdiYgZqj28Zg+IEsy1FaRToVHFvcNkqDf2
         ygwxG9Z+6SEvS29n4h6JzvVojUA1hqmJ9rmGYA2hdpY/lFZdi7YJhHab2SjcQ8/o/8uE
         yWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Iv77R9xIf2Zpsv1uSDBTkW8/S6yCOSOT3Zqw79KydcQ=;
        b=EFJUS2pgS0Qo7NJ/WwGsoF0BoXlBo9i5JRFhwSJhs5VMwQbcgIhGm2jokHZPqs41OL
         N90ONAIWhvR8Avk8RImrX5u5tGIpQSasGbYEZEre8pTvY50kl2pwR4Ywy1amN2oNnRJH
         oDIPODC7kncnJQGPFFMEH+RdunNGGxnMfYI+eoUOSihPm0P1XPwfuyEu3Mxl2mwd6JIh
         UCh6R6HNi1yKKmV7YO7hG8KsdVBhkzKZ+MSofSFVsRKiXWsOwrEHpeKmGk6TfLJNqxSh
         02W15HR+lBlCgeLFfLsqPbaQAODwjpq28l0X6if1V9rfwY7X33tXFD/8wxicQ/2xeXwX
         84iA==
X-Gm-Message-State: ANhLgQ0pQxTzjyiaG0Vzx3lB1ckE7/xhIQ5sHEqb0SE4NOvQntQrRA2+
        f+yQTunzvVoXtvtFBYf9CZ4=
X-Google-Smtp-Source: ADFU+vueMPfKqmKSQNvPkaQIlyhwfkEvf41MYvMKaO+gzudevYA3ndfvjrWYfnmAmDUtwenU2bslVw==
X-Received: by 2002:aca:aa55:: with SMTP id t82mr13291293oie.147.1584256316688;
        Sun, 15 Mar 2020 00:11:56 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id c3sm8649193otl.81.2020.03.15.00.11.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 00:11:56 -0700 (PDT)
Date:   Sun, 15 Mar 2020 00:11:54 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v2] MIPS: pass non-NULL dev_id on shared request_irq()
Message-ID: <20200315071154.GA31696@ubuntu-m2-xlarge-x86>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
 <20200311090308.GA5060@afzalpc>
 <20200311104217.GA10615@alpha.franken.de>
 <20200311131210.GA5115@afzalpc>
 <20200311160307.GA15464@alpha.franken.de>
 <20200311163249.GA4984@afzalpc>
 <20200313121138.GA5985@afzalpc>
 <20200314081312.GA4948@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200314081312.GA4948@afzalpc>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 14, 2020 at 01:43:12PM +0530, afzal mohammed wrote:
> Recently all usages of setup_irq() was replaced by request_irq().
> request_irq() does a few sanity checks that were not done in
> setup_irq(), if they fail irq registration will fail. One of the check
> is to ensure that non-NULL dev_id is passed in the case of shared irq.
> This caused malta on qemu to hang.
> 
> Fix it by passing handler as dev_id to all request_irq()'s that are
> shared. For sni, instead of passing non-NULL dev_id, remove shared irq
> flags.
> 
> Fixes: ac8fd122e070 ("MIPS: Replace setup_irq() by request_irq()")
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Suggested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>

Tested-by: Nathan Chancellor <natechancellor@gmail.com>
