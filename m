Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF5339FC50
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbhFHQZq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:25:46 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:41912 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbhFHQZp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:25:45 -0400
Received: by mail-pg1-f177.google.com with SMTP id l184so1393154pgd.8;
        Tue, 08 Jun 2021 09:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qCqEbRr/ZPdmz8AchOJtyzKCBs+O43d8wPQ5fZZFjhk=;
        b=YNuXS3Okmlo1KkF/+e+wHVaYweLf8URsjuNIoLH2O90LshTx/p5cCBRBhxB/jBmPiB
         ueAf+6qv6lE8gKxYDmkwr8RLS0crcjiW3612B18/9xPuEWSfBK53mAVdHpbpQ0YaYQmr
         GjMg4vbL0XeP5XDVy3ISz74vXEriUP3Pjubcwz0d3f8X6Oem0HT4LN+a2tLeHKcrH8U6
         i0s6MV2p+oVSEFuzcoG49ROXFjEaSX5048vVPRPEbsJwpu449UuMoTAL5uhOKfgFO3PJ
         1cffb5/EDp/DZAWgtMhNxwNDMIaVHTN1+JgZgao/HPnVHCFF2KtbSO1JQ9wZZFkGs0gu
         b7Cw==
X-Gm-Message-State: AOAM531E/zD2fwUWJ6ujik/TbBv8DpUpxZzMVUj9BgDGgdV87rK/8n5Q
        aCp+VWbKG6Z6YQRoLski7JBZs3RqI5o=
X-Google-Smtp-Source: ABdhPJw4bmfvWGcz16m0nccIT5A1wyVoaTqb2ljpnWRWjedCwkO8zIDp8El5QdjOUdkYia3UO1TSlw==
X-Received: by 2002:a65:5684:: with SMTP id v4mr22680238pgs.218.1623169415549;
        Tue, 08 Jun 2021 09:23:35 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id p40sm4440358pfw.142.2021.06.08.09.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 09:23:34 -0700 (PDT)
Subject: Re: [PATCH 02/16] MIPS: don't include <linux/genhd.h> in
 <asm/mach-rc32434/rb.h>
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>, dm-devel@redhat.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        ceph-devel@vger.kernel.org
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-3-hch@lst.de>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <9a073f63-65f6-6f3d-600d-e3900707fd06@acm.org>
Date:   Tue, 8 Jun 2021 09:23:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210608160603.1535935-3-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/8/21 9:05 AM, Christoph Hellwig wrote:
> There is no need to include genhd.h from a random arch header, and not
> doing so prevents the possibility for nasty include loops.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/include/asm/mach-rc32434/rb.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-rc32434/rb.h b/arch/mips/include/asm/mach-rc32434/rb.h
> index d502673a4f6c..34d179ca020b 100644
> --- a/arch/mips/include/asm/mach-rc32434/rb.h
> +++ b/arch/mips/include/asm/mach-rc32434/rb.h
> @@ -7,8 +7,6 @@
>  #ifndef __ASM_RC32434_RB_H
>  #define __ASM_RC32434_RB_H
>  
> -#include <linux/genhd.h>
> -
>  #define REGBASE		0x18000000
>  #define IDT434_REG_BASE ((volatile void *) KSEG1ADDR(REGBASE))
>  #define UART0BASE	0x58000

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
