Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9813402C4
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 11:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhCRKJN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 06:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhCRKJC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 06:09:02 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFF2C06175F;
        Thu, 18 Mar 2021 03:09:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 75so3623920lfa.2;
        Thu, 18 Mar 2021 03:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jMxhISu+COlRrHc/EVrqMnT5LVw2161ovhdA7IBtSGw=;
        b=N+Q0LUNoyVaDPJ1eJrZ67FhUa77q/Fz02On4l9bg9QACSIgykCKqUmFdsf53Ojgnbf
         eyumUdx/TwjbtDOLgwCYAB7RDOtR57TMCBeyNSAY//ay7Tl2lccP2Ssym94kRXjxfYRe
         lulL4E/vgpp41CghUdWNrhQunOsNpbRkQh1Z5uA9cr4OPAdKTqKspV2wEkOPVcm1LmJR
         yZKXoXYlgW/Aj82akuKLiTGE5Fox66wxjP6rcBsCJbwoniHR5/N5xRjjkVjAEfQdY1MW
         wabHvQrtRlGBXU/oemiBE0fxxY0J0doyEwDn/K3ybrpVrl7lPm8K8TOwVCHW7Z8VfYJf
         AzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jMxhISu+COlRrHc/EVrqMnT5LVw2161ovhdA7IBtSGw=;
        b=IG0AFNQ4WIC7kIb1oqhO0NDJK4IpvBYtQMoHOV9DKFOKi5oYNqDC/BV9Gtr3IoH2cm
         FMs+fvSr2r42szRdjBPArkOki56V6+y780HZ3xrW6yfFyKEi0qH0qiSI896Z5F/SCDWD
         ywvmmefUjva1eWKcciuSJvoS6NdenabVMNcsg1d8HYaxGNWsyi9Xt1aa+qEHr4TnD6wH
         an9cXBxh/pCVUaM1/Pr6Aho5lINHP7y0Ugv7D63w2LHAIaFUmQ0Lp14Sbf7tY7fYwmtz
         IdX2/sg635XMHgnoc2K33eKSEoNXkHFZ3pV+ht+R7Yd3WIRao7tSSwmpDuvelJQKDFD1
         81fA==
X-Gm-Message-State: AOAM533B0nqqsdjnFA3SuMjAMpcZxmYRRvil0HpuTdKptUaWI6YivoUR
        nH2jPe16oyAGQmh2VUFkPZLMuey11I6fmA==
X-Google-Smtp-Source: ABdhPJx2/i763YoZT8agJf/e8IcPTQBDi5fhHCqQUnQpQ0jOlOdRn9E3L+UaYKsqgqqx/61KeZhUWQ==
X-Received: by 2002:a05:6512:32ab:: with SMTP id q11mr4934722lfe.106.1616062140994;
        Thu, 18 Mar 2021 03:09:00 -0700 (PDT)
Received: from [192.168.1.101] ([178.176.78.3])
        by smtp.gmail.com with ESMTPSA id z21sm173661ljh.104.2021.03.18.03.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 03:09:00 -0700 (PDT)
Subject: Re: [PATCH 07/10] MIPS: disable CONFIG_IDE in bigsur_defconfig
To:     Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-8-hch@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <53035511-c140-b51a-dd1d-874b1041039a@gmail.com>
Date:   Thu, 18 Mar 2021 13:08:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318045706.200458-8-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On 3/18/21 7:57 AM, Christoph Hellwig wrote:

> bigsur_defconfig enables CONFIG_IDE for the tc86c001 ide driver, which
> is a Toshiba plug in card that does not make much sense to use on bigsur
    ^ for

   Else that doesn't make much sense. :-)

> platforms.  For all other ATA cards libata support is already enabled.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
