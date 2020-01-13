Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1370A139952
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 19:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgAMSws (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 13:52:48 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46627 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbgAMSws (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 13:52:48 -0500
Received: by mail-pg1-f196.google.com with SMTP id z124so5105810pgb.13;
        Mon, 13 Jan 2020 10:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OejaDp/PtovUjNqTYwQR8/+Ob40Nm9cyB96j7j566Wg=;
        b=sAknIcAxDU9dyT80OVk8uYwaiZhZ/9KtVgbOYf3IsEhdZDLqo0YDUKtws8dZ7PJ6T6
         K5AOB4iMAlr/BiRctstIZoDZ9QeqyigXu1vvGg5ZetPkejr365QS4reBPu6ezCT2RUlL
         pZn6gKoOb+Iz0z6NgjImKvYFNUgshRn9JUPqwQ8/3cwdV961kaZ5XKQkcrG/pPdM0Vud
         hiL/z7INGmlQVMO6Rt6PfEaeSyLBpS3v7Hwx2/tSNG7GCedrX5o7sqoIbwLMpYYtylNQ
         n3T7+tw61yDkpdzcrg2BKG6zKNvgWaKnTzSqNMrTzEMLfxGmKyXG3QipdU+fkTZ+j8Hh
         AF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OejaDp/PtovUjNqTYwQR8/+Ob40Nm9cyB96j7j566Wg=;
        b=EzoSi4awJYqN95Ocz2DictkR1UMyPnnzria1fPU3+oF/9paxRyI6+hKtFB7BKuxWVM
         KqLbRB1sp4qxrYjVVF0+w7OsvDeUq2ffnL5uizXCTrQqnknGsaWJv7wEQMj/8swnteen
         leBjf0UHkxU/75TBXTmobg3WfN+/LOkqVU14yQthcoyg0wLE36sQ4/G/zivbMOCNIFiJ
         YzAJjZFzjJTF8goSEdM7TG2ri8qmIeEOD6pZiXUX1JTxhGP9T9OcdgAAp2nIjloTSiGe
         nJ7sPOAGrklcy4W7vzVzkgIlxqEBEMnrGzZU1qu0eDjhVC/nOYEZqBYCHviSRPHms34v
         romg==
X-Gm-Message-State: APjAAAU+14wLmhRnBrKrHDj5qTivLbkKUxts9eaQwHNPnqpLCQ5Wpy98
        SNb/boysZV1fW+FvaP/PgxL0f1Tx3Ec=
X-Google-Smtp-Source: APXvYqxhcQ/lr6IXonkIYwS46bv4iuXGXhIWft3L6uDy6PooO/C3WYdEXY6wNI/XmbRUJoHA4XZPeg==
X-Received: by 2002:aa7:93c1:: with SMTP id y1mr20114255pff.200.1578941567724;
        Mon, 13 Jan 2020 10:52:47 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id y203sm15660002pfb.65.2020.01.13.10.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 10:52:46 -0800 (PST)
From:   Paul Burton <paulburton89@gmail.com>
X-Google-Original-From: Paul Burton <paul.burton@mips.com>
Date:   Mon, 13 Jan 2020 10:52:46 -0800
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        linux-kernel@vger.kernel.org, hch@lst.de
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Add dma iocoherency detection
 support
Message-ID: <20200113185246.zvsahaeh36gdfsv2@pburton-laptop>
References: <20200113140705.74605-1-jiaxun.yang@flygoat.com>
 <20200113140705.74605-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113140705.74605-2-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On Mon, Jan 13, 2020 at 10:07:05PM +0800, Jiaxun Yang wrote:
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> index 8c286bedff3e..2da2be40ad81 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -115,7 +115,8 @@ struct irq_source_routing_table {
>  	u64 pci_io_start_addr;
>  	u64 pci_io_end_addr;
>  	u64 pci_config_addr;
> -	u32 dma_mask_bits;
> +	u16 dma_mask_bits;
> +	u16 dma_noncoherent;
>  } __packed;

This struct is generated by the firmware, right? So does this change
require that firmware be updated along with the kernel? Or was the
kernel's definition always incorrect/incomplete?

Thanks,
    Paul
